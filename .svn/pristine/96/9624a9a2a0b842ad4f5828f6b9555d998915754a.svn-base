package kr.or.ddit.service.userService;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.InterestCompanyVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.ReportVO;

public interface IUserServiceService {

	public int selectCompanyRankCount(PaginationInfoVO<CompanyVO> pagingVo);

	public List<CompanyVO> selectCompanyRankList(PaginationInfoVO<CompanyVO> pagingVo);

	public CompanyVO getCompanyDetailByCoNo(String coNo);

	public int getLikeCompanyByMemId(InterestCompanyVO intVO);
	public ServiceResult reportReview(ReportVO report);

}
