package kr.or.ddit.controller.company;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.security.PermitAll;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import kr.or.ddit.service.commonCode.ICommonCodeService;
import kr.or.ddit.service.company.ICompanyService;
import kr.or.ddit.service.file.IFileService;
import kr.or.ddit.service.recruit.IRecruitService;
import kr.or.ddit.vo.AttachFileVO;
import kr.or.ddit.vo.CommonCodeVO;
import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.RecruitmentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/jobel")
//@PreAuthorize("hasRole('ROLE_COMPANY')")
@Controller
public class CompanyController {

	@Inject
	private ICompanyService comService;
	
	@Inject
	private IRecruitService recService;
	
	@Inject
	private ICommonCodeService codeService;
	
	@Inject
	private IFileService fileService;
	
	/**
	 * 기업 메뉴 최초 페이지 이동
	 */
	@PermitAll
	@RequestMapping(value = "/co_menu", method = RequestMethod.GET)
	public String companyLoginForm() {
		return "login/company/companyLoginForm";
	}
	
	/**
	 * 기업 등록 폼 이동 메소드
	 */
	@RequestMapping(value = "/co_register", method = RequestMethod.GET)
	public String registerForm(Model model) {
		model.addAttribute("bodyText", "registerBody");
		return "login/company/registerForm";
	}
	
	
	/**
	 * 기업 등록 메소드
	 * @return 성공 : 기업 로그인 페이지 / 실패 : 기업 등록 폼 페이지
	 */
	@RequestMapping(value = "/co_register", method = RequestMethod.POST)
	public String registerCompany(HttpServletRequest req, CompanyVO company) {
		log.info("registerCompany 실행!");

		String result = "";
		ServiceResult sr = null;

		//	기업 로고 이미지 가져오기
		MultipartFile imgFile = company.getImgFile();
		
		//	로고가 존재한다면 등록 진행
		if(imgFile.getOriginalFilename() != null && !imgFile.getOriginalFilename().equals("")) {
			//	기업 로고 등록
			company = fileService.registerCoLo(req, company);
		}
		
		//	기업 증명 서류 등록
		//	서류 파일은 여러 개일 수 있으므로 List 객체에 담겨서 온다.
		List<MultipartFile> reqFiles = company.getRequiredFile();
		
		//	첨부 파일이 존재하는 경우
		if(!reqFiles.isEmpty() && reqFiles != null) {
			company = fileService.registerReqFile(req, company);
		}
		
		sr = comService.registerCompany(req, company);
		
		if(sr.equals(ServiceResult.OK)) {
			result = "redirect:/jobel/co_login";
		} else {
			result = "login/company/registerForm";
		}
		
		return result;
	}
	
	/**
	 * 기업 정보 수정 메소드
	 */
	@RequestMapping(value = "/editCompany", method = RequestMethod.POST)
	public ResponseEntity<String> editCompany(CompanyVO company){
		ResponseEntity<String> entity = null;
		
		ServiceResult result = comService.editCompany(company);
		
		if(result.equals(ServiceResult.OK)) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	/**
	 * 기업 회원 메인 화면 이동 메소드
	 */
//	@PreAuthorize("hasRole('ROLE_COMPANY')")
	@RequestMapping(value = "/co_home", method = RequestMethod.GET)
	public String companyHome(HttpServletRequest req, RedirectAttributes ra, Model model) {
		
		//	로그인 정보에서 작성자 아이디 가져오기
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		MemberVO member = user.getMember();
		
		//	자신의 기업 번호를 얻어오기
		String coNo = member.getCoNo();
		
		//	대쉬보드 창 간소화 된 채용공고 목록창에 띄울 공고 목록 가져오기
		List<RecruitmentVO> recList = recService.getDashBoardRecList(coNo);
		
		Map<String, Object> getMap = new HashMap<String, Object>();
		getMap.put("coNo", coNo);
		
		//	지원자 현황 중 현재 진행 중인 공고들에 지원한 성비율을 가져오기
		Map<String, Object> genderChart = recService.getGenderChart(getMap);
		
		List<String> genderName = new ArrayList<String>();
		List<BigDecimal> genderData = new ArrayList<BigDecimal>();
		
		genderName.add("'총원'");
		genderData.add((BigDecimal) genderChart.get("TOTAL"));
		
		genderName.add("'남성'");
		genderData.add((BigDecimal) genderChart.get("WOMAN"));
		
		genderName.add("'여성'");
		genderData.add((BigDecimal) genderChart.get("MAN"));
		
		//	지원자 현황 중 현재 진행 중인 공고들에 날짜별 지원한 지원자 수 구하기
		Map<String, Object> recentChart = recService.getRecentChart(getMap);
		
		//	오늘 기준 최대 5일 구하기(4일 전까지의 값)
		LocalDateTime now = LocalDateTime.now();
		int year = now.getYear() - 2000;
		int month = now.getMonthValue();
		int day = now.getDayOfMonth();
		
		List<String> recentName = new ArrayList<String>();
		List<BigDecimal> recentData = new ArrayList<BigDecimal>();
		
		//	4일 전
		String dateName = "'" + year + "-" + month + "-" + (day - 4) + "'";
		recentName.add(dateName);
		recentData.add((BigDecimal) recentChart.get("BEFORE4"));
		
		//	3일 전
		dateName = "'" + year + "-" + month + "-" + (day - 3) + "'";
		recentName.add(dateName);
		recentData.add((BigDecimal) recentChart.get("BEFORE3"));
		
		//	2일 전
		dateName = "'" + year + "-" + month + "-" + (day - 2) + "'";
		recentName.add(dateName);
		recentData.add((BigDecimal) recentChart.get("BEFORE2"));
		
		//	1일 전
		dateName = "'" + year + "-" + month + "-" + (day - 1) + "'";
		recentName.add(dateName);
		recentData.add((BigDecimal) recentChart.get("BEFORE1"));
		
		//	오늘
		dateName = "'" + year + "-" + month + "-" + day + "'";
		recentName.add(dateName);
		recentData.add((BigDecimal) recentChart.get("TODAY"));
		
		//	데이터 전달
		model.addAttribute("recruitList", recList);
		model.addAttribute("genderName", genderName);
		model.addAttribute("genderData", genderData);
		model.addAttribute("recentName", recentName);
		model.addAttribute("recentData", recentData);
		
		return "company/home";
	}
	
	
	/**
	 * 기업 회원 공고 목록 이동 메소드 
	 */
	@RequestMapping(value = "/co_rec_list", method = RequestMethod.GET)
	public String recruitListHome(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			Model model) {
		
		//	로그인 정보에서 작성자 아이디 가져오기
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		MemberVO member = user.getMember();
		
		//	자신의 기업 번호를 얻어오기
		String coNo = member.getCoNo();
		
		PaginationInfoVO<RecruitmentVO> pagingVO = new PaginationInfoVO<RecruitmentVO>();
		
		pagingVO.setScreenSize(10);					//	한 화면에 10개의 공고를 보여줌
		pagingVO.setCurrentPage(currentPage);		//	현재 페이지 가져오기
		
		int totalRecord = recService.getCompanyRecruitCount(coNo);
		pagingVO.setTotalRecord(totalRecord);		//	가져온 공고의 개수 설정
		
		Map<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("coNo", coNo);
		pageMap.put("startRow", pagingVO.getStartRow());
		pageMap.put("endRow", pagingVO.getEndRow());
		
		List<RecruitmentVO> recList = recService.getCompanyRecList(pageMap);
		pagingVO.setDataList(recList);
		
		model.addAttribute("pagingVO", pagingVO);
		
		return "company/recruit_list";
	}
	
	
	/**
	 * 채용 공고 작성 폼 이동 메소드
	 */
	@RequestMapping(value = "/co_rec_write", method = RequestMethod.GET)
	public String recruitWriteForm(Model model) {

		//	공고 작성 중 직무를 선택하기 위한 List 
		//	공통 코드 'JOB---T' 는 직무가 적혀있는 공통 코드이다.
		List<CommonCodeVO> jobCodeList = codeService.getJobList("JOB");
		model.addAttribute("jobCodeList", jobCodeList);
		
		return "company/recruit_writeForm";
	}
	
	
	/**
	 * 채용 공고 등록 메소드
	 */
	@RequestMapping(value = "/co_rec_write", method = RequestMethod.POST)
	public String recruitWrite(HttpServletRequest req, RecruitmentVO recruit) {
		
		//	등록 성공, 실패 여부에 따라 달라지는 이동 URL 정보를 담을 변수 선언
		String goPage = "";
		
		//	성공 여부를 위한 Enum 선언
		ServiceResult sr = null;
		
		//	로그인 정보에서 작성자 아이디 가져오기
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		MemberVO member = user.getMember();
		
		//	아이디 입력을 임시로 하드코딩 작업함
		recruit.setCoMemId(member.getMemId());
		
		//	채용 공고 시간 형식 변경 메소드 호출
		recruit = chagneTime(recruit);
		
		//	파일은 여러 개일 수 있으므로 List 객체에 담겨서 온다.
		List<MultipartFile> reqFiles = recruit.getRecFiles();
		
		//	파일이 존재할 경우 파일 등록 서비스로 보낸다.
		if(!reqFiles.isEmpty() && reqFiles != null) {
			recruit = fileService.registerRecFile(req, recruit);
		}
		
		//	채용 공고 등록
		sr = comService.recruitWrite(req, recruit);
		
		if(sr.equals(ServiceResult.OK)) {		//	등록 성공
			goPage = "redirect:/jobel/co_rec_list";
		} else {		//	등록 실패
			goPage = "company/recruit_writeForm";
		}
		
		return goPage;
	}

	/**
	 * 공고 목록에서 공고 상세보기로 이동하는 메소드 
	 */
	@RequestMapping(value = "/co_rec_detail", method = RequestMethod.GET)
	public String recruitDetail(int recruitNo, @RequestParam(required = false, name = "trigger") String trigger, Model model) {
		
		//	채용 공고 정보 가져오기
		RecruitmentVO recruit = comService.getRecruitDetail(recruitNo);
		
		//	직종 이름을 출력하기 위한 공통코드 변수
		String jobCode = recruit.getRecruitJob();
		String wrkType = recruit.getWorkType();
		String schType = recruit.getRequiredEducation();
		
		//	직종명을 담을 변수 선언 및 서비스 실행
		String jobCodeName = codeService.getCodeName(jobCode);
		String wrkTypeName = codeService.getCodeName(wrkType);
		String schTypeName = codeService.getCodeName(schType);
		
		//	얻어온 직종명을 VO객체에 입력
		recruit.setJobName(jobCodeName);
		recruit.setWrkTypeName(wrkTypeName);
		recruit.setSchTypeName(schTypeName);
		
		//	로고 경로를 담을 변수 선언 및 서비스 실행
		String coLogoPath = comService.getLogoPath(recruit.getCoNo());
		
		//	얻어온 로고 경로를 VO객체에 입력
		recruit.setCoLogoPath(coLogoPath);
		
		String attachFile = recruit.getAttachFile();
		
		//	파일이 존재한다면
		if(attachFile != null && !attachFile.equals("") && attachFile != "") {
			List<AttachFileVO> attachFileList = new ArrayList<AttachFileVO>();
			attachFileList = fileService.getFileList(attachFile);
			model.addAttribute("fileList", attachFileList);
		}
		model.addAttribute("recruit", recruit);

		//	상세보기인지 수정하기인지 확인하기 위한 트리거
		String goPage = "";
		if(trigger != null && !trigger.equals("")) {		//	수정하기
			//	공고 작성 중 직무를 선택하기 위한 List 
			List<CommonCodeVO> jobCodeList = new ArrayList<CommonCodeVO>();
			
			//	공통 코드 'JOB---T' 는 직무가 적혀있는 공통 코드이다.
			jobCodeList = codeService.getJobList("JOB");
			
			model.addAttribute("jobCodeList", jobCodeList);
			
			goPage = "company/recruit_editForm";
			
		} else {		//	상세보기
			goPage = "company/recruit_detail";
		}
		
		return goPage;
	}
	
	/**
	 * 채용 공고 수정 메소드
	 */
	@RequestMapping(value = "/co_rec_edit", method = RequestMethod.POST)
	public String recruitEdit(HttpServletRequest req, RecruitmentVO recruit) {
		
		//	수정 성공, 실패 여부에 따라 달라지는 이동 경로 정보를 담을 변수 선언
		String goPage = "";
		
		//	성공 여부를 위한 Enum 선언
		ServiceResult sr = null;
		
		//	채용 공고 시간 형식 변경 메소드 호출
		recruit = chagneTime(recruit);
		
		//	파일은 여러 개일 수 있으므로 List 객체에 담겨서 온다.
		List<MultipartFile> reqFiles = recruit.getRecFiles();
		
		//	파일이 존재할 경우 파일 등록 서비스로 보낸다.
		if(!reqFiles.isEmpty() && reqFiles != null) {

			//	이미 파일을 등록한 적이 있는 경우
			String attachId = recruit.getAttachFile();
			if(attachId != null && !attachId.equals("")) {
				sr = fileService.editRecFile(req, recruit);
				
				if(sr.equals(ServiceResult.FAILED)) {
					//	등록을 더 진행하지 않고 돌려보낸다.
					return "company/recruit_editForm";
				}
			} else {		//	등록한 적 없는 경우 신규 등록
				recruit = fileService.registerRecFile(req, recruit);
			}
		}		//	파일 등록 if문 종료
		
		//	채용 공고 수정
		sr = comService.recruitEdit(req, recruit);
		
		if(sr.equals(ServiceResult.OK)) {		//	등록 성공
			goPage = "redirect:/jobel/co_rec_detail?recruitNo="+recruit.getRecruitNo();
		} else {		//	등록 실패
			goPage = "company/recruit_editForm";
		}
		
		return goPage;
	}
	
	/**
	 * 채용 공고를 삭제하는 메소드
	 */
	@ResponseBody
	@RequestMapping(value = "/co_rec_del", method = RequestMethod.POST)
	public ResponseEntity<String> recruitDelete(@RequestParam(name="recruitNo") int recruitNo) {
		
		//	메소드 실행 결과를 전달할 entity 생성
		ResponseEntity<String> entity = null;
		
		//	채용 공고 정보 가져오기
		RecruitmentVO recruit = new RecruitmentVO();
		recruit = comService.getRecruitDetail(recruitNo);
		
		String attachFile = recruit.getAttachFile();
		
		//	파일이 존재한다면
		if(attachFile != null && !attachFile.equals("") && attachFile != "") {
			List<AttachFileVO> attachFileList = new ArrayList<AttachFileVO>();
			attachFileList = fileService.getFileList(attachFile);
			
			//	해당 목록에 해당되는 파일 전부 삭제처리한다.
			for(AttachFileVO file : attachFileList) {
				fileService.delFile(file);
			}
		}
		
		//	삭제 실행 결과를 받아올 Enum 생성
		ServiceResult sr = null;
		
		sr = comService.recruitDelete(recruitNo);
		
		if(sr.equals(ServiceResult.OK)) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	//------------------------------------------------------//
	//	채용 공고 시간 형식 변경 메소드
	private RecruitmentVO chagneTime(RecruitmentVO recruit) {
		//	채용 공고 시작 및 종료 시간 형식 변경
		String bgngYmb = recruit.getRecruitBgngYmd();
		String ddlnYmd = recruit.getRecruitDdlnYmd();
		String bgngDt = recruit.getRecruitBgngDt();
		String ddlnDt = recruit.getRecruitDdlnDt();
		
//		log.info("시작 일자 >>>>> " + bgngYmb);
//		log.info("종료 일자 >>>>> " + ddlnYmd);
//		log.info("시작 시간 >>>>> " + bgngDt);
//		log.info("종료 일자 >>>>> " + ddlnDt);
		
		bgngYmb = bgngYmb.replaceAll("\\D", "");
		ddlnYmd = ddlnYmd.replaceAll("\\D", "");
		bgngDt = bgngDt.replaceAll("\\D", "");
		ddlnDt = ddlnDt.replaceAll("\\D", "");
		
//		log.info("시작 일자 변경 >>>>> " + bgngYmb);
//		log.info("종료 일자 변경 >>>>> " + ddlnYmd);
//		log.info("시작 시간 변경 >>>>> " + bgngDt);
//		log.info("종료 일자 변경 >>>>> " + ddlnDt);
		
		//	형식 변경한 시간으로 재입력
		recruit.setRecruitBgngYmd(bgngYmb);
		recruit.setRecruitDdlnYmd(ddlnYmd);
		recruit.setRecruitBgngDt(bgngDt);
		recruit.setRecruitDdlnDt(ddlnDt);
		
		return recruit;
	}
}
