package kr.or.ddit.service.application;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IApplicationMapper;
import kr.or.ddit.service.file.IFileService;
import kr.or.ddit.vo.ApplicationDocumentVO;
import kr.or.ddit.vo.ApplicationVO;
import kr.or.ddit.vo.PaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Transactional
@Slf4j
@Service
public class ApplicationServiceImpl implements IApplicationService {
	
	@Inject
	private IApplicationMapper mapper;
	
	@Inject
	private IFileService fileService;

	//	공고를 통한 이력서 지원 등록 메소드
	@Override
	public ServiceResult doApplication(ApplicationVO applyVO) {
		ServiceResult result = null;
		
		try {
			mapper.doApplication(applyVO);		//	채용 지원 등록
			List<MultipartFile> applyFiles = applyVO.getApplyFiles();		//	이력서 파일 가져오기
			
			//	이력서 저장 및 등록번호 가져오기
			String fileId = fileService.doAppPdf(applyVO.getAppNo(), applyFiles);
			
			//	지금 등록하는 이력서가 해당 공고의 몇번째 파일인지 개수 구하기
			int appCount = mapper.getDocCount(applyVO.getAppNo());
			
			//	DB에 등록하기 위한 VO객체
			ApplicationDocumentVO applyDocVO = new ApplicationDocumentVO();
			applyDocVO.setAppNo(applyVO.getAppNo());
			applyDocVO.setDocumentNo(appCount+1);
			applyDocVO.setRsmFileNo(fileId);
			applyDocVO.setDocumentStatCode("DOCSTAT001");
			
			//	채용 지원 서류에도 등록
			mapper.doAppDocument(applyDocVO);
			
			result = ServiceResult.OK;
		} catch (Exception e) {
			log.error("{}",e);
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	//	지원 여부 확인 메소드
	@Override
	public ServiceResult applyCheck(Map<String, Object> checkMap) {
		ServiceResult result = null;
		int count = mapper.applyCheck(checkMap);
		
		if(count > 0) {				//	지원한 기록이 존재
			result = ServiceResult.EXIST;
		} else if(count == 0) {		//	지원한 기록이 없음
			result = ServiceResult.NOTEXIST;
		} else {					//	오류
			result = ServiceResult.FAILED;
		}
		return result;
	}

	//	회원 아이디를 통한 지원한 공고 기록 가져오는 메소드
	@Override
	public List<ApplicationVO> getApplyRecruit(PaginationInfoVO<ApplicationVO> pagingVO) {
		int totalCount = mapper.getTotalAppCount(pagingVO.getMemId());
		pagingVO.setTotalRecord(totalCount);
		List<ApplicationVO> recruitList = mapper.getApplyRecruit(pagingVO);
		return recruitList;
	}

	//	공고 번호를 통해 해당 공고에 지원한 기록을 가져오는 메소드
	@Override
	public List<ApplicationVO> getAppList(int recNo) {
		return mapper.getAppList(recNo);
	}

}
