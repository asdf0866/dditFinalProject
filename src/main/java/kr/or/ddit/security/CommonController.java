package kr.or.ddit.security;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CommonController {
	
	private static final Logger log = LoggerFactory.getLogger(CommonController.class);
	
	@RequestMapping(value = "/accessError")
	public String accessDenied(HttpServletRequest request, Authentication auth, RedirectAttributes ra) {
		log.info("accessDenied() 실행!");
		/*
			auth의 정보 출력
				org.springframework.security.authentication.UsernamePasswordAuthenticationToken@8ae115:
				UserName : member;
				Password : [PROTECTED];
				Enabled : true;
				AccountNonExpired : true;
				CredentialNonExpired : true;
				AccountNonLocked : true;
				Granted Authorities : ROLE_MEMBER;
				Credentials : [PROTECTED];
				Authenticated : true;
				Details : org.springframework.security:web.authentication.WebAuthenticationDetails@
				SessionId : 5FA58F74576592A925177200B9BFECEF;
				Granted Authorities : ROLE_MEMBER;
		 */
		log.info("Access Denied : " + auth);
		
		String goPage = "";
		ra.addFlashAttribute("message", "해당 권한이 없습니다.");
		
		if(request.getHeader("Referer") != null) {
			goPage = "redirect:" + request.getHeader("Referer");
		} else {
			goPage = "redirect:/jobel/login";
		}
		
		return goPage;
	}
}
