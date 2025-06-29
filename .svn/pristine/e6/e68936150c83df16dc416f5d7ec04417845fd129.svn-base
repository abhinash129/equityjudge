package com.nivesh.service.dashboard;

import java.util.List;

import com.nivesh.bo.AccuracyBO;
import com.nivesh.command.dashboard.ContactUsCommand;

public interface IDashboardServices {

	 public List<Integer> getPrice();

	public int contactUs(ContactUsCommand contactUsCommand);

	public int calculatePrice(List<String> priceSelection);

	public int submitFeedback(String name, String email, String category, String message);
	
	public int forgotPassword(String username,String email);

	public int changePassword(String username, String old_password, String new_password);
    
	public List<AccuracyBO> getaccuracyList();

}
