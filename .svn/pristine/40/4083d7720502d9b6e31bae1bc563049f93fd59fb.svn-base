package com.nivesh.service.login;

import java.net.UnknownHostException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.nivesh.bo.UserMstrBO;
import com.nivesh.command.login.LoginCommand;

public interface ILoginService {

	public String getNewsData();

	 public String checkUserName_pswd(LoginCommand loginCommand);

	public  void insertLoginHistoiry(String isLoginSuccess, String remoteAddr, String systemname);

	public List<UserMstrBO> checkUserName_pswd_beforeLogin(LoginCommand logincommand);

	public int updateSubscription(String duration, String buyer_userId);

	public List<String> getLoginAddress(HttpServletRequest httpServletRequest) throws UnknownHostException; 
	
	public int insertreview(String userfeedback,String remoteaddress);
		
	

	
	
	 
}
