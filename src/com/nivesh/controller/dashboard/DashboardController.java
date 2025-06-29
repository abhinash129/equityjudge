package com.nivesh.controller.dashboard;

import java.sql.Date;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nivesh.bo.AccuracyBO;
import com.nivesh.bo.BuyStockBO;
import com.nivesh.bo.DailyPatternReportBO;
import com.nivesh.bo.LiveBSESensexBO;
import com.nivesh.bo.UserSessionBO;
import com.nivesh.command.dashboard.ContactUsCommand;
import com.nivesh.controller.login.LoginController;
import com.nivesh.service.company.ICompanyService;
import com.nivesh.service.dashboard.IDashboardServices;
import com.nivesh.service.portfolio.IPortfoliodataService;
import com.nivesh.util.ICache;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {

	public static final String HOME="home",PATTERN_ACCURACY="accuracuCheck", ABOUTUS="aboutUsHome", CONTACTUS="contactUsHome", SUBSCRIPTION="subscriptionHome";

	@Autowired
	IDashboardServices iDashboardServices;
	
	@Autowired
	IPortfoliodataService iPortfoliodataService;

	
	@Autowired
	ICompanyService iCompanyService;
	
	@Resource(name="parameterCache")
	ICache icache;
	
	@Autowired
	ICompanyService icompanyService;

	/*PURPOSE: FOR LOAD  HOME PAGE	
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: NA
	 *OUTPUT: RETURN NAME OF JSP VAR */
	@RequestMapping(value="/home/home",method=RequestMethod.GET)

	public String mainHome(HttpServletRequest request,ModelMap map) throws ParseException{
		HttpSession session = request.getSession(false);
		UserSessionBO usSessionBO =  (UserSessionBO) session.getAttribute("sessionBO");
		
		Map<String, Object> model = new HashMap<String, Object>();
		
	
		
		List<LiveBSESensexBO> liveBSEList = icompanyService.getTickerData();
		List<LiveBSESensexBO> newlyaddedcompanylist=icompanyService.getnewlyaddedcompany();
		Map<String,List<LiveBSESensexBO>> gainerLoserTurnoverMap = icompanyService.getLiveGainerLosserTurnover();
		model.put("newlyaddedcompanylist",newlyaddedcompanylist);
		model.put("LiveBSE", liveBSEList);
		model.put("BSESensexValue" ,liveBSEList.get(liveBSEList.size()-1));
		
		model.put("FirstCompny", LoginController.FIRSTGRAPHCOMPANY);
		model.put("gainerLooserTurnOver",gainerLoserTurnoverMap);
		
		TreeMap<Float,String> topgain_loss=new TreeMap<>();
		float networth=0;
		List<BuyStockBO> portfoliobos=iPortfoliodataService.getSellDetails(usSessionBO.getUserName());
		
		List<Float> totalinvestment = iPortfoliodataService.calculateTotalInvest(portfoliobos);
		map.addAttribute("investment", totalinvestment.get(0));
		map.addAttribute("overallGainLoss", totalinvestment.get(1));
		map.addAttribute("latestValue", totalinvestment.get(2));
		
		for(int i=0;i<portfoliobos.size();i++)
		{  
			topgain_loss.put(portfoliobos.get(i).getAppreciation(),portfoliobos.get(i).getSc_name());
			networth=networth+portfoliobos.get(i).getCurrent_value();
		}

		if (topgain_loss.isEmpty()) {
			map.addAttribute("top_gainer_company","No Gainers");
			map.addAttribute("top_losser_company","No Looser");
		} else {
			List<LiveBSESensexBO> livedataPortfolioComp=null;
			List<String> bseSensexBOs=new ArrayList<>();
			if (topgain_loss.lastKey() > 0) {
				map.addAttribute("top_gainer_company",topgain_loss.get(topgain_loss.lastKey()));


				bseSensexBOs.add(topgain_loss.get(topgain_loss.lastKey()));
				livedataPortfolioComp=iCompanyService.getDataForBanners(bseSensexBOs);
				map.addAttribute("top_gainer_company_value",livedataPortfolioComp.get(0).getCurrent_Value());
				map.addAttribute("top_gainer_company_variation",livedataPortfolioComp.get(0).getChang_points());
				map.addAttribute("top_gainer_company_per",livedataPortfolioComp.get(0).getChange_per());

			}else{
				map.addAttribute("top_gainer_company","No Gainer");
			}

			if (topgain_loss.firstKey() < 0) {


				List<LiveBSESensexBO> livedataPortfolioComp1=null;
				List<String> bseSensexBOs1=new ArrayList<>();

				map.addAttribute("top_losser_company",topgain_loss.get(topgain_loss.firstKey()));

				bseSensexBOs1.add(topgain_loss.get(topgain_loss.firstKey()));
				livedataPortfolioComp1=iCompanyService.getDataForBanners(bseSensexBOs1);
				map.addAttribute("top_losser_company_value",livedataPortfolioComp1.get(0).getCurrent_Value());
				map.addAttribute("top_losser_company_variation",livedataPortfolioComp1.get(0).getChang_points());
				map.addAttribute("top_losser_company_per",livedataPortfolioComp1.get(0).getChange_per());

			}else{
				map.addAttribute("top_losser_company","No Looser");
			}

			map.addAttribute("networth",Math.round(networth*100.00)/100.00);
			map.addAttribute("overallGainLossPer", totalinvestment.get(3));
		}

		
		
		
		
		LiveBSESensexBO liveBSESensexBO = icompanyService.getLiveData(LoginController.FIRSTGRAPHCOMPANY);
		model.put("CompnyLiveBO", liveBSESensexBO);
		
		
		Map<String,List<DailyPatternReportBO>> highlightCompanyMap = icompanyService.getHighLight();
		
		model.putAll(highlightCompanyMap);
		//System.out.println("apna contr"+highlightCompanyMap.get(highlightCompanyMap).get(0).getForming_Date());
		map.addAttribute("Model", model);
		//map.addAttribute("hightlightDate", highlightCompanyMap.get(highlightCompanyMap).get(0).getForming_Date());
		return HOME;
	}

	@RequestMapping(value="/accuracy",method=RequestMethod.GET)
	public String accuracyChecking(HttpServletRequest request,ModelMap map){
		
		List<AccuracyBO> accuracyList=new ArrayList<>();
		accuracyList=iDashboardServices.getaccuracyList();
		Date accdate=accuracyList.get(accuracyList.size()-1).getAccdate();
		map.addAttribute("Accuracy_List",accuracyList);
		map.addAttribute("accDate", accdate);
		return PATTERN_ACCURACY;
	}
	/*PURPOSE: FOR LOADABOUT US PAGE	
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: NA
	 *OUTPUT: RETURN NAME OF JSP VAR */
	@RequestMapping(value="/aboutus/home",method=RequestMethod.GET)
	public String aboutUsHome(HttpServletRequest request){
		return ABOUTUS;
	}

	/*PURPOSE: FOR LOAD CONTACT US PAGE	
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: NA
	 *OUTPUT: RETURN NAME OF JSP VAR */
	@RequestMapping(value="/contactus/home",method=RequestMethod.GET)
	public String contactUsHome(HttpServletRequest request){
		return CONTACTUS;
	}

	/*PURPOSE: FOR LOAD SUBSCRIPTION HOME PAGE	
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: NA
	 *OUTPUT: RETURN NAME OF JSP VAR */
	@RequestMapping(value="/subscribe/home",method=RequestMethod.GET)
	public String subscriptionHome(ModelMap modelMap, HttpServletRequest request){
		List<Integer>  pricelist =null;
		pricelist = iDashboardServices.getPrice();

		modelMap.addAttribute("Week", pricelist.get(0));
		modelMap.addAttribute("Month", pricelist.get(1));
		modelMap.addAttribute("Months", pricelist.get(2));
		modelMap.addAttribute(SUBSCRIPTION);

		return SUBSCRIPTION;
	}



	/*PURPOSE: FOR CALCULATE PRICE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: LIST OF VALUES 
	 *OUTPUT: RETURN TOTAL PRICE */
	@RequestMapping(value = "/subscription", method = RequestMethod.POST)
	public @ResponseBody int calculatePrice(@RequestParam List<String> duration) {
		int total = iDashboardServices.calculatePrice(duration);
		return total;
	}


	/*PURPOSE:FOR CONTACT US PAGE SENDING MAIL (FOR MAIN CONTEMNT)
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: LIST OF VALUES 
	 *OUTPUT: RETURN MESSAGE */
	@RequestMapping(value = "/contactus2", method = RequestMethod.POST)
	public String homecontactUs(@ModelAttribute ContactUsCommand contactUsCommand, ModelMap modelMap) {

		int i = iDashboardServices.contactUs(contactUsCommand);
		if (i!=0) {
			modelMap.addAttribute("msgSuccess", "Thank you for contacting us.. We will get back to you as soon as possible....");
			modelMap.addAttribute(LoginController.H_CONTACTUS);
			return LoginController.H_CONTACTUS;
		} else {
			modelMap.addAttribute("msgError", "Something Went wrong.. Please try again after some time....");
			modelMap.addAttribute(LoginController.H_CONTACTUS);
			return LoginController.H_CONTACTUS;
		}

	}








	/*PURPOSE:FOR SUBMIT FEEDBACK SENDING MAIL 
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: LIST OF VALUES 
	 *OUTPUT: RETURN MESSAGE */
	@RequestMapping(value = "/feedbackSubmit", method = RequestMethod.POST)
	public @ResponseBody int submitFeedback(@RequestParam("name") String name,@RequestParam("email") String email,
			@RequestParam("category") String category,@RequestParam("message") String message,ModelMap modelMap) {
//		System.out.println("Name : "+name+", Email : "+email+", Cate : "+category+", Massage : "+message);
		int i = iDashboardServices.submitFeedback(name,email,category,message);
		return i;
	}



	/*PURPOSE:FOR FORGOT PASSWORD 
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: USERNAME & EMAIL ID 
	 *OUTPUT: RETURN MESSAGE */
	@RequestMapping(value = "/forgotPassword", method = RequestMethod.POST)
	public @ResponseBody int forgotPassword(@RequestParam("username") String username,@RequestParam("email") String email, ModelMap modelMap) {
		return iDashboardServices.forgotPassword(username,email);
	}




	/**
	 * PREPARED BY :SUNIL GAUSWAMI
	 * NAME        :CHANGE PASSWORD
	 * PURPOSE     :FOR CHANGING PASSWORD
	 * */
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public @ResponseBody int changePassword(@RequestParam String new_password,@RequestParam String old_password, HttpServletRequest httpServletRequest)
			throws Exception {
		HttpSession ses = httpServletRequest.getSession();
		UserSessionBO usSessionBO =  (UserSessionBO) ses.getAttribute("sessionBO");
		String userName = usSessionBO.getUserName();
		int i = iDashboardServices.changePassword(userName,old_password,new_password);
		
		if (i==1) {
			ses.removeAttribute("sessionBO");
			ses.invalidate();
		}
		
		return i;
	}




	/*PURPOSE:FOR CONTACT US PAGE SENDING MAIL(AFTER LOIN PAGE)
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: LIST OF VALUES 
	 *OUTPUT: RETURN MESSAGE */
	@RequestMapping(value = "/contactus", method = RequestMethod.POST)
	public String contactUs(@ModelAttribute ContactUsCommand contactUsCommand, ModelMap modelMap) {

		int i = iDashboardServices.contactUs(contactUsCommand);
		if (i!=0) {
			modelMap.addAttribute("msgSuccess", "Thank you for contacting us.. We will get back to you as soon as possible....");
			modelMap.addAttribute(CONTACTUS);
			return CONTACTUS;
		} else {
			modelMap.addAttribute("msgError", "Something Went wrong.. Please try again after some time....");
			modelMap.addAttribute(CONTACTUS);
			return CONTACTUS;
		}

	}
	@ModelAttribute("month")
	public void  getReachUsList( ModelMap modelMap){

		List<String> parameterList = null;
		parameterList=(List<String>) icache.get("month");
		modelMap.addAttribute("month",parameterList);
		
		List<String> parameterList1 = null;
		parameterList1=(List<String>) icache.get("week");
		modelMap.addAttribute("week",parameterList1);
		//System.out.println("week==    "+parameterList1);
	}
}