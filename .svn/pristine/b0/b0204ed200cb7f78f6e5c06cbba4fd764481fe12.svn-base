package kr.or.ddit.service.file;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.AttachFileVO;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.RecruitmentVO;
import kr.or.ddit.vo.ResumeVO;

public interface IFileService {
	public List<AttachFileVO> getFileList(String attachFile);
	public AttachFileVO getFile(AttachFileVO attachFile);
	public ServiceResult delFile(AttachFileVO delFile);
	
	//	회원 정보 기능
	public MemberVO insertProfilePhoto(HttpServletRequest req, MemberVO member);
	public MemberVO editProfilePhoto(HttpServletRequest req, MemberVO member);
	
	//	기업 등록 관련 기능
	public CompanyVO registerCoLo(HttpServletRequest req, CompanyVO company);
	public CompanyVO registerReqFile(HttpServletRequest req, CompanyVO company);
	public ServiceResult editRecFile(HttpServletRequest req, RecruitmentVO recruit);
	
	//	공고 기능
	public RecruitmentVO registerRecFile(HttpServletRequest req, RecruitmentVO recruit);
	
	//	이력서 기능
	public ResumeVO insertResumePhoto(HttpServletRequest req, ResumeVO resumeVO);
	public ResumeVO registerRsmFile(HttpServletRequest req, ResumeVO resumeVO);
	public ServiceResult editResumePhoto(HttpServletRequest req, ResumeVO resumeVO);
	public ServiceResult editRsmFile(HttpServletRequest req, ResumeVO resumeVO);
	
	//	게시판 등록 기능
	public BoardVO registerBoFile(HttpServletRequest req, BoardVO board);
	public ServiceResult editBoardFile(HttpServletRequest req, BoardVO boardVO);
	
	//	채용 지원 기능
	public String doAppPdf(int appNo, List<MultipartFile> applyFiles);
}
