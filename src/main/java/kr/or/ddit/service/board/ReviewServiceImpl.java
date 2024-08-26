package kr.or.ddit.service.board;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IReviewMapper;
import kr.or.ddit.vo.CompanyReviewVO;
import kr.or.ddit.vo.CompanyVO;

@Service
public class ReviewServiceImpl implements IReviewService {
	
	@Inject
	private IReviewMapper mapper;

	@Override
	public ServiceResult reviewWrite(CompanyReviewVO review) {
		ServiceResult result = null;
		int count = mapper.reviewWrite(review);
		
		if(count > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public List<CompanyReviewVO> getCoReviewList(Map<String, Object> pageMap) {
		return mapper.getCoReviewList(pageMap);
	}

	@Override
	public int getCoReviewCount(String coNo) {
		return mapper.getCoReviewCount(coNo);
	}

	@Override
	public Map<String, Double> getCoReviewScore(String coNo) {
		return mapper.getCoReviewScore(coNo);
	}

	@Override
	public List<CompanyReviewVO> getFavoriteReview() {
		return mapper.getFavoriteReview();
	}

	@Override
	public int getReviewHits(CompanyVO company) {
		return mapper.getReviewHits(company);
	}

	@Override
	public String getRecentReview(CompanyVO company) {
		return mapper.getRecentReview(company);
	}

	@Override
	public int checkLikeReivew(CompanyReviewVO reviewLike) {
		return mapper.checkLikeReivew(reviewLike);
	}

	@Override
	public int addLikeReview(CompanyReviewVO reviewLike) {
		return mapper.addLikeReview(reviewLike);
	}

}
