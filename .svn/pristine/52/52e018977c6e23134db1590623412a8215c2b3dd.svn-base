package kr.or.ddit.controller.commonCode;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.commonCode.ICommonCodeService;
import kr.or.ddit.vo.CommonCodeDetailVO;

@RequestMapping("/jobel")
@Controller
public class CommonCodeController {

	@Inject
	private ICommonCodeService service;
	
	/**
	 * commonCode 를 보내주면 해당하는 Detail 코드를 담은 List를 반환하는 메소드
	 */
	@ResponseBody
	@RequestMapping(value = "/commonDetailCodeList", method = RequestMethod.POST)
	public List<CommonCodeDetailVO> getDetailList(@RequestParam("commonCode") String commonCode) {
		
		//	CommonCodeDetailVO를 담을 List 객체 선언
		List<CommonCodeDetailVO> detailList = new ArrayList<CommonCodeDetailVO>();
		
		//	commonCode에 해당하는 직군의 detailList 요청
		detailList = service.getDetailList(commonCode);
		
		return detailList;
	}
	
	/**
	 * 직종을 검색하면 해당 키워드가 들어간 직종 코드를 담은 List를 반환하는 메소드
	 */
	@ResponseBody
	@RequestMapping(value = "/commonDetailSearch", method = RequestMethod.POST)
	public List<CommonCodeDetailVO> getDetailSearch(
			@RequestParam("typeName") String typeName,
			@RequestParam("detailWord") String keyword
			) {
		
		//	CommonCodeDetailVO를 담을 List 객체 선언
		List<CommonCodeDetailVO> detailList = new ArrayList<CommonCodeDetailVO>();
		
		//	keyword에 해당하는 검색 된 detailList 요청
		detailList = service.getDetailSearch(typeName, keyword);
		
		return detailList;
	}
}
