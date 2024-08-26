package kr.or.ddit.mapper;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.BoardReplyVO;

public interface IReplyMapper {

	List<BoardReplyVO> getCommentList(String reply_no);

	List<BoardReplyVO> myRecord(String mem_id);

	void commentDelete(BoardReplyVO replyVO);
	
	/*
	취업상담게시판 댓글
	INSERT INTO BOARD_REPLY(REPLY_NO, PARENT_REPLY_NO, MEM_ID, BOARD_ID, REPLY_CONTENT, REPLY_WRT_DT, DEL_YN)
	VALUES('BOARD00028001',NULL,'aa1234','BOARD00028','내용',SYSDATE,'N')
	<insert id="CommentRegist" parameterType="replyVO">
	*/
	public int CommentRegist(BoardReplyVO boardReplyVO);

	public ServiceResult updateComment(HttpServletRequest req, BoardReplyVO boardReplyVO);

	public int updateCommentAjax(BoardReplyVO boardReplyVO);

	public int deleteCommentAjax(BoardReplyVO boardReplyVO);

	public ServiceResult deleteComment(HttpServletRequest req, BoardReplyVO boardReplyVO);
}
