package kr.or.ddit.service.application;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.ApplicationVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface IApplicationService {
	public ServiceResult doApplication(ApplicationVO applyVO);
	public ServiceResult applyCheck(Map<String, Object> checkMap);
	public List<ApplicationVO> getApplyRecruit(PaginationInfoVO<ApplicationVO> applyList);
	public List<ApplicationVO> getAppList(int recNo);
}
