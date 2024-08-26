package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class ApplicationDocumentVO {
	private int appNo;
	private int documentNo;
	private String rsmFileNo;
	private String documentStatCode;
	
	private List<AttachFileVO> fileVO;
}
