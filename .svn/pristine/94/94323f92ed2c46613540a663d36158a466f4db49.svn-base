package kr.or.ddit.controller.interest;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.interest.IInterestService;
import kr.or.ddit.vo.InterestCompanyVO;
import kr.or.ddit.vo.InterestRecruitVO;

@RequestMapping("/jobel")
@Controller
public class InterestController {

	@Inject
	private IInterestService intService;
	
	/**
	 * 채용 공고를 일반 회원이 즐겨찾기 하는 메소드
	 */
	@ResponseBody
	@RequestMapping(value = "/likeRecruit", method = RequestMethod.POST)
	public ResponseEntity<String> likeRecruit(String memId, int recruitNo) {
		ResponseEntity<String> entity = null;
		
		InterestRecruitVO intRecruit = new InterestRecruitVO();
		intRecruit.setMemId(memId);
		intRecruit.setRecruitNo(recruitNo);
		
		ServiceResult result = intService.likeRecruit(intRecruit);
		
		if(result.equals(ServiceResult.OK)) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/**
	 * 채용 공고에서 일반 회원이 즐겨찾기를 취소하는 메소드
	 */
	@ResponseBody
	@RequestMapping(value = "/likeRecruitDelete", method = RequestMethod.POST)
	public ResponseEntity<String> likeRecruitDelete(String memId, int recruitNo) {
		ResponseEntity<String> entity = null;
		
		InterestRecruitVO intRecruit = new InterestRecruitVO();
		intRecruit.setMemId(memId);
		intRecruit.setRecruitNo(recruitNo);
		
		ServiceResult result = intService.likeRecruitDelete(intRecruit);
		
		if(result.equals(ServiceResult.OK)) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/**
	 * 관심있는 기업을 즐겨찾기 하는 메소드
	 */
	@ResponseBody
	@RequestMapping(value = "/likeCompany", method = RequestMethod.POST)
	public ResponseEntity<String> likeCompany(String memId, String coNo){
		ResponseEntity<String> entity = null;
		
		InterestCompanyVO intCompany = new InterestCompanyVO();
		intCompany.setMemId(memId);
		intCompany.setCoNo(coNo);
		
		ServiceResult result = intService.likeCompany(intCompany);
		
		if(result.equals(ServiceResult.OK)) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	/**
	 * 즐겨찾기한 기업을 삭제하는 메소드
	 */
	@ResponseBody
	@RequestMapping(value = "/likeCompanyDelete", method = RequestMethod.POST)
	public ResponseEntity<String> likeCompanyDelete(String memId, String coNo) {
		ResponseEntity<String> entity = null;
		
		InterestCompanyVO intCompany = new InterestCompanyVO();
		intCompany.setMemId(memId);
		intCompany.setCoNo(coNo);
		
		ServiceResult result = intService.likeCompanyDelete(intCompany);
		
		if(result.equals(ServiceResult.OK)) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
