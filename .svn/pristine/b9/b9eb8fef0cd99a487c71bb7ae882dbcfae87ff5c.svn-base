package com.nivesh.controller.portfolio;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nivesh.bo.AfterSellBO;
import com.nivesh.bo.BuyStockBO;
import com.nivesh.bo.CapitalgainlossBO;
import com.nivesh.bo.LiveBSESensexBO;
import com.nivesh.bo.UserSessionBO;
import com.nivesh.command.portfolio.Portfolicommand;
import com.nivesh.command.portfolio.PortfolioHistorycommand;
import com.nivesh.service.company.ICompanyService;
import com.nivesh.service.portfolio.IPortfoliodataService;

@Controller
@RequestMapping("/companydatas")
public class PortfolioHomeController {

	public static final String PORTFOLIOHOME="portfolioHome", SELLINGLIST="SellingShare", PORTFOLIO_HISTORY="portfolio_history";

	@Inject
	ICompanyService iCompanyService;

	public void setiCompanyService(ICompanyService iCompanyService) {
		this.iCompanyService = iCompanyService;
	}


	@Inject
	IPortfoliodataService iPortfoliodataService;

	public void setiPortfoliodataService(IPortfoliodataService iPortfoliodataService) {
		this.iPortfoliodataService = iPortfoliodataService;
	}


	/**
	 * PREPARED BY :SANDEEP KUMAR
	 * NAME        :GET  DATA FOR SELL
	 * PURPOSE     :TO RETURN JSP PAGE WHICH DISPLAY ALL COMPANY RECORD  FOR SELL
	 * @throws ParseException 
	 * */
	@RequestMapping(value = "/portfoliohome", method = RequestMethod.GET)
	public  String sellhome(HttpServletRequest request, ModelMap map) throws ParseException {
		HttpSession ses = request.getSession(false);
		List<BuyStockBO> portfoliobos;
		TreeMap<Float,String> topgain_loss=new TreeMap<>();
		float networth=0;
		UserSessionBO usSessionBO =  (UserSessionBO) ses.getAttribute("sessionBO");
		String userName = usSessionBO.getUserName();
		portfoliobos=iPortfoliodataService.getSellDetails(userName);
		//here changes
		List<Float> totalinvestment = iPortfoliodataService.calculateTotalInvest(portfoliobos);
		List<LiveBSESensexBO> liveBSEList = iCompanyService.getTickerData();
        map.addAttribute("BSESensexValue" ,liveBSEList.get(liveBSEList.size()-1));
		map.addAttribute("investment", totalinvestment.get(0));
		map.addAttribute("overallGainLoss", totalinvestment.get(1));
		map.addAttribute("latestValue", totalinvestment.get(2));
		
		
		//here from 29-apr-2016
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



		map.addAttribute("sell_data",portfoliobos);
		return PORTFOLIOHOME;
	}
	/**
	 * PREPARED BY :SANDEEP KUMAR
	 * NAME        :GET PARTICULAR COMPANY FOR SELL AFTER CLICKING ON SELL BUTTON
	 * PURPOSE     :TO RETURN THE JSP PAGE CONTAIN PARTICULAR COMPANY FOR SELL AFTER CLICKING ON SELL BUTTON
	 * */

	@RequestMapping(value = "/selling", method = RequestMethod.POST)
	public  String getSellByNames(@RequestParam(value = "companyName",required=true) String companyName,HttpServletRequest request,ModelMap map) {
		HttpSession ses = request.getSession(false);

		UserSessionBO usSessionBO =  (UserSessionBO) ses.getAttribute("sessionBO");
		String userName = usSessionBO.getUserName();
		List<BuyStockBO> sellList=iPortfoliodataService.getSellList(companyName,userName);
		map.addAttribute("sellinglist",sellList);
		return SELLINGLIST;
	}   

	@RequestMapping(value = "/editing", method = RequestMethod.POST)
	public @ResponseBody List<BuyStockBO> geteditByNames(@RequestParam(value = "companyName",required=true) String companyName,HttpServletRequest request,ModelMap map) {
		HttpSession ses = request.getSession(false);


		UserSessionBO usSessionBO =  (UserSessionBO) ses.getAttribute("sessionBO");
		String userName = usSessionBO.getUserName();
		List<BuyStockBO> sellList=iPortfoliodataService.getSellList(companyName,userName);
		return sellList;
	} 

	/**
	 * PREPARED BY :JITENDRA KUMAR
	 * NAME        :TO  EDIT THE LIST WHICH IS ALREADY ADDED
	 * PURPOSE     :TO RETURN THE JSP PAGE CONTAIN PARTICULAR COMPANY WHICH IS MODIFIED
	 * @throws ParseException 
	 * @throws java.text.ParseException 
	 * */

	@RequestMapping(value = "/editStock", method = RequestMethod.POST)
	public  String getEditByNames(@Valid @ModelAttribute("portfolicommand") Portfolicommand portfolicommand,ModelMap modelMap,BindingResult bindingResult,HttpServletRequest request,ModelMap map ) throws ParseException, java.text.ParseException {
		if (bindingResult.hasErrors()) {
			//modelMap.addAttribute("listInfo", new Portfolicommand());
			modelMap.addAttribute("listInfo","Your Stock Updated Successfully");
			return PORTFOLIOHOME;
		}else{
			HttpSession ses = request.getSession(false);
			UserSessionBO usSessionBO =  (UserSessionBO) ses.getAttribute("sessionBO");
			String userName = usSessionBO.getUserName();
			List<BuyStockBO> portfoliobos=null;
			int[] editList=iPortfoliodataService.getEditList(portfolicommand,userName);
			portfoliobos=iPortfoliodataService.getSellDetails(userName);
			map.addAttribute("sell_data",portfoliobos);
			List<Float> totalinvestment = iPortfoliodataService.calculateTotalInvest(portfoliobos);
			map.addAttribute("investment", totalinvestment.get(0));
			map.addAttribute("overallGainLoss", totalinvestment.get(1));
			map.addAttribute("latestValue", totalinvestment.get(2));
			
			List<LiveBSESensexBO> liveBSEList = iCompanyService.getTickerData();
	        map.addAttribute("BSESensexValue" ,liveBSEList.get(liveBSEList.size()-1));
			TreeMap<Float,String> topgain_loss=new TreeMap<>();
			float networth=0;
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




			if(editList!=null){
				map.addAttribute("listInfo","Your Stock Updated Successfully");
				return PORTFOLIOHOME;
			}else{
				map.addAttribute("listInfo","Your Stock Not Updated");
				return PORTFOLIOHOME;
			}
		}
		//return EDITINGLIST;
	}   
	/**
	 * PREPARED BY :JITENDRA KUMAR
	 * NAME        :TO  DELETE THE LIST WHICH IS ALREADY ADDED
	 * PURPOSE     :TO RETURN THE JSP PAGE CONTAIN PARTICULAR COMPANY WHICH IS DELETED
	 * @throws ParseException 
	 * */

	@RequestMapping(value = "/deleting", method = RequestMethod.GET)
	public  String  getDeleteByNames(@RequestParam(value = "listofP_id",required=true) List<?> listofP_id,HttpServletRequest request,ModelMap map) throws ParseException {
		HttpSession ses = request.getSession(false);
		//System.out.println("listofP_id "+listofP_id);
		UserSessionBO usSessionBO =  (UserSessionBO) ses.getAttribute("sessionBO");
		String userName = usSessionBO.getUserName();
		List<BuyStockBO> portfoliobos=null;
		int deleteList[]=iPortfoliodataService.getDeleteList(listofP_id,userName);
		portfoliobos=iPortfoliodataService.getSellDetails(userName);
		map.addAttribute("sell_data",portfoliobos);
		List<Float> totalinvestment = iPortfoliodataService.calculateTotalInvest(portfoliobos);
		map.addAttribute("investment", totalinvestment.get(0));
		map.addAttribute("overallGainLoss", totalinvestment.get(1));
		map.addAttribute("latestValue", totalinvestment.get(2));
		List<LiveBSESensexBO> liveBSEList = iCompanyService.getTickerData();
        map.addAttribute("BSESensexValue" ,liveBSEList.get(liveBSEList.size()-1));
		TreeMap<Float,String> topgain_loss=new TreeMap<>();
		float networth=0;
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

		if(deleteList!=null){
			map.addAttribute("listInfo","Your Stock Deleted Successfully");
		}else{
			map.addAttribute("listInfo","Your Stock Not Deleted");
		}
		return PORTFOLIOHOME;

	}   

	@RequestMapping(value = "/getHistoryData", method = RequestMethod.POST)
	public  String getPortfolioHistoryData(@ModelAttribute PortfolioHistorycommand portfolioHistoryCommand,HttpServletRequest request,ModelMap map) throws ParseException {
		HttpSession ses = request.getSession(false);

		UserSessionBO usSessionBO =  (UserSessionBO) ses.getAttribute("sessionBO");
		String userName = usSessionBO.getUserName();
		List<AfterSellBO> portfoliobost=iPortfoliodataService.getHistoryData(portfolioHistoryCommand,userName);
		map.addAttribute("sell_data", portfoliobost);

		

		List<CapitalgainlossBO> capitalbolist=	iPortfoliodataService.getCapitalData(portfoliobost);
		map.addAttribute("capital", capitalbolist);



		return SellStockController.SELLSTOCK;  
	}



	@RequestMapping(value = "/Portfolio_history", method = RequestMethod.GET)
	public  String getPortfolioHistory(HttpServletRequest request,ModelMap map) {
		return PORTFOLIO_HISTORY;
	}   


}
