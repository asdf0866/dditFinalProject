package kr.or.ddit.service.interest;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IInterestMapper;
import kr.or.ddit.vo.InterestCompanyVO;
import kr.or.ddit.vo.InterestRecruitVO;

@Service
public class InterestServiceImpl implements IInterestService {

	@Inject
	private IInterestMapper mapper;
	
	@Override
	public ServiceResult checkLikeRecruit(InterestRecruitVO intRecruit) {
		ServiceResult result = null;
		int count = mapper.checkLikeRecruit(intRecruit);
		
		if(count > 0) {
			result = ServiceResult.EXIST;
		} else {
			result = ServiceResult.NOTEXIST;
		}
		
		return result;
	}

	@Override
	public ServiceResult likeRecruit(InterestRecruitVO intRecruit) {
		ServiceResult result = null;
		int count = mapper.likeRecruit(intRecruit);
		
		if(count > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public ServiceResult likeRecruitDelete(InterestRecruitVO intRecruit) {
		ServiceResult result = null;
		int count = mapper.likeRecruitDelete(intRecruit);
		
		if(count > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public List<InterestRecruitVO> getLikeRecruit(String memId) {
		return mapper.getLikeRecruit(memId);
	}

	@Override
	public List<InterestCompanyVO> getLikeCompanyList(String memId) {
		return mapper.getLikeCompanyList(memId);
	}

	@Override
	public ServiceResult likeCompany(InterestCompanyVO intCompany) {
		ServiceResult result = null;
		
		int count = mapper.likeCompany(intCompany);
		
		if(count > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public ServiceResult likeCompanyDelete(InterestCompanyVO intCompany) {
		ServiceResult result = null;
		
		int count = mapper.likeCompanyDelete(intCompany);
		
		if(count > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

}
