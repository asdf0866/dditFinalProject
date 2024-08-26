package kr.or.ddit.service.file;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IFileMapper;
import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.vo.AttachFileVO;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.RecruitmentVO;
import kr.or.ddit.vo.ResumeDocumentVO;
import kr.or.ddit.vo.ResumeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FileServiceImpl implements IFileService {

	@Inject
	private IFileMapper mapper;

	@Inject
	private IMemberService memService;
	
	@Override
	public List<AttachFileVO> getFileList(String attachFile) {
		return mapper.getFileList(attachFile);
	}

	
	@Override
	public AttachFileVO getFile(AttachFileVO attachFile) {
		return mapper.getFile(attachFile);
	}

	
	@Override
	public ServiceResult delFile(AttachFileVO delFile) {
		ServiceResult sr = null;
		int count = mapper.delFile(delFile);
		
		if(count > 0) {
			sr = ServiceResult.OK;
		} else {
			sr = ServiceResult.FAILED;
		}
		
		return sr;
	}

	/**
	 * 일반 회원 프로필 사진 등록 메소드
	 */
	@Override
	public MemberVO insertProfilePhoto(HttpServletRequest req, MemberVO member) {
		
		MultipartFile profile = member.getProfilePhoto();
		
		try {
			//	원래라면 배포된 환경에 저장해야하지만 현재는 임시로 직접 경로로 저장
//			String uploadPath = req.getServletContext().getRealPath("/resources/upload/member");
			String uploadPath = "C:/sts3915/workspace/jobEulLae/src/main/webapp/resources/upload/member";
			
			
			//	폴더 구조의 위치를 가지고 있는 파일 객체 생성
			File folder = new File(uploadPath);
			
			//	폴더 구조가 존재하지 않다면 생성
			if(!folder.exists()) {
				folder.mkdirs();
			}
			
			//	UUID 생성
			String fileName = UUID.randomUUID().toString();
			
			//	UUID_원본파일명
			fileName += "_" + profile.getOriginalFilename();
			
			//	이미지 파일 저장 경로 생성(/upload/member/profile)
			String imgPath = uploadPath + File.separator + "profile";
			
			//	이미지 파일 저장 경로 폴더 구조 확인
			File chkFile = new File(imgPath);
			
			if(!chkFile.exists()) {
				chkFile.mkdirs();
			}
			
			imgPath += File.separator + fileName;
			
			//	파일을 저장 경로에 복사
			profile.transferTo(new File(imgPath));
			
			//	DB에 저장할 경로명 생성(resources 앞에 있는 경로구분자부터 등록)
			int pathNumber = imgPath.indexOf("resources") - 1;
			String profilePhotoPath = imgPath.substring(pathNumber);
			
			//	VO객체에 이미지 경로 저장
			member.setProfilePhotoPath(profilePhotoPath);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return member;
	}
	
	
	/**
	 * 일반 회원 프로필 사진 변경 메소드
	 */
	@Override
	public MemberVO editProfilePhoto(HttpServletRequest req, MemberVO member) {
		String memId = member.getMemId();
		
		//	기존의 프로필 사진은 삭제
		MemberVO oldMember = memService.readByUserId(memId);
		String oldPhotoPath = oldMember.getProfilePhotoPath();
		File oldPhoto = new File(req.getServletContext().getRealPath(oldPhotoPath));
		if(oldPhoto.exists()) {
			oldPhoto.delete();
		}
		
		//	프로필 사진 새로 등록
		member = insertProfilePhoto(req, member);
		return member;
	}
	
	
	/**
	 * 기업 로고 저장 메소드
	 */
	@Override
	public CompanyVO registerCoLo(HttpServletRequest req, CompanyVO company) {
		//	원래라면 배포된 환경에 저장해야하지만 현재는 임시로 직접 경로로 저장
//		String uploadPath = req.getServletContext().getRealPath("/resources/upload/company");
		String uploadPath = "C:/sts3915/workspace/jobEulLae/src/main/webapp/resources/upload/company";
		
		//	폴더 구조의 위치를 가지고 있는 파일 객체 생성
		File folder = new File(uploadPath);
		
		//	폴더 구조가 존재하지 않다면 생성
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		/***** 기업 로고 이미지 저장 ******/
		//	이미지 파일은 첨부파일 DB에서 관리하지 않고 경로만 DB에 입력
		
		//	기업 정보에 존재하는 로고 이미지 파일 경로를 담을 변수 선언
		String logoPath = "";
		
		MultipartFile imgFile = company.getImgFile();
		
		//	이미지 파일이 존재하는지 확인
		try {
			if(imgFile.getOriginalFilename() != null
					&& !imgFile.getOriginalFilename().equals("")
					) {
				//	UUID 생성
				String logoName = UUID.randomUUID().toString();
				
				//	UUID_원본파일명
				logoName += "_" + imgFile.getOriginalFilename();
				
				//	이미지 파일 저장 경로 생성
				String imgPath = uploadPath + File.separator + "logo";
				
				//	이미지 파일 저장 경로 폴더 구조 확인
				File chkFile = new File(imgPath);
				
				if(!chkFile.exists()) {
					chkFile.mkdirs();
				}
				
				imgPath +=  File.separator + logoName;
				
				//	파일을 저장 경로에 복사
				imgFile.transferTo(new File(imgPath));
				
				//	DB에 저장할 경로명 생성
				logoPath = "/resources/upload/company/logo/" + logoName;
			}
			//	VO객체에 이미지 경로 저장
			company.setCoLogoPath(logoPath);
		} catch (Exception e) {
			log.error("{}",e);
		}
		
		return company;
	}

	
	/**
	 * 기업 증명 서류 저장 메소드
	 */
	@Override
	public CompanyVO registerReqFile(HttpServletRequest req, CompanyVO company) {
		
		//	서류 파일은 여러 개일 수 있으므로 List 객체에 담겨서 온다.
		List<MultipartFile> reqFiles = company.getRequiredFile();
		
		//	첨부 파일이 존재하는 경우
		if(!reqFiles.isEmpty() && reqFiles != null) {
			String fileId = fileRegister(req, reqFiles, "COM");
			//	저장한 파일 ID 등록
			company.setRequestFile(fileId);
		}
		
		return company;
	}

	
	/**
	 * 공고 등록시 첨부 파일 등록 메소드
	 */
	@Override
	public RecruitmentVO registerRecFile(HttpServletRequest req, RecruitmentVO recruit) {
		
		//	파일은 여러 개일 수 있으므로 List 객체에 담겨서 온다.
		List<MultipartFile> reqFiles = recruit.getRecFiles();
		
		//	파일이 존재할 경우 파일 등록 메소드로 보낸다.
		if(!reqFiles.isEmpty() && reqFiles != null) {
			//	등록할 때 사용할 VO와 유형을 입력
			String fileId = fileRegister(req, reqFiles, "REC");
			
			//	저장한 파일 ID 등록
			recruit.setAttachFile(fileId);
		}
		
		return recruit;
	}
	
	
	/**
	 * 공고의 첨부파일 수정 메소드
	 */
	@Override
	public ServiceResult editRecFile(HttpServletRequest req, RecruitmentVO recruit) {
		
		//	파일은 여러 개일 수 있으므로 List 객체에 담겨서 온다.
		List<MultipartFile> reqFiles = recruit.getRecFiles();
		String attachId = recruit.getAttachFile();
		
		ServiceResult result = fileUpdate(req, reqFiles, "REC", attachId);
		
		return result;
	}
	
	
	/**
	 * 이력서 사진 저장 메소드
	 */
	@Override
	public ResumeVO insertResumePhoto(HttpServletRequest req, ResumeVO resumeVO) {
		
		MultipartFile profile = resumeVO.getImgFile();
		
		//	원래라면 배포된 환경에 저장해야하지만 현재는 임시로 직접 경로로 저장
//		String uploadPath = req.getServletContext().getRealPath("/resources/upload/company");
		String uploadPath = "C:/sts3915/workspace/jobEulLae/src/main/webapp/resources/upload/resume/";
		uploadPath += resumeVO.getRsmNo() + File.separator;		//	저장경로에 이력서 번호를 추가하여 이력서별로 구분
		
		try {
			//	폴더 구조의 위치를 가지고 있는 파일 객체 생성
			File folder = new File(uploadPath);
			
			//	해당 경로의 폴더가 존재하지 않는다면 생성
			if(!folder.exists()) {
				folder.mkdirs();
			}
			
			//	UUID 생성
			String fileName = UUID.randomUUID().toString();
			
			//	UUID_원본파일명
			fileName += "_" + profile.getOriginalFilename();
			
			String imgPath = uploadPath + fileName;
				
			//	파일을 저장 경로에 복사
			profile.transferTo(new File(imgPath));
			//	DB에 저장할 경로명 생성(resources 앞에 있는 경로구분자부터 등록)
			int pathNumber = imgPath.indexOf("resources") - 1;
			String rsmPhotoPath = imgPath.substring(pathNumber);
			
			//	VO객체에 이미지 경로 저장
			resumeVO.setRsmPhotoPath(rsmPhotoPath);
		} catch (Exception e) {
			log.error("{}",e);
		}
		
		return resumeVO;
	}
	
	
	/**
	 * 이력서 첨부파일을 등록하는 메소드
	 */
	@Override
	public ResumeVO registerRsmFile(HttpServletRequest req, ResumeVO resumeVO) {
		
		//	서류 파일은 여러 개일 수 있으므로 List 객체에 담겨서 온다.
		List<MultipartFile> reqFiles = resumeVO.getResumeFiles();
		
		//	첨부 파일이 존재하는 경우
		if(!reqFiles.isEmpty() && reqFiles != null) {
			String fileId = fileRegister(req, reqFiles, "RSM"+resumeVO.getRsmNo());
			
			//	저장한 파일 ID 등록
			ResumeDocumentVO document = new ResumeDocumentVO();
			document.setRsmNo(resumeVO.getRsmNo());
			document.setDocumentName(fileId);
			document.setDocumentStatCode("RSMFILE001");
			
			resumeVO.setResumeDocument(document);
		}
		
		return resumeVO;
	}
	
	
	/**
	 * 이력서 사진 변경 메소드
	 */
	@Override
	public ServiceResult editResumePhoto(HttpServletRequest req, ResumeVO resumeVO) {
		
		return null;
	}
	
	/**
	 * 이력서 첨부파일 수정 메소드
	 */
	@Override
	public ServiceResult editRsmFile(HttpServletRequest req, ResumeVO resumeVO) {
		//	파일은 여러 개일 수 있으므로 List 객체에 담겨서 온다.
		List<MultipartFile> resumeFiles = resumeVO.getResumeFiles();
		String attachId = resumeVO.getResumeDocument().getDocumentName();
		
		ServiceResult result = fileUpdate(req, resumeFiles, "RSM"+resumeVO.getRsmNo(), attachId);
		
		return result;
	}
	
	
	/**
	 * 게시판 파일 등록 메소드
	 */
	@Override
	public BoardVO registerBoFile(HttpServletRequest req, BoardVO board) {
		//	서류 파일은 여러 개일 수 있으므로 List 객체에 담겨서 온다.
		List<MultipartFile> reqFiles = board.getBoFile();
		
		//	첨부 파일이 존재하는 경우
		if(!reqFiles.isEmpty() && reqFiles != null) {
			String fileId = fileRegister(req, reqFiles, "BRD");
			
			board.setAttachFile(fileId);
		}
		
		return board;
	}

	
	/**
	 * 게시판 파일 수정 메소드
	 */
	@Override
	public ServiceResult editBoardFile(HttpServletRequest req, BoardVO boardVO) {
		
		//	파일은 여러 개일 수 있으므로 List 객체에 담겨서 온다.
		List<MultipartFile> boFile = boardVO.getBoFile();
		String attachId = boardVO.getAttachFile();
		
		ServiceResult result = fileUpdate(req, boFile, "BRD", attachId);
		
		return result;
	}

	
	/**
	 * 채용 지원 후 이력서 PDF화 보관 메소드
	 */
	@Override
	public String doAppPdf(int appNo, List<MultipartFile> applyFiles) {
		
		//	원래라면 배포된 환경에 저장해야하지만 현재는 임시로 직접 경로로 저장
//		String uploadPath = req.getServletContext().getRealPath("/resources/upload/company");
		String uploadPath = "C:/sts3915/workspace/jobEulLae/src/main/webapp/resources";
		uploadPath += File.separator + "upload" +  File.separator + "application" + File.separator + appNo;
		
		//	파일 경로가 존재하지 않는다면 생성
		File checkPath = new File(uploadPath);
		if(!checkPath.exists()) {
			checkPath.mkdirs();
		}
		
		//	첨부파일 DB에 존재하는 파일 숫자 확인(ID가 겹치지 않게)
		int count = mapper.getFileNo("APP");
		
		//	7자리로 생성하고 빈 자리는 0으로 채워서 10자리의 ID 생성
		String fileId = "APP" + String.format("%07d", count);
		
		for(int i = 0; i < applyFiles.size(); i++) {
			try {
				//	index를 통해 하나하나 처리하기 위한 MultipartFile 객체
				MultipartFile appFile = applyFiles.get(i);
				
				//	원본 파일명
				String originalName = appFile.getOriginalFilename();
				
				//	저장 파일명(UUID_원본파일명)
				String saveName = UUID.randomUUID().toString() + "_" + originalName;
				
				//	파일 확장자
				String fileContentType = originalName.substring(originalName.lastIndexOf(".") + 1);
				
				//	파일 크기
				long fileSize = appFile.getSize();
				
				//	첨부 파일 저장 경로 생성
				String appFilePath = uploadPath + File.separator + "file";
				
				//	파일을 저장 경로에 복사
				appFile.transferTo(new File(appFilePath));
				
				//	DB에 저장할 경로명 생성(resources 앞에 있는 경로구분자부터 등록)
				int pathNumber = appFilePath.indexOf("resources") - 1;
				String filePath = appFilePath.substring(pathNumber);
				
				//	첨부파일 등록을 위한 VO 객체
				AttachFileVO attachFile = new AttachFileVO();
				attachFile.setFileId(fileId);
				attachFile.setFileSerialNo(i+1);
				attachFile.setFileOriginName(originalName);
				attachFile.setFileSaveName(saveName);
				attachFile.setFileContentType(fileContentType);
				attachFile.setFileSize(fileSize);
				attachFile.setFilePath(filePath);
				
				mapper.attachFileRegister(attachFile);
				
				
			} catch (Exception e) {
				log.error("{}",e);
			}
		}		//	for문 종료
		
		return fileId;
	}

	
	/***** 파일 등록 메소드 *****/
	private String fileRegister(HttpServletRequest req, List<MultipartFile> reqFiles, String type) {
		
		//	원래라면 배포된 환경에 저장해야하지만 현재는 임시로 직접 경로로 저장
//		String uploadPath = req.getServletContext().getRealPath("/resources/upload/company");
		String uploadPath = "C:/sts3915/workspace/jobEulLae/src/main/webapp/resources";
		
		//	어느 메소드에서 등록하는지에 따라 경로가 바뀐다.
		switch (type.substring(0, 3)) {
		case "REC":
			uploadPath += "/upload/recruit";
			break;
		case "COM":
			uploadPath += "/upload/company";
			break;
		case "RSM":
			uploadPath += "/upload/resume/" + type.substring(3) + File.separator;
			break;
		case "BRD":
			uploadPath += "/upload/board";
			break;
		}
		
		//	첨부파일 DB에 존재하는 파일 숫자 확인(ID가 겹치지 않게)
		int count = mapper.getFileNo(type.substring(0, 3));
		
		//	7자리로 생성하고 빈 자리는 0으로 채워서 10자리의 ID 생성
		String fileId = type.substring(0, 3) + String.format("%07d", count);
		
		//	채용 공고 첨부 파일 경로를 담을 변수 생성
		String filePath = "";
		
		//	파일 숫자만큼 반복
		for(int i = 0; i < reqFiles.size(); i++) {
			try {
				//	index를 통해 하나하나 처리하기 위한 MultipartFile 객체
				MultipartFile reqFile = reqFiles.get(i);
				
				//	원본 파일명
				String originalName = reqFile.getOriginalFilename();
				
				//	저장 파일명(UUID_원본파일명)
				String saveName = UUID.randomUUID().toString() + "_" + originalName;
				
				//	파일 확장자
				String fileContentType = originalName.substring(originalName.lastIndexOf(".") + 1);
				
				//	파일 크기
				long fileSize = reqFile.getSize();
				
				//	첨부 파일 저장 경로 생성
				String reqFilePath = uploadPath + File.separator + "file";
				
				//	첨부 파일 저장 경로 파일 구조 확인
				File chkFile = new File(reqFilePath);
				
				if(!chkFile.exists()) {
					chkFile.mkdirs();
				}
				
				reqFilePath += File.separator + saveName;
				
				//	파일을 저장 경로에 복사
				reqFile.transferTo(new File(reqFilePath));
				
				//	DB에 저장할 경로명 생성(resources 앞에 있는 경로구분자부터 등록)
				int pathNumber = reqFilePath.indexOf("resources") - 1;
				
				filePath = reqFilePath.substring(pathNumber);
				
				//	첨부파일 DB에 등록하기 위한 AttachFileVO 객체 선언
				AttachFileVO attachFile = new AttachFileVO();
				attachFile.setFileId(fileId);
				attachFile.setFileSerialNo(i+1);
				attachFile.setFileOriginName(originalName);
				attachFile.setFileSaveName(saveName);
				attachFile.setFileContentType(fileContentType);
				attachFile.setFileSize(fileSize);
				attachFile.setFilePath(filePath);
				
				mapper.attachFileRegister(attachFile);
			} catch (Exception e) {
				log.error("{}",e);
			}
		}		//	for문 종료
		
		return fileId;
	}
	/***** 파일 등록 메소드 종료 ******/

	
	/***** 파일 추가 메소드 ******/
	private ServiceResult fileUpdate(
			HttpServletRequest req, List<MultipartFile> reqFiles, 
			String type, String attachId) {
		
		//	결과값을 반환할 변수
		ServiceResult result = null;
		
		//	원래라면 배포된 환경에 저장해야하지만 현재는 임시로 직접 경로로 저장
//		String uploadPath = req.getServletContext().getRealPath("/resources/upload/company");
		String uploadPath = "C:/sts3915/workspace/jobEulLae/src/main/webapp/resources";
		
		//	어느 메소드에서 등록하는지에 따라 경로가 바뀐다.
		switch (type) {
		case "REC":
			uploadPath += "/upload/recruit";
			break;
		case "COM":
			uploadPath += "/upload/company";
			break;
		case "RSM":
			uploadPath += "/upload/resume/" + type.substring(3) + File.separator;
			break;
		case "BRD":
			uploadPath += "/upload/board";
			break;
		}
		
		//	채용 공고 첨부 파일 경로를 담을 변수 생성
		String filePath = "";
		
		//	해당 공고의 첨부파일 번호에 해당하는 파일 수량 구하기(등록 시 +1 되야하기 때문에 1을 더함)
		int count = mapper.getFileCount(attachId) + 1;

		//	파일 숫자만큼 반복
		for(int i = 0; i < reqFiles.size(); i++) {
			try {
				//	index를 통해 하나하나 처리하기 위한 MultipartFile 객체
				MultipartFile reqFile = reqFiles.get(i);
				
				//	원본 파일명
				String originalName = reqFile.getOriginalFilename();
				
				//	저장 파일명(UUID_원본파일명)
				String saveName = UUID.randomUUID().toString() + "_" + originalName;
				
				//	파일 확장자
				String fileContentType = originalName.substring(originalName.lastIndexOf(".") + 1);
				
				//	파일 크기
				long fileSize = reqFile.getSize();
				
				//	첨부 서류 저장 경로 생성
				String reqFilePath = uploadPath + File.separator + "file";
				
				//	첨부 서류 저장 경로 파일 구조 확인
				File chkFile = new File(reqFilePath);
				
				if(!chkFile.exists()) {
					chkFile.mkdirs();
				}
				
				reqFilePath += File.separator + saveName;
				
				//	파일을 저장 경로에 복사
				reqFile.transferTo(new File(reqFilePath));
				
				//	DB에 저장할 경로명 생성(resources 앞에 있는 경로구분자부터 등록)
				int pathNumber = reqFilePath.indexOf("resources") - 1;
				filePath = reqFilePath.substring(pathNumber);
				
				//	첨부파일 DB에 등록하기 위한 AttachFileVO 객체 선언
				AttachFileVO attachFile = new AttachFileVO();
				attachFile.setFileId(attachId);
				attachFile.setFileSerialNo(i+count);
				attachFile.setFileOriginName(originalName);
				attachFile.setFileSaveName(saveName);
				attachFile.setFileContentType(fileContentType);
				attachFile.setFileSize(fileSize);
				attachFile.setFilePath(filePath);
				
				mapper.attachFileRegister(attachFile);
				
				//	등록이 끝나면 결과 값 OK를 전송
				result = ServiceResult.OK;
				
			} catch (Exception e) {
				log.error("{}",e);
				
				//	에러 발생시 결과 값으로 FAILED를 전송
				result = ServiceResult.FAILED;
			}
		}		//	for문 종료
		
		return result;
	}
	/***** 파일 추가 메소드 종료 ******/

}
