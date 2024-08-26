package kr.or.ddit.controller.recruit;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang.StringUtils;
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
import kr.or.ddit.service.application.IApplicationService;
import kr.or.ddit.service.commonCode.ICommonCodeService;
import kr.or.ddit.service.company.ICompanyService;
import kr.or.ddit.service.file.IFileService;
import kr.or.ddit.service.interest.IInterestService;
import kr.or.ddit.service.recruit.IRecruitService;
import kr.or.ddit.service.resume.IResumeService;
import kr.or.ddit.vo.ApplicationVO;
import kr.or.ddit.vo.AttachFileVO;
import kr.or.ddit.vo.CommonCodeDetailVO;
import kr.or.ddit.vo.CommonCodeVO;
import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.InterestRecruitVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.RecruitmentVO;
import kr.or.ddit.vo.ResumeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/jobel")
@Controller
public class RecruitController {
	
	@Inject
	private ICommonCodeService codeService;		//	공통코드 서비스
	
	@Inject
	private IFileService fileService;			//	첨부파일 서비스
	
	@Inject
	private IRecruitService recService;			//	채용공고 서비스
	
	@Inject
	private IResumeService rsmService;			//	이력서 서비스
	
	@Inject
	private IApplicationService appService;		//	채용지원 서비스
	
	@Inject
	private ICompanyService comService;			//	기업 서비스
	
	@Inject
	private IInterestService intService;		//	관심등록 서비스

	/**
	 * 채용 공고 목록 페이지 출력 메소드
	 * 페이징, 분류, 검색 기능에 따라서 출력하는 공고가 다름
	 */
	@RequestMapping(value = "/recHome", method = RequestMethod.GET)
	public String recruitHome(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false) String regType,
			@RequestParam(required = false) String jobType,
			@RequestParam(required = false) String searchWord,
			Model model) {
		
		PaginationInfoVO<RecruitmentVO> pagingVO = new PaginationInfoVO<RecruitmentVO>();
		
		if(StringUtils.isNotBlank(regType)) {		//	지역 선택을 한 경우
			String regName = codeService.getCodeName(regType);
			pagingVO.setRegType(regName);
			model.addAttribute("regType", regType);
		}
		
		if(StringUtils.isNotBlank(jobType)) {		//	직업 선택을 한 경우
			pagingVO.setJobType(jobType);
			model.addAttribute("jobType", jobType);
		}
		
		if(StringUtils.isNotBlank(searchWord)) {		//	검색어가 존재하는 경우
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVO.setScreenSize(15);					//	한 화면에 15개의 공고를 보여줌
		pagingVO.setCurrentPage(currentPage);		//	현재 페이지 가져오기
		
		int totalRecord = recService.getRecruitCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);		//	가져온 공고의 개수 설정
		
//		List<RecruitmentVO> recList = recService.getRecListCommons();
		List<RecruitmentVO> recList = recService.getRecList(pagingVO);
		
		//	가져온 공고 정보 담기
		pagingVO.setDataList(recList);
		
		for(RecruitmentVO recruit : recList) {
			String wrkType = recruit.getWorkType();
			String schType = recruit.getRequiredEducation();
			//	직종명을 담을 변수 선언 및 서비스 실행
			String wrkTypeName = codeService.getCodeName(wrkType);
			String schTypeName = codeService.getCodeName(schType);
			
			//	얻어온 직종명을 VO객체에 입력
			recruit.setWrkTypeName(wrkTypeName);
			recruit.setSchTypeName(schTypeName);
		}
		
//		model.addAttribute("recruitList", recList);
		model.addAttribute("pagingVO", pagingVO);
		
		//	검색을 위한 공통코드 정보 출력
		List<CommonCodeDetailVO> regtypeList = codeService.getDetailList("REGTYPE");		//	소재 구분(지역)
		List<CommonCodeVO> jobCodeList = codeService.getJobList("JOB");						//	직무 코드 'JOB---T'
		model.addAttribute("jobCodeList", jobCodeList);
		model.addAttribute("regtypeList", regtypeList);
		
		return "commons/recruit/recruitHome";
	}
	/**	recruitHome 종료 */
	
	
	/**
	 * 채용 공고 상세보기 페이지로 이동하는 메소드
	 */
	@RequestMapping(value = "/recDetail", method = RequestMethod.GET)
	public String recruitDetail(int recruitNo, Model model) {
		
		RecruitmentVO recruit = recService.getRecruit(recruitNo);			//	공고정보 가져오기
		int count = recService.incrementRecHit(recruitNo);					//	조회수 증가
		
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
		
		String attachFile = recruit.getAttachFile();
		
		//	파일이 존재한다면
		if(attachFile != null && !attachFile.equals("") && attachFile != "") {
			List<AttachFileVO> attachFileList = new ArrayList<AttachFileVO>();
			attachFileList = fileService.getFileList(attachFile);
			model.addAttribute("fileList", attachFileList);
		}
		
		model.addAttribute("recruit", recruit);
		
		//	채용 공고를 올린 기업에 대한 정보 가져오기
		CompanyVO company = comService.getCompany(recruit.getCoNo());
		model.addAttribute("company", company);
		
		//	이미 즐겨찾기한 공고인지 확인
		//	anonumousUser == 비회원 : 로그인하지 않았음
		if(!SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			MemberVO member = user.getMember();
			InterestRecruitVO intRecruit = new InterestRecruitVO();
			intRecruit.setMemId(member.getMemId());
			intRecruit.setRecruitNo(recruit.getRecruitNo());
			ServiceResult result = intService.checkLikeRecruit(intRecruit);
			
			if(result.equals(ServiceResult.EXIST)) {		//	이미 즐겨찾기를 한 경우 표시
				model.addAttribute("alreadyLike", "Y");
			}
		}
		
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
		
		model.addAttribute("genderName", genderName);
		model.addAttribute("genderData", genderData);
		model.addAttribute("ageRangeName", ageRangeName);
		model.addAttribute("ageRangeData", ageRangeData);
		
		return "commons/recruit/recruitDetail";
	}
	
	
	/**
	 * 채용 공고 상세보기에서 지원하기 클릭했을 때 내 이력서를 가져오는 메소드
	 */
	@ResponseBody
	@RequestMapping(value = "/getMyResume", method = RequestMethod.POST)
	public ResponseEntity<List<ResumeVO>> myResumeList(String memId) {
		ResponseEntity<List<ResumeVO>> entity = null;
		List<ResumeVO> rsmList = rsmService.getResume(memId);
		
		//	이력서가 존재하지 않는 경우
		if(rsmList == null || rsmList.isEmpty()) {
			entity = new ResponseEntity<List<ResumeVO>>(HttpStatus.BAD_REQUEST);
		} else {
			entity = new ResponseEntity<List<ResumeVO>>(rsmList, HttpStatus.OK);
		}
		
		return entity;
	}
	
	/**
	 * 특정 공고에 이력서를 제출하는 메소드
	 */
	@ResponseBody
	@RequestMapping(value = "/doApplication", method = RequestMethod.POST)
	public ResponseEntity<String> doApplication(ApplicationVO applyVO) {
		ResponseEntity<String> entity = null;
		applyVO.setAppStatCode("APPSTAT001");		//	입사 지원하는 단계이므로 상태 코드로 '서류 접수' 코드를 부여
		
		ServiceResult result = appService.doApplication(applyVO);
		
		if(result.equals(ServiceResult.OK)) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	/**
	 * 특정 공고에 지원하기를 클릭했을 때 이미 지원한 공고인지 확인하는 메소드
	 */
	@ResponseBody
	@RequestMapping(value = "/applyCheck", method = RequestMethod.POST)
	public ResponseEntity<String> applyCheck(String memId, int recNo) {
		ResponseEntity<String> entity = null;
		
		Map<String, Object> checkMap = new HashMap<String, Object>();
		checkMap.put("memId", memId);
		checkMap.put("recruitNo", recNo);
		
		ServiceResult result = appService.applyCheck(checkMap);
		
		if(result.equals(ServiceResult.EXIST)) {
			entity = new ResponseEntity<String>("ALREADY", HttpStatus.OK);
		} else if(result.equals(ServiceResult.NOTEXIST)) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
