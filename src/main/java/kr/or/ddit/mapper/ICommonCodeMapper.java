package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CommonCodeDetailVO;
import kr.or.ddit.vo.CommonCodeVO;

public interface ICommonCodeMapper {
	public List<CommonCodeVO> getCodeList(String code);
	public List<CommonCodeDetailVO> getDetailList(String commonCode);
	public List<CommonCodeDetailVO> getDetailSearch(Map<String, String> map);
	public String getCodeName(String jobCode);
	public String getCommonCodeName(String jobType);
}
