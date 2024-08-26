package kr.or.ddit.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberVO {
	//	회원 공통
	private String memId;
	private String memPassword;
	private String name;
	private String telno;
	private String email;
	private String joinYmd;
	private String memStatCode;
	private String enabled;
	private List<MemberAuthVO> authList;
	
	//	일반 회원
	private String nickname;
	private String gender;
	private String brdt;
	private String postcode;
	private String addressBasic;
	private String addressDetail;
	private String marriageYn;
	private String profilePhotoPath;
	
	//	일반 회원 프로필 사진을 받기 위한 변수
	private MultipartFile profilePhoto;
	
	//	기업 회원
	private String coNo;
	private String jobName;
	
}
