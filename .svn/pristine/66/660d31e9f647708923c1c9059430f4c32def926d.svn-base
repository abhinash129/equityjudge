package com.nivesh.controller.masterdatasetup;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nivesh.bo.CustomPriceBO;
import com.nivesh.service.masterdatasetup.ISubscriptionPriceService;

@Controller
@RequestMapping("/price")
public class SubscriptionPriceController {
	
	public static final String SUBSCRIPTIONPRICE="SubscriptionPriceHome";
	
	@Inject
	ISubscriptionPriceService iSubscriptionPriceService;
	public void setiSubscriptionPriceService(ISubscriptionPriceService iSubscriptionPriceService) {
		this.iSubscriptionPriceService = iSubscriptionPriceService;
	}
	
	
	@RequestMapping(value="/home",method=RequestMethod.GET)
	public String priceHomePage(ModelMap map,HttpServletRequest request){
				List<CustomPriceBO> PriceList = null;
					PriceList = iSubscriptionPriceService.getallprice();
				   map.addAttribute("PriceList", PriceList);
				   return SUBSCRIPTIONPRICE;
	}	
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updatePrice(ModelMap map){
		   return SUBSCRIPTIONPRICE;
	}

}
