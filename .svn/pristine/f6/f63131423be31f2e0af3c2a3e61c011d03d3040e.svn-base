package kr.or.ddit.service.member;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface IMemberService {
	public ServiceResult registerMember(MemberVO member);
	public int idCheck(String memId);
	public ServiceResult coMemberEdit(MemberVO member);
	public ServiceResult checkMyPw(String memId, String memPassword);
	public ServiceResult changeMyPw(String memId, String memPassword);
	public ServiceResult changeMyAddr(Map<String, String> map);
	public ServiceResult changeMyAcct(Map<String, String> map);
	public MemberVO readByUserId(String memId);
	public ServiceResult changeProfile(MemberVO member);
	
	//	관리자 기능
	public List<MemberVO> getMemberList(PaginationInfoVO<MemberVO> pagingVO);
	public int getMemberCount();
	public MemberVO memberDataGet(String memId);
	public List<MemberVO> coMemberDateGet(String coNo);
	
	//	아이디 비밀번호 찾기
	public String getMemId(MemberVO member);
	public int findMyPw(MemberVO member);
}
