package kr.or.ddit.service.commonCode;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CommonCodeDetailVO;
import kr.or.ddit.vo.CommonCodeVO;

public interface ICommonCodeService {
	public List<CommonCodeVO> getJobList(String string);
	public List<CommonCodeDetailVO> getDetailList(String commonCode);
	public List<CommonCodeDetailVO> getDetailSearch(String typeName, String keyword);
	public String getCodeName(String jobCode);
	public String getCommonCodeName(String jobType);
	public Map<String, List<CommonCodeDetailVO>> getDetailMap(String ... string);
}
