package kr.or.ddit.security;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/jobel")
@Controller
public class LoginController {
	
	/**
	 * 일반 회원 로그인 페이지로 이동하는 메소드
	 * @return 일반회원 로그인 페이지
	 */
	@PreAuthorize("permitAll")
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String memberLoginForm(String error, String logout, Model model) {
		
		String goPage = "login/loginForm";
		
		if(error != null) {
			model.addAttribute("message", "로그인 중 에러가 발생했습니다. 다시 입력해주세요.");
		}
		
		if(logout != null) {
			goPage = "redirect:/jobel/home";
		}
		
		return goPage;
	}
	
	/**
	 * 기업 회원 로그인 페이지로 이동하는 메소드
	 * @return 기업 회원 로그인 페이지
	 */
	@PreAuthorize("permitAll")
	@RequestMapping(value = "/co_login", method = RequestMethod.GET)
	public String companyLoginForm() {
		return "login/company/companyLoginForm"; 
	}
	
}
