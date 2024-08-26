package kr.or.ddit.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class RecruitmentVO {
	private int recruitNo;
	private String coMemId;
	private String title;
	private String content;
	private String requiredEducation;
	private String requiredQualification;
	private String recruitJob;
	private String recruitBgngYmd;
	private String recruitBgngDt;
	private String recruitDdlnYmd;
	private String recruitDdlnDt;
	private String workTime;
	private String workType;
	private String salary;
	private String coPostcode;
	private String coAddressBasic;
	private String coAddressDetail;
	private String recruitCount;
	private String recruitRegYmd;
	private int hit;
	private String attachFile;
	private String allRecruitYn;
	private String selfRsmYn;
	private String recruitStatCode;
	
	//	첨부파일을 처리하기 위한 List<MultipartFile> 객체
	private List<MultipartFile> recFiles;
	
	//	상세보기 또는 공고 출력할 때 기업 데이터를 받아오기 위한 변수
	private String coNo;
	private String coName;
	private String coLogoPath;
	
	//	상세보기할 때 공통코드 데이터를 받아오기 위한 변수
	private String jobName;
	private String wrkTypeName;
	private String schTypeName;
	
	//	지원자 관리할 때를 위해 데이터를 받아오기 위한 변수
	private List<ApplicationVO> appList;
}
