package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.ResumeCareerVO;
import kr.or.ddit.vo.ResumeCertificateVO;
import kr.or.ddit.vo.ResumeDocumentVO;
import kr.or.ddit.vo.ResumeEducationVO;
import kr.or.ddit.vo.ResumeMilServiceVO;
import kr.or.ddit.vo.ResumeVO;

public interface IResumeMapper {
	public int createResume(ResumeVO resume);
	public ResumeVO getResumeDetail(ResumeVO resume);
	public List<ResumeVO> getResume(String memId);
	
	public int createResumeTemp(ResumeVO resumeVO);
	public int createRsmCareer(ResumeCareerVO career);
	public int createRsmCert(ResumeCertificateVO certificate);
	public int createRsmEducation(ResumeEducationVO education);
	public int createMilitaryService(ResumeMilServiceVO militaryService);
	public int createDocument(ResumeDocumentVO document);
	
	public int deleteRsmEducation(int rsmNo);
	public int deleteRsmCareer(int rsmNo);
	public int deleteRsmCert(int rsmNo);
	public int deleteMilitaryService(int rsmNo);
	public int resumeDelete(int rsmNo);
}
