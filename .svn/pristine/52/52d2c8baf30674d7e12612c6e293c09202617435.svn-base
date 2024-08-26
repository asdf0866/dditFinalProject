package kr.or.ddit.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IAnswerQnaService;
import kr.or.ddit.service.IQNAService;
import kr.or.ddit.vo.AnswerQnaVO;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.QNAVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/jobel")
@Controller
public class QNAController {

	@Inject
	private IQNAService service;
	
	@Inject
	private IAnswerQnaService answerService;
	
	// QNA 메인화면
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String qnaHome(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model) {
		
		PaginationInfoVO<QNAVO> pagingVo = new PaginationInfoVO<QNAVO>();
		
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVo.setSearchType(searchType);
			pagingVo.setSearchWord(searchWord);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVo.setCurrentPage(currentPage);
		
		// 목록 총 게시글 수 가져오기
		int totalRecord = service.selectQnaCount(pagingVo);
		pagingVo.setTotalRecord(totalRecord);
		
		// 현재 페이지에 해당하는 screenSize 만큼의 게시글 정보를 얻어온다.
		List<QNAVO> dataList = service.selectQnaList(pagingVo);
		pagingVo.setDataList(dataList);
		
		model.addAttribute("pagingVo", pagingVo);
		
		
		return "commons/qnaHome";
	}
	
	// QNA 상세보기
	@RequestMapping(value="/qnaDetail", method = RequestMethod.GET )
	public String qnaDetail(String boardNo, Model model) {
		
		QNAVO qnaVo = service.selectQna(boardNo);
		model.addAttribute("qna", qnaVo);
		
//		 답변 목록 가져오기
		AnswerQnaVO answer = answerService.selectAnswerList(boardNo);
		model.addAttribute("answer", answer);
		
//		MemberVO member = (시큐티리);
//		String auth = member.getAuth();
		String auth = "ROLE_ADMIN";
		model.addAttribute("auth", auth);
		
		return "commons/qnaView";
	}
	
	// QNA 등록 폼
	@PreAuthorize("hasAnyRole('ROLE_MEMBER', 'ROLE_ADMIN')")
	@RequestMapping(value = "/qnaInsertForm", method = RequestMethod.GET)
	public String qnaInsertForm(HttpSession session, Model model) {

		return "commons/qnaInsertForm";
	}
	
	// QNA 등록 처리
	@RequestMapping(value="/qnaInsert", method = RequestMethod.POST)
	public String qnaInsert(QNAVO qnaVo, Model model, HttpSession session) {
		// session에 저장된 memId를 writer에 저장
		String writer = (String) session.getAttribute("memId");
		// Vo에 writer를 세팅
		qnaVo.setWriter(writer);
		
		
		// 넘겨 받은 데이터가 혹시나 모를 에러가 있을 수 있어 입력값 검증을 진행함 이상없으면 등록 ok
		
		// 유효성 검사 시, 데이터에 에러가 발생했을 때 에러 정보를 담을 공간
		Map<String, String> errors = new HashMap<String, String>();
		String goPage = "";	// 페이지 정보 담을 공간
		
		if(StringUtils.isBlank(qnaVo.getTitle())) {
			errors.put("title", "제목을 입력해주세요!");
		}
		if(StringUtils.isBlank(qnaVo.getContent())) {
			errors.put("content", "내용을 입력해주세요!");
		}
		
		if(errors.size() > 0) {	// 입력된 데이터의 에러가 발생
			// 데이터를 전달
			model.addAttribute("errors", errors);
			model.addAttribute("qna", qnaVo);
			// 페이지 이동 경로를 설정
			goPage = "commons/qnaInsertForm";
		}else {	// 정상적인 데이터가 입력됨
			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String memId = user.getMember().getMemId();
			qnaVo.setWriter(memId);	// 작성자 설정
			qnaVo.setContent(qnaVo.getContent().replace("\r\n", "<br>"));
			ServiceResult result = service.insertQna(qnaVo);
			if(result.equals(ServiceResult.OK)) {	// 등록 성공
				goPage = "redirect:/jobel/qnaDetail?boardNo="+qnaVo.getBoardNo();
			}else {
				model.addAttribute("qna", qnaVo);
				goPage = "commons/qnaInsertForm";
			}
		}
		
		return goPage;
		
	}
	
	// QNA 수정 폼
	@RequestMapping(value="/qnaUpdate", method = RequestMethod.GET)
	public String qnaUpdateForm(String boardNo, Model model) {
		log.info("boardNO >>>>> " + boardNo);
		QNAVO qnaVo = service.selectQna(boardNo);
		model.addAttribute("qna", qnaVo);
		// 수정 이벤트 처리 시, flag 값에 해당하는 'update'의 약자인 'u'를 flag로 설정
		model.addAttribute("status", "u");
		
		return "commons/qnaUpdateForm";
	}
	
	// QNA 수정 처리
	@RequestMapping(value="/qnaUpdate", method = RequestMethod.POST)
	public String qnaUpdate(QNAVO qnaVo, Model model) {
		String goPage = "";
		log.info("NO >>>>>> " + qnaVo.getBoardNo());
		log.info("title >>>>>> " + qnaVo.getTitle());
		ServiceResult result = service.updateQna(qnaVo);
		if(result.equals(ServiceResult.OK)) {	// 수정 성공
			goPage = "redirect:/jobel/qnaDetail?boardNo="+qnaVo.getBoardNo();
		}else {
			model.addAttribute("status", "u");
			model.addAttribute("qna", qnaVo);
			goPage = "commons/qnaInsertForm";
		}
		
		return goPage;
	}
	
	// QNA 삭제 처리
	@RequestMapping(value="/qnaDelete", method = RequestMethod.POST)
	public String deleteQna(String boardNo, Model model) {
		String goPage = "";
		ServiceResult result = service.deleteQnaAndAnswers(boardNo);
		if(result.equals(ServiceResult.OK)) {
			goPage = "redirect:/jobel/qna";
		}else {
			goPage = "redirect:/jobel/qnaDetail?boardNo="+boardNo;
		}
		return goPage;
		
	}
	
	// 답변 등록 처리
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value="/answerInsert", method = RequestMethod.POST)
	public String answerInsert(AnswerQnaVO answerVo, Model model) {
		
		CustomUser admin = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String adminId = admin.getMember().getMemId();
		answerVo.setWriter(adminId);	// 작성자 설정
		
		answerVo.setContent(answerVo.getContent().replace("\r\n", "<br>"));
		ServiceResult result = answerService.insertAnswer(answerVo);
		if(result.equals(ServiceResult.OK)) {
			return "redirect:/jobel/qnaDetail?boardNo=" + answerVo.getBoardNo();
		} else {
			model.addAttribute("errorMessage", "답변 등록에 실패했습니다.");
			return "commons/qnaView";
		}
	}
	
	// 답변 수정 처리
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/answerUpdate", method = RequestMethod.POST)
	public String answerUpdate(AnswerQnaVO answerVo, Model model) {
		answerVo.setContent(answerVo.getContent().replace("\r\n", "<br>"));
		ServiceResult result = answerService.updateAnswer(answerVo);
		if(result.equals(ServiceResult.OK)) {
			return "redirect:/jobel/qnaDetail?boardNo="+answerVo.getBoardNo();
		}else {
			model.addAttribute("errorMessage", "답변 수정에 실패했습니다.");
			return "commons/qnaView";
		}
	}
	
	//답변 삭제 처리
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/answerDelete", method = RequestMethod.POST)
	public String answerDelete(@RequestParam("answerNo") int answerNo,
			@RequestParam("boardNo") String boardNo, Model model) {
		ServiceResult result = answerService.deleteAnswer(answerNo);
		if(result.equals(ServiceResult.OK)) {
			return "redirect:/jobel/qnaDetail?boardNo=" + boardNo;
		}else {
			model.addAttribute("errorMessage", "답변 삭제에 실패했습니다.");
			return "commons/qnaView";
		}
	}
	
}
























