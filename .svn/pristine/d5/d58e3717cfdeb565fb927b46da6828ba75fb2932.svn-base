package kr.or.ddit.controller.company;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
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

import kr.or.ddit.service.application.IApplicationService;
import kr.or.ddit.service.commonCode.ICommonCodeService;
import kr.or.ddit.service.company.ICompanyService;
import kr.or.ddit.service.file.IFileService;
import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.recruit.IRecruitService;
import kr.or.ddit.vo.ApplicationDocumentVO;
import kr.or.ddit.vo.ApplicationVO;
import kr.or.ddit.vo.AttachFileVO;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.RecruitmentVO;

@Controller
@RequestMapping("/jobel")
public class CompanyApplicationController {

	@Inject
	private ICompanyService comService;				//	기업 서비스
	
	@Inject
	private IMemberService memService;				//	회원 서비스
	
	@Inject
	private IFileService fileService;				//	파일 서비스
	
	@Inject
	private IRecruitService recService;				//	공고 서비스
	
	@Inject
	private IApplicationService appService;			//	공고 지원 서비스
	
	@Inject
	private ICommonCodeService codeService;			//	공통 코드 서비스
	
	/**
	 * 지원자 관리의 지원자 목록으로 이동하는 메소드
	 */
	@RequestMapping(value = "/co_apply_list", method = RequestMethod.GET)
	public String applicationList(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			Model model) {
		
		//	로그인 정보에서 작성자 아이디 가져오기
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		MemberVO member = user.getMember();
		
		//	자신의 기업 번호를 얻어오기
		String coNo = member.getCoNo();
		
		//	공고 목록을 받아올 객체 선언
		PaginationInfoVO<RecruitmentVO> pagingVO = new PaginationInfoVO<RecruitmentVO>();
		
		pagingVO.setScreenSize(10);					//	한 화면에 10개의 공고를 보여줌
		pagingVO.setCurrentPage(currentPage);		//	현재 페이지 가져오기
		int totalRecord = recService.getCompanyRecruitCount(coNo);
		pagingVO.setTotalRecord(totalRecord);		//	가져온 공고의 개수 설정
		
		Map<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("coNo", coNo);
		pageMap.put("startRow", pagingVO.getStartRow());
		pageMap.put("endRow", pagingVO.getEndRow());
		
		List<RecruitmentVO> recList = recService.getCompanyRecList(pageMap);
		
		//	해당 공고에 해당되는 지원정보
		for(RecruitmentVO recruit : recList) {
			int recNo = recruit.getRecruitNo();
			List<ApplicationVO> appList = appService.getAppList(recNo);
			recruit.setAppList(appList);
		}
		pagingVO.setDataList(recList);
		model.addAttribute("pagingVO", pagingVO);
		
		return "company/application_list";
	}
	
	@RequestMapping(value = "/co_app_detail", method = RequestMethod.GET)
	public String applicationDetail(int recruitNo, Model model) {
		
		//	채용 공고 정보 가져오기
		RecruitmentVO recruit = comService.getRecruitDetail(recruitNo);
		
		//	직종 이름을 출력하기 위한 공통코드 변수
		String jobCode = recruit.getRecruitJob();
		String wrkType = recruit.getWorkType();
		String schType = recruit.getRequiredEducation();
		
		//	직종명을 담을 변수 선언 및 서비스 실행
		String jobCodeName = codeService.getCodeName(jobCode);
		String wrkTypeName = codeService.getCodeName(wrkType);
		String schTypeName = codeService.getCodeName(schType);
		
		//	얻어온 직종명을 VO객체에 입력
		recruit.setJobName(jobCodeName);
		recruit.setWrkTypeName(wrkTypeName);
		recruit.setSchTypeName(schTypeName);
		
		//	로고 경로를 담을 변수 선언 및 서비스 실행
		String coLogoPath = comService.getLogoPath(recruit.getCoNo());
		
		//	얻어온 로고 경로를 VO객체에 입력
		recruit.setCoLogoPath(coLogoPath);
		
		//	통계 정보 가져오기
		Map<String, Object> getMap = new HashMap<String, Object>();
		getMap.put("recruitNo", recruitNo);
		
		//**********
		//	지원자 현황 중 현재 진행 중인 공고들에 지원한 성비율을 가져오기
		Map<String, Object> genderChart = recService.getGenderChart(getMap);

		List<String> genderName = new ArrayList<String>();
		List<BigDecimal> genderData = new ArrayList<BigDecimal>();
		
		genderName.add("'총원'");
		genderData.add((BigDecimal) genderChart.get("TOTAL"));
		
		genderName.add("'남성'");
		genderData.add((BigDecimal) genderChart.get("WOMAN"));
		
		genderName.add("'여성'");
		genderData.add((BigDecimal) genderChart.get("MAN"));
		
		//**********
		//	지원자 현황 중 현재 진행 중인 공고들에 날짜별 지원한 지원자 수 구하기
		Map<String, Object> recentChart = recService.getRecentChart(getMap);
		
		//	오늘 기준 최대 5일 구하기(4일 전까지의 값)
		LocalDateTime now = LocalDateTime.now();
		int year = now.getYear() - 2000;
		int month = now.getMonthValue();
		int day = now.getDayOfMonth();
		
		List<String> recentName = new ArrayList<String>();
		List<BigDecimal> recentData = new ArrayList<BigDecimal>();
		
		//	4일 전
		String dateName = "'" + year + "-" + month + "-" + (day - 4) + "'";
		recentName.add(dateName);
		recentData.add((BigDecimal) recentChart.get("BEFORE4"));
		
		//	3일 전
		dateName = "'" + year + "-" + month + "-" + (day - 3) + "'";
		recentName.add(dateName);
		recentData.add((BigDecimal) recentChart.get("BEFORE3"));
		
		//	2일 전
		dateName = "'" + year + "-" + month + "-" + (day - 2) + "'";
		recentName.add(dateName);
		recentData.add((BigDecimal) recentChart.get("BEFORE2"));
		
		//	1일 전
		dateName = "'" + year + "-" + month + "-" + (day - 1) + "'";
		recentName.add(dateName);
		recentData.add((BigDecimal) recentChart.get("BEFORE1"));
		
		//	오늘
		dateName = "'" + year + "-" + month + "-" + day + "'";
		recentName.add(dateName);
		recentData.add((BigDecimal) recentChart.get("TODAY"));
		
		
		//**********
		//	지원자 연령대별 값 가져오기
		Map<String, Object> ageRangeChart = recService.getAgeRangeChart(getMap);
		List<String> ageRangeName = new ArrayList<String>();
		List<BigDecimal> ageRangeData = new ArrayList<BigDecimal>();
		ageRangeName.add("'10대'");
		ageRangeData.add((BigDecimal) ageRangeChart.get("TEN"));
		ageRangeName.add("'20대'");
		ageRangeData.add((BigDecimal) ageRangeChart.get("TWENTY"));
		ageRangeName.add("'30대'");
		ageRangeData.add((BigDecimal) ageRangeChart.get("THIRTY"));
		ageRangeName.add("'40대'");
		ageRangeData.add((BigDecimal) ageRangeChart.get("FORTY"));
		ageRangeName.add("'50대'");
		ageRangeData.add((BigDecimal) ageRangeChart.get("FIFTY"));
		
		//	데이터 전달
		model.addAttribute("genderName", genderName);
		model.addAttribute("genderData", genderData);
		model.addAttribute("recentName", recentName);
		model.addAttribute("recentData", recentData);
		model.addAttribute("ageRangeName", ageRangeName);
		model.addAttribute("ageRangeData", ageRangeData);
		model.addAttribute("recruit", recruit);
		
		return "company/application_detail";
	}
	
	//	해당 공고의 지원자 목록을 출력하는 페이지로 이동하는 메소드
	@RequestMapping(value = "/co_app_detail_jobseeker", method = RequestMethod.GET)
	public String applicationDetailJobSeeker(int recruitNo, Model model) {
		//	채용 공고 정보 가져오기
		RecruitmentVO recruit = comService.getRecruitDetail(recruitNo);
		
		//	직종 이름을 출력하기 위한 공통코드 변수
		String jobCode = recruit.getRecruitJob();
		String wrkType = recruit.getWorkType();
		String schType = recruit.getRequiredEducation();
		
		//	직종명을 담을 변수 선언 및 서비스 실행
		String jobCodeName = codeService.getCodeName(jobCode);
		String wrkTypeName = codeService.getCodeName(wrkType);
		String schTypeName = codeService.getCodeName(schType);
		
		//	얻어온 직종명을 VO객체에 입력
		recruit.setJobName(jobCodeName);
		recruit.setWrkTypeName(wrkTypeName);
		recruit.setSchTypeName(schTypeName);
		
		//	로고 경로를 담을 변수 선언 및 서비스 실행
		String coLogoPath = comService.getLogoPath(recruit.getCoNo());
		
		//	얻어온 로고 경로를 VO객체에 입력
		recruit.setCoLogoPath(coLogoPath);
		
		List<ApplicationVO> appList = appService.getAppList(recruitNo);
		for(ApplicationVO app : appList) {
			ApplicationDocumentVO document = app.getDocument();
			String attachFile = document.getRsmFileNo();
			if(attachFile != null && !attachFile.equals("") && attachFile != "") {
				List<AttachFileVO> attachFileList = new ArrayList<AttachFileVO>();
				attachFileList = fileService.getFileList(attachFile);
				document.setFileVO(attachFileList);
			}
		}
		recruit.setAppList(appList);
		
		model.addAttribute("recruit", recruit);
		
		
		return "company/application_detail_jobseeker";
	}
}
