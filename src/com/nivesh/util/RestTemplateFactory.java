package com.nivesh.util;

import org.springframework.web.client.RestTemplate;

import com.nivesh.service.payment.InstamojoPaymentServiceImpl;

public class RestTemplateFactory implements IRestTemplateFactory,Cloneable {

	private RestTemplate restTemplate;
	private static volatile RestTemplateFactory restTemplateFactory;
	
	private RestTemplateFactory(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;
		
	}
	
	
	
	@Override
	public IRest getRestObject(String str) {
		IRest iRest=null;
		switch(str)
		{
		case "PAYMENT":iRest=new InstamojoPaymentServiceImpl(restTemplate);break;
		
		}
		
		return iRest;
		
	}
	
	public static RestTemplateFactory getInstance(RestTemplate restTemplate){
		if(restTemplateFactory==null){
			synchronized (RestTemplateFactory.class) {
				if(restTemplateFactory==null)
					restTemplateFactory=new RestTemplateFactory(restTemplate){
					
				};
			}
		}	
		
		return restTemplateFactory;
	}
	
	public Object readresolve(){
		return restTemplateFactory;
	}
	
	@Override
	public Object clone() throws CloneNotSupportedException {
		// TODO Auto-generated method stub
		return restTemplateFactory;
	}
	
	
	

}
