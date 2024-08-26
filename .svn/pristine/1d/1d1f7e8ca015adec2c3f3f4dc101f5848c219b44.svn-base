package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IAnswerQnaMapper;
import kr.or.ddit.mapper.IQNAMapper;
import kr.or.ddit.service.IQNAService;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.QNAVO;

@Transactional
@Service
public class QNAServiceImpl implements IQNAService {
	
	@Inject
	private IQNAMapper mapper;
	
	@Inject
	private IAnswerQnaMapper answerMapper;

	@Override
	public ServiceResult insertQna(QNAVO qnaVo) {
		ServiceResult result = null;
		int status = mapper.insertQna(qnaVo);
		if(status > 0) {	// 등록 성공
			result = ServiceResult.OK;
		}else {	// 등록 실패
			result = ServiceResult.FAILED;
		}
		
		return result;
		
	}

	@Override
	public int selectQnaCount(PaginationInfoVO<QNAVO> pagingVo) {
		return mapper.selectQnaCount(pagingVo);
	}
	
	@Override
	public List<QNAVO> selectQnaList(PaginationInfoVO<QNAVO> pagingVo) {
		return mapper.selectQnaList(pagingVo);
	}

	@Override
	public QNAVO selectQna(String boardNo) {
		mapper.incrementByHit(boardNo);	//조회수 증가
		return mapper.selectQna(boardNo);
	}

	@Override
	public ServiceResult updateQna(QNAVO qnaVo) {
		ServiceResult result = null;
		int status = mapper.updateQna(qnaVo);
		if(status > 0) {	// 수정 성공
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult deleteQna(String boardNo) {
		ServiceResult result = null;
		int status = mapper.deleteQna(boardNo);
		if(status > 0) {	// 수정 성공
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult deleteQnaAndAnswers(String boardNo) {
		answerMapper.deleteQnaAndAnswers(boardNo);	// QNA 관련 답변 삭제
		int cnt = mapper.deleteQna(boardNo);		// QNA 삭제
		if (cnt > 0) {
			return ServiceResult.OK;
		}else {
			return ServiceResult.FAILED;
		}
	}
}




























