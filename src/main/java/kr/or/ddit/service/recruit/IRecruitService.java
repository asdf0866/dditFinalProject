package kr.or.ddit.service.recruit;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.RecruitmentVO;

public interface IRecruitService {
	public List<RecruitmentVO> getRecListCommons();
	public int getRecruitCount(PaginationInfoVO<RecruitmentVO> pagingVO);
	public List<RecruitmentVO> getRecList(PaginationInfoVO<RecruitmentVO> pagingVO);
	public RecruitmentVO getRecruit(int recruitNo);
	public int incrementRecHit(int recruitNo);
	
	//	기업 회원
	public int getCompanyRecruitCount(String coNo);
	public List<RecruitmentVO> getCompanyRecList(Map<String, Object> pageMap);
	public Map<String, Object> getGenderChart(Map<String, Object> getMap);
	public Map<String, Object> getRecentChart(Map<String, Object> getMap);
	public Map<String, Object> getAgeRangeChart(Map<String, Object> getMap);
	
	//	기업 홈 화면용 쿼리
	public List<RecruitmentVO> getHomeRecList(int qty);
	public List<RecruitmentVO> getDashBoardRecList(String coNo);
}
