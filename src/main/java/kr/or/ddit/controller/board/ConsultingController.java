package kr.or.ddit.controller.board;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IConsultingService;
import kr.or.ddit.service.board.IReplyService;
import kr.or.ddit.service.file.IFileService;
import kr.or.ddit.vo.AttachFileVO;
import kr.or.ddit.vo.BoardReplyVO;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/jobel")
@Controller
public class ConsultingController {
	
	@Inject
	private IConsultingService consultingService;
	
	@Inject
	private IReplyService ReplyService;
	
	@Inject
	private IFileService fileService;
	
	/**
	 * 취업 상담 게시판으로 이동하는 메소드
	 * 
	 * 요청URI : /jobel/consulting_board?page=&searchType=title&searchWord=5
	 * 요청파라미터 : page=&searchType=title&searchWord=5
	 * 요청방식 : get
	 */
	
	@GetMapping("/consulting_board")
	public String consultBoardHome(
			@RequestParam(name="page", required=false, defaultValue = "1") int currentPage,
			@RequestParam(name="searchType", required = false, defaultValue="title") String searchType,
			@RequestParam(name="searchWord", required = false, defaultValue="") String searchWord,
			Model model
			) {
		log.info("consultBoardHome() 실행...!");
		
		PaginationInfoVO<BoardVO> pagingVO =  new PaginationInfoVO<BoardVO>();
		
		List<BoardVO> popularQNAList = consultingService.getPopular5();
		log.info("popularQNAList--{}", popularQNAList);
		// 검색기능 추가
		
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			
			
			// 검색 후 , 목록 페이지로 이동 할 때 검색된 내용을 적용시키위한 데이터 전달
			model.addAttribute("searchType" , searchType);
			model.addAttribute("searchWord" , searchWord);
		}
		
		//총 4가지의 필드를 설정하기 위함
		// 현재 페이지를 전달후, start/endRow, start/endPage 설정
		pagingVO.setCurrentPage(currentPage);
		
		log.info("consultBoardHome->pagingVO : " + pagingVO);
		
		//총 게시글 수를 얻어온다.
		int totalRecord = consultingService.selectConsultingCount(pagingVO);
		log.info("totalRecord : " + totalRecord);
		// 총 게시글 수를 전달 후, 총 페이지 수를 설정
		pagingVO.setTotalRecord(totalRecord);
		
		log.info("consultBoardHome->pagingVO(2) : " + pagingVO);
		//총 게시글 수가 포함된  PaginationInfoVO객체를 넘겨주고 1페이지에 해당하는 10개(screenSize)의 게시글을 얻어온다
		List<BoardVO> dataList = consultingService.selectConsultingList(pagingVO);
		log.info("dataList : " + dataList);
		pagingVO.setDataList(dataList);
		
		
		model.addAttribute("popularQNAList", popularQNAList);
		model.addAttribute("pagingVO", pagingVO);
		
		return "commons/job_consulting_board";
	}
	
	/*
	 요청URI : /jobel/insert
	 요청파라미터 : {title : 1, content : 2}
	 요청방식 : post
	 */
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@PostMapping("/insert")
	public String consultInsert(HttpServletRequest req,
								BoardVO board,
								Model model,
								RedirectAttributes ra) {
		//BoardVO(fileList=null, boardNo=null, writer=null, title=ㅁㅁㅁ3, content=<p>ㅂㅂㅂ2</p>
		//, wrtDt=null, attachFile=null, hit=0, boardStatCode=null, 
		//boFile=[org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@2b553e48])
		log.info("consultInsert() 실행...!->board : " + board);
		 String goPage = ""; // 이동할 페이지
		 
		 
		 // 넘겨받은 데이터 검증후, 에러가 발생한 데이터에 대한 에러 정보를 담을 공간
		 Map<String, String> errors = new HashMap<String, String>();
		 if(StringUtils.isBlank(board.getTitle())) {
			errors.put("title", "제목을 입력해주세요" ); // 제목데이터가 누락되었을 때  
		 }
		 
		 if(StringUtils.isBlank(board.getContent())) {
			 errors.put("content", "내용을 입력해주세요"); // 내용 데이터가 누락되었을 때 
		 }
		 
		 // 기본 데이터의 누락정보에 따른 에러정보 갯수에 따른 처리 
		 if(errors.size() > 0 ) { // 에러 갯수가 0보다 클때
			 model.addAttribute("errors", errors);
			 model.addAttribute("boardVO", board);
			 goPage = "redirect:/jobel/con_writeForm";
	
		 }else {// 에러가 없을 때
			//BoardVO(board_no=null, writer=null, title=제목3, content=내용33,
			 CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			 MemberVO memberVO = user.getMember();
			 if(memberVO != null) {
				 board.setWriter(memberVO.getMemId());
				 board.setBoardStatCode("BRDSTAT001");
				 ServiceResult result = consultingService.consultingInsert(req, board);
				 if(result.equals(ServiceResult.OK))   {   // 등록 성공
					 goPage = "redirect:/jobel/detail?boardNo="+board.getBoardNo();
				 }else {
					 model.addAttribute("board", board);
					 goPage = "redirect:/jobel/con_writeForm";
				 }
//		         }else {
//		            ra.addFlashAttribute("message", "로그인 후에 사용 가능합니다.");
//		            goPage = "redirect:/notice/login.do";
			 }
		 }
		      
		 return goPage;
	}
			//BoardVO(boardNo=null, writer=a001, title=제목3, content=내용33,
			//***** insert 실행!!
//			ServiceResult result = consultingService.consultingInsert(board);
//			
//			if(result.equals(ServiceResult.OK)) {
//				log.info("왔다1");
//				//http://localhost/jobel/detail?boardNo=BOARD00002
//				goPage = "redirect:/jobel/detail?boardNo=" + board.getBoardNo();
//			}else {
//				log.info("왔다2");
//				model.addAttribute("board", board);
//				goPage = "redirect:/jobel/con_writeForm";
//			}
//		 }
//		 
//		 return goPage;
//	}
	
	/**
	 * 취업 상담 게시글 작성 폼으로 이동하는 메소드
	 */
	@RequestMapping(value = "/con_writeForm", method = RequestMethod.GET)
	public String consultWriteForm() {
		return "commons/job_con_writeForm";
	}
	
	@GetMapping("/list")
	public String  consultingList(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue="title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model
			) {
		log.info("consultingList() 실행...!");
		
		PaginationInfoVO<BoardVO> pagingVO =  new PaginationInfoVO<BoardVO>();
		
		List<BoardVO> popularQNAList = consultingService.getPopular5();
		log.info("popularQNAList--{}", popularQNAList);
		// 검색기능 추가
		
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			
			
			// 검색 후 , 목록 페이지로 이동 할 때 검색된 내용을 적용시키위한 데이터 전달
			model.addAttribute("searchType" , searchType);
			model.addAttribute("searchWord" , searchWord);
		}
		
		//총 4가지의 필드를 설정하기 위함
		// 현재 페이지를 전달후, start/endRow, start/endPage 설정
		pagingVO.setCurrentPage(currentPage);	
		//총 게시글 수를 얻어온다.
		int totalRecord = consultingService.selectConsultingCount(pagingVO);
		// 총 게시글 수를 전달 후, 총 페이지 수를 설정
		pagingVO.setTotalRecord(totalRecord);
		//총 게시글 수가 포함된  PaginationInfoVO객체를 넘겨주고 1페이지에 해당하는 10개(screenSize)의 게시글을 얻어온다
		List<BoardVO> dataList = consultingService.selectConsultingList(pagingVO);
		pagingVO.setDataList(dataList);
		
//		model.addAttribute("data" , data);
		model.addAttribute("popularQNAList", popularQNAList);
		model.addAttribute("pagingVO", pagingVO);
		//
		
		return "commons/job_consulting_board";
	}
	
	
	/*
	 요청URI : /jobel/detail?boardNo=BOARD00001
	 요청파라미터 : boardNo=BOARD00001
	 요청방식 : get
	 */
	@GetMapping("/detail")
	public String detail(String boardNo,Model model) {
		//detail->boardNo : BOARD00005
		log.info("detail->boardNo : " + boardNo);
		
		//상세
		BoardVO board = this.consultingService.selectConsulting(boardNo);
		log.info("detail->board : " + board);
		
		//댓글 목록
		List<BoardReplyVO> boardReplyVOList = this.consultingService.commentList(boardNo);
		log.info("detail->boardReplyVOList : " + boardReplyVOList);
		
		//1행을 select
		model.addAttribute("board", board);
		model.addAttribute("boardReplyVOList", boardReplyVOList);
		
		//댓글
//				List<BoardReplyVO> replyVOList = ReplyService.getReply(board.getBoardNo());
//				log.info("detail -> replyVOList : " + replyVOList);
//				
//				for(int i = 0; i < replyVOList.size(); i++) {
//					date = replyVOList.get(i).getReply_wrt_dt();
//					replyVOList.get(i).setPassedTime(passedTime);
//				}
//		s
		
		return "commons/job_con_detail";
	
	
	}
	@PreAuthorize("hasAnyRole('ROLE_MEMBER','ROLE_ADMIN')")
	@RequestMapping(value="/update.do", method = RequestMethod.GET)
	public String ModifyForm(String boardNo, Model model) {
		BoardVO board = this.consultingService.selectBoard(boardNo);
//		BoardVO board = this.consultingService.selectConsulting(boardNo);

		//	첨부파일 있는 지 확인
		String fileId = board.getAttachFile();
		if(fileId != null && fileId != "") {
			List<AttachFileVO> fileList = fileService.getFileList(fileId);
			model.addAttribute("fileList", fileList);
		}
		
		model.addAttribute("board", board);
		model.addAttribute("status", "u");
		return "commons/job_con_writeForm";
	}
	
	
	
	@PostMapping("/update.do")
	public String modify(
			HttpServletRequest req, RedirectAttributes ra,
			BoardVO boardVO, Model model
			) {
		String goPage ="";
		
		ServiceResult result = consultingService.updateConsulting(req, boardVO);
		if(result.equals(ServiceResult.OK)) { //수정성공
			ra.addFlashAttribute("message", "게시글 수정 성공");
			goPage = "redirect:/jobel/detail?boardNo="+boardVO.getBoardNo();			
		}else { // 수정 실패
			model.addAttribute("status", "u");
			model.addAttribute("board", boardVO);
			model.addAttribute("message", "수정실패");
			goPage = "commons/job_con_writeForm";
		}
		
	return goPage;	
	
	}
	@PreAuthorize("hasAnyRole('ROLE_MEMBER','ROLE_ADMIN')")
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public String Delete(String boardNo, Model model) {
		log.info("crudDelete() 실행...!");
		consultingService.delete(boardNo);
		model.addAttribute("msg", "삭제가 완료되었습니다!");
		return "redirect:/jobel/consulting_board";
	}	
	
	
	@RequestMapping(value="/consultingDownload", method = RequestMethod.GET)
	public View ConsultingDownload(int fileSerialNo, ModelMap model ) {
		
		//선택한 파일을 다운로드 하기위한 정보로 파일번호에 해당하는 파일정보를 얻어온다. 
		AttachFileVO attachFileVO =  consultingService.consultingDownload(fileSerialNo);
		
		//데이터 전달자를 통해서 파일정보를 전달하기 위해서 Map선언
		Map<String, Object> fileMap = new HashMap<String, Object>();
		fileMap.put("fileName", attachFileVO.getFileOriginName()); //파일명 추가
		fileMap.put("fileSize", attachFileVO.getFileSize()); //파일크기 추가
		fileMap.put("filePath", attachFileVO.getFilePath()); //파일저장경로 추가
		model.addAttribute("fileMap", fileMap); // 데이터 전달자로 전달
		
		//리턴되는 consultingDownloadView는 jsp페이지로 존재하는 페이지 name을 요청하는게 아니라
		//클래스를 요청하는 것인데 해당 클래스가 스프링에서 제공하는 AbstractView클래스를 상속받은 클래스인데
		// 그 클래스는 AbstractView를 상속받아 renderMergedOutputModel 함수를 재정의할 때 View로 취급될 수 있게 함
	
		
		return new ConDownloadView();
	}
	
	
	
}

