package kr.or.ddit.controller.company;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.commonCode.ICommonCodeService;
import kr.or.ddit.service.company.ICompanyService;
import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.vo.CommonCodeVO;
import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.MemberAuthVO;
import kr.or.ddit.vo.MemberVO;

@RequestMapping("/jobel")
@Controller
public class CompanyMemberController {

	//	기업 메뉴 중 회원 관련된 부분만 여기에 작성할 것
	@Inject
	private ICompanyService comService;
	
	@Inject
	private IMemberService memService;
	
	@Inject
	private ICommonCodeService codeService;
	
	/**
	 * 마이 페이지 이동하기 전 비밀번호를 검증하는 페이지로 이동
	 */
	@RequestMapping(value = "/co_mem_pw_check", method = RequestMethod.GET)
	public String coMemPwCheckPage() {
		return "company/member_pw_checkpage";
	}
	
	/**
	 * 비밀번호 검증하는 메소드
	 */
	@RequestMapping(value = "/co_mem_pw_check", method = RequestMethod.POST)
	public String coMemPwCheck(String password, Model model) {
		String goPage = "";
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memId = user.getMember().getMemId();
		
		ServiceResult result = memService.checkMyPw(memId, password);
		
		if(result.equals(ServiceResult.OK)) {
			goPage = "redirect:/jobel/co_mem_page";
		} else {
			model.addAttribute("errors", "비밀번호가 일치하지 않습니다.");
			goPage = "company/member_pw_checkpage";
		}
		
		return goPage;
	}
	
	/**
	 * 기업 회원이 자신의 회원 정보 창으로 이동하는 메소드
	 */
	@RequestMapping(value = "/co_mem_page", method = RequestMethod.GET)
	public String coMemberMyPage(Model model) {
		
		//	로그인한 회원 정보 가져오기
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		//	회원 아이디를 통해 DB의 회원 정보 가져오기
		String memId = user.getMember().getMemId();
		MemberVO member = memService.readByUserId(memId);
		
		//	기업 회원의 정보를 통해 기업 정보 가져오기
		String coNo = member.getCoNo();
		CompanyVO company = comService.getCompany(coNo);
		
		//	기업 정보를 수정할 경우를 위한 직군 공통코드
		List<CommonCodeVO> codeList = codeService.getJobList("JOB");
		
		model.addAttribute("member", member);
		model.addAttribute("company", company);
		model.addAttribute("codeList", codeList);
		
		return "company/member_page";
	}
	
	/**
	 * 기업 등록 신청 후 승인 대기 또는 반려 상태의 회원이 로그인했을 때 이동되는 페이지
	 */
	@RequestMapping(value = "/waitCompany", method = RequestMethod.GET)
	public String waitCompanyHome(String stat, Model model) {
		
		if(stat.equals("wait")) {
			model.addAttribute("stat", "wait");
		}
		if(stat.equals("cancel")) {
			model.addAttribute("stat", "cancel");
		}
		return "login/company/cancelCompanyHome";
	}
}
