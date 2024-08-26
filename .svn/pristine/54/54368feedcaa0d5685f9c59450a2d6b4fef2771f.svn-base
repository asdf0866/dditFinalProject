package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.FAQVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface IFAQMapper {
	public int faqWrite(FAQVO faqVo);
	public List<FAQVO> getFAQList();
	public int faqUpdate(FAQVO faqVo);
	public int faqDelete(int faqNo);
	public int increaseHit(int faqNo);
	public int selectFaqCount(PaginationInfoVO<FAQVO> pagingVo);
	public List<FAQVO> selectFaqList(PaginationInfoVO<FAQVO> pagingVo);
}
