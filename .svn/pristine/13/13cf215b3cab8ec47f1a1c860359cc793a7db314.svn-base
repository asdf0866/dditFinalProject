package kr.or.ddit.service.company;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.ICompanyMapper;
import kr.or.ddit.mapper.IMemberMapper;
import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.MemberAuthVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.RecruitmentVO;
import lombok.extern.slf4j.Slf4j;

@Transactional
@Slf4j
@Service
public class CompanyServiceImpl implements ICompanyService {
	
	@Inject
	private IMemberMapper memMapper;
	
	@Inject
	private ICompanyMapper comMapper;
	
	@Inject
	private PasswordEncoder encoder;

	@Override
	@Transactional
	public ServiceResult registerCompany(HttpServletRequest req, CompanyVO company) {
		//	결과 값을 전송할 객체 생성
		ServiceResult result = null;
		
		/***** 기업 정보 등록 *****/
		
		//	회사의 연간 매출액은 백만 단위로 잘라서 DB에 저장
		long calcMoney = company.getCoSales() / 1000000;
		company.setCoSales(calcMoney);
		
		//	회사의 상태 코드는 000번으로 신청 대기 상태코드로 입력
		company.setCoStatCode("COMSTAT000");
		
		//	창립 일자는 특수기호 "-" 를 제거한 상태로 DB에 저장
		String fndnYmd = company.getCoFndnYmd();
		fndnYmd = fndnYmd.replaceAll("-", "");
		company.setCoFndnYmd(fndnYmd);
		
		//	기업 정보 등록
		int cnt = comMapper.registerCompany(company);
		
		//	기업 등록 성공 시 기업 관리자 계정도 생성
		MemberVO member = company.getMember();
		
		//	기업 등록하면서 생성된 회사 번호 정보를 기업 관리자 계정에 입력
		String coNo = company.getCoNo();
		member.setCoNo(coNo);
		
		//	기업 회원 등록
		ServiceResult memResult = registerCoMember(member);
		if(cnt > 0 && memResult.equals(ServiceResult.OK)) {		//	등록 성공
			result = ServiceResult.OK;
		} else {		//	등록 실패
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	//	기업 회원 등록 메소드
	@Transactional
	private ServiceResult registerCoMember(MemberVO member) {
		ServiceResult result = null;
		
		//	계정 비밀번호를 암호화 처리하여 등록
		member.setMemPassword(encoder.encode(member.getMemPassword()));
		
		//	기업 회원 승인 대기 상태 코드를 입력한다.
		member.setMemStatCode("MEMSTAT100");
		int count1 = memMapper.register(member);
		int count2 = memMapper.registerCoMember(member);
		
		if(count1 > 0 && count2 > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}
	
	//	기업 정보 수정 메소드
	@Override
	public ServiceResult editCompany(CompanyVO company) {
		
		//	결과 값을 전송할 객체 생성
		ServiceResult result = null;
		
		/***** 기업 정보 등록 *****/
		
		//	회사의 연간 매출액은 백만 단위로 잘라서 DB에 저장
		long calcMoney = company.getCoSales() / 1000000;
		company.setCoSales(calcMoney);
		
		//	창립 일자는 특수기호 "-" 를 제거한 상태로 DB에 저장
		String fndnYmd = company.getCoFndnYmd();
		fndnYmd = fndnYmd.replaceAll("-", "");
		company.setCoFndnYmd(fndnYmd);
		
		//	기업 정보 수정
		int count = comMapper.editCompany(company);
		
		if(count > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}
	
	//	기업 정보 가져오는 메소드
	@Override
	public CompanyVO getCompany(String coNo) {
		return comMapper.getCompany(coNo);
	}

	//	공고 작성 메소드
	@Override
	public ServiceResult recruitWrite(HttpServletRequest req, RecruitmentVO recruit) {
		//	결과에 따른 값을 반환하기 위한 변수 선언
		ServiceResult sr = null;
		
		//	공고 등록
		int cnt = comMapper.recruitWrite(recruit);
		
		if(cnt > 0) {
			sr = ServiceResult.OK;
		} else {
			sr = ServiceResult.FAILED;
		}
		
		return sr;
	}

	@Override
	public List<RecruitmentVO> getRecList(String coNo) {
		//	해당 기업의 공고들을 담을 List 객체 선언 후 공고 목록 담기
		List<RecruitmentVO> recList = comMapper.getRecList(coNo);
		
		//	담은 목록 반환
		return recList;
	}

	//	공고 상세보기 정보 가져오는 메소드
	@Override
	public RecruitmentVO getRecruitDetail(int recruitNo) {
		return comMapper.getRecruitDetail(recruitNo);
	}

	//	기업 로고 경로 가져오는 메소드
	@Override
	public String getLogoPath(String coNo) {
		return comMapper.getLogoPath(coNo);
	}

	//	공고 수정 메소드
	@Override
	public ServiceResult recruitEdit(HttpServletRequest req, RecruitmentVO recruit) {
		//	결과에 따른 값을 반환하기 위한 변수 선언
		ServiceResult sr = null;
		
		int count = comMapper.recruitEdit(recruit);
		
		if(count > 0) {
			sr = ServiceResult.OK;
		} else {
			sr = ServiceResult.FAILED;
		}
		
		return sr;
	}
	
	//	공고 삭제 메소드
	@Override
	public ServiceResult recruitDelete(int recruitNo) {
		//	결과 값을 보낼 Enum 생성
		ServiceResult sr = null;
		
		int count = comMapper.recruitDelete(recruitNo);
		
		if(count > 0) {
			sr = ServiceResult.OK;
		} else {
			sr = ServiceResult.FAILED;
		}
		
		return sr;
	}
	
	@Override
	public List<CompanyVO> getCompanyList(String comName) {
		return comMapper.getCompanyList(comName);
	}

	@Override
	public CompanyVO getCompanyDetail(String comNo) {
		return comMapper.getCompanyDetail(comNo);
	}

	//********************
	//	관리자 기능
	@Override
	public int getWaitCompanyCount() {
		return comMapper.getWaitCompanyCount();
	}

	@Override
	public List<CompanyVO> getWaitCompanyList(PaginationInfoVO<CompanyVO> pagingVO) {
		return comMapper.getWaitCompanyList(pagingVO);
	}

	@Override
	public int getRecogCompanyCount() {
		return comMapper.getRecogCompanyCount();
	}
	
	@Override
	public List<CompanyVO> getRecogCompanyList(PaginationInfoVO<CompanyVO> pagingVO) {
		return comMapper.getRecogCompanyList(pagingVO);
	}
	
	@Override
	public ServiceResult cancelCompany(String coNo) {
		ServiceResult result = null;
		
		try {
			comMapper.cancelCompany(coNo);			//	기업 반려 처리
			memMapper.cancelCoMember(coNo);			//	해당 기업 회원 반려 처리
			
			result = ServiceResult.OK;
		} catch (Exception e) {
			log.error("{}", e);
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public ServiceResult signUpCompany(String coNo) {
		ServiceResult result = null;
		
		try {
			//	기업 승인 처리
			int count = comMapper.signUpCompany(coNo);
			
			if(count < 1) {		//	1보다 작은 경우 : 등록 실패
				return ServiceResult.FAILED;
			}
			
			//	해당 기업이 이용하게 될 계정의 상태코드 변경
			count = memMapper.signUpCoMember(coNo);
			
			if(count > 0) {
				//	회원 ID 가져오기
				String id = memMapper.getCoMemId(coNo);
				
				//	만약의 경우를 대비한 해당 ID의 권한 삭제
				memMapper.deleteAuth(id);
				
				//	권한 부여
				MemberAuthVO auth = new MemberAuthVO();
				auth.setMemId(id);
				auth.setAuth("ROLE_COMPANY_LEADER");
				memMapper.registerAuth(auth);
				auth.setAuth("ROLE_COMPANY");
				memMapper.registerAuth(auth);
				
			} else {		//	0보다 크지 않다 : 수정 실패
				return ServiceResult.FAILED;
			}
			
			result = ServiceResult.OK;
		} catch (Exception e) {
			log.error("{}", e);
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public String checkAlert(int reviewNo) {
		return comMapper.checkAlert(reviewNo);
	}

}




