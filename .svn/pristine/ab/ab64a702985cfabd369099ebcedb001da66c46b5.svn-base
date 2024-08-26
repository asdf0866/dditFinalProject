package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IConsultingMapper;
import kr.or.ddit.mapper.IReplyMapper;
import kr.or.ddit.service.board.IReplyService;
import kr.or.ddit.vo.BoardReplyVO;

@Service
public class ReplyServiceImpl implements IReplyService {
	
	@Inject
	private IReplyMapper replyMapper;

	@Override
	public void commentinsert(HttpServletRequest req, BoardReplyVO reply) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<BoardReplyVO> getCommentList(String reply_no) {
		return replyMapper.getCommentList(reply_no);
	}

	@Override
	public List<BoardReplyVO> myRecord(String mem_id) {
		// TODO Auto-generated method stub
		return replyMapper.myRecord(mem_id);
	}

	@Override
	public void commentDelete(BoardReplyVO replyVO) {
		// TODO Auto-generated method stub
		replyMapper.commentDelete(replyVO);
		
	}

	/*
	취업상담게시판 댓글
	*/
	@Override
	public int CommentRegist(BoardReplyVO boardReplyVO) {
		return this.replyMapper.CommentRegist(boardReplyVO);
	}

	@Override
	public ServiceResult updateComment(HttpServletRequest req, BoardReplyVO boardReplyVO) {
		// TODO Auto-generated method stub
		return replyMapper.updateComment(req, boardReplyVO);
	}

	@Override
	public int updateCommentAjax(BoardReplyVO boardReplyVO) {
		return replyMapper.updateCommentAjax(boardReplyVO);
	}

	@Override
	public int deleteCommentAjax(BoardReplyVO boardReplyVO) {
		return replyMapper.deleteCommentAjax(boardReplyVO);
	}

	@Override
	public ServiceResult deleteComment(HttpServletRequest req, BoardReplyVO boardReplyVO) {
		// TODO Auto-generated method stub
		return replyMapper.deleteComment(req, boardReplyVO);
	}
}
