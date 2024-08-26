package kr.or.ddit.vo;

import lombok.Data;

@Data
public class CompanyReviewVO {
	private int reviewNo;
	private String memId;
	private String coNo;
	private String title;
	private String oneLineReview;
	private String wrtDt;
	private String workYn;
	private int coWelfareEvl;
	private int coSalaryEvl;
	private int coCultureEvl;
	private int coImproveEvl;
	private int coManageEvl;
	private String coStrengths;
	private String coWeaknesses;
	private String coWish;
	private int hit;
	
	private String coName;
	
	public double getAvgScore() {
		int sum = coWelfareEvl + coSalaryEvl + coCultureEvl + coImproveEvl + coManageEvl;
		double avg = sum / 5;
		return avg;
	}
}
