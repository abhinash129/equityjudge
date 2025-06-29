package com.nivesh.util;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.nivesh.bo.ActiveCompanyListBO;
import com.nivesh.bo.DailyPatternReportBO;
import com.nivesh.bo.LiveBSESensexBO;
import com.nivesh.controller.login.LoginController;
import com.nivesh.exception.SigninException;
import com.nivesh.exception.SigninExceptionStatic;
import com.nivesh.exception.SignupException;
import com.nivesh.exception.UserProfileException;
import com.nivesh.service.company.ICompanyService;
import com.nivesh.service.login.ILoginService;
/**
 * PREPARED BY:JITENDRA KUMAR
 * NAME: ALL USER PRFILE EXCEPTION
 * PURPOSE:HANDLING  EXCEPTION OF LOGIN , SIGN AND USERPROFILE
 * */
@ControllerAdvice
public class GlobalExceptionContollerAdvice {
	
	public static final String SUCCESSSIGNUP="successSignup",UNSUCCESSPROFILEUPDATE="unSuccessProfileUpdate";
	
	
	@Autowired
	ICompanyService icompanyServices;
	
	@Autowired
	ILoginService iloginService;
	
	
/*	@ExceptionHandler(value=Exception.class)
	public String handleException(Exception e)
	{
		return "errorPage";
	}
	*/
	@ExceptionHandler( value= SignupException.class)
	public ModelAndView signupException(SignupException e)
	{
		return new ModelAndView(SUCCESSSIGNUP,"uname",e.getMessage());
	}
	
	@ExceptionHandler(SigninException.class)
	public ModelAndView signinException(SigninException e,HttpServletRequest request) throws ParseException
	{
		HttpSession ses = request.getSession(false);
		ses.removeAttribute("userName");
		ses.invalidate();
		ModelAndView modelMap = new ModelAndView();
		
		List<LiveBSESensexBO> liveBSEList = icompanyServices.getTickerData();
		modelMap.addObject("LiveBSE", liveBSEList);

		ActiveCompanyListBO activeCompanyListBO =  icompanyServices.getsc_codeBaseCompanyName(LoginController.FIRSTGRAPHCOMPANY);

		modelMap.addObject("FirstCompny", activeCompanyListBO);
		
		Map<String,List<LiveBSESensexBO>> gainerLoserTurnoverMap = icompanyServices.getLiveGainerLosserTurnover();
		LiveBSESensexBO liveBSESensexBO = icompanyServices.getLiveData(LoginController.FIRSTGRAPHCOMPANY);
		
		/*====================================*/
		List<DailyPatternReportBO> dailyPatternReportBOs = icompanyServices.getHilightesCompanyData(LoginController.NUMBEROF_COMPNY_FOR_HIGHLIGHT);
		modelMap.addObject("DailyHighlightDate", dailyPatternReportBOs.get(0).getAudit_date_time());
		modelMap.addObject("DailyHighlight", dailyPatternReportBOs);
		/*====================================*/
		String newsData=iloginService.getNewsData();
		modelMap.addObject("news",newsData);
		
		modelMap.addObject("CompnyLiveBO", liveBSESensexBO);
		modelMap.addObject("userUNSuccessResult", e.getMessage());
		modelMap.addObject("Model",gainerLoserTurnoverMap);
		modelMap.addObject(LoginController.LOGIN);
		return modelMap;
	}

	@ExceptionHandler(SigninExceptionStatic.class)
	public ModelAndView signinExceptionStatic(SigninExceptionStatic e,HttpServletRequest request)
	{
		HttpSession ses = request.getSession(false);
		ses.removeAttribute("userName");
		ses.invalidate();
		return new ModelAndView(LoginController.LOGIN_FIRST_PORTFOLIO,"userUNSuccessResult", e.getMessage());
	}
	
	@ExceptionHandler(UserProfileException.class)
	public ModelAndView userProfileException(UserProfileException exception)
	{
		return new ModelAndView(UNSUCCESSPROFILEUPDATE, "unSuccessProfileUpdate", exception.getMessage());
	}

}
