package kr.or.ddit.controller.resume;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.commonCode.ICommonCodeService;
import kr.or.ddit.service.file.IFileService;
import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.resume.IResumeService;
import kr.or.ddit.vo.AttachFileVO;
import kr.or.ddit.vo.CommonCodeDetailVO;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ResumeCareerVO;
import kr.or.ddit.vo.ResumeCertificateVO;
import kr.or.ddit.vo.ResumeDocumentVO;
import kr.or.ddit.vo.ResumeEducationVO;
import kr.or.ddit.vo.ResumeMilServiceVO;
import kr.or.ddit.vo.ResumeVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@RequestMapping("/jobel")
@Controller
public class ResumeController {
	
	@Inject
	private IMemberService memService;
	
	@Inject
	private ICommonCodeService codeService;
	
	@Inject
	private IResumeService rsmService;
	
	@Inject
	private IFileService fileService;

	/**
	 * 이력서 작성 페이지로 이동하는 메소드 
	 */
	@RequestMapping(value = "/resumeWrite", method = RequestMethod.GET)
	public String resumeWriteForm(
			@RequestParam(required = false) Integer rsmNo,
			@RequestParam(required = false) String trigger,
			Model model) {

		//	회원 정보 가져오기
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memId = user.getMember().getMemId();
		MemberVO member = memService.readByUserId(memId);
		ResumeVO resume = new ResumeVO();
		if(trigger != null && trigger.equals("Y")) {		//	이력서 수정 버튼을 클릭한 경우
			resume.setRsmNo(rsmNo);
			resume = rsmService.getResumeDetail(resume);
			model.addAttribute("trigger", "Y");
		} else {		//	이력서 작성 버튼을 클릭한 경우
			//	임시 저장된 이력서가 있는 지 확인
			ResumeVO checkResume = new ResumeVO();
			checkResume.setMemId(memId);							//	회원 아이디
			checkResume.setRsmStatCode("RSMTYPE001");				//	임시저장 코드
			resume = rsmService.getResumeDetail(checkResume);
			if(resume != null) {		//	임시 저장 이력서가 있을 경우
				model.addAttribute("message", "임시 저장 된 이력서가 존재합니다. 임시 저장된 이력서를 재작성합니다.");
			} else {		//	이력서가 존재하지 않을 경우 신규 생성
				resume = rsmService.createResume(member);
			}
		}
		
		//	이력서 작성 중 내용들을 선택하기 위한 공통코드 List 
		Map<String, List<CommonCodeDetailVO>> codeMap
			= codeService.getDetailMap("SCHTYPE", "REGTYPE", "GRDTYPE", "GRDBASE", "MILTYPE", "WRKTYPE");
		
		model.addAttribute("member", member);
		model.addAttribute("resume", resume);
		model.addAllAttributes(codeMap);
		
		return "commons/resume/resumeWriteForm";
	}
	
	/**
	 * 이력서 임시 저장 메소드
	 */
	@ResponseBody
	@RequestMapping(value = "/tempSave", method = RequestMethod.POST)
	public ResponseEntity<String> saveResumeTemp(@RequestBody ResumeVO resumeVO) {
		ResponseEntity<String> entity = null;
		
		ServiceResult result = rsmService.saveResumeTemp(resumeVO);
		
		if(result.equals(ServiceResult.OK)) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/**
	 * 이력서 저장 메소드
	 */
	@ResponseBody
	@RequestMapping(value = "/resumeSave", method = RequestMethod.POST)
	public ResponseEntity<String> saveResume(HttpServletRequest req, ResumeVO resumeVO) {
		ResponseEntity<String> entity = null;
		
		//	신규 등록하는 프로필 사진이 있을 경우 반영한다.
		if(resumeVO.getImgFile() != null) {
			resumeVO = fileService.insertResumePhoto(req, resumeVO);
		}
		
		//	첨부파일이 있을 경우 반영한다.
		if(resumeVO.getResumeFiles() != null) {
			resumeVO = fileService.registerRsmFile(req, resumeVO);
		}
		
		//	상태코드를 임시 저장이 아닌 작성 완료로 변경
		resumeVO.setRsmStatCode("RSMTYPE002");
		
		//	그 외 항목들은 임시저장 때 사용하는 항목 그대로 입력
		ServiceResult result = rsmService.saveResumeTemp(resumeVO);
		
		if(result.equals(ServiceResult.OK)) {
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/**
	 * 이력서 수정 메소드
	 */
	@RequestMapping(value = "/resumeUpdate", method = RequestMethod.POST)
	public ResponseEntity<String> resumeUpdate(HttpServletRequest req, ResumeVO resumeVO){
		ResponseEntity<String> entity = null;
		
		try {
			//	변경하는 프로필 사진이 있을 경우 반영한다.
			if(resumeVO.getImgFile() != null) {
				//	기존에 등록해둔 사진이 존재하는지 확인
				String photoPath = resumeVO.getRsmPhotoPath();
				if(photoPath != null && !photoPath.equals("")) {		//	기존의 등록한 사진이 있는 경우
					ServiceResult result = fileService.editResumePhoto(req, resumeVO);
					if(result.equals(ServiceResult.FAILED)) {		//	변경 실패시 그 외의 작업을 진행하지 않고 리턴
						return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
					}
				} else {		//	등록했던 사진이 없는 경우, 신규 등록
					resumeVO = fileService.insertResumePhoto(req, resumeVO);
				}
			}
			
			//	첨부파일이 있을 경우 반영한다.
			if(resumeVO.getResumeFiles() != null) {
				//	파일을 등록한 적 있는지 확인 
				String attachId = resumeVO.getResumeDocument().getDocumentName();
				if(attachId != null && !attachId.equals("")) {		//	이미 파일을 등록한 적이 있는 경우
					ServiceResult result =fileService.editRsmFile(req, resumeVO);
					if(result.equals(ServiceResult.FAILED)) {		//	변경 실패시 그 외 작업을 진행하지 않고 리턴
						return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
					}
				} else {		//	등록한 적 없는 경우 신규 등록
					resumeVO = fileService.registerRsmFile(req, resumeVO);
				}
			}
			
			ServiceResult result = rsmService.saveResumeTemp(resumeVO);
			if(result.equals(ServiceResult.OK)) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			}
			
		} catch (Exception e) {
			log.error("{}", e);
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/**
	 * 이력서 상세보기 메소드 
	 */
	@RequestMapping(value = "/resumeInfo", method = RequestMethod.GET)
	public String resumeInfo(int rsmNo, Model model) {
		//	이력서 정보를 가져올 resumeVO 객체 생성
		ResumeVO resume = new ResumeVO();
		
		//	회원 정보 가져오기
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memId = user.getMember().getMemId();
		MemberVO member = memService.readByUserId(memId);
		
		//	이력서 정보 가져오기
		resume.setRsmNo(rsmNo);
		resume.setMemId(memId);
		resume = rsmService.getResumeDetail(resume);
		
		//	첨부파일 존재 유무 확인
		ResumeDocumentVO document = resume.getResumeDocument();
		if(document.getDocumentName() != null && document.getDocumentName() != "") {
			List<AttachFileVO> attachFileList = new ArrayList<AttachFileVO>();
			attachFileList = fileService.getFileList(document.getDocumentName());
			model.addAttribute("fileList", attachFileList);
		}
		
		Map<String, List<CommonCodeDetailVO>> codeMap
			= codeService.getDetailMap("SCHTYPE", "REGTYPE", "GRDTYPE", "GRDBASE", "MILTYPE", "WRKTYPE");
		
		model.addAttribute("resume", resume);
		model.addAttribute("member", member);
		model.addAllAttributes(codeMap);
		return "commons/resume/resumeInfo";
	}
	
	/**
	 * 이력서 삭제 메소드
	 */
	@ResponseBody
	@RequestMapping(value = "/resumeDelete", method = RequestMethod.POST)
	public ResponseEntity<String> resumeDelete(int rsmNo) {
		ResponseEntity<String> entity = null;
		ServiceResult result = rsmService.resumeDelete(rsmNo);
		
		if(result.equals(ServiceResult.OK)) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/**
	 * 이력서 미리 보기
	 */
	@ResponseBody
	@RequestMapping(value = "/getPreviewResume", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getMyResume(int rsmNo, String memId) {
		Map<String, Object> resumeMap = new HashMap<String, Object>();
		
		//	이력서 정보 가져오기
		ResumeVO resume = new ResumeVO();
		resume.setRsmNo(rsmNo);
		resume = rsmService.getResumeDetail(resume);
		
		//	공통코드로 구성되어있는 컬럼들의 공통코드명을 가져온다.
		//	학력사항 공통코드
		List<ResumeEducationVO> educationList = resume.getEducationList();
		if(educationList != null && !educationList.isEmpty()) {			//	학력사항 값 1차 검증
			if(educationList.get(0).getEduDivision() != null) {			//	학력사항 값 2차 검증
				List<String> eduDivisions = new ArrayList<String>();
				List<String> eduLocations = new ArrayList<String>();
				List<String> eduGrdBasis = new ArrayList<String>();
				List<String> eduGrdTypes = new ArrayList<String>();
				for(ResumeEducationVO education : educationList) {
					//	학력 구분
					String division = education.getEduDivision();
					String divName = codeService.getCodeName(division);
					eduDivisions.add(divName);
					
					//	학교 소재
					String location = education.getEduLocation();
					String lctName = codeService.getCodeName(location);
					eduLocations.add(lctName);
					
					//	기준 학점
					String gradeBasis = education.getGradeBasis();
					if(gradeBasis != null && gradeBasis != "") {
						String basisName = codeService.getCodeName(gradeBasis);
						eduGrdBasis.add(basisName);
					} else {
						eduGrdBasis.add("");
					}
					
					//	졸업 구분
					String gradeType = education.getGradeType();
					if(gradeType != null && gradeType != "") {
						String grdTypeName = codeService.getCodeName(gradeType);
						eduGrdTypes.add(grdTypeName);
					} else {
						eduGrdTypes.add("");
					}
				}
				resumeMap.put("eduDivisions", eduDivisions);
				resumeMap.put("eduLocations", eduLocations);
				resumeMap.put("eduGrdBasis", eduGrdBasis);
				resumeMap.put("eduGrdTypes", eduGrdTypes);
			} else {		//	educationList에 이력서 번호를 제외하고는 값이 없는 경우
				resume.setEducationList(null);		//	학력사항 값 제거
			}
		}		//	if문 종료
		
		//	경력사항 공통코드
		List<ResumeCareerVO> careerList = resume.getCareerList();
		
		//	경력사항이 존재할 경우
		if(careerList != null && !careerList.isEmpty()) {
			if(careerList.get(0).getWorkType() != null) {
				List<String> careerWorkTypes = new ArrayList<String>();
				for(ResumeCareerVO career : careerList) {
					String workType = career.getWorkType();
					String codeName = codeService.getCodeName(workType);
					careerWorkTypes.add(codeName);
				}
				resumeMap.put("careerWorkTypes", careerWorkTypes);
			} else {		//	careerList에 이력서 번호를 제외하고는 값이 없는 경우
				resume.setCareerList(null);		//	경력사항 값 제거
			}
		}
		
		//	자격증 리스트
		List<ResumeCertificateVO> certList = resume.getCertList();
		
		//	자격증이 존재할 경우
		if(certList != null && !certList.isEmpty()) {
			//	이력서 번호만 존재하는 경우
			if(certList.get(0).getCertType() == null){
				resume.setCertList(null);
			}
		}
		
		//	병역사항 공통코드
		ResumeMilServiceVO milService = resume.getMilitaryService();
		if(milService != null) {
			if(milService.getMilitaryService() != null) {
				String militaryService = milService.getMilitaryService();
				String milServiceName = codeService.getCodeName(militaryService);
				resumeMap.put("milServiceName", milServiceName);
			} else {		//	militaryService에 회원 아이디만 존재하는 경우
				resume.setMilitaryService(null);		//	병역사항 값 제거
			}
		}
		
		//	이력서 정보와 공통코드 이름들을 map에 담음
		resumeMap.put("resume", resume);
		
		//	회원정보 가져와서 map에 담음
		MemberVO member = memService.readByUserId(memId);
		resumeMap.put("member", member);
		
		return new ResponseEntity<Map<String, Object>>(resumeMap, HttpStatus.OK);
	}
}
