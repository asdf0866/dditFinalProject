package kr.or.ddit.controller.member;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IConsultingService;
import kr.or.ddit.service.IQNAService;
import kr.or.ddit.service.application.IApplicationService;
import kr.or.ddit.service.commonCode.ICommonCodeService;
import kr.or.ddit.service.company.ICompanyService;
import kr.or.ddit.service.file.IFileService;
import kr.or.ddit.service.interest.IInterestService;
import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.recruit.IRecruitService;
import kr.or.ddit.service.resume.IResumeService;
import kr.or.ddit.vo.ApplicationVO;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.CommonCodeDetailVO;
import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.InterestCompanyVO;
import kr.or.ddit.vo.InterestRecruitVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.QNAVO;
import kr.or.ddit.vo.RecruitmentVO;
import kr.or.ddit.vo.ResumeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/jobel")
@Controller
public class MemberController {
	
	@Inject
	private IMemberService memService;			//	회원 서비스
	
	@Inject
	private IResumeService rsmService;			//	이력서 서비스
	
	@Inject
	private IFileService fileService;			//	파일 서비스
	
	@Inject
	private ICommonCodeService codeService;		//	공통코드 서비스
	
	@Inject
	private IInterestService intService;		//	관심등록 서비스
	
	@Inject
	private IRecruitService recService;			//	채용공고 서비스
	
	@Inject
	private IApplicationService appService;		//	공고지원 서비스
	
	@Inject
	private IQNAService qnaService;				//	1:1 문의 서비스
	
	@Inject
	private IConsultingService conService;		//	취업상담 서비스
	
	@Inject
	private ICompanyService comService;			//	기업 서비스
	
	@Inject
    private JavaMailSender mailSender;			//	이메일 전송
	
	/**
	 *	회원 가입 폼으로 이동하는 메소드 
	 */
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerForm() {
		return "login/registerForm";
	}
	
	/**
	 * 회원을 신규 등록하는 메소드 
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String memberInsert(HttpServletRequest req, MemberVO member, Model model) {
		log.info("memberInsert() 실행!");
		
		//	상태코드 일반회원에 해당하는 "MEMSTAT001" 부여
		member.setMemStatCode("MEMSTAT001");
		String result = "";
		
		MultipartFile profile = member.getProfilePhoto();
		
		//	프로필 사진이 존재할 경우 프로필 사진 등록
		if(profile.getOriginalFilename() != null && !profile.getOriginalFilename().equals("")) {
			member = fileService.insertProfilePhoto(req, member);
		}
		
		ServiceResult sr = memService.registerMember(member);
		
		if(sr.equals(ServiceResult.OK)) {
			model.addAttribute("msg", "등록이 완료되었습니다.");
			result = "redirect:/jobel/login";
		} else {
			result = "login/registerForm";
		}
		
		return result;
	}
	
	/**
	 * 회원 가입 중 아이디 중복을 확인하는 메소드
	 * @param memId : 입력한 아이디
	 * @return 1 : 검색 결과 해당 아이디가 존재, 0 : 존재하지 않음
	 */
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public ResponseEntity<Integer> idCheck(@RequestParam(name = "memId") String memId) {
		
		int count = memService.idCheck(memId);
		
		return new ResponseEntity<Integer>(count, HttpStatus.OK);
	}
	
	/**
	 * 기업 회원이 마이 페이지에서 회원 정보를 수정하는 메소드
	 */
	@ResponseBody
	@RequestMapping(value = "/coMemberEdit", method = RequestMethod.POST)
	public ResponseEntity<String> coMemberEdit(MemberVO member) {
		
		ResponseEntity<String> entity = null;
		
		ServiceResult result = memService.coMemberEdit(member);
		
		if(result.equals(ServiceResult.OK)) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/**
	 * 일반 회원이 마이 페이지로 이동하는 메소드 
	 */
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String memberMyPage(
			@RequestParam(required = false) String menu,
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			Model model) {
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		String memId = user.getMember().getMemId();
		MemberVO member = memService.readByUserId(memId);
				
		model.addAttribute("member", member);
		
		String goPage = "commons/myPage/member_myPage";
		
		if(menu != null) {
			goPage += "_" + menu;
			model.addAttribute("menu", menu);
			
			if(menu.equals("viewResume")) {		//	내 이력서 메뉴
				List<ResumeVO> rsmList = rsmService.getResume(memId);
				List<CommonCodeDetailVO> codeList = codeService.getDetailList("RSMTYPE");
				model.addAttribute("resumeList", rsmList);
				model.addAttribute("codeList", codeList);
			}
			if(menu.equals("interest")) {		//	관심 등록 메뉴
				//	관심 공고
				List<InterestRecruitVO> intRecruitList = intService.getLikeRecruit(memId);
				List<RecruitmentVO> recruitList = new ArrayList<RecruitmentVO>();
				for(InterestRecruitVO intRecruit : intRecruitList) {
					int recruitNo = intRecruit.getRecruitNo();
					RecruitmentVO recruit = recService.getRecruit(recruitNo);
					recruitList.add(recruit);
				}
				model.addAttribute("intRecruitList", intRecruitList);
				model.addAttribute("recruitList", recruitList);
				
				//	관심 기업
				List<InterestCompanyVO> intCompanyList = intService.getLikeCompanyList(memId);
				List<CompanyVO> companyList = new ArrayList<CompanyVO>();
				for(InterestCompanyVO intCompany : intCompanyList) {
					String coNo = intCompany.getCoNo();
					CompanyVO company = comService.getCompany(coNo);
					companyList.add(company);
				}
				model.addAttribute("intCompanyList", intCompanyList);
				model.addAttribute("companyList", companyList);
			}
			if(menu.equals("application")) {		//	채용 관리
				PaginationInfoVO<ApplicationVO> pagingApplyVO = new PaginationInfoVO<ApplicationVO>();
				pagingApplyVO.setMemId(memId);
				pagingApplyVO.setScreenSize(5);
				pagingApplyVO.setCurrentPage(currentPage);
				
				List<ApplicationVO> applyList  = appService.getApplyRecruit(pagingApplyVO);
				List<RecruitmentVO> applyRecruitList = new ArrayList<RecruitmentVO>();
				for(ApplicationVO apply : applyList) {
					int recruitNo = apply.getRecruitNo();
					RecruitmentVO recruit = recService.getRecruit(recruitNo);
					applyRecruitList.add(recruit);
				}
				pagingApplyVO.setDataList(applyList);
				model.addAttribute("pagingVO", pagingApplyVO);
				model.addAttribute("applyRecruitList", applyRecruitList);
			}
			
			if(menu.equals("myQna")) {		//	1:1 문의
				PaginationInfoVO<QNAVO> pagingQnaVO = new PaginationInfoVO<QNAVO>();
				pagingQnaVO.setMemId(memId);		//	내가 작성한 것만 가져오기
				pagingQnaVO.setScreenSize(10);
				pagingQnaVO.setCurrentPage(currentPage);
				
				int totalCount = qnaService.selectQnaCount(pagingQnaVO);		//	작성한 개수 가져오기
				pagingQnaVO.setTotalRecord(totalCount);
				
				List<QNAVO> qnaList = qnaService.selectQnaList(pagingQnaVO);
				pagingQnaVO.setDataList(qnaList);
				model.addAttribute("pagingVO", pagingQnaVO);
			}
			if(menu.equals("myConsulting")) {
				PaginationInfoVO<BoardVO> pagingConsultVO = new PaginationInfoVO<BoardVO>();
				pagingConsultVO.setMemId(memId);		//	내가 작성한 것만 가져오기
				pagingConsultVO.setScreenSize(10);
				pagingConsultVO.setCurrentPage(currentPage);
				
				int totalCount = conService.selectConsultingCount(pagingConsultVO);		//	작성한 개수 가져오기
				pagingConsultVO.setTotalRecord(totalCount);
				
				List<BoardVO> consultList = conService.selectConsultingList(pagingConsultVO);
				pagingConsultVO.setDataList(consultList);
				model.addAttribute("pagingVO", pagingConsultVO);
			}
		}
		
		return goPage;
	}
	
	/**
	 * 비밀번호 변경 전 현재 비밀번호 일치 여부를 확인하는 메소드
	 */
	@ResponseBody
	@RequestMapping(value = "/checkPassword", method = RequestMethod.POST)
	public ResponseEntity<String> checkMyPw(
			@RequestParam(name = "memId") String memId, 
			@RequestParam(name = "memPassword") String memPassword) {
		
		ResponseEntity<String> entity = null;
		
		ServiceResult result = memService.checkMyPw(memId, memPassword);
		
		if(result.equals(ServiceResult.OK)) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/**
	 * 회원 정보 중 비밀번호를 변경하는 메소드
	 */
	@ResponseBody
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public ResponseEntity<String> changeMyPw(
		@RequestParam(name = "memId") String memId, 
		@RequestParam(name = "memPassword") String memPassword) {
		
		ResponseEntity<String> entity = null;
		
		ServiceResult result = memService.changeMyPw(memId, memPassword);
		
		if(result.equals(ServiceResult.OK)) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/**
	 * 회원 정보를 수정하는 메소드
	 */
	@ResponseBody
	@RequestMapping(value = "/changeAccount", method = RequestMethod.POST)
	public ResponseEntity<String> changeMyAcct(@RequestParam Map<String, String> map) {
		ResponseEntity<String> entity = null;
		
		ServiceResult result = null;
		
		//	트리거를 통해 어떤 것을 수정하는지 확인한다.
		boolean trigger = map.get("modalTrigger").equals("Y");
		
		//	트리거는 여부를 확인했으면 해당 값을 제거한다. (서비스 단계에서 오류를 발생시킴)
		map.remove("modalTrigger");
		
		if(trigger) {		//	주소를 변경할 경우
			result = memService.changeMyAddr(map);
		} else {		//	그 외 정보를 변경할 경우
			result = memService.changeMyAcct(map);
		}
		
		if(result.equals(ServiceResult.OK)) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/**
	 * 회원 정보 중 별명과 프로필 사진을 수정하는 메소드
	 */
	@ResponseBody
	@RequestMapping(value = "/changeProfile", method = RequestMethod.POST)
	public ResponseEntity<String> changeProfile(HttpServletRequest req, MemberVO member){
		ResponseEntity<String> entity = null;
		
		try {
			//	프로필 사진이 존재할 경우 프로필 사진 등록
			MultipartFile profile = member.getProfilePhoto();
			if(profile != null && profile.getOriginalFilename() != null && !profile.getOriginalFilename().equals("")) {
//			if(profile.getOriginalFilename() != null && !profile.getOriginalFilename().equals("")) {
				member = fileService.editProfilePhoto(req, member);
			}
			
			ServiceResult result = memService.changeProfile(member);
			
			if(result.equals(ServiceResult.OK)) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			}
		} catch (Exception e) {
			log.error("{}", e);
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/**
	 * 회원이 아이디, 비밀번호 찾는 페이지로 이동하는 메소드
	 */
	@RequestMapping(value = "/findIdPwForm", method = RequestMethod.GET)
	public String findIdPwForm() {
		return "login/findIdPwForm";
	}
	
	/**
	 * 아이디 찾기 메소드
	 */
	@RequestMapping(value = "/findId.do", method = RequestMethod.POST)
	public String findId(MemberVO member, Model model) {
		String goPage = "";
		String memId = memService.getMemId(member);

		//	JavaMail API
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");
			mailHelper.setFrom("baek1853@naver.com", "(주)잡을래");   	//	보내는 사람 email 안해주면 smtp 권한 오류남
			mailHelper.setTo(member.getEmail());   						//	받는사람 email
			mailHelper.setSubject("[잡을래] 요청하신 아이디입니다.");   //	제목
			//	내용
			String text = ""
					+ "<html><body>"
					+ "안녕하세요 <strong>'구인구직 잡을래?'</strong> 입니다.<br>"
					+ " 회원님께서 요청하신 아이디는 <br>"
					+ memId + " <br>입니다."
					+ "감사합니다.";
			mailHelper.setText(text, true);		//	내용 true해줘야 html형식으로 바뀜
			mailSender.send(mail);				//	mailSender를 통해 메일을 전송함
			
			model.addAttribute("message", "이메일로 전송하였습니다. 이메일을 확인해주세요.");
			goPage = "redirect:/jobel/login";
		} catch (Exception e) {
			log.error("{}", e);
			model.addAttribute("message", "검색 결과가 존재하지 않습니다. 제대로 입력했는지 확인해주세요.");
			goPage = "login/findIdPwForm";
		}
		
		return goPage;
	}

	/**
	 * 비밀번호 찾기 일치 시 변경하는 페이지 이동 메소드
	 */
	@RequestMapping(value = "/changePwForm", method = RequestMethod.GET)
	public String changePwForm() {
		return "login/changePwForm";
	}
	
	/**
	 * 비밀번호 찾기 메소드
	 */
	@RequestMapping(value = "/findPw.do", method = RequestMethod.POST)
	public String findPw(MemberVO member, Model model, RedirectAttributes ra) {
		String goPage = "";
		int count = memService.findMyPw(member);
		
		if(count > 0) {		//	아이디, 이름, 이메일이 일치하는 경우
			ra.addAttribute("memId", member.getMemId());
			goPage = "redirect:/jobel/changePwForm";
		} else {
			model.addAttribute("message", "검색 결과가 존재하지 않습니다. 제대로 입력했는지 확인해주세요.");
			goPage = "login/findIdPwForm";
		}
		
		return goPage;
	}
}
