package kr.or.ddit.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ResumeVO {
	private String memId;
	private int rsmNo;
	private String rsmTitle;
	private String rsmPhotoPath;
	private String pronunciationYn;
	private String selfIntroduction;
	private String rsmRegYmd;
	private String rsmStatCode;
	private String rsmRlsYn;
	
	private List<ResumeEducationVO> educationList;			//	학력사항
	private List<ResumeCareerVO> careerList;				//	경력사항
	private List<ResumeCertificateVO> certList;				//	자격증 / 면허
	private ResumeMilServiceVO militaryService;				//	병역사항
	private ResumeDocumentVO resumeDocument;				//	첨부파일(포트폴리오 등)
	
	private MultipartFile imgFile;							//	증명사진을 변경할 때의 파일
	private List<MultipartFile> resumeFiles;				//	첨부파일을 처리하기 위한 List<MultipartFile> 객체
}
