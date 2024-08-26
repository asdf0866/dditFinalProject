package kr.or.ddit.service.recruit;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IRecruitMapper;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.RecruitmentVO;

@Service
public class RecruitService implements IRecruitService {

	@Inject
	private IRecruitMapper mapper;
	
	@Override
	public List<RecruitmentVO> getRecListCommons() {
		return mapper.getRecListCommons();
	}

	@Override
	public int getRecruitCount(PaginationInfoVO<RecruitmentVO> pagingVO) {
		return mapper.getRecruitCount(pagingVO);
	}

	@Override
	public List<RecruitmentVO> getRecList(PaginationInfoVO<RecruitmentVO> pagingVO) {
		return mapper.getRecList(pagingVO);
	}

	@Override
	public RecruitmentVO getRecruit(int recruitNo) {
		return mapper.getRecruit(recruitNo);
	}

	@Override
	public List<RecruitmentVO> getHomeRecList(int qty) {
		return mapper.getHomeRecList(qty);
	}

	@Override
	public int incrementRecHit(int recruitNo) {
		return mapper.incrementRecHit(recruitNo);
	}
	
	@Override
	public int getCompanyRecruitCount(String coNo) {
		return mapper.getCompanyRecruitCount(coNo);
	}
	
	@Override
	public List<RecruitmentVO> getCompanyRecList(Map<String, Object> pageMap) {
		return mapper.getCompanyRecList(pageMap);
	}

	@Override
	public List<RecruitmentVO> getDashBoardRecList(String coNo) {
		return mapper.getDashBoardRecList(coNo);
	}

	@Override
	public Map<String, Object> getGenderChart(Map<String, Object> getMap) {
		return mapper.getGenderChart(getMap);
	}

	@Override
	public Map<String, Object> getRecentChart(Map<String, Object> getMap) {
		return mapper.getRecentChart(getMap);
	}

	@Override
	public Map<String, Object> getAgeRangeChart(Map<String, Object> getMap) {
		return mapper.getAgeRangeChart(getMap);
	}

}
