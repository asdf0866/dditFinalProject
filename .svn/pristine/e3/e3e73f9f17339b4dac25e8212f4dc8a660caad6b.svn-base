package kr.or.ddit.service.board;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.CompanyReviewVO;
import kr.or.ddit.vo.CompanyVO;

public interface IReviewService {
	public ServiceResult reviewWrite(CompanyReviewVO review);			//	리뷰 작성
	public List<CompanyReviewVO> getFavoriteReview();
	public int checkLikeReivew(CompanyReviewVO reviewLike);				//	리뷰 좋아요 여부
	public int addLikeReview(CompanyReviewVO reviewLike);				//	리뷰 좋아요 추가
	
	//	기업회원 기능
	public List<CompanyReviewVO> getCoReviewList(Map<String, Object> pageMap);		//	리뷰 목록 가져오기
	public int getCoReviewCount(String coNo);										//	리뷰 개수 가져오기
	public Map<String, Double> getCoReviewScore(String coNo);						//	리뷰 평점 가져오기
	public int getReviewHits(CompanyVO company);									//	리뷰 총 조회수 가져오기
	public String getRecentReview(CompanyVO company);								//	가장 최근 리뷰 가져오기
	
}
