package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IFAQMapper;
import kr.or.ddit.service.IFAQService;
import kr.or.ddit.vo.FAQVO;
import kr.or.ddit.vo.PaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FAQServiceImpl implements IFAQService {

	@Inject
	private IFAQMapper mapper;
	
	@Override
	public int faqWrite(FAQVO faqVo) {
		int count = mapper.faqWrite(faqVo);
		return count;
	}

	@Override
	public List<FAQVO> getFAQList() {
		return mapper.getFAQList();
	}

	@Override
	public int faqUpdate(FAQVO faqVo) {
		return mapper.faqUpdate(faqVo);
	}

	@Override
	public int faqDelete(int faqNo) {
		return mapper.faqDelete(faqNo);
	}

	@Override
	public int increaseHit(int faqNo) {
		return mapper.increaseHit(faqNo);
	}

	@Override
	public int selectFaqCount(PaginationInfoVO<FAQVO> pagingVo) {
		return mapper.selectFaqCount(pagingVo);
	}

	@Override
	public List<FAQVO> selectFaqList(PaginationInfoVO<FAQVO> pagingVo) {
		return mapper.selectFaqList(pagingVo);
	}

}
