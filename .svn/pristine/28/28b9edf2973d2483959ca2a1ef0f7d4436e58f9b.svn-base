package kr.or.ddit.service.resume;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IResumeMapper;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ResumeCareerVO;
import kr.or.ddit.vo.ResumeCertificateVO;
import kr.or.ddit.vo.ResumeDocumentVO;
import kr.or.ddit.vo.ResumeEducationVO;
import kr.or.ddit.vo.ResumeMilServiceVO;
import kr.or.ddit.vo.ResumeVO;

@Transactional
@Service
public class ResumeServiceImpl implements IResumeService {
	
	@Inject
	private IResumeMapper mapper;

	@Override
	public ResumeVO createResume(MemberVO member) {
		ResumeVO resume = new ResumeVO();
		
		//	이력서 VO 객체에 아이디와 임시 제목, 상태코드(임시저장)를 부여한다.
		resume.setMemId(member.getMemId());
		resume.setRsmTitle(member.getName() + "님의 이력서입니다.");
		resume.setRsmStatCode("RSMTYPE001");
		
		mapper.createResume(resume);
		
		return resume;
	}
	
	@Override
	public ResumeVO getResumeDetail(ResumeVO resume) {
		return mapper.getResumeDetail(resume);
	}

	@Override
	public List<ResumeVO> getResume(String memId) {
		return mapper.getResume(memId);
	}

	@Transactional
	@Override
	public ServiceResult saveResumeTemp(ResumeVO resumeVO) {
		ServiceResult result = null;
		
		boolean commitCheck = false;
		
		int rsmNo = resumeVO.getRsmNo();
		
		int count = mapper.createResumeTemp(resumeVO);
		
		//	학력사항 있을 시 등록
		List<ResumeEducationVO> educationList = resumeVO.getEducationList();
		if(educationList != null && educationList.size() != 0) {
			//	기존의 내용은 삭제하고 새로 덮어씌운다.
			count = mapper.deleteRsmEducation(rsmNo);
			
			for(ResumeEducationVO education : educationList) {
				//	학력사항에 이력서 번호 입력
				education.setRsmNo(rsmNo);
				
				//	입학일자가 존재할 경우 형식 변환
				if(education.getEnterYmd() != null && education.getEnterYmd() != "") {
					education.setEnterYmd(changeTime(education.getEnterYmd()));
				}
				
				//	졸업일자가 존재할 경우 형식 변환
				if(education.getGraduateYmd() != null && education.getGraduateYmd() != "") {
					education.setGraduateYmd(changeTime(education.getGraduateYmd()));
				}
				
				count = mapper.createRsmEducation(education);
				
				if(count == 0) {		//	에러가 발생시 체크
					commitCheck = true;
				}
			}
		}
		
		//	경력사항 있을 시 등록
		List<ResumeCareerVO> careerList = resumeVO.getCareerList();
		if(careerList != null && careerList.size() != 0) {
			//	기존의 내용은 삭제하고 새로 덮어씌운다.
			count = mapper.deleteRsmCareer(rsmNo);
			
			for(ResumeCareerVO career : careerList) {
				//	경력사항에 이력서 번호 입력
				career.setRsmNo(rsmNo);
				
				//	입사일이 존재할 경우 형식 변환
				if(career.getJncmpYmd() != null && career.getJncmpYmd() != "") {
					career.setJncmpYmd(changeTime(career.getJncmpYmd()));
				}
				
				//	퇴사일이 존재할 경우 형식 변환
				if(career.getRtrmYmd() != null && career.getRtrmYmd() != "") {
					career.setRtrmYmd(changeTime(career.getRtrmYmd()));
				}
				
				count = mapper.createRsmCareer(career);
				if(count == 0) {
					commitCheck = true;
				}
			}
		}
		
		//	자격증 있을 시 등록
		List<ResumeCertificateVO> certList = resumeVO.getCertList();
		if(certList != null) {
			//	기존의 내용은 삭제하고 새로 덮어씌운다.
			count = mapper.deleteRsmCert(rsmNo);
			
			for(ResumeCertificateVO certificate : certList) {
				//	자격증에 이력서 번호 입력
				certificate.setRsmNo(rsmNo);
				
				//	취득일자가 존재할 경우 형식 변환
				if(certificate.getCertAcqulreYmd() != null && certificate.getCertAcqulreYmd() != "") {
					certificate.setCertAcqulreYmd(changeTime(certificate.getCertAcqulreYmd()));
				}
				
				//	만료일자가 존재할 경우 형식 변환
				if(certificate.getCertExpiryYmd() != null && certificate.getCertExpiryYmd() != "") {
					certificate.setCertExpiryYmd(changeTime(certificate.getCertExpiryYmd()));
				}
				
				count = mapper.createRsmCert(certificate);
				if(count == 0) {
					commitCheck = true;
				}
			}
		}
		
		//	병역사항 해당시 등록
		ResumeMilServiceVO militaryService = resumeVO.getMilitaryService();
		if(militaryService != null) {
			//	기존의 내용은 삭제하고 새로 덮어씌운다.
			count = mapper.deleteMilitaryService(rsmNo);
			
			//	병역사항에 이력서 번호 입력
			militaryService.setRsmNo(rsmNo);
			
			//	입대일자가 존재할 경우 형식 변환
			if(militaryService.getMilBgngYmd() != null && militaryService.getMilBgngYmd() != "") {
				militaryService.setMilBgngYmd(changeTime(militaryService.getMilBgngYmd()));
			}
			
			//	전역일자가 존재할 경우 형식 변환
			if(militaryService.getMilEndYmd() != null && militaryService.getMilEndYmd() != "") {
				militaryService.setMilEndYmd(changeTime(militaryService.getMilEndYmd()));
			}
			
			count = mapper.createMilitaryService(militaryService);
			if(count == 0) {
				commitCheck = true;
			}
		}
		
		ResumeDocumentVO document = resumeVO.getResumeDocument();
		if(document != null) {
			count = mapper.createDocument(document);
			
			if(count == 0) {
				commitCheck = true;
			}
		}
		
		if(commitCheck) {		//	true 라는 것은 Insert 과정에 0이 뜬 적이 있다는 뜻
			result = ServiceResult.FAILED;
		} else {
			result = ServiceResult.OK;
		}
		
		return result;
	}


	@Override
	public ServiceResult resumeDelete(int rsmNo) {
		ServiceResult result = null;
		
		int count = mapper.resumeDelete(rsmNo);
		
		if(count > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	/**************************************************
	 * 문자열 변경 메소드
	 */
	//	'yyyyMMdd' 형식으로 날짜 형식을 문자열로 변환
	private String changeTime(String dateString) {
		return dateString.replaceAll("\\D", "");
	}

}
