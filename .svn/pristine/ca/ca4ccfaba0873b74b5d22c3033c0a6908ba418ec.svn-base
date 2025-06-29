package com.nivesh.controller.portfolio;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nivesh.bo.ActiveCompanyListBO;
import com.nivesh.bo.BuyStockBO;
import com.nivesh.bo.LiveBSESensexBO;
import com.nivesh.bo.UserSessionBO;
import com.nivesh.command.portfolio.Portfolicommand;
import com.nivesh.service.company.ICompanyService;
import com.nivesh.service.portfolio.IPortfoliodataService;

@Controller
@RequestMapping("/companydata")
public class BuyStockController {

	public static final String BUYSTOCK="CompanySearch",PORTFOLIODEMOHOME="portfoliodemohome",PORTFOLIODEMO="portfoliodemo" ;

	@Inject
	IPortfoliodataService iPortfoliodataService;

	@Autowired
	ICompanyService iCompanyService;
	
	public void setiPortfoliodataService(IPortfoliodataService iPortfoliodataService) {
		this.iPortfoliodataService = iPortfoliodataService;
	}

	@RequestMapping(value = "/companydatasearch", method = RequestMethod.GET)
	public String inserthome(HttpServletRequest request) {
		return BUYSTOCK;
	}


	@RequestMapping(value = "/portfoliodemo", method = RequestMethod.GET)
	public String portfolioDemo(HttpServletRequest request) {
		return PORTFOLIODEMO;
	}

	/**
	 * PREPARED BY :SANDEEP KUMAR
	 * NAME        :GET COMPANY NAME
	 * PURPOSE     :TO GET COMPANY LIST AFTER SEARCHING WITH SOME INITIAL CHARACTER
	 * */
	@RequestMapping(value = "/data", method = RequestMethod.POST)
	public @ResponseBody List<ActiveCompanyListBO> getCompanyName(@RequestParam String companyName) {
		List<ActiveCompanyListBO> companyNameList = null;

		companyNameList=iPortfoliodataService.getCompanyList(companyName);
		return companyNameList;

	}

	/**
	 * PREPARED BY :SANDEEP KUMAR
	 * NAME        :ADD THE STOCK FOR BUY AND THEN GET CALCULATED DATA 
	 * PURPOSE     :TO GET LIST OF BUYSTOCK WITH CALULATED DATA
	 * */

	@RequestMapping(value = "/directAddStocks", method = RequestMethod.POST)
	public @ResponseBody int TrendToPoprtfolioAddStock(@RequestParam List<Object> stockListFromTrendToPorfolio,HttpServletRequest request, ModelMap map) throws ParseException {
		HttpSession ses = request.getSession(false);
		UserSessionBO usSessionBO =  (UserSessionBO) ses.getAttribute("sessionBO");
		String userName = usSessionBO.getUserName();
		int i = iPortfoliodataService.insertTrendToPortfolio(stockListFromTrendToPorfolio,userName);
		return i;
	}
		
	@RequestMapping(value = "/addstock", method = RequestMethod.POST)
	public  String getStock(@Valid @ModelAttribute Portfolicommand portfolicommand,BindingResult bindingResult,HttpServletRequest request, ModelMap map) throws ParseException {
		HttpSession ses = request.getSession(false);
		if(bindingResult.hasErrors())  //this i add 29 jan
		{  
			return BUYSTOCK;
		}
		else{	
			List<BuyStockBO> portfoliobos = null;
			UserSessionBO usSessionBO =  (UserSessionBO) ses.getAttribute("sessionBO");
			String userName = usSessionBO.getUserName();
			
			portfoliobos = iPortfoliodataService.insert(portfolicommand,userName);
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
				networth=networth+portfoliobos.get(i).getBuy_value();

			}

			if (topgain_loss.isEmpty()) {

				map.addAttribute("top_gainer_company","No Gainers");
				map.addAttribute("top_losser_company","No Looser");
			} else {
				List<LiveBSESensexBO> livedataPortfolioComp=null;
				List<String> bseSensexBOs=new ArrayList<>();
				if (topgain_loss.lastKey() >= 0) {
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
			return "redirect:/companydatas//portfoliohome"; 
		}//else

	}

    

}
