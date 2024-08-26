package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ResumeEducationVO {
	private int rsmNo;
	private int eduNo;
	private String eduDivision;
	private String eduLocation;
	private String schoolName;
	private String enterYmd;
	private String graduateYmd;
	private String major;
	private String subMajor;
	private String gradeBasis;
	private double gradeAvg;
	private String gradeType;
}
