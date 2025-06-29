package com.nivesh.controller.watchlist;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nivesh.bo.ActiveCompanyListBO;
import com.nivesh.bo.LiveBSESensexBO;
import com.nivesh.bo.UserSessionBO;
import com.nivesh.bo.WatchListBO;
import com.nivesh.service.company.ICompanyService;
import com.nivesh.service.watchlist.IWatchListService;

@Controller
@RequestMapping("/watchlist")
public class WatchListController {

	public static final String WATCHLISTHOME="watchlisthome";
	@Autowired	
	ICompanyService icompanyService;

	@Autowired
	IWatchListService iWatchListService;
	
	@RequestMapping(value="/dropdown", method=RequestMethod.POST)
	public @ResponseBody List<ActiveCompanyListBO> getCompanyForDropDown(@RequestParam String companyName){
		List<ActiveCompanyListBO> companyNameList = null;
		companyNameList=iWatchListService.getCompanyDropDown(companyName);
		return companyNameList;
		
	}
	
	/**
	 * Function : To add  stocks in watchlist
	 * @param companyName
	 * @param companyCode
	 * @param modelMap
	 * @param request
	 * @return integer
	 */
	@RequestMapping(value="/addwatchlist" , method=RequestMethod.POST)
	public @ResponseBody int WatchList(@RequestParam String companyName,@RequestParam String companyCode, ModelMap modelMap,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		UserSessionBO sessionBO = (UserSessionBO) session.getAttribute("sessionBO");
		WatchListBO watchListBO=null;
		watchListBO = new WatchListBO();
		String userID = sessionBO.getUserName();
		watchListBO.setCompany_code(Integer.parseInt(companyCode));
		watchListBO.setCompany_name(companyName);
		int i=iWatchListService.addToWatchList(watchListBO,userID);
		return i;
		
	}
	
	
	/**
	 * Purpose : FOR DISPLAYING WATCHLIST PAGE
	 * @param modelMap
	 * @param request
	 * @return String
	 * @throws ParseException
	 */
	
	@RequestMapping(value="/watchlisthome", method=RequestMethod.GET)
	public String WatchListHome(ModelMap modelMap, HttpServletRequest request) throws ParseException{
		HttpSession session = request.getSession(false);
		UserSessionBO sessionBO = (UserSessionBO) session.getAttribute("sessionBO");
		List<WatchListBO> watchList = null;
		watchList=iWatchListService.getWatchList(sessionBO.getUserName());
		
		List<LiveBSESensexBO> liveBSEList = icompanyService.getTickerData();
		modelMap.addAttribute("WatchList", watchList);
		modelMap.addAttribute("BSESensexValue" ,liveBSEList.get(liveBSEList.size()-1));
		return WATCHLISTHOME;
	}



	
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public @ResponseBody int DeleleWatchList(@RequestParam String companyCode, HttpServletRequest servletRequest,ModelMap modelMap) throws ParseException{
		List<WatchListBO> watchListAftrDelt = null;
		int deleteStatus;
		HttpSession ses = servletRequest.getSession(false);
		UserSessionBO userSessionBO =  (UserSessionBO) ses.getAttribute("sessionBO");
		String userId = userSessionBO.getUserName();
		deleteStatus=iWatchListService.deleteWatchList(Integer.parseInt(companyCode),userId);
		watchListAftrDelt=iWatchListService.getWatchList(userId);
		List<LiveBSESensexBO> liveBSEList = icompanyService.getTickerData();
		modelMap.addAttribute("WatchList", watchListAftrDelt);
		modelMap.addAttribute("BSESensexValue" ,liveBSEList.get(liveBSEList.size()-1));
		return deleteStatus;
		
	}
}
