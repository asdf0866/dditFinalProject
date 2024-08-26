package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.vo.FAQVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface IFAQService {
	public int faqWrite(FAQVO faqVo);
	public List<FAQVO> getFAQList();
	public int faqUpdate(FAQVO faqVo);
	public int faqDelete(int faqNo);
	public int increaseHit(int faqNo);
	public int selectFaqCount(PaginationInfoVO<FAQVO> pagingVo);
	public List<FAQVO> selectFaqList(PaginationInfoVO<FAQVO> pagingVo);
}
