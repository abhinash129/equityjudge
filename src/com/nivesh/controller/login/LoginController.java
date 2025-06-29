package com.nivesh.controller.login;

import java.io.IOException;
import java.net.UnknownHostException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nivesh.bo.ActiveCompanyListBO;
import com.nivesh.bo.BuyStockBO;
import com.nivesh.bo.DailyPatternReportBO;
import com.nivesh.bo.LiveBSESensexBO;
import com.nivesh.bo.UserMstrBO;
import com.nivesh.bo.UserSessionBO;
import com.nivesh.command.login.LoginCommand;
import com.nivesh.command.signup.SignupCommand;
import com.nivesh.command.userprofile.UserProfileCommand;
import com.nivesh.exception.SigninException;
import com.nivesh.exception.SigninExceptionStatic;
import com.nivesh.exception.SignupException;
import com.nivesh.exception.UserProfileException;
import com.nivesh.service.company.ICompanyService;
import com.nivesh.service.dashboard.IDashboardServices;
import com.nivesh.service.login.ILoginService;
import com.nivesh.service.portfolio.IPortfoliodataService;
import com.nivesh.service.signup.ISignupService;
import com.nivesh.service.userprofile.IUserProfileService;
import com.nivesh.util.ApplicationConstant;
import com.nivesh.util.ICache;
import com.nivesh.util.IExceptionPropertyAccessore;
import com.nivesh.util.IParameterAccessorService;

@Controller
public class LoginController {

	public static final String LOGIN_FIRST_PORTFOLIO="loginfirstPortfolio",LOGIN_FIRST_TREND="loginfirstTrend",SIGNUP="signupHome",H_CONTACTUS="contactus",H_ABOUTUS="aboutus",H_SUBSCRIPTION="subscription"
			,PROFILE="profile",BEFORLOGIN_PORTFOLIO_DEMO ="portfoliodemohome",LOGIN="login", HOME="home",SETTING="setting",DISCLAIMER="disclaimer",TERM_AND_CONDITION="termsandconditions";

	public static final int NUMBEROF_COMPNY_FOR_HIGHLIGHT=5;

	public static String FIRSTGRAPHCOMPANY=ApplicationConstant.BSE_SENSEX_NAME;


	@Autowired
	ILoginService loginService;
	@Autowired
	IExceptionPropertyAccessore iExceptionPropertyAccessore;

	@Autowired
	IPortfoliodataService iPortfoliodataService;


	@Autowired
	ICompanyService icompanyServices;

	@Autowired
	IDashboardServices iDashboardServices;

	@Resource(name="parameterCache")
	ICache icache;

	@Autowired
	IUserProfileService iUserProfileService;

	@Autowired
	ISignupService iSignupService;

	@Autowired
	IParameterAccessorService iParameterAccessorService;

	/**
	 * PREPARED BY :JITENDRA KUMAR
	 * NAME        :SIGNUP USERNAME VALIDATION
	 * PURPOSE     :TO CHECK WHETHER USER NAME EXISTS OR NOT
	 * */
	@RequestMapping(value = "/username", method = RequestMethod.POST)
	public @ResponseBody boolean SignupUserNameValidation(@RequestParam String userName, HttpServletRequest httpServletRequest)
			throws Exception {
		int loginProcess1 = iSignupService.checkUserName(userName);

		if (loginProcess1 == 1) {
			return false;

		} else

			return true;

	}


	/**
	 * PREPARED BY :SUNIL GAUSWAMI
	 * NAME        :SIGNUP EMAIL VALIDATION
	 * PURPOSE     :TO CHECK WHETHER EMAIL ADDRESS EXISTS OR NOT
	 * */
	@RequestMapping(value = "/email", method = RequestMethod.POST)
	public @ResponseBody boolean SignupEmailValidation(@RequestParam String emailAddress, HttpServletRequest httpServletRequest)
			throws Exception {
		int loginProcess1 = iSignupService.checkEmailId(emailAddress);
		if (loginProcess1 == 1) {
			return false;
		} else
			return true;
	}





	/**
	 * PREPARED BY :SUNIL GAUSWAMI
	 * NAME        : PROFILE UPDATE EMAIL UPDATE
	 * PURPOSE     :TO UPDATE EMAIL ADDRESS
	 * */
	@RequestMapping(value = "/updateEmail", method = RequestMethod.POST)
	public @ResponseBody int emailUpdate(@RequestParam String email, HttpServletRequest httpServletRequest)
			throws Exception {
		UserSessionBO sessionBO = (UserSessionBO) httpServletRequest.getSession().getAttribute("sessionBO");
		return iSignupService.updateEmailId(email,sessionBO.getUserName());
	}

	/**
	 * PREPARED BY :SUNIL GAUSWAMI
	 * NAME        :SIGNUP MOBILE NUMBER VALIDATION
	 * PURPOSE     :TO CHECK WHETHER MOBILE NUMBER ADDRESS EXISTS OR NOT
	 * */
	@RequestMapping(value = "/phone", method = RequestMethod.POST)
	public @ResponseBody boolean SignupPhoneValidation(@RequestParam String phoneNO, HttpServletRequest httpServletRequest)
			throws Exception {
		int loginProcess1 = iSignupService.checkPhoneId(phoneNO);
		if (loginProcess1 == 1) {
			return false;

		} else

			return true;

	}


	/**
	 * PREPARED BY :SUNIL GAUSWAMI
	 * NAME        : PROFILE UPDATE MOBILE NUMBER
	 * PURPOSE     :TO UPDATE MOILE NUMBER
	 * */
	@RequestMapping(value = "/updateMobile", method = RequestMethod.POST)
	public @ResponseBody int mobileUpdate(@RequestParam String mobile, HttpServletRequest httpServletRequest)
			throws Exception {
		UserSessionBO sessionBO = (UserSessionBO) httpServletRequest.getSession().getAttribute("sessionBO");
		return iSignupService.updatePhoneNo(mobile,sessionBO.getUserName());
	}


	@RequestMapping(value="/signuphome",method=RequestMethod.POST)
	public ModelAndView signupHome(ModelAndView mv){
		SignupCommand signupCommand = new SignupCommand();
		return new ModelAndView(SIGNUP,"signupCommand",signupCommand);
	}

	@RequestMapping(value="/signuphome",method=RequestMethod.GET)
	public ModelAndView signupHomeStatic(ModelAndView mv){
		SignupCommand signupCommand = new SignupCommand();
		return new ModelAndView(SIGNUP,"signupCommand",signupCommand);
	}


	@RequestMapping(value="/terms-and-conditions",method=RequestMethod.GET)
	public String termsAndConditions(){
		return TERM_AND_CONDITION;
	}

	@RequestMapping(value="/disclaimer",method=RequestMethod.GET)
	public String disclaimer(){
		return DISCLAIMER;
	}

	@RequestMapping(value="/subscription",method=RequestMethod.GET)
	public ModelMap Subscipriptionhome(ModelMap modelMap){
		List<Integer>  pricelist =null;

		pricelist = iDashboardServices.getPrice();


		modelMap.addAttribute("Week", pricelist.get(0));
		modelMap.addAttribute("Month", pricelist.get(1));
		modelMap.addAttribute("Months", pricelist.get(2));
		modelMap.addAttribute(H_SUBSCRIPTION);
		return modelMap;
	}

	@RequestMapping(value="/about_us",method=RequestMethod.GET)
	public ModelAndView aboutUsHome(ModelAndView mv){
		return new ModelAndView(H_ABOUTUS);
	}
	@RequestMapping(value="/contact_us",method=RequestMethod.GET)
	public ModelAndView contactUsHome(ModelAndView mv){
		return new ModelAndView(H_CONTACTUS);
	}

	@RequestMapping(value="/login_home",method=RequestMethod.GET)
	public ModelAndView LoginHome(ModelMap modelMap, HttpServletRequest request) throws ParseException{
		HttpSession ses = request.getSession(false);
		if (ses!=null) {
			if (ses.getAttribute("sessionBO")!=null) {
				ses.removeAttribute("sessionBO");
				ses.invalidate();
			}}

		String newsData=null;
		newsData=loginService.getNewsData();
		SignupCommand signupCommand = new SignupCommand();
		modelMap.addAttribute("signupCommand",signupCommand);

		List<LiveBSESensexBO> liveBSEList = icompanyServices.getTickerData();
		Map<String,List<LiveBSESensexBO>> gainerLoserTurnoverMap = icompanyServices.getLiveGainerLosserTurnover();
		LiveBSESensexBO liveBSESensexBO = icompanyServices.getLiveData(FIRSTGRAPHCOMPANY);
		modelMap.addAttribute("LiveBSE", liveBSEList);
		modelMap.addAttribute("BSESensexValue" ,liveBSEList.get(liveBSEList.size()-1));
		modelMap.addAttribute("news",newsData);

		/*====================================*/
		
		List<DailyPatternReportBO> dailyPatternReportBOs = icompanyServices.getHilightesCompanyData(NUMBEROF_COMPNY_FOR_HIGHLIGHT);
		System.out.println(dailyPatternReportBOs.size());
		if(dailyPatternReportBOs.size() > 0) {
			System.out.println("DailyHighlightDate: "+ dailyPatternReportBOs.get(0).getAudit_date_time());
			System.out.println("DailyHighlight: "+ dailyPatternReportBOs);
		modelMap.addAttribute("DailyHighlightDate", dailyPatternReportBOs.get(0).getAudit_date_time());
		modelMap.addAttribute("DailyHighlight", dailyPatternReportBOs);}
	/*	====================================
*/
		ActiveCompanyListBO activeCompanyListBO =  icompanyServices.getsc_codeBaseCompanyName(LoginController.FIRSTGRAPHCOMPANY);

		modelMap.addAttribute("FirstCompny", activeCompanyListBO);

		modelMap.addAttribute("CompnyLiveBO", liveBSESensexBO);
		modelMap.addAttribute("Model",gainerLoserTurnoverMap);
		return new ModelAndView(LOGIN);
	}


	/**DONE
	 * PREPARED BY :JITENDRA KUMAR
	 * NAME        :SIGNUP PROCESS
	 * PURPOSE     :INSERT SIGNUP DATA INTO DATABASE
	 * */
	@RequestMapping(value="/signup",method=RequestMethod.POST)
	public String signup(@Valid @ModelAttribute SignupCommand signupCommand,BindingResult bindingResult,ModelMap map){
		if(bindingResult.hasErrors())
		{
			return SIGNUP;
		}else{

			String result=iSignupService.userRegistration(signupCommand);
			if(result.equals("unsuccess"))
			{
				throw new SignupException("",signupCommand.getUserName()+"your registration unsuccessfull");
			}
			else{
				map.addAttribute("success", "Registration done");
				return "redirect:/loginfirst";
			}
		}}

	@RequestMapping("/loginfirst")
	public String wrongSessionPortfolio(HttpServletRequest request,ModelMap map){
		String mesage = request.getParameter("success");
		if (!(mesage==null)) {
			map.addAttribute("successs", "Registration successfully done........Please Login with your Credentials");	
		}
		return LOGIN_FIRST_PORTFOLIO;
	}



	/**
	 * PREPARED:JITENDRA KUMAR 
	 * NAME :SIGNIN VALIDATION PURPOSE :USERNAME AND PASSWORD VARIFICATION
	 *  
	 */

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginProcess(@Valid @ModelAttribute LoginCommand logincommand,
			BindingResult bindingResult,HttpServletRequest httpServletRequest, ModelMap map) throws Exception {

		if (bindingResult.hasErrors()) {
			return new ModelAndView(LOGIN,"FirstCompny", FIRSTGRAPHCOMPANY);
		} else {

			String isLoginSuccess = null;
			//List<UserLogBO> loginProcess;
			HttpSession httpSession = httpServletRequest.getSession(false);
			isLoginSuccess = logincommand.getUserName();

			String loginProcess = loginService.checkUserName_pswd(logincommand);
			String loginProcessArray[] = loginProcess.split("##");
			String success = loginProcessArray[0]; // 0/1 Value
			String role = loginProcessArray[1];  // Role of Particuler User
			String duration = loginProcessArray[2]; // duration Remain of subscription
			String first_Login = loginProcessArray[3]; //First time login or not

			if (!success.equals("0")) {

				List<String> listofInfo =  loginService.getLoginAddress(httpServletRequest);
				loginService.insertLoginHistoiry(isLoginSuccess,listofInfo.get(0),listofInfo.get(1));


				UserSessionBO userSessionBO = new UserSessionBO();
				userSessionBO.setUserName(isLoginSuccess);
				userSessionBO.setIpRemoteAddress(httpServletRequest.getRemoteAddr());
				userSessionBO.setRole(role);
				userSessionBO.setUserRemainingDays(role +": "+duration+" days Left..");

				String subscriptionFlag = loginProcessArray[4]; // Getting Subscription Period is Over or Not
				if (subscriptionFlag.equals("0")) {
					httpSession.invalidate();
					ModelAndView modelMap = new ModelAndView();
					List<LiveBSESensexBO> liveBSEList = icompanyServices.getTickerData();

					/*====================================*/
					/*List<DailyPatternReportBO> dailyPatternReportBOs = icompanyServices.getHilightesCompanyData(NUMBEROF_COMPNY_FOR_HIGHLIGHT);
					modelMap.addObject("DailyHighlightDate", dailyPatternReportBOs.get(0).getAudit_date_time());
					modelMap.addObject("DailyHighlight", dailyPatternReportBOs);
					====================================*/

					String newsData=loginService.getNewsData();
					modelMap.addObject("news",newsData);

					modelMap.addObject("LiveBSE", liveBSEList);
					
					ActiveCompanyListBO activeCompanyListBO =  icompanyServices.getsc_codeBaseCompanyName(LoginController.FIRSTGRAPHCOMPANY);

					modelMap.addObject("FirstCompny", activeCompanyListBO);
					
					LiveBSESensexBO liveBSESensexBO = icompanyServices.getLiveData(FIRSTGRAPHCOMPANY);
					Map<String,List<LiveBSESensexBO>> gainerLoserTurnoverMap = icompanyServices.getLiveGainerLosserTurnover();
					modelMap.addObject("CompnyLiveBO", liveBSESensexBO);
					modelMap.addObject("msg","Your Subscription time is Over Please Subscribe....");
					modelMap.addObject(LOGIN);
					modelMap.addObject("Model",gainerLoserTurnoverMap);
					return modelMap;
				}

				httpSession.setAttribute("sessionBO", userSessionBO);
				if (first_Login.equalsIgnoreCase("N")) {

					//					int numberofCompany = NUMBEROF_COMPNY_FOR_HIGHLIGHT;
					List<LiveBSESensexBO> liveBSEList = icompanyServices.getTickerData();
					Map<String,List<DailyPatternReportBO>> gainerLoserTurnoverMap = icompanyServices.getHighLight();
					LiveBSESensexBO liveBSESensexBO = icompanyServices.getLiveData(FIRSTGRAPHCOMPANY);
					List<LiveBSESensexBO> newlyaddedcompanylist=icompanyServices.getnewlyaddedcompany(); 
					Map<String, Object> model = new HashMap<String, Object>();
					model.put("LiveBSE", liveBSEList);
					model.put("BSESensexValue" ,liveBSEList.get(liveBSEList.size()-1));
					model.put("FirstCompny", FIRSTGRAPHCOMPANY);
					model.put("CompnyLiveBO", liveBSESensexBO);
					model.putAll(gainerLoserTurnoverMap);
					
					Map<String,List<LiveBSESensexBO>> gainerLoserTurnoverMap2 = icompanyServices.getLiveGainerLosserTurnover();
					model.put("gainerLooserTurnOver",gainerLoserTurnoverMap2);
					
					model.put("newlyaddedcompanylist",newlyaddedcompanylist);
					model.put("successProfileUpdate","Hi "+userSessionBO.getUserName()+", Welcome to Equityjudge...");


					TreeMap<Float,String> topgain_loss=new TreeMap<>();
					float networth=0;
					List<BuyStockBO> portfoliobos=iPortfoliodataService.getSellDetails(userSessionBO.getUserName());

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
						map.addAttribute("top_losser_company","No Loser");
					} else {
						List<LiveBSESensexBO> livedataPortfolioComp=null;
						List<String> bseSensexBOs=new ArrayList<>();
						if (topgain_loss.lastKey() > 0) {
							map.addAttribute("top_gainer_company",topgain_loss.get(topgain_loss.lastKey()));


							bseSensexBOs.add(topgain_loss.get(topgain_loss.lastKey()));
							livedataPortfolioComp=icompanyServices.getDataForBanners(bseSensexBOs);
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
							livedataPortfolioComp1=icompanyServices.getDataForBanners(bseSensexBOs1);
							map.addAttribute("top_losser_company_value",livedataPortfolioComp1.get(0).getCurrent_Value());
							map.addAttribute("top_losser_company_variation",livedataPortfolioComp1.get(0).getChang_points());
							map.addAttribute("top_losser_company_per",livedataPortfolioComp1.get(0).getChange_per());

						}else{
							map.addAttribute("top_losser_company","No Loser");
						}

						map.addAttribute("networth",Math.round(networth*100.00)/100.00);
						map.addAttribute("overallGainLossPer", totalinvestment.get(3));
					}




					return new ModelAndView(HOME,"Model", model);

				} else if(first_Login.equalsIgnoreCase("Y")){
					return new ModelAndView("redirect:/profile");

				}
			}

			else
			{
				String msg=iExceptionPropertyAccessore.getInstance().getExceptionObject().get("SI01");
				throw new SigninException("SI01",msg);
			}
		}
		return null;
	}


	/**
	 * PREPARED:SUNIL GAUSWAMI	 
	 * NAME :LOGIN FROM SECOND STATIC LOGIN PAGE VALIDATION PURPOSE :USERNAME AND PASSWORD VARIFICATION
	 */

	@RequestMapping(value = "/loginPage", method = RequestMethod.POST)
	public ModelAndView secondLoginProcess(@Valid @ModelAttribute LoginCommand logincommand,
			BindingResult bindingResult,HttpServletRequest httpServletRequest,ModelMap map) throws Exception {
		if (bindingResult.hasErrors()) {
			return new ModelAndView(LOGIN,"FirstCompny", FIRSTGRAPHCOMPANY);
		} else {

			String isLoginSuccess = null;
			//List<UserLogBO> loginProcess;
			HttpSession httpSession = httpServletRequest.getSession(false);
			isLoginSuccess = logincommand.getUserName();

			String loginProcess = loginService.checkUserName_pswd(logincommand);
			String loginProcessArray[] = loginProcess.split("##");
			String success = loginProcessArray[0]; // 0/1 Value
			String role = loginProcessArray[1];  // Role of Particuler User
			String duration = loginProcessArray[2]; // duration Remain of subscription
			String first_Login = loginProcessArray[3]; //First time login or not


			if (!success.equals("0")) {

				List<String> listofInfo =  loginService.getLoginAddress(httpServletRequest);
				loginService.insertLoginHistoiry(isLoginSuccess,listofInfo.get(0),listofInfo.get(1));



				UserSessionBO userSessionBO = new UserSessionBO();
				userSessionBO.setUserName(isLoginSuccess);
				userSessionBO.setIpRemoteAddress(httpServletRequest.getRemoteAddr());
				userSessionBO.setRole(role);
				userSessionBO.setUserRemainingDays(role +": "+duration+" days Left..");

				String subscriptionFlag = loginProcessArray[4]; // Getting Subscription Period is Over or Not
				if (subscriptionFlag.equals("0")) {
					httpSession.invalidate();
					ModelAndView modelMap = new ModelAndView();
					List<LiveBSESensexBO> liveBSEList = icompanyServices.getTickerData();

					String newsData=loginService.getNewsData();
					modelMap.addObject("news",newsData);

					/*====================================*/
/*					List<DailyPatternReportBO> dailyPatternReportBOs = icompanyServices.getHilightesCompanyData(NUMBEROF_COMPNY_FOR_HIGHLIGHT);
					modelMap.addObject("DailyHighlightDate", dailyPatternReportBOs.get(0).getAudit_date_time());
					modelMap.addObject("DailyHighlight", dailyPatternReportBOs);
*/					/*====================================*/

					modelMap.addObject("LiveBSE", liveBSEList);
					ActiveCompanyListBO activeCompanyListBO =  icompanyServices.getsc_codeBaseCompanyName(LoginController.FIRSTGRAPHCOMPANY);

					modelMap.addObject("FirstCompny", activeCompanyListBO);
					LiveBSESensexBO liveBSESensexBO = icompanyServices.getLiveData(FIRSTGRAPHCOMPANY);
					Map<String,List<LiveBSESensexBO>> gainerLoserTurnoverMap = icompanyServices.getLiveGainerLosserTurnover();
					modelMap.addObject("CompnyLiveBO", liveBSESensexBO);
					modelMap.addObject("msg","Your Subscription time is Over Please Subscribe....");
					modelMap.addObject(LOGIN);
					modelMap.addObject("Model",gainerLoserTurnoverMap);
					return modelMap;
				}

				httpSession.setAttribute("sessionBO", userSessionBO);
				if (first_Login.equalsIgnoreCase("N")) {

					List<LiveBSESensexBO> liveBSEList = icompanyServices.getTickerData();
					Map<String,List<DailyPatternReportBO>> highLightMap = icompanyServices.getHighLight();
					LiveBSESensexBO liveBSESensexBO = icompanyServices.getLiveData(FIRSTGRAPHCOMPANY);
					List<LiveBSESensexBO> newlyaddedcompanylist=icompanyServices.getnewlyaddedcompany();
					Map<String, Object> model = new HashMap<String, Object>();
					model.put("LiveBSE", liveBSEList);
					model.put("FirstCompny", FIRSTGRAPHCOMPANY);
					model.put("CompnyLiveBO", liveBSESensexBO);
					model.put("BSESensexValue" ,liveBSEList.get(liveBSEList.size()-1));
					model.putAll(highLightMap);
					model.put("successProfileUpdate","Hi "+userSessionBO.getUserName()+", Welcome to Equityjudge...");
					model.put("newlyaddedcompanylist",newlyaddedcompanylist);
					TreeMap<Float,String> topgain_loss=new TreeMap<>();
					float networth=0;
					List<BuyStockBO> portfoliobos=iPortfoliodataService.getSellDetails(userSessionBO.getUserName());

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
						map.addAttribute("top_losser_company","No Loser");
					} else {
						List<LiveBSESensexBO> livedataPortfolioComp=null;
						List<String> bseSensexBOs=new ArrayList<>();
						if (topgain_loss.lastKey() > 0) {
							map.addAttribute("top_gainer_company",topgain_loss.get(topgain_loss.lastKey()));


							bseSensexBOs.add(topgain_loss.get(topgain_loss.lastKey()));
							livedataPortfolioComp=icompanyServices.getDataForBanners(bseSensexBOs);
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
							livedataPortfolioComp1=icompanyServices.getDataForBanners(bseSensexBOs1);
							map.addAttribute("top_losser_company_value",livedataPortfolioComp1.get(0).getCurrent_Value());
							map.addAttribute("top_losser_company_variation",livedataPortfolioComp1.get(0).getChang_points());
							map.addAttribute("top_losser_company_per",livedataPortfolioComp1.get(0).getChange_per());

						}else{
							map.addAttribute("top_losser_company","No Loser");
						}

						map.addAttribute("networth",Math.round(networth*100.00)/100.00);
						map.addAttribute("overallGainLossPer", totalinvestment.get(3));
					}

					Map<String,List<LiveBSESensexBO>> gainerLoserTurnoverMap2 = icompanyServices.getLiveGainerLosserTurnover();
					model.put("gainerLooserTurnOver",gainerLoserTurnoverMap2);
					return new ModelAndView(HOME,"Model", model);

				} else if(first_Login.equalsIgnoreCase("Y")){
					return new ModelAndView("redirect:/profile");

				}
			}

			else
			{
				String msg=iExceptionPropertyAccessore.getInstance().getExceptionObject().get("SI01");
				throw new SigninExceptionStatic("SI01",msg);
			}
		}
		return null;
	}



	@RequestMapping(value = "/settings", method = RequestMethod.GET)
	public String Settings(HttpServletRequest httpServletRequest, ModelMap modelMap) {
		return SETTING;
	}


	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public ModelAndView userProfile(HttpServletRequest httpServletRequest, ModelMap modelMap) {
		HttpSession ses = httpServletRequest.getSession();

		UserSessionBO usSessionBO =  (UserSessionBO) ses.getAttribute("sessionBO");
		String userName = usSessionBO.getUserName();
		List<UserMstrBO> list = iUserProfileService.listof_UserSpecific_Info(userName);
		ModelAndView modelAndView=null;

		UserProfileCommand userProfileCommand = new UserProfileCommand();
		Map<String, String> map=null;
		map=new HashedMap();
		userProfileCommand.setUserName(list.get(0).getUname());
		userProfileCommand.setFirstName(list.get(0).getFirstname());
		userProfileCommand.setLastName(list.get(0).getLastname());
		userProfileCommand.setMobile(""+list.get(0).getPh_no());
		userProfileCommand.setEmail(list.get(0).getEmail_id());
		//For Binding the Compbobox...
		String defalt = "Selecte------";
		if (list.get(0).getOccupation()==null) {
			list.get(0).setOccupation(defalt);
		}
		map.put("state", list.get(0).getState());
		map.put("country", list.get(0).getCountry());

		userProfileCommand.setAddressLine(list.get(0).getAddressLine());
		userProfileCommand.setOccupation(list.get(0).getOccupation());
		userProfileCommand.setState(list.get(0).getState());
		userProfileCommand.setCountry(list.get(0).getCountry());

		modelAndView=new ModelAndView(PROFILE,"userProfileCommand",userProfileCommand);
		modelAndView.addAllObjects(map);

		return modelAndView;
	}

	@RequestMapping(value = "/profileUpdate", method = RequestMethod.POST)
	public ModelAndView userProfileUpdate(@Valid @ModelAttribute UserProfileCommand userProfileCommand,BindingResult bindingResult,HttpServletRequest httpServletRequest)
			throws UserProfileException, IOException {
		if(bindingResult.hasErrors())
		{
			return new ModelAndView(PROFILE,"userProfileCommand",userProfileCommand);
		}else
		{

			int i= iUserProfileService.insert_UserSpecificInfo(userProfileCommand);

			if(i==1){
				ModelAndView modelAndView=null;
				Map<String, String> map=new HashedMap();;
				map.put("state", userProfileCommand.getState());
				map.put("country", userProfileCommand.getCountry());
				map.put("profileMessage", "Your Profile is Updated Successfully");
				userProfileCommand.setState(userProfileCommand.getState());
				userProfileCommand.setCountry(userProfileCommand.getCountry());
				modelAndView=new ModelAndView(PROFILE,"userProfileCommand",userProfileCommand);
				modelAndView.addAllObjects(map);
				return modelAndView;

			}
			else
			{
				String msg=iExceptionPropertyAccessore.getInstance().getExceptionObject().get("UP01");
				throw new UserProfileException("SI01",userProfileCommand.getUserName()+msg);
			}
		} 
	}
	//catch (UserProfileException exception){
	//return new ModelAndView("unSuccessProfileUpdate", "unSuccessProfileUpdate", exception.getMessage());




	@RequestMapping(value="/",method=RequestMethod.GET)
	public String home(ModelMap modelMap, HttpServletRequest httpServletRequest) throws ParseException{



		String newsData=loginService.getNewsData();
		modelMap.addAttribute("news",newsData);

		/*		SignupCommand signupCommand = new SignupCommand();
		modelMap.addAttribute("signupCommand",signupCommand);
		 */
		List<LiveBSESensexBO> liveBSEList = icompanyServices.getTickerData();
		modelMap.addAttribute("LiveBSE", liveBSEList);

		ActiveCompanyListBO activeCompanyListBO =  icompanyServices.getsc_codeBaseCompanyName(LoginController.FIRSTGRAPHCOMPANY);

		modelMap.addAttribute("FirstCompny", activeCompanyListBO);

		/*====================================*/
		/*List<DailyPatternReportBO> dailyPatternReportBOs = icompanyServices.getHilightesCompanyData(NUMBEROF_COMPNY_FOR_HIGHLIGHT);
		modelMap.addAttribute("DailyHighlightDate", dailyPatternReportBOs.get(0).getAudit_date_time());
		modelMap.addAttribute("DailyHighlight", dailyPatternReportBOs);
		====================================*/

		LiveBSESensexBO liveBSESensexBO = icompanyServices.getLiveData(FIRSTGRAPHCOMPANY);
		Map<String,List<LiveBSESensexBO>> gainerLoserTurnoverMap = icompanyServices.getLiveGainerLosserTurnover();

		modelMap.addAttribute("CompnyLiveBO", liveBSESensexBO);
		modelMap.addAttribute("Model",gainerLoserTurnoverMap);
		return LOGIN;
	}




	@RequestMapping("/loginfirstTrend")
	public String wrongSessionTrend(ModelMap map,HttpServletRequest request) throws ParseException{


		ActiveCompanyListBO activeCompanyListBO =  icompanyServices.getsc_codeBaseCompanyName(FIRSTGRAPHCOMPANY);
		map.addAttribute("FirstCompny", activeCompanyListBO);

		List<LiveBSESensexBO> liveBSEList = icompanyServices.getTickerData();
		map.addAttribute("BSESensexValue" ,liveBSEList.get(liveBSEList.size()-1));
		map.addAttribute("LiveBSE", liveBSEList);


		return LOGIN_FIRST_TREND;
	}

	@RequestMapping("/beforeLoginPortfolioDemo")
	public String wrongSessionPortfolioDemo(HttpServletRequest request){
		return BEFORLOGIN_PORTFOLIO_DEMO;
	}


	@RequestMapping(value="/graphpattern/graph/selectCompnyDemo",method=RequestMethod.GET)
	public String CompnyGraph(@RequestParam("companyName") String companyName,ModelMap map) throws ParseException{
		ActiveCompanyListBO activeCompanyListBO =  icompanyServices.getsc_codeBaseCompanyName(companyName);
		map.addAttribute("FirstCompny", activeCompanyListBO);
		List<LiveBSESensexBO> liveBSEList = icompanyServices.getTickerData();
		map.addAttribute("BSESensexValue" ,liveBSEList.get(liveBSEList.size()-1));
		map.addAttribute("LiveBSE", liveBSEList);
		return LOGIN_FIRST_TREND;
	}
    
	@RequestMapping("/userreview")
	public @ResponseBody int userReview(@RequestParam String userreview,HttpServletRequest httpServletRequest) throws Exception{
		List<String> listofInfo =  loginService.getLoginAddress(httpServletRequest);
		int i = loginService.insertreview(userreview, listofInfo.get(0));
		return i;
	}
	
	
	@SuppressWarnings("unchecked")
	@ModelAttribute("code")
	public void  getReachUsList( ModelMap modelMap){
		List<String> parameterList0 = null;

		parameterList0=(List<String>) icache.get("period");
		modelMap.addAttribute("period", parameterList0);

		List<String> parameterList = null;

		parameterList=(List<String>) icache.get("reachus");
		modelMap.addAttribute("reachUsList",parameterList);
		List<String> parameterList1 = null;
		parameterList1= (List<String>) icache.get("CountryCode");
		modelMap.addAttribute("countryCode",parameterList1);
		List<String> parameterList2 = null;
		parameterList2= (List<String>) icache.get("occupation");
		modelMap.addAttribute("occupation",parameterList2);

		List<String> parameterList3 = null;
		parameterList3= (List<String>) icache.get("title");
		modelMap.addAttribute("title",parameterList3);
		List<String> parameterList4 = null;
		parameterList4=(List<String>) icache.get("month");
		modelMap.addAttribute("month",parameterList4);

		List<String> parameterList5 = null;
		parameterList5=(List<String>) icache.get("week");
		modelMap.addAttribute("week",parameterList5);


		List<String> parameterList6 = null;

		parameterList6=(List<String>) icache.get("G_L today");
		modelMap.addAttribute("variation", parameterList6);

		List<String> parameterList7 = null;

		parameterList7=(List<String>) icache.get("priceRange");
		modelMap.addAttribute("price", parameterList7);

		List<String> parameterList8 = null;

		parameterList8= (List<String>) icache.get("indexrange");
		modelMap.addAttribute("indexrange", parameterList8);



	}
}
