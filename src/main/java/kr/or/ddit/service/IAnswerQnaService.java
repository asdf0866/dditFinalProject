package kr.or.ddit.service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.AnswerQnaVO;

public interface IAnswerQnaService {

	public AnswerQnaVO selectAnswerList(String boardNo);

	public ServiceResult insertAnswer(AnswerQnaVO answerVo);

	public ServiceResult updateAnswer(AnswerQnaVO answerVo);

	public ServiceResult deleteAnswer(int answerNo);


}
