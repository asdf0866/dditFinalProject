package kr.or.ddit.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.ddit.service.IConsultingService;
import kr.or.ddit.vo.AttachFileVO;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Slf4j
@Controller
public class UploadController {
	
	@Autowired
	String uploadFolder;
	
	//c드라이브의 upload폴더
	@Autowired
	String uploadPath;
	
	@Autowired
	IConsultingService iConsultingService;
	
	//ATTACH_FILE 테이블에 INSERT
	public void uploadFormAction(MultipartFile[] uploadFile, String fileId) {
		//MultipartFile : 스프링에서 제공해주는 타입
		//파일이 저장되는 경로
		String uploadFolder = "C:\\upload";
		int fileSerialNo = 1;
		int result = 0;
		
		for(MultipartFile multipartFile : uploadFile) {
			log.info("---------------------------");
			//이미지 명
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());
			
			//실제파일명
			String uploadFileName = multipartFile.getOriginalFilename();			
			uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			
			log.info("only file name : " + uploadFileName);
			
			//------------- 같은날 같은 이미지를 업로드 시 파일 중복 방지 시작 -------------
			//java.util.UUID => 랜덤값 생성
			UUID uuid = UUID.randomUUID(); //임의의 값을 생성
			//원래의 파일 이름과 구분하기 위해 _를 붙임
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			//------------- 같은날 같은 이미지를 업로드 시 파일 중복 방지 끝 -------------			
			
			//File 객체 설계(복사할 대상 경로 , 파일명)
//				File saveFile = new File(uploadFolder, uploadFileName);
			//uploadPath : D:\\A_TeachingMaterial\\06_spring\\springProj\\src\\
			//					main\\webapp\\resources\\upload\\2022\\07\\22
			File saveFile = new File(uploadPath, uploadFileName);
			
			try {
				//파일이 복사 됨
				multipartFile.transferTo(saveFile);
				
				//4) productVO.setFilename(파일full경로+명);
//				String filename = "/" + getFolder().replaceAll("\\\\","/") + "/" + uploadFileName;
			
				//ATTACH 테이블에 반영
				/*
				 UPDATE ATTACH
				 SET    FILENAME = '/2022/11/16/ASDFLDAS_개똥이.JPG'
				 WHERE  USER_NO = 3 AND SEQ = 5
				 */
				/*
				 .replace("대상문자열(정규식불가)","바꿀문자")
				    replace("\\","/") : 역슬러시 두개를 슬러시로 바꿈
				 .replaceAll("대상문자열(정규식반영)","바꿀문자")
				 	replaceAll("\\","/") : 역슬러시 한개를 슬러시로 바꿈
				 	            \\  : escape 정규식 \
				 	            \" : "
				 */
				//								   .replaceAll("\\\\","/")
//				String filename = "/" + getFolder().replace("\\", "/") + "/" + uploadFileName;
//				log.info("filename : " + filename);
				
				String ext = multipartFile.getOriginalFilename();
				//파일 확장자
				ext = ext.substring(ext.lastIndexOf(".")+1);
				
				AttachFileVO attachFileVO = new AttachFileVO();
				attachFileVO.setFileId(fileId);
				attachFileVO.setFileSerialNo(fileSerialNo++);
				attachFileVO.setFileOriginName(multipartFile.getOriginalFilename());
				attachFileVO.setFileSaveName(uploadFileName);
				attachFileVO.setFileContentType(ext);
				attachFileVO.setFileSize(multipartFile.getSize());
				attachFileVO.setFilePath("/resources/upload/board/"+uploadFileName);
										
				result += this.iConsultingService.updateAttachFile(attachFileVO);
			} catch (IllegalStateException e) {
				log.error(e.getMessage());
			} catch (IOException e) {
				log.error(e.getMessage());
			}
		}//end for
		
		
	}

	@ResponseBody
	@PostMapping("/uploadAjaxAction")
	public String uploadAjaxAction(MultipartFile[] uploadFile) {
		log.info("uploadAjaxAction에 왔다");
		log.info("uploadFile : " + uploadFile);
		
		//파일명 리스트
		List<String> strList = new ArrayList<String>(); 
		
//			String uploadFolder 
//				= "D:\\A_TeachingMaterial\\06_spring\\springProj\\src\\main\\webapp\\resources\\upload";
		
		//make folder 시작 ---------------------------
		File uploadPath = new File(uploadFolder, getFolder());
		log.info("upload Path : " + uploadPath);
		
		//만약 년/월/일 해당 폴더가 없다면 생성
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs();
		}
		//make folder 끝 ---------------------------
		
		//배열로부터 하나씩 파일을 꺼내오자
		for(MultipartFile multipartFile : uploadFile) {
			log.info("-----------------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());
			
			//IE 처리 => 경로를 제외한 파일명만 추출 
			//c:\\upload\\image01.jpg => image01.jpg
			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			
			log.info("only file name : " + uploadFileName);
			
			//------------- 같은날 같은 이미지를 업로드 시 파일 중복 방지 시작 -------------
			//java.util.UUID => 랜덤값 생성
			UUID uuid = UUID.randomUUID(); //임의의 값을 생성
			//원래의 파일 이름과 구분하기 위해 _를 붙임
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			//------------- 같은날 같은 이미지를 업로드 시 파일 중복 방지 끝 -------------			
			
			//File 객체 설계(복사할 대상 경로 , 파일명)
//				File saveFile = new File(uploadFolder, uploadFileName);
			//uploadPath : D:\\A_TeachingMaterial\\06_spring\\springProj\\src\\
			//					main\\webapp\\resources\\upload\\2022\\07\\22
			File saveFile = new File(uploadPath, uploadFileName);
			
			try {
				//파일 복사가 일어남
				multipartFile.transferTo(saveFile);
				
				//이미지인지 체킹
				if(checkImageType(saveFile)) {	//이미지라면..
					FileOutputStream thumbnail = new FileOutputStream(
							new File(uploadPath, "s_" + uploadFileName)
							);
					//섬네일 생성
					Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail,100,100);
					thumbnail.close();
				}
				
				//4) productVO.setFilename(파일full경로+명);
//					String filename = "/" + getFolder().replaceAll("\\\\","/") + "/" + uploadFileName;
				
				//ATTACH 테이블에 반영
				/*
				 UPDATE ATTACH
				 SET    FILENAME = '/2022/11/16/ASDFLDAS_개똥이.JPG'
				 WHERE  USER_NO = 3 AND SEQ = 5
				 */
				/*
				 .replace("대상문자열(정규식불가)","바꿀문자")
				    replace("\\","/") : 역슬러시 두개를 슬러시로 바꿈
				 .replaceAll("대상문자열(정규식반영)","바꿀문자")
				 	replaceAll("\\","/") : 역슬러시 한개를 슬러시로 바꿈
				 	            \\  : escape 정규식 \
				 	            \" : "
				 */
				//								   .replaceAll("\\\\","/")
				String filename = "/" + getFolder().replace("\\", "/") + "/" + uploadFileName;
				log.info("filename : " + filename);
				
				strList.add(filename);
				
//				attachVO.setFilename(filename);
				
//				int result = this.galleryService.updatePost(attachVO);
				
			} catch (IllegalStateException e) {
				log.error(e.getMessage());
			} catch (IOException e) {
				log.error(e.getMessage());
			}//tnd catch
		}//end for
		return "0";
	}//uploadAjaxAction

	//년/월/일 폴더 생성
	public static String getFolder() {
		//2022-07-22 형식(format) 지정
		//간단한 날짜 형식
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//날짜 객체 생성(java.util패키지)
		Date date = new Date();
		//2022-07-22
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	//용량이 큰 파일을 섬네일 처리를 하지 않으면
	//모바일과 같은 환경에서 많은 데이터를 소비해야 하므로
	//이미지의 경우 특별한 경우가 아니면 섬네일을 제작해야 함.
	//섬네일은 이미지만 가능함.
	//이미지 파일의 판단
	public static boolean checkImageType(File file) {
		/*
		 .jpeg / .jpg(JPEG 이미지)의 MIME 타입 : image/jpeg
		 */
		//MIME 타입을 통해 이미지 여부 확인
		//file.toPath() : 파일 객체를 path객체로 변환
		try {
			String contentType = Files.probeContentType(file.toPath());
			log.info("contentType : " + contentType);
			//MIME 타입 정보가 image로 시작하는지 여부를 return
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		//이 파일이 이미지가 아닐 경우
		return false;
	}
	
	//파일 다운로드
	// localhost/upload/download?fileName=2022/07/25/cd862ebd-10a2-4220-bbbb-5bbf8ffdadd7_phone01.jpg
	@ResponseBody
	@GetMapping("/download")
	public ResponseEntity<Resource> download(@RequestParam String fileName){
		log.info("fileName : " + fileName);
		
		//resource : 다운로드 받을 파일(자원)
		Resource resource = new FileSystemResource(
				"D:\\A_TeachingMaterial\\06_spring\\springProj\\src\\main\\webapp\\resources\\upload\\"
				+fileName
				);
		//cd862ebd-10a2-4220-bbbb-5bbf8ffdadd7_phone01.jpg
		String resourceName = resource.getFilename();
		//header : 인코딩 정보, 파일명 정보
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add("Content-Disposition", "attachment;filename="+
					new String(resourceName.getBytes("UTF-8"),"ISO-8859-1"));
		} catch (UnsupportedEncodingException e) {
			log.info(e.getMessage());
		}
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
}




