package kr.or.ddit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.AttachFileVO;
import kr.or.ddit.vo.BoardReplyVO;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface IConsultingService {
	public ServiceResult consultingInsert(HttpServletRequest req, BoardVO board);
	public int selectConsultingCount(PaginationInfoVO<BoardVO> pagingVO);
	public List<BoardVO> selectConsultingList(PaginationInfoVO<BoardVO> pagingVO);
	public BoardVO selectConsulting(String boardNo);
	public ServiceResult updateConsulting(HttpServletRequest req, BoardVO boardVO);
	public BoardVO selectBoard(String boardNo);
	public void delete(String boardNo);
	public AttachFileVO consultingDownload(int fileSerialNo);
	//댓글 목록
	public List<BoardReplyVO> commentList(String boardNo);

	
	//	파일업로드
	public int updateAttachFile(AttachFileVO attachFileVO);
	//인기글 
	public List<BoardVO> getPopular5();

}
