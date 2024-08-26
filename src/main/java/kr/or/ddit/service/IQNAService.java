package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.QNAVO;

public interface IQNAService {
	public ServiceResult insertQna(QNAVO qnaVo);
	public List<QNAVO> selectQnaList(PaginationInfoVO<QNAVO> pagingVo);
	public QNAVO selectQna(String boardNo);
	public int selectQnaCount(PaginationInfoVO<QNAVO> pagingVo);
	public ServiceResult updateQna(QNAVO qnaVo);
	public ServiceResult deleteQna(String boardNo);
	public ServiceResult deleteQnaAndAnswers(String boardNo);
}
