package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ResumeCertificateVO {
	private int rsmNo;
	private int certNo;
	private String certType;
	private String certAcqulreYmd;
	private String certExpiryYmd;
	private String certAgency;
}