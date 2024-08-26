package kr.or.ddit.controller.file;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.file.IFileService;
import kr.or.ddit.vo.AttachFileVO;

@RequestMapping("/jobel")
@Controller
public class FileController {
	
	@Inject
	private IFileService service;
	
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public View fileDownload(ModelMap model, String fileId, int fileSerialNo) {
		//	파일 정보를 얻어오기 위한 VO 객체 선언
		AttachFileVO attachFile = new AttachFileVO();
		
		//	파일의 아이디와 몇 번째 파일인지 데이터 입력
		attachFile.setFileId(fileId);
		attachFile.setFileSerialNo(fileSerialNo);
		
		//	파일 정보 가져오기
		AttachFileVO downloadFile = service.getFile(attachFile);
		
		//	데이터 전달자를 통해 파일 정보를 전달하기 위한 Map 선언
		Map<String, Object> fileMap = new HashMap<String, Object>();
		fileMap.put("fileName", downloadFile.getFileOriginName());	// 파일명추가
		fileMap.put("fileSize", downloadFile.getFileSize());		// 파일크기 추가
		fileMap.put("fileSavePath", downloadFile.getFilePath());	// 파일저장경로 추가
		model.addAttribute("fileMap", fileMap);						// 데이터 전달자로 전달
		
		return new FileDownloadView();
	}
	
	@ResponseBody
	@RequestMapping(value = "/delFile", method = RequestMethod.POST)
	public ResponseEntity<String> delFile(
			@RequestParam(name="fileId") String fileId, 
			@RequestParam(name="fileSerialNo") int fileSerialNo) {
		
		ResponseEntity<String> entity = null;
		
		AttachFileVO delFile = new AttachFileVO();
		delFile.setFileId(fileId);
		delFile.setFileSerialNo(fileSerialNo);
		
		ServiceResult sr = null;
		
		sr = service.delFile(delFile);
		
		if(sr.equals(ServiceResult.OK)) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
