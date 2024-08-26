package kr.or.ddit.controller.userService;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.board.IReviewService;
import kr.or.ddit.service.userService.IUserServiceService;
import kr.or.ddit.vo.CompanyReviewVO;
import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.InterestCompanyVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.ReportVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/jobel")
public class UserServiceController {
	
	@Inject
	private IUserServiceService service;
	
	@Inject
	private IReviewService reviewService;
	
	@RequestMapping(value = "/comRank", method = RequestMethod.GET)
	public String companyRankPage(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name="searchType", required = false, defaultValue="") String searchType,
			@RequestParam(name="searchWord", required = false, defaultValue="") String searchWord,
			@RequestParam(name="orderType", required = false, defaultValue="") String orderType,
			Model model) {
		
		log.info("companyRankPage->currentPage : " + currentPage);//1
		log.info("companyRankPage->searchType : " + searchType);//title
		log.info("companyRankPage->searchWord : " + searchWord);//null->""
		
		PaginationInfoVO<CompanyVO> pagingVo = new PaginationInfoVO<CompanyVO>();
		
//		if(StringUtils.isNotBlank(searchWord)) {
			pagingVo.setSearchType(searchType);
			pagingVo.setSearchWord(searchWord);
			pagingVo.setOrderType(orderType);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
//		}
		
		pagingVo.setCurrentPage(currentPage);
		
		// 목록 총 게시글 수 가져오기
		/*
		PaginationInfoVO(totalRecord=0, totalPage=0, currentPage=1, screenSize=10
		, blockSize=5, startRow=1, endRow=10, startPage=1, endPage=5, dataList=null
		, searchType="", searchWord="")
		 */
		int totalRecord = service.selectCompanyRankCount(pagingVo);
		log.info("totalRecord : " + totalRecord);
		pagingVo.setTotalRecord(totalRecord);
		
		// 현재 페이지에 해당하는 screenSize만큼의 게시글 정보를 얻어온다.
		List<CompanyVO> dataList = service.selectCompanyRankList(pagingVo);
		for(int i =0;i<dataList.size();i++) {
			String addressBasic = dataList.get(i).getAddressBasic().split(" ")[0] + " " + dataList.get(i).getAddressBasic().split(" ")[1];
			dataList.get(i).setAddressBasic(addressBasic);
		}
		pagingVo.setDataList(dataList);
		
		log.info("companyRankPage->pagingVo : " + pagingVo);
		
		model.addAttribute("pagingVo", pagingVo);
		
		return "commons/userService/companyRank";
	}
	
	/**
	 * 기업 정보 상세보기 메소드
	 */
	@RequestMapping(value = "/comDetail", method = RequestMethod.GET)
	public String companyDetail(String coNo, Model model) {
		
		CompanyVO comVO = service.getCompanyDetailByCoNo(coNo);
		model.addAttribute("comVO", comVO);
		
		if(!SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
			CustomUser member = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String memId = member.getMember().getMemId();
			InterestCompanyVO intVO = new InterestCompanyVO();
			intVO.setCoNo(coNo);
			intVO.setMemId(memId);
			int result = service.getLikeCompanyByMemId(intVO);
			model.addAttribute("isLike", result);
		}
		
		PaginationInfoVO<CompanyReviewVO> pagingVO = new PaginationInfoVO<CompanyReviewVO>();
		int totalReviewCount = reviewService.getCoReviewCount(coNo);
		pagingVO.setScreenSize(3);
		pagingVO.setCurrentPage(1);
		pagingVO.setTotalRecord(totalReviewCount);
		model.addAttribute("pagingVO", pagingVO);
		
		return "commons/userService/companyDetail";	
	}
	
	//	기업 리뷰 좋아요 여부 확인 메소드
	@ResponseBody
	@RequestMapping(value = "/checkLikeReview.do", method = RequestMethod.POST)
	public ResponseEntity<String> checkLikeReivew(String memId, int reviewNo) {
		ResponseEntity<String> entity = null;
		
		CompanyReviewVO reviewLike = new CompanyReviewVO();
		reviewLike.setMemId(memId);
		reviewLike.setReviewNo(reviewNo);
		int count = reviewService.checkLikeReivew(reviewLike);
		
		if(count > 0) {
			entity = new ResponseEntity<String>("ALREADY", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("NOTYET", HttpStatus.OK);
		}
		
		return entity;
	}
	
	//	기업 리뷰 좋아요 등록 메소드
	@ResponseBody
	@RequestMapping(value = "/addLikeReview.do", method = RequestMethod.POST)
	public ResponseEntity<String> addLikeReview(String memId, int reviewNo) {
		ResponseEntity<String> entity = null;
		
		CompanyReviewVO reviewLike = new CompanyReviewVO();
		reviewLike.setMemId(memId);
		reviewLike.setReviewNo(reviewNo);
		int count = reviewService.addLikeReview(reviewLike);
		
		if(count > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	//	기업 리뷰 신고 이벤트
	@ResponseBody
	@RequestMapping(value = "/reportReview.do", method = RequestMethod.POST)
	public ResponseEntity<String> reportReview(ReportVO report) {
		ResponseEntity<String> entity = null;
		
		ServiceResult result = service.reportReview(report);
		
		if(result.equals(ServiceResult.OK)) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}























