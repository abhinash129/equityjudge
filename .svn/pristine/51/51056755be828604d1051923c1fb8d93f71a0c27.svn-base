package com.nivesh.controller.login;

import java.net.UnknownHostException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nivesh.bo.ActiveCompanyListBO;
import com.nivesh.bo.DailyPatternReportBO;
import com.nivesh.bo.LiveBSESensexBO;
import com.nivesh.service.company.ICompanyService;
import com.nivesh.service.login.ILoginService;

@Controller
@RequestMapping("/logout")
public class LogoutController {

	@Autowired
	ILoginService loginService;

	@Autowired
	ICompanyService icompanyServices;

	@RequestMapping("/")
	public ModelAndView logout(HttpServletRequest request,ModelMap map) throws ParseException, UnknownHostException{
		HttpSession ses = request.getSession(false);
		if (ses!=null) {
			if (ses.getAttribute("sessionBO")!=null) {
				ses.removeAttribute("sessionBO");
				ses.invalidate();
			}
		}

		
		String newsData=loginService.getNewsData();
		map.addAttribute("news",newsData);
		
		List<LiveBSESensexBO> liveBSEList = icompanyServices.getTickerData();
		map.addAttribute("LiveBSE", liveBSEList);
		map.addAttribute("msgg", "Thank you for using Equityjudge....");
		LiveBSESensexBO liveBSESensexBO = icompanyServices.getLiveData(LoginController.FIRSTGRAPHCOMPANY);
		Map<String,List<LiveBSESensexBO>> gainerLoserTurnoverMap = icompanyServices.getLiveGainerLosserTurnover();
		/*====================================*/
		List<DailyPatternReportBO> dailyPatternReportBOs = icompanyServices.getHilightesCompanyData(LoginController.NUMBEROF_COMPNY_FOR_HIGHLIGHT);
		map.addAttribute("DailyHighlightDate", dailyPatternReportBOs.get(0).getAudit_date_time());
		map.addAttribute("DailyHighlight", dailyPatternReportBOs);
		/*====================================*/

		map.addAttribute("CompnyLiveBO", liveBSESensexBO);

		ActiveCompanyListBO activeCompanyListBO =  icompanyServices.getsc_codeBaseCompanyName(LoginController.FIRSTGRAPHCOMPANY);

		map.addAttribute("FirstCompny", activeCompanyListBO);

		map.addAttribute("Model",gainerLoserTurnoverMap);
		return new ModelAndView(LoginController.LOGIN);
	}



}
