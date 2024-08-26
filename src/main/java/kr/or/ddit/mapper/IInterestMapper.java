package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.InterestCompanyVO;
import kr.or.ddit.vo.InterestRecruitVO;

public interface IInterestMapper {
	public int checkLikeRecruit(InterestRecruitVO intRecruit);
	public int likeRecruit(InterestRecruitVO intRecruit);
	public int likeRecruitDelete(InterestRecruitVO intRecruit);
	public List<InterestRecruitVO> getLikeRecruit(String memId);
	public List<InterestCompanyVO> getLikeCompanyList(String memId);
	public int likeCompany(InterestCompanyVO intCompany);
	public int likeCompanyDelete(InterestCompanyVO intCompany);
}
