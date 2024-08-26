package kr.or.ddit.service.commonCode;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ICommonCodeMapper;
import kr.or.ddit.vo.CommonCodeDetailVO;
import kr.or.ddit.vo.CommonCodeVO;

@Service
public class CommonCodeServiceImpl implements ICommonCodeService {

	@Inject
	private ICommonCodeMapper mapper;
	
	@Override
	public List<CommonCodeVO> getJobList(String code) {
		
		//	해당 분류의 공통코드를 얻어서 담을 List 객체 선언
		List<CommonCodeVO> jobCodeList = new ArrayList<CommonCodeVO>();
		
		//	검색할 키워드가 될 키워드를 통해 code 담기
		jobCodeList = mapper.getCodeList(code);
		
		//	해당 코드 정보들이 담긴 List 객체 반환
		return jobCodeList;
	}

	@Override
	public List<CommonCodeDetailVO> getDetailList(String commonCode) {
		
		//	해당 공통코드에 해당하는 DetailCode 를 담을 List 객체 선언
		List<CommonCodeDetailVO> detailList = new ArrayList<CommonCodeDetailVO>();
		
		//	공통코드를 기준으로 detailCode 담기
		detailList = mapper.getDetailList(commonCode);
		
		//	해당 정보들이 담긴 List 객체 반환
		return detailList;
	}
	
	@Override
	public Map<String, List<CommonCodeDetailVO>> getDetailMap(String... string) {
		Map<String, List<CommonCodeDetailVO>> map = new HashMap<String, List<CommonCodeDetailVO>>();
		for(String s : string) {
			String listName = s.toLowerCase() + "List";
			List<CommonCodeDetailVO> codeList = getDetailList(s);
			map.put(listName, codeList);
		}
		
		return map;
	}

	@Override
	public List<CommonCodeDetailVO> getDetailSearch(String typeName, String keyword) {
		//	검색어에 해당하는 DetailCode 를 담을 List 객체 선언
		List<CommonCodeDetailVO> detailList = new ArrayList<CommonCodeDetailVO>();
		
		//	검색에 기준으로 detailCode 담기
		Map<String, String> map = new HashMap<String, String>();
		map.put("typeName", typeName);
		map.put("keyword", keyword);
		detailList = mapper.getDetailSearch(map);
		
		//	해당 정보들이 담긴 List 객체 반환
		return detailList;
	}

	@Override
	public String getCodeName(String codeDetail) {
		return mapper.getCodeName(codeDetail);
	}

	@Override
	public String getCommonCodeName(String jobType) {
		return mapper.getCommonCodeName(jobType);
	}


}
