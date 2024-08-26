package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

 @Data
public class BoardVO {
	private List<AttachFileVO> fileList;
	private String boardNo;
	private String writer;
	private String title;
	private String content;
	private Date wrtDt;
	private String attachFile;
	private int hit;
	private String boardStatCode;
	//<input type="file" class="custom-file-input" id="boFile" name="boFile" multiple="multiple">
	private List<MultipartFile> boFile;
	private String rnum;
}
