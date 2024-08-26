package kr.or.ddit.controller.company;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.service.company.ICompanyService;
import kr.or.ddit.vo.CompanyVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/comCompare")
public class ComRankingController {
	
	@Inject
	ICompanyService service;
	
	@GetMapping("/list")
	public String list(Model model) {
		
		return "commons/userService/compare";
	}
	
	@RequestMapping(value="/searchCompany.do", method = RequestMethod.POST)
	public ResponseEntity<List<CompanyVO>> searchCompany(String comName) {
		
		log.info("comName {}", comName);
		List<CompanyVO> comList = service.getCompanyList(comName);
		
		return new ResponseEntity<List<CompanyVO>>(comList, HttpStatus.OK);
	}

	@RequestMapping(value="/searchCompanyDetail.do", method = RequestMethod.POST)
	public ResponseEntity<CompanyVO> searchCompanyDetail(String comNo) {
		
		CompanyVO comVO = service.getCompanyDetail(comNo);
		
		return new ResponseEntity<CompanyVO>(comVO ,HttpStatus.OK);
	}
	
	
	
}

































