package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ApplicationDocumentVO;
import kr.or.ddit.vo.ApplicationVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.RecruitmentVO;

public interface IApplicationMapper {
	public int doApplication(ApplicationVO applyVO);
	public int applyCheck(Map<String, Object> checkMap);
	public int getDocCount(int appNo);
	public int doAppDocument(ApplicationDocumentVO applyDocVO);
	public int getTotalAppCount(String memId);
	public List<ApplicationVO> getApplyRecruit(PaginationInfoVO<ApplicationVO> pagingVO);
	public List<ApplicationVO> getAppList(int recNo);
}
