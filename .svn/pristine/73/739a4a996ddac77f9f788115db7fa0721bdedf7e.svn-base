package kr.or.ddit.controller.board;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.board.IReplyService;
import kr.or.ddit.vo.BoardReplyVO;
import kr.or.ddit.vo.BoardVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/comment")
public class ConCommentController {
	
	@Inject
	private IReplyService ReplyService;
	
	//{replyNo,memId,boardId,replyContent}
	@PostMapping(value="/insert")
	public String insertComment(BoardReplyVO boardReplyVO){
		/*
		 BoardReplyVO(replyNo=null, parentReplyNo=null, memId=aa1234
		 , boardId=BOARD00028, replyContent=asfd, replyWrtDt=null, delYn=null) 
		 */
		log.info("insertComment()실행 ->boardReplyVO : " + boardReplyVO);
		
		int result = this.ReplyService.CommentRegist(boardReplyVO);
		log.info("insertComment->result : " + result);
		
		return "redirect:/jobel/detail?boardNo="+boardReplyVO.getBoardId();
	}
	
	@PostMapping(value="/update")
	public String updateComment(
	
				HttpServletRequest req, RedirectAttributes ra,
				BoardReplyVO boardReplyVO, Model model
				) {
			String goPage ="";
			
			ServiceResult result = ReplyService.updateComment(req,boardReplyVO);
			if(result.equals(ServiceResult.OK)) { //수정성공
				ra.addFlashAttribute("message", "댓글 수정 성공");
				goPage = "redirect:/jobel/detail?boardNo="+boardReplyVO.getBoardId();			
			}else { // 수정 실패
				model.addAttribute("status", "u");
				model.addAttribute("reply", boardReplyVO);
				model.addAttribute("message", "수정실패");
				goPage = "commons/job_con_writeForm";
			}
			
			return goPage;	


	}
	
	@ResponseBody
	@PostMapping(value="/updateAjax")
	public BoardReplyVO updateAjax(
			@RequestBody BoardReplyVO boardReplyVO
			) {
		log.info("updateAjax->boardReplyVO : " + boardReplyVO);
		
		//set    reply_content = 샵{replyContent} where  reply_no = 샵{replyNo}
		int result = ReplyService.updateCommentAjax(boardReplyVO);
		log.info("updateAjax->result : " + result);
		
		return boardReplyVO;	
		
		
	}
	
	@PostMapping(value="/delete")
	public String deleteComment(
	
				HttpServletRequest req, RedirectAttributes ra,
				BoardReplyVO boardReplyVO, Model model
				) {
			String goPage ="";
			
			ServiceResult result = ReplyService.deleteComment(req,boardReplyVO);
			if(result.equals(ServiceResult.OK)) { //수정성공
				ra.addFlashAttribute("message", "댓글 수정 성공");
				goPage = "redirect:/jobel/detail?boardNo="+boardReplyVO.getBoardId();			
			}else { // 수정 실패
				model.addAttribute("status", "u");
				model.addAttribute("reply", boardReplyVO);
				model.addAttribute("message", "수정실패");
				goPage = "commons/job_con_writeForm";
			}
			
			return goPage;	


	}
	
	@ResponseBody
	@PostMapping(value="/deleteAjax")
	public BoardReplyVO deleteAjax(
			@RequestBody BoardReplyVO boardReplyVO
			) {
		log.info("deleteAjax->boardReplyVO : " + boardReplyVO);
		
		//set    reply_content = 샵{replyContent} where  reply_no = 샵{replyNo}
		int result = ReplyService.deleteCommentAjax(boardReplyVO);
		log.info("deleteAjax->result : " + result);
		
		return boardReplyVO;	
		
		
	}
	
}
