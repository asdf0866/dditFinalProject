package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.InterestCompanyVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.ReportVO;

public interface IUserServiceMapper {

	public int selectCompanyRankCount(PaginationInfoVO<CompanyVO> pagingVo);

	public List<CompanyVO> selectCompanyRankList(PaginationInfoVO<CompanyVO> pagingVo);

	public CompanyVO getCompanyDetailByCoNo(String coNo);

	public int getLikeCompanyByMemId(InterestCompanyVO intVO);
	
	//	신고기능
	public String getReportId(int reviewNo);
	public int reportReview(ReportVO report);
}
