package kr.or.ddit.service.member;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IMemberMapper;
import kr.or.ddit.vo.MemberAuthVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PaginationInfoVO;

@Service
public class MemberServiceImpl implements IMemberService {

	@Inject
	private IMemberMapper mapper;
	
	@Inject
	private PasswordEncoder encoder;
	

	@Override
	public MemberVO readByUserId(String memId) {
		return mapper.readByUserId(memId);
	}
	
	@Override
	@Transactional
	public ServiceResult registerMember(MemberVO member) {
		
		//	결과 값을 전송할 객체 생성
		ServiceResult sr = null;
		
		//	계정 비밀번호를 암호화 처리하여 등록
		member.setMemPassword(encoder.encode(member.getMemPassword()));
		
		//	생일 값에서 특수문자 제거 후 등록
		String memberBrdt = member.getBrdt();
		memberBrdt = memberBrdt.replaceAll("-", "");
		member.setBrdt(memberBrdt);
		
		//	회원 등록
		int count1 = mapper.register(member);
		
		//	일반회원 정보 등록
		int count2 = mapper.registerMember(member);
		
		//	일반 회원에 해당하는 권한 등록
		MemberAuthVO memberAuth = new MemberAuthVO();
		memberAuth.setMemId(member.getMemId());
		memberAuth.setAuth("ROLE_MEMBER");
		
		int count3 = mapper.registerAuth(memberAuth);
		
		if(count1 > 0 && count2 > 0 && count3 > 0) {
			sr = ServiceResult.OK;
		} else {
			sr = ServiceResult.FAILED;
		}
		
		return sr;
	}

	@Override
	public int idCheck(String memId) {
		return mapper.idCheck(memId);
	}

	@Override
	@Transactional
	public ServiceResult coMemberEdit(MemberVO member) {
		
		//	결과 값을 반환하기 위한 변수 선언
		ServiceResult result = null;
		
		//	memId, name, jobName, telNo, email
		//	Member 테이블에 있는 정보 업데이트
		int count1 = mapper.memberEdit(member);
		
		//	CO_MEMBER 테이블에 있는 정보 업데이트
		int count2 = mapper.coMemberEdit(member);
		
		if(count1 > 0 && count2 > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public ServiceResult checkMyPw(String memId, String memPassword) {
		ServiceResult result = null;
		
		//	DB의 비밀번호 얻기
		String checkPassword = mapper.getMemberPassword(memId);
		
		//	비밀번호 비교
		if(encoder.matches(memPassword, checkPassword)) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public ServiceResult changeMyPw(String memId, String memPassword) {
		ServiceResult result = null;
		
		String encodePw = encoder.encode(memPassword);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("memId", memId);
		map.put("memPassword", encodePw);
		
		int count = mapper.changeMyPw(map);
		
		if(count > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public ServiceResult changeMyAddr(Map<String, String> map) {
		//	결과를 반환할 변수
		ServiceResult result = null;
		
		//	주소를 변경할 때 사용할 name들은 정해져있으므로 VO객체로 옮긴다.
		MemberVO member = new MemberVO();
		member.setMemId(map.get("memId"));
		member.setPostcode(map.get("postcode"));
		member.setAddressBasic(map.get("addressBasic"));
		member.setAddressDetail(map.get("addressDetail"));
		
		int count = mapper.changeMyAddr(member);
		
		if(count > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public ServiceResult changeMyAcct(Map<String, String> map) {
		
		//	결과를 반환할 변수
		ServiceResult result = null;
		
		Map<String, String> acctMap = new HashMap<String, String>();
		String keyword = "";
		
		//	변경하고자 하는 값이 어떤 것인지 확인하기 위해 map에서 key를 꺼냄
		Iterator<String> key = map.keySet().iterator();
		
		//	Map에서 key를 꺼내 MAPPER로 보낼 HashMap에 keyword로 설정
		while(key.hasNext()) {
			keyword = key.next();
			
			//	key 중에서도 아이디가 아닌 변경할 내용에 대한 key 값을 입력
			if(!keyword.equals("memId")) {
				acctMap.put("keyword", keyword);
			}
			
			//	회원 테이블에 있는 값을 수정할 경우 테이블명을 MEMBER로 넣는다.
			if(keyword.equals("name") || keyword.equals("telno") || keyword.equals("email")) {
				acctMap.put("table", "MEMBER");
			}
			
			//	일반 회원 테이블에 있는 값을 수정할 경우 테이블명을 COMMON_MEMBER로 넣는다.
			if(keyword.equals("nickname") || keyword.equals("gender") || keyword.equals("brdt") || keyword.equals("marriageYn")) {
				acctMap.put("table", "COMMON_MEMBER");
			}
			
			if(keyword.equals("brdt")) {		//	생일을 변경하는 경우, 날짜 형식이므로 특수문자 제거
				String memberBrdt = map.get(keyword);
				memberBrdt = memberBrdt.replaceAll("-", "");
				acctMap.put("value", memberBrdt);
			} else {
				//	꺼낸 key를 통해 MAPPER로 보낼 변경할 값을 value 라는 이름으로 설정 
				acctMap.put("value", map.get(keyword));
			}
		}
		
		//	변경할 아이디 값도 꺼내서 입력
		acctMap.put("memId", map.get("memId"));
		
		int count = mapper.changeMyAcct(acctMap);
		
		if(count > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public ServiceResult changeProfile(MemberVO member) {
		ServiceResult result = null;
		int count = mapper.changeProfile(member);
		
		if(count > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	//********************
	//	관리자 기능
	@Override
	public List<MemberVO> getMemberList(PaginationInfoVO<MemberVO> pagingVO) {
		return mapper.getMemberList(pagingVO);
	}

	@Override
	public int getMemberCount() {
		return mapper.getMemberCount();
	}

	@Override
	public MemberVO memberDataGet(String memId) {
		return mapper.memberDataGet(memId);
	}

	@Override
	public List<MemberVO> coMemberDateGet(String coNo) {
		return mapper.coMemberDateGet(coNo);
	}

	@Override
	public String getMemId(MemberVO member) {
		return mapper.getMemId(member);
	}

	@Override
	public int findMyPw(MemberVO member) {
		return mapper.findMyPw(member);
	}

}
