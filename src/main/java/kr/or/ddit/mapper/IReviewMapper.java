package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CompanyReviewVO;
import kr.or.ddit.vo.CompanyVO;

public interface IReviewMapper {
	public int reviewWrite(CompanyReviewVO review);
	public List<CompanyReviewVO> getFavoriteReview();
	public int checkLikeReivew(CompanyReviewVO reviewLike);
	public int addLikeReview(CompanyReviewVO reviewLike);
	
	//	기업 회원
	public List<CompanyReviewVO> getCoReviewList(Map<String, Object> pageMap);
	public int getCoReviewCount(String coNo);
	public Map<String, Double> getCoReviewScore(String coNo);
	public int getReviewHits(CompanyVO company);
	public String getRecentReview(CompanyVO company);
	
}
