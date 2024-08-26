package kr.or.ddit.security;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.or.ddit.mapper.IMemberMapper;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomUserDetailsService implements UserDetailsService {

	@Inject
	private IMemberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.info("@#@#@ loadUserByUsername() 실행!");
		log.info("@#@#@ loadUserByUsername() : " + username);
		
		MemberVO memberVO = new MemberVO();
		try {
			memberVO = mapper.readByUserId(username);
			log.info("query by member mapper : " + memberVO);
			return memberVO == null ? null : new CustomUser(memberVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
