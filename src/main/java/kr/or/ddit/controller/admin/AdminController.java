package kr.or.ddit.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.commonCode.ICommonCodeService;
import kr.or.ddit.service.company.ICompanyService;
import kr.or.ddit.service.file.IFileService;
import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.report.IReportService;
import kr.or.ddit.service.userService.IUserServiceService;
import kr.or.ddit.vo.AttachFileVO;
import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.ReportVO;

@Controller
@RequestMapping("/jobel")
@PreAuthorize("hasRole('ROLE_ADMIN')")
public class AdminController {
	
	@Inject
	private IMemberService memService;
	
	@Inject
	private ICompanyService comService;
	
	@Inject
	private ICommonCodeService codeService;
	
	@Inject
	private IFileService fileService;
	
	@Inject
	private IReportService repService;
	
	@Inject
	private IUserServiceService userService;

	@RequestMapping(value = "/adminHome", method = RequestMethod.GET)
	public String adminHome(
			@RequestParam(required = false) String menu,
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			Model model) {
		
		String goPage = "admin/adminHome";
		
		//	메뉴가 존재할 때
		if(menu != null) {
			goPage += "_" + menu;
			model.addAttribute("menu", menu);
			
			if(menu.equals("memberManage")) {		//	일반 회원 관리
				PaginationInfoVO<MemberVO> pagingVO = new PaginationInfoVO<MemberVO>();
				pagingVO.setScreenSize(10);
				pagingVO.setCurrentPage(currentPage);
				
				int totalRecord = memService.getMemberCount();
				pagingVO.setTotalRecord(totalRecord);		//	가져온 회원의 수 설정
				
				List<MemberVO> memberList = memService.getMemberList(pagingVO);
				pagingVO.setDataList(memberList);
				model.addAttribute("pagingVO", pagingVO);
			}
			
			if(menu.equals("coMemberManage")) {		//	기업 회원 관리
				PaginationInfoVO<CompanyVO> pagingVO = new PaginationInfoVO<CompanyVO>();
				pagingVO.setScreenSize(10);
				pagingVO.setCurrentPage(currentPage);
				
				int totalRecord = comService.getRecogCompanyCount();
				pagingVO.setTotalRecord(totalRecord);
				
				List<CompanyVO> companyList = comService.getRecogCompanyList(pagingVO);
				for(CompanyVO company : companyList) {
					String jobType = company.getCoJobType();
					String jobName = codeService.getCommonCodeName(jobType);
					company.setCoJobTypeName(jobName);
				}
				pagingVO.setDataList(companyList);
				model.addAttribute("pagingVO", pagingVO);
			}
			
			if(menu.equals("signManage")) {			//	승인 처리
				PaginationInfoVO<CompanyVO> pagingVO = new PaginationInfoVO<CompanyVO>();
				pagingVO.setScreenSize(10);
				pagingVO.setCurrentPage(currentPage);
				
				int totalRecord = comService.getWaitCompanyCount();
				pagingVO.setTotalRecord(totalRecord);
				
				List<CompanyVO> companyList = comService.getWaitCompanyList(pagingVO);
				for(CompanyVO company : companyList) {
					String jobType = company.getCoJobType();
					String jobName = codeService.getCommonCodeName(jobType);
					company.setCoJobTypeName(jobName);
				}
				pagingVO.setDataList(companyList);
				model.addAttribute("pagingVO", pagingVO);
			}
			
			if(menu.equals("alertManage")) {		//	신고 처리
				PaginationInfoVO<ReportVO> pagingVO = new PaginationInfoVO<ReportVO>();
				pagingVO.setScreenSize(10);
				pagingVO.setCurrentPage(currentPage);
				
				int totalRecord = repService.getReportCount();
				pagingVO.setTotalRecord(totalRecord);
				
				List<ReportVO> reportVO = repService.getReportList(pagingVO);
				for(ReportVO report : reportVO) {
					String reason = report.getReportReason();
					String reasonName = codeService.getCodeName(reason);
					report.setReasonName(reasonName);
				}
				pagingVO.setDataList(reportVO);
				model.addAttribute("pagingVO", pagingVO);
			}
		}		//	메뉴 if문 종료
		
		return goPage;
	}
	
	/**
	 * 일반회원 상세보기 할 때 정보 가져오는 메소드
	 */
	@ResponseBody
	@RequestMapping(value = "/memberDataGet.do", method = RequestMethod.POST)
	public ResponseEntity<MemberVO> memberDataGet(String memId) {
		
		MemberVO member = memService.memberDataGet(memId);
		
		return new ResponseEntity<MemberVO>(member, HttpStatus.OK);
	}
	
	/**
	 * 기업 상세보기 할 때 정보 가져오는 메소드
	 */
	@ResponseBody
	@RequestMapping(value = "/companyDataGet.do", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> companyDataGet(String coNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		CompanyVO company = userService.getCompanyDetailByCoNo(coNo);
		map.put("company", company);
		
		String attachFile = company.getRequestFile();
		//	파일이 존재한다면
		if(attachFile != null && !attachFile.equals("") && attachFile != "") {
			List<AttachFileVO> attachFileList = fileService.getFileList(attachFile);
			map.put("fileList", attachFileList);
		}
		
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
	/**
	 * 기업 정보 중 해당 기업의 회원 정보를 가져오는 메소드
	 */
	@ResponseBody
	@RequestMapping(value = "/coMemberDateGet.do", method = RequestMethod.POST)
	public ResponseEntity<List<MemberVO>> coMemberDateGet(String coNo) {
		
		List<MemberVO> memberList = memService.coMemberDateGet(coNo);
		
		return new ResponseEntity<List<MemberVO>>(memberList, HttpStatus.OK);
	}
	
	/**
	 * 승인 처리 중 해당 기업을 반려 처리하는 메소드
	 */
	@ResponseBody
	@RequestMapping(value = "/cancelCompany.do", method = RequestMethod.POST)
	public ResponseEntity<String> cancelCompany(String coNo) {
		ResponseEntity<String> entity = null;
		ServiceResult result = comService.cancelCompany(coNo);
		
		if(result.equals(ServiceResult.OK)) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/**
	 * 승인 처리 중 해당 기업을 승인 처리하는 메소드
	 */
	@ResponseBody
	@RequestMapping(value = "/signUpCompany.do", method = RequestMethod.POST)
	public ResponseEntity<String> signUpCompany(String coNo) {
		ResponseEntity<String> entity = null;
		ServiceResult result = comService.signUpCompany(coNo);
		
		if(result.equals(ServiceResult.OK)) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	/**
	 * 관리자가 신고 된 리뷰를 확인하러 가는 메소드
	 */
	@RequestMapping(value = "/checkAlert", method = RequestMethod.GET)
	public String checkAlert(int reviewNo) {
		
		String getCoNo = comService.checkAlert(reviewNo);
		String goPage = "redirect:/jobel/comDetail?coNo=" + getCoNo;
		
		return goPage;
	}
}
