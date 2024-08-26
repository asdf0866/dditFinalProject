package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class CommonCodeVO {
	private String commonCode;
	private String commonCodeName;
	private String commonCodeDesc;
	
	private List<CommonCodeDetailVO> detailList;
}
