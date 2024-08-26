package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.AttachFileVO;
import kr.or.ddit.vo.BoardReplyVO;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface IConsultingMapper {

	public int consultingInsert(BoardVO board);


	public List<BoardVO> selectConsultingList(PaginationInfoVO<BoardVO> pagingVO);

	public int selectConsultingCount(PaginationInfoVO<BoardVO> pagingVO);

	public BoardVO selectConsulting(String boardNo);


	public int updateConsulting(BoardVO boardVO);


	public void incrementHit(String boardNo);


	public BoardVO selectBoard(String boardNo);


	public String deleteconsulting(int boardNo);


	public int delete(String boardNo);


	public AttachFileVO consultingDownload(int fileSerialNo);


	public int incrementConsultingDowncount(int fileSerialNo);


	public int updateAttachFile(AttachFileVO attachFileVO);

	//댓글 목록
	//<select id="commentList" resultType="replyVO">
	public List<BoardReplyVO> commentList(String boardNo);


	public List<BoardVO> getPopular5();
}
