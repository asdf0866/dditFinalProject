package kr.or.ddit.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IAnswerQnaMapper;
import kr.or.ddit.service.IAnswerQnaService;
import kr.or.ddit.vo.AnswerQnaVO;

@Service
public class AnswerQnaServiceImpl implements IAnswerQnaService {

	@Inject
	private IAnswerQnaMapper mapper;

	@Override
	public AnswerQnaVO selectAnswerList(String boardNo) {
		return mapper.selectAnswer(boardNo);
	}

	@Override
	public ServiceResult insertAnswer(AnswerQnaVO answerVo) {
		ServiceResult result = null;
		int status = mapper.insertAnswer(answerVo);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public ServiceResult updateAnswer(AnswerQnaVO answerVo) {
		ServiceResult result = null;
		int status = mapper.updateAnswer(answerVo);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult deleteAnswer(int answerNo) {
		ServiceResult result = null;
		int status = mapper.deleteAnswer(answerNo);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	

}
























