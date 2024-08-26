package kr.or.ddit.controller.company;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.board.IReviewService;
import kr.or.ddit.vo.CompanyReviewVO;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PaginationInfoVO;

@Controller
@RequestMapping("/jobel")
public class CompanyCoReviewController {
	
	@Inject
	private IReviewService reviewService;
	
	@RequestMapping(value = "/co_review_list", method = RequestMethod.GET)
	public String reviewHome(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			Model model) {
		
		//	로그인 정보에서 작성자 아이디 가져오기
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		MemberVO member = user.getMember();
		
		//	자신의 기업 번호를 얻어오기
		String coNo = member.getCoNo();

		//	공고 목록을 받아올 객체 선언
		PaginationInfoVO<CompanyReviewVO> pagingVO = new PaginationInfoVO<CompanyReviewVO>();
		pagingVO.setScreenSize(10);
		pagingVO.setCurrentPage(currentPage);
		
		int totalRecord = reviewService.getCoReviewCount(coNo);
		pagingVO.setTotalRecord(totalRecord);		//	가져온 공고의 개수 설정
				
		Map<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("coNo", coNo);
		pageMap.put("startRow", pagingVO.getStartRow());
		pageMap.put("endRow", pagingVO.getEndRow());
		
		List<CompanyReviewVO> reviewList = reviewService.getCoReviewList(pageMap);
		pagingVO.setDataList(reviewList);
		
		//	리뷰 평균 정보 가져오기
		Map<String, Double> scoreMap = reviewService.getCoReviewScore(coNo);
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("scoreMap", scoreMap);
		return "company/review_list";
	}
}
