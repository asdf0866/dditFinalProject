package kr.or.ddit.controller.board;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.IFAQService;
import kr.or.ddit.service.commonCode.ICommonCodeService;
import kr.or.ddit.vo.CommonCodeDetailVO;
import kr.or.ddit.vo.FAQVO;
import kr.or.ddit.vo.PaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/jobel")
@Controller
public class FAQController {
	
	@Inject
	private IFAQService service;
	
	@Inject
	private ICommonCodeService codeService;

	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faqHome(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "") String searchType,
			@RequestParam(required = false, defaultValue = "") String searchWord,
			Model model) {
		
//		List<FAQVO> faqList = service.getFAQList();
//		model.addAttribute("faqList", faqList);
		
		log.info("currentPage >> " + currentPage);
		log.info("searchType >> " + searchType);
		log.info("searchWord >> " + searchWord);
		
		PaginationInfoVO<FAQVO> pagingVo = new PaginationInfoVO<FAQVO>();
		
		pagingVo.setSearchType(searchType);
		pagingVo.setSearchWord(searchWord);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		
		pagingVo.setCurrentPage(currentPage);
		
		int totalRecord = service.selectFaqCount(pagingVo);
		pagingVo.setTotalRecord(totalRecord);
		
		List<FAQVO> dataList = service.selectFaqList(pagingVo);
		pagingVo.setDataList(dataList);
		
		List<CommonCodeDetailVO> codeList = codeService.getDetailList("FAQSTAT");
		
		model.addAttribute("pagingVo", pagingVo);
		model.addAttribute("faqCodeList", codeList);
		
		return "commons/faq";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@ResponseBody
	@RequestMapping(value = "/faqwrite", method = RequestMethod.POST)
	public ResponseEntity<String> faqWrite(@RequestBody FAQVO faqVo) {
		ResponseEntity<String> res = null;
		
		log.info("Title >>> " + faqVo.getTitle());
		log.info("Content >>> " + faqVo.getContent());
		log.info("StatCode >>> " + faqVo.getFaqStatCode());
		
		int count = service.faqWrite(faqVo);
		
		log.info("resultCount >>> " + count);
		
		if(count > 0) {
			res = new ResponseEntity<String>("OK", HttpStatus.OK);
		} else {
			res = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return res;
	}
	
	// FAQ 수정 메소드
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@ResponseBody
	@RequestMapping(value = "/faq/update/{faqNo}", method = RequestMethod.PUT)
	public ResponseEntity<String> faqUpdate(@PathVariable("faqNo") int faqNo, @RequestBody FAQVO faqVo){
		ResponseEntity<String> res = null;
		
		faqVo.setFaqNo(faqNo);
		int count = service.faqUpdate(faqVo);
		
		if(count > 0) {
			res = new ResponseEntity<String>("OK", HttpStatus.OK);
		} else {
			res = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return res;
	}
	
	// FAQ 삭제
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@ResponseBody
	@RequestMapping(value = "/faq/delete/{faqNo}", method = RequestMethod.PUT)
	public ResponseEntity<String> faqDelete(@PathVariable("faqNo") int faqNo){
		ResponseEntity<String> res = null;
		
		int count = service.faqDelete(faqNo);
		
		if(count > 0) {
			res = new ResponseEntity<String>("OK", HttpStatus.OK);
		}else {
			res = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return res;
	}
	
	// 조회수 증가 메서드
	@ResponseBody
	@RequestMapping(value = "/faq/increaseHit", method = RequestMethod.POST)
	public ResponseEntity<String> increaseHit(@RequestParam("faqNo") int faqNo){
		ResponseEntity<String> res = null;
		
		int count = service.increaseHit(faqNo);
		
		if(count > 0) {
			res = new ResponseEntity<String>("OK", HttpStatus.OK);
		}else {
			res = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return res;
	}
	
}



























