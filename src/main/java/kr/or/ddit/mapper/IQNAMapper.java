package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.QNAVO;

public interface IQNAMapper {
	public int insertQna(QNAVO qnaVo);
	public List<QNAVO> selectQnaList(PaginationInfoVO<QNAVO> pagingVo);
	public void incrementByHit(String boardNo);
	public QNAVO selectQna(String boardNo);
	public int selectQnaCount(PaginationInfoVO<QNAVO> pagingVo);
	public int updateQna(QNAVO qnaVo);
	public int deleteQna(String boardNo);
}
