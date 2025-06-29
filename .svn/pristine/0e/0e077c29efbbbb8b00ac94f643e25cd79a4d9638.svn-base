package com.nivesh.controller.portfolio;

import java.text.ParseException;
import java.util.List;

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

import com.nivesh.bo.AfterSellBO;
import com.nivesh.bo.CapitalgainlossBO;
import com.nivesh.bo.UserSessionBO;
import com.nivesh.command.portfolio.Portfolicommand;
import com.nivesh.service.portfolio.IPortfoliodataService;

@Controller
@RequestMapping("/companydatas1")
public class SellStockController {

	public static final String SELLSTOCK="Sellportfoliodata";

	/*@Inject
	ICompanyDataService iDataService;
	public void setiDataService(ICompanyDataService iDataService) {
		this.iDataService = iDataService;
	}
	 */
	@Inject
	IPortfoliodataService iPortfoliodataService;

	public void setiPortfoliodataService(IPortfoliodataService iPortfoliodataService) {
		this.iPortfoliodataService = iPortfoliodataService;
	}
	/**
	 * PREPARED BY :SANDEEP KUMAR
	 * NAME        :AFTER SELL STOCK PROCESS
	 * PURPOSE     :TO RETURN THE JSP PAGE  CONTAIN ALL COMPANY WITH CALCULATION WHICH ARE SELLED ALREADY 
	 * */


	@RequestMapping(value = "/sellstock",method=RequestMethod.POST)
	public String sellstock(@Valid @ModelAttribute Portfolicommand portfolicommand,BindingResult bindingResult,HttpServletRequest request,ModelMap map) throws ParseException {
		HttpSession ses = request.getSession(false);

		if(bindingResult.hasErrors())  //this i add 29 jan
		{  

			return "redirect:/companydatas/sell";
		}
		else{

			List<AfterSellBO> portfoliobos = null;
			
			UserSessionBO usSessionBO =  (UserSessionBO) ses.getAttribute("sessionBO");
			String userName = usSessionBO.getUserName(); //27 jan

			portfoliobos = iPortfoliodataService.insertsell(portfolicommand,userName);

			// from here on 4feb
			if(portfoliobos.isEmpty())
			{     
				return "redirect:/companydatas/sell";
			}
			//till here 4feb	

			map.addAttribute("sell_data", portfoliobos);
			
			List<CapitalgainlossBO> capitalbolist=	iPortfoliodataService.getCapitalData(portfoliobos);
			map.addAttribute("capital", capitalbolist);

			return SELLSTOCK;  
		}


	}        


}
