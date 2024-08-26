package kr.or.ddit.service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.BoardReplyVO;

public interface IReplyService {

	public void commentinsert(HttpServletRequest req, BoardReplyVO reply);
	
	List<BoardReplyVO> getCommentList(String reply_no); // 댓글 목록
	List<BoardReplyVO> myRecord(String mem_id); //작성자
	void commentDelete(BoardReplyVO replyVO); // 삭제 

	//취업상담게시판 댓글
	public int CommentRegist(BoardReplyVO boardReplyVO);

	public ServiceResult updateComment(HttpServletRequest req, BoardReplyVO boardReplyVO);

	//댓글 수정
	public int updateCommentAjax(BoardReplyVO boardReplyVO);

	//댓글 삭제 처리 
	public int deleteCommentAjax(BoardReplyVO boardReplyVO);

	public ServiceResult deleteComment(HttpServletRequest req, BoardReplyVO boardReplyVO);
	
	
	

}
