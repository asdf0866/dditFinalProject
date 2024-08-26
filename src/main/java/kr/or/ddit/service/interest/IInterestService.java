package kr.or.ddit.service.interest;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.InterestCompanyVO;
import kr.or.ddit.vo.InterestRecruitVO;

public interface IInterestService {
	public ServiceResult checkLikeRecruit(InterestRecruitVO intRecruit);		//	해당 공고 즐겨찾기를 했는지 확인
	public ServiceResult likeRecruit(InterestRecruitVO intRecruit);				//	공고 즐겨찾기 추가
	public ServiceResult likeRecruitDelete(InterestRecruitVO intRecruit);		//	공고 즐겨찾기 삭제
	public List<InterestRecruitVO> getLikeRecruit(String memId);				//	등록 된 관심 공고 가져오기
	
	public List<InterestCompanyVO> getLikeCompanyList(String memId);			//	즐겨찾기한 기업 목록 가져오기
	public ServiceResult likeCompany(InterestCompanyVO intCompany);				//	기업 즐겨찾기 추가
	public ServiceResult likeCompanyDelete(InterestCompanyVO intCompany);		//	기업 즐겨찾기 삭제
}
