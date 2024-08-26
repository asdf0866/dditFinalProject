package kr.or.ddit.security;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.MemberVO;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	
	private static final Logger log = LoggerFactory.getLogger(CustomLoginSuccessHandler.class);

	private RequestCache requestCache = new HttpSessionRequestCache();
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		log.info("### onAuthenticationSuccess() 실행!");
		
		User customUser = (User) authentication.getPrincipal();
		String username = customUser.getUsername();
		String password = customUser.getPassword();
		log.info("### username : " + username);
		log.info("### password : " + password);
		
		//	시큐리티 내 발생한 에러 세션 정보들을 삭제
		clearAuthenticationAttribute(request);
		
		//	요청이 가지고 있는 request 내 타겟 정보
		//	타겟 정보가 존재한다면 타겟으로 이동시켜준다.
		String targetUrl = "";
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		
		if(savedRequest != null) {
			targetUrl = savedRequest.getRedirectUrl();
		} else {
			targetUrl = "/jobel/home";
		}
		
		//	만약에 기업회원이라면 기업 화면으로 이동시킨다.
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Iterator<GrantedAuthority> ite = user.getAuthorities().iterator();
		while (ite.hasNext()) {
			String authName = ite.next().getAuthority();
			log.info("### user.auth : " + authName);
			if(authName.equals("ROLE_COMPANY")) {		//	기업 회원
				targetUrl = "/jobel/co_home";
			}
			if(authName.equals("ROLE_ADMIN")) {		//	관리자
				targetUrl = "/jobel/adminHome?menu=memberManage";
			}
		}
		
		//	승인 또는 반려 된 기업 회원 검증 절차
		MemberVO member = user.getMember();
		String statCode = member.getMemStatCode();
		if(statCode.equals("MEMSTAT100")) {
			targetUrl = "/jobel/waitCompany?stat=wait";
		}
		
		if(statCode.equals("MEMSTAT102")) {
			targetUrl = "/jobel/waitCompany?stat=cancel";
		}
		
		log.info("Login Success targetUrl : " + targetUrl);
		response.sendRedirect(targetUrl);
	}

	private void clearAuthenticationAttribute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		if(session == null) {
			return;
		}
		
		//	SPRING_SECURITY_LAST_EXCEPTION 값에 해당하는 KEY
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}
}
