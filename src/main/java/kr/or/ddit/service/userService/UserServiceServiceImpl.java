package kr.or.ddit.service.userService;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IUserServiceMapper;
import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.InterestCompanyVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.ReportVO;

@Service
public class UserServiceServiceImpl implements IUserServiceService {

	@Inject
	private IUserServiceMapper mapper;
	
	@Override
	public int selectCompanyRankCount(PaginationInfoVO<CompanyVO> pagingVo) {
		return mapper.selectCompanyRankCount(pagingVo);
	}

	@Override
	public List<CompanyVO> selectCompanyRankList(PaginationInfoVO<CompanyVO> pagingVo) {
		return mapper.selectCompanyRankList(pagingVo);
	}

	@Override
	public CompanyVO getCompanyDetailByCoNo(String coNo) {
		return mapper.getCompanyDetailByCoNo(coNo);
	}

	@Override
	public int getLikeCompanyByMemId(InterestCompanyVO intVO) {
		return mapper.getLikeCompanyByMemId(intVO);
	}

	@Override
	public ServiceResult reportReview(ReportVO report) {
		ServiceResult result = null;
		
		int reviewNo = report.getReviewNo();
		String memId = mapper.getReportId(reviewNo);
		report.setReportId(memId);
		
		int count = mapper.reportReview(report);
		if(count > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}
}



































