package kr.or.ddit.vo;

import lombok.Data;

@Data
public class QNAVO {
	private String boardNo;
	private String writer;
	private String title;
	private String content;
	private String wrtDt;
	private String attachFile;
	private int hit;
	private String boardStatCode;
	
	private int rnum;
}
