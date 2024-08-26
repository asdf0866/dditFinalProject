package kr.or.ddit.service.company;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.RecruitmentVO;

public interface ICompanyService {
	public ServiceResult registerCompany(HttpServletRequest req, CompanyVO company);
	public ServiceResult recruitWrite(HttpServletRequest req, RecruitmentVO recruit);
	public List<RecruitmentVO> getRecList(String coNo);
	public RecruitmentVO getRecruitDetail(int recruitNo);
	public String getLogoPath(String coNo);
	public ServiceResult recruitEdit(HttpServletRequest req, RecruitmentVO recruit);
	public ServiceResult recruitDelete(int recruitNo);
	public CompanyVO getCompany(String coNo);
	public CompanyVO getCompanyDetail(String comNo);
	public List<CompanyVO> getCompanyList(String comName);
	public ServiceResult editCompany(CompanyVO company);
	
	//	관리자 기능
	public int getWaitCompanyCount();
	public List<CompanyVO> getWaitCompanyList(PaginationInfoVO<CompanyVO> pagingVO);
	public ServiceResult cancelCompany(String coNo);
	public ServiceResult signUpCompany(String coNo);
	public int getRecogCompanyCount();
	public List<CompanyVO> getRecogCompanyList(PaginationInfoVO<CompanyVO> pagingVO);
	public String checkAlert(int reviewNo);
}
