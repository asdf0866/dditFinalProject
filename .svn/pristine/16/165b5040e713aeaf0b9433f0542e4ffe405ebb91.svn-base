package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.RecruitmentVO;

public interface ICompanyMapper {
	public int registerCompany(CompanyVO company);
	public int recruitWrite(RecruitmentVO recruit);
	public List<RecruitmentVO> getRecList(String coNo);
	public RecruitmentVO getRecruitDetail(int recruitNo);
	public String getLogoPath(String coNo);
	public int recruitEdit(RecruitmentVO recruit);
	public int recruitDelete(int recruitNo);
	public CompanyVO getCompany(String coNo);
	public CompanyVO getCompanyDetail(String comNo);
	public List<CompanyVO> getCompanyList(String comName);
	public int editCompany(CompanyVO company);
	
	//	관리자 기능
	public int getWaitCompanyCount();
	public List<CompanyVO> getWaitCompanyList(PaginationInfoVO<CompanyVO> pagingVO);
	public int getRecogCompanyCount();
	public List<CompanyVO> getRecogCompanyList(PaginationInfoVO<CompanyVO> pagingVO);
	public int cancelCompany(String coNo);
	public int signUpCompany(String coNo);
	public String checkAlert(int reviewNo);
}
