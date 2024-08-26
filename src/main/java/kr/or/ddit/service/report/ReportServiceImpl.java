package kr.or.ddit.service.report;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IReportMapper;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.ReportVO;

@Service
public class ReportServiceImpl implements IReportService {

	@Inject
	private IReportMapper mapper;
	
	@Override
	public int getReportCount() {
		return mapper.getReportCount();
	}

	@Override
	public List<ReportVO> getReportList(PaginationInfoVO<ReportVO> pagingVO) {
		return mapper.getReportList(pagingVO);
	}

}
