package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberAuthVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface IMemberMapper {
	public int register(MemberVO member);
	public int registerMember(MemberVO member);
	public int registerAuth(MemberAuthVO memberAuth);
	public int deleteAuth(String id);
	public int registerCoMember(MemberVO member);
	public int idCheck(String memId);
	public int memberEdit(MemberVO member);
	public int coMemberEdit(MemberVO member);
	public String getMemberPassword(String memId);
	public int changeMyPw(Map<String, String> map);
	public int changeMyAddr(MemberVO member);
	public int changeMyAcct(Map<String, String> acctMap);
	public int changeProfile(MemberVO member);
	public MemberVO readByUserId(String username);
	
	//	관리자 기능
	public List<MemberVO> getMemberList(PaginationInfoVO<MemberVO> pagingVO);
	public int getMemberCount();
	public MemberVO memberDataGet(String memId);
	public List<MemberVO> coMemberDateGet(String coNo);
	
	public int signUpCoMember(String coNo);
	public String getCoMemId(String coNo);
	public int cancelCoMember(String coNo);
	
	//	아이디 비밀번호 찾기
	public String getMemId(MemberVO member);
	public int findMyPw(MemberVO member);
}
