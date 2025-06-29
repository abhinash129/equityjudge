package com.nivesh.service.signup;

import com.nivesh.command.signup.SignupCommand;

public interface ISignupService{

	 public int checkUserName(String userName);
	 public String userRegistration( SignupCommand signupCommand) ;
	public int checkEmailId(String emailAddress);
	public int checkPhoneId(String phoneNO);
	public int updateEmailId(String email, String uname);
	public int updatePhoneNo(String mobile, String uname);
	String guestUserRegistration(SignupCommand signupCommand);

}
