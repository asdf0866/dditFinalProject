package kr.or.ddit.controller.home;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.service.company.ICompanyService;
import kr.or.ddit.service.recruit.IRecruitService;
import kr.or.ddit.vo.RecruitmentVO;

@RequestMapping("/jobel")
@Controller
public class HomeController {
	
	@Inject
	private IRecruitService recService;
	
	@Inject
	private ICompanyService comService;
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String jobelHome(Model model) {
		List<RecruitmentVO> recList = recService.getHomeRecList(4);
		model.addAttribute("recruitList", recList);
		
		return "commons/home";
	}

}
