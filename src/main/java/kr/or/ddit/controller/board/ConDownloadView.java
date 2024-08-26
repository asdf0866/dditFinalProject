package kr.or.ddit.controller.board;

import java.io.File;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.view.AbstractView;


//AbstractView 클래스를 상속받아 renderMergedOutputModel 메소드를 재정의하여 사용하면 
// 사용 클래스가 View의 역할을 하는 페이지의 형태가 된다. 
public class ConDownloadView extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> fileMap = (Map<String, Object>) model.get("fileMap");
		
		File saveFile = new File(fileMap.get("fileSavepath").toString());
		String fileName = (String) fileMap.get("fileName");
		
		
		//요청 Header 정보들 중, User-Agent 영역안에 여러 키워드 정보들을 가지고
		// 특정 키워드가 포함되어있는지를 체크해서 파일명의 출력 인코딩 부분을 설정한다. 
		//사용브라우저 또는 현상에 따라 발생하는 알고리즘이므로, 내가 사용하게 되는 브라우저의 버전이나 얻어온 
		// Header 정보들 값에 따라 차이가 발생할 수 있다. 
		String agent = request.getHeader("User-Agent");
		if(StringUtils.containsIgnoreCase(agent, "msie") || 
				StringUtils.containsIgnoreCase(agent, "trident")) { // IE, Chrome
			fileName = URLEncoder.encode(fileName,"UTF-8");
			
		}else { // firefox , chrome
			fileName = new String(fileName.getBytes(),"UTF-8");
		}
		
		response.setHeader("Content-Disposition", "attachment;filename=\"" + fileName +"\"");
		response.setHeader("Content-Length", fileMap.get("fileSize").toString());
		
		//try(){} : try with resource
		// () 안에 명시한 객체는 finally로 최종 열린 객체에 대한 close를 처리하지않아도 자동 close가 이루어진다.
		
		try (
			OutputStream os = response.getOutputStream();
		){
			FileUtils.copyFile(saveFile, os);
		}
		
	}

}


