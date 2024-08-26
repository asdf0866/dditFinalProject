package kr.or.ddit.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ApplicationVO {
	private int appNo;
	private int recruitNo;
	private int rsmNo;
	private String appStatCode;
	private String appApplyYmd;
	private String appChgYmd;
	
	//	채용시 정보 PDF화하여 저장하기 위한 변수
	private List<MultipartFile> applyFiles;
	
	//	정보 읽어올 때 필요함
	private ApplicationDocumentVO document;
	private String memberName;
	private String rsmTitle;
}
