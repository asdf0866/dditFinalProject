package kr.or.ddit.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import kr.or.ddit.service.interest.IInterestService;
import kr.or.ddit.service.userService.IUserServiceService;
import kr.or.ddit.vo.CompanyReviewVO;
import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.InterestCompanyVO;
import kr.or.ddit.vo.PaginationInfoVO;

@Controller
@RequestMapping("/jobel")
public class CompanyReviewController {
	
	@Inject
	private IUserServiceService userSerService;
	
	@Inject
	private IInterestService intService;
	
	@Inject
	private IReviewService reviewService;
	
	@RequestMapping(value = "/reviewHome", method = RequestMethod.GET)
	public String reviewHome(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name="searchType", required = false, defaultValue="") String searchType,
			@RequestParam(name="searchWord", required = false, defaultValue="") String searchWord,
			Model model) {
		
		PaginationInfoVO<CompanyVO> pagingVo = new PaginationInfoVO<CompanyVO>();
		
		//	검색했을 경우 검색 값이 들어감
		pagingVo.setSearchType(searchType);
		pagingVo.setSearchWord(searchWord);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		
		pagingVo.setScreenSize(5);				//	한 번에 5개씩 보여줄 예정
		pagingVo.setCurrentPage(currentPage);	//	현재 페이지 설정
		
		int totalRecord = userSerService.selectCompanyRankCount(pagingVo);		//	총 개수 설정
		pagingVo.setTotalRecord(totalRecord);
		
		//	번호에 해당하는 정보들을 가져온다.
		List<CompanyVO> dataList = userSerService.selectCompanyRankList(pagingVo);
		for(CompanyVO company : dataList) {
			int hits = reviewService.getReviewHits(company);
			String recentReview = reviewService.getRecentReview(company);
			int counts = reviewService.getCoReviewCount(company.getCoNo());
			company.setTotalReviewHit(hits);
			company.setRecentReview(recentReview);
			company.setTotalReviewCount(counts);
		}
		pagingVo.setDataList(dataList);
		
		//	비회원이 아니라면 회원의 즐겨찾기 정보를 가져온다.
		if(!SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
			CustomUser member = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String memId = member.getMember().getMemId();
			List<InterestCompanyVO> likeComList = intService.getLikeCompanyList(memId);
			model.addAttribute("likeComList", likeComList);
		}
		
		//	인기 글 3개 가져오기
		List<CompanyReviewVO> favoriteReview = reviewService.getFavoriteReview();
		
		model.addAttribute("pagingVo", pagingVo);
		model.addAttribute("favoriteReview", favoriteReview);
		
		return "commons/companyReview/reviewHome";
	}
	
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.GET)
	public String reviewWriteForm() {
		return "commons/companyReview/reviewWriteForm";
	}
	
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.POST)
	public String reviewWrite(CompanyReviewVO review, Model model) {
		ServiceResult result = reviewService.reviewWrite(review);
		String goPage = "";
		
		if(result.equals(ServiceResult.OK)) {
			goPage = "redirect:/jobel/reviewHome";
		} else {
			model.addAttribute("message", "에러가 발생했습니다. 다시 시도해주세요.");
			model.addAttribute("review", review);
			goPage = "commons/companyReview/reviewWriteForm";
		}
		
		return goPage;
	}
	
	/**
	 * 기업 상세보기 중 리뷰 출력 이벤트
	 */
	@ResponseBody
	@RequestMapping(value = "/companyDetailReview.do", method = RequestMethod.POST)
	public ResponseEntity<PaginationInfoVO<CompanyReviewVO>> getReviewList(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			String coNo
			) {
		
		PaginationInfoVO<CompanyReviewVO> pagingVO = new PaginationInfoVO<CompanyReviewVO>();
		pagingVO.setScreenSize(3);
		pagingVO.setCurrentPage(currentPage);
		
		int totalRecord = reviewService.getCoReviewCount(coNo);
		pagingVO.setTotalRecord(totalRecord);		//	가져온 공고의 개수 설정
				
		Map<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("coNo", coNo);
		pageMap.put("startRow", pagingVO.getStartRow());
		pageMap.put("endRow", pagingVO.getEndRow());
		
		List<CompanyReviewVO> reviewList = reviewService.getCoReviewList(pageMap);
		pagingVO.setDataList(reviewList);
		
		return new ResponseEntity<PaginationInfoVO<CompanyReviewVO>>(pagingVO, HttpStatus.OK);
	}
}
