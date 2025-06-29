package com.nivesh.service.login;

import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nivesh.bo.NewsBO;
import com.nivesh.bo.ReviewBO;
import com.nivesh.bo.UserLogBO;
import com.nivesh.bo.UserLogHistoryBO;
import com.nivesh.bo.UserMstrBO;
import com.nivesh.command.login.LoginCommand;
import com.nivesh.dao.login.IDBLoginDao;
import com.nivesh.service.userprofile.IUserProfileService;
import com.nivesh.util.ApplicationConstant;
import com.nivesh.util.DateHelper;
import com.nivesh.util.IEncryptDecryptServices;

@Service
@Transactional
public class LoginServiceImpl implements ILoginService{

	@Resource(name="dbLoginDaoImpl")
	private IDBLoginDao idbLoginDao;

	public void setIdbLoginDao(IDBLoginDao idbLoginDao) {
		this.idbLoginDao = idbLoginDao;
	}

	@Autowired
	private IUserProfileService iUserProfileService;

	@Autowired
	IEncryptDecryptServices iEncryptDecryptServices;

	/**
	 * NAME :SIGNIN VALIDATION PERPOSE :USERNAME & PASSWORD VERIFICATION
	 */
	@Override
	public String checkUserName_pswd(LoginCommand loginCommand) {

		UserLogBO userLogBO = null;
		userLogBO = new UserLogBO();
		userLogBO.setUname(loginCommand.getUserName());
		//userLogBO.setPassword(loginCommand.getPassword());
		try {
			userLogBO.setPassword(iEncryptDecryptServices.encrypt(loginCommand.getPassword()));
		} catch (Exception e) {
			System.out.println("Encryption Exception:---"+e);
		}


		List<UserLogBO> list = idbLoginDao.isUName_Pswd_Authenticate(userLogBO);

		String returnMsg=null;

		if (list.size()!=0) {

			if (!list.get(0).getSubscription().equals(ApplicationConstant.ADMIN_ROLE) && !list.get(0).getSubscription().equals(ApplicationConstant.OFFICE_ROLE)) {

				//THIS IS FOR CHECKING SUBSCRIPTION TIME VALIDATION
				/*				long remain_day = subscriptionValidation(list.get(0));
				if (!(remain_day<=0)) {
					returnMsg="1##"+list.get(0).getSubscription()+"##"+remain_day+"##"+list.get(0).getFirst_Login()+"##1";
				}
				else{
					returnMsg="1##"+list.get(0).getSubscription()+"##"+remain_day+"##"+list.get(0).getFirst_Login()+"##0";
				}
				 */
				returnMsg="1##"+list.get(0).getSubscription()+"##"+1+"##"+list.get(0).getFirst_Login()+"##1";
				return returnMsg;
			}
			returnMsg="1##"+list.get(0).getSubscription()+"##"+list.get(0).getDuration()+"##"+list.get(0).getFirst_Login()+"##1";
			return returnMsg;
		}
		returnMsg="0##NULL##NULL##0";
		return returnMsg;

	}


	private long subscriptionValidation(UserLogBO userLogBO) {
		long days = 0;
		String duration = userLogBO.getDuration();
		int durationTime = Integer.parseInt(duration.replaceAll("\\D+",""));
		//String durationLable = duration.substring(2);
		String durationLable = justAlphaChars(duration);
		//int durationTime= Integer.parseInt(duration.substring(0, 1));
		//System.out.println("Durationi Time :"+durationTime);
		//System.out.println("Durationi Label :"+durationLable);

		if (durationLable.equals("Days")) {
			days = durationTime;
		}else if (durationLable.equals("Week")) {
			days = 7*durationTime;
		}else if (durationLable.equals("Month")) {
			days = 30*durationTime;
		}

		Date  date = null;

		if (userLogBO.getSubscription().equals(ApplicationConstant.FIRSTSUBSCRIPTION)) {
			date = userLogBO.getReg_date();	
		}
		if (userLogBO.getSubscription().equals(ApplicationConstant.PAIDSUBSCRIPTION)) {
			date = userLogBO.getPayment_date();
		}
		long diff = Math.abs(date.getTime() - DateHelper.todaysDateTimeInDBFormat().getTime());
		long diffDays = diff / (24 * 60 * 60 * 1000);
		long remain_days = days-diffDays;
		return remain_days;

	}


	public static String justAlphaChars(String text) {
		StringBuilder builder = new StringBuilder();
		for (char ch : text.toCharArray()) 
			if (Character.isAlphabetic(ch)) 
				builder.append(ch);
		return builder.toString();
	}


	@Override
	public String getNewsData() {

		List<NewsBO> newsList;
		StringBuffer buffer=null;
		newsList= idbLoginDao.getNews();
		buffer=new StringBuffer();
		boolean flag=true;
		for (NewsBO newsBO : newsList) {
			if(flag){
				buffer.append(newsBO.getSubject());
				flag=false;
				continue;
			}	

			buffer.append(" | ").append(newsBO.getSubject());

		}
		return buffer.toString();

	}


	@Override
	public void insertLoginHistoiry(String isLoginSuccess, String remoteAddr, String systemname) {
		UserLogHistoryBO loghistory=null;
		loghistory= new UserLogHistoryBO();
		loghistory.setIP_ADDR(remoteAddr);
		loghistory.setSYSTEM_NAME(systemname);
		loghistory.setUNAME(isLoginSuccess);
		Date date=DateHelper.todaysDateTimeInDBFormat();
		loghistory.setLAST_LOGIN_DATE_TIME(date);
		int result=idbLoginDao.username(loghistory);
		if(result>0){
			idbLoginDao.updateloghistory(loghistory);
		}else{
			idbLoginDao.userloghistory(loghistory);
		}
	}


	@Override
	public List<UserMstrBO> checkUserName_pswd_beforeLogin(LoginCommand logincommand) {
		UserLogBO userLogBO = null;
		userLogBO = new UserLogBO();
		userLogBO.setUname(logincommand.getUserName());


		//userLogBO.setPassword(loginCommand.getPassword());


		try {
			userLogBO.setPassword(iEncryptDecryptServices.encrypt(logincommand.getPassword()));
		} catch (Exception e) {
			System.out.println("Encryption Exception:---"+e);
		}

		List<UserLogBO> list = idbLoginDao.isUName_Pswd_Authenticate(userLogBO);


		if(list==null)
		{
			return null;
		}else{
			List<UserMstrBO> userInfo = iUserProfileService.listof_UserSpecific_Info(logincommand.getUserName());
			if(userInfo!=null)
			{
				return userInfo;
			}
			else{
				return null;
			}
		}


	}


	// This is For Update subscription After Payment SuccessFull
	@Override
	public int updateSubscription(String duration,String uname) {

		UserLogBO userLogBO=new UserLogBO();

		userLogBO.setUname(uname);
		userLogBO.setPayment_date(DateHelper.todaysDateTimeInDBFormat());

		userLogBO.setAudit_date_time(DateHelper.todaysDateTimeInDBFormat());
		userLogBO.setAudit_action(ApplicationConstant.AUDIT_ACTION_UPDATE);
		userLogBO.setActive(ApplicationConstant.ACTIVE);

		if (duration.equals(ApplicationConstant.AFTER_REFUND_DURATION)) {
			userLogBO.setSubscription(ApplicationConstant.FIRSTSUBSCRIPTION);
			userLogBO.setDuration(duration);
		} else {
			List<UserLogBO> listofBo = idbLoginDao.checkingSubscriptionAvability(uname,ApplicationConstant.PAIDSUBSCRIPTION);
			if (listofBo.size()==0) {
				userLogBO.setSubscription(ApplicationConstant.PAIDSUBSCRIPTION);
				userLogBO.setDuration(duration);
			} else {

				userLogBO.setSubscription(ApplicationConstant.PAIDSUBSCRIPTION);
				long remain_days = calculateRemainDays(listofBo.get(0).getDuration(), listofBo.get(0).getPayment_date());
				//System.out.println("Remain Days : "+remain_days);

				long subscribe_days = calculateRemainDays(duration, userLogBO.getPayment_date());
				//System.out.println("Subscribe Days : "+subscribe_days);

				long final_days = remain_days+subscribe_days;
				//System.out.println("Final Days : "+final_days);

				String final_duration = final_days+" Days";

				userLogBO.setDuration(final_duration);

			}
		}
		return idbLoginDao.updateSubscription(userLogBO);
	}

	public long calculateRemainDays(String duration, Date date){

		long days = 0;

		/*String durationLable = duration.substring(2);
		int durationTime= Integer.parseInt(duration.substring(0, 1));
		 */

		int durationTime = Integer.parseInt(duration.replaceAll("\\D+",""));
		String durationLable = justAlphaChars(duration);

		if (durationLable.equals("Days")) {
			days = durationTime;
		}else if (durationLable.equals("Week")) {
			days = 7*durationTime;
		}else if (durationLable.equals("Month")) {
			days = 30*durationTime;
		}


		long diff = Math.abs(date.getTime() - DateHelper.todaysDateTimeInDBFormat().getTime());
		long diffDays = diff / (24 * 60 * 60 * 1000);
		long remain_days = days-diffDays;

		return remain_days;

	}


	@Override
	public List<String> getLoginAddress(HttpServletRequest httpServletRequest) throws UnknownHostException {

		List<String> listofInfo =  new ArrayList<>();

		String computerName = java.net.InetAddress.getLocalHost().getCanonicalHostName();
		String ipAddress = httpServletRequest.getRemoteAddr();

		//		System.out.println("Ip Address : "+ipAddress+", System Name : "+computerName);

		listofInfo.add(ipAddress);
		listofInfo.add(computerName);
		return listofInfo;
	}


	@Override
	public int insertreview(String userReview, String remoteaddress) {

		ReviewBO  reviewbolist = new ReviewBO();
		reviewbolist.setIpaddress(remoteaddress);
		reviewbolist.setReview(userReview);
		reviewbolist.setAudit_action(ApplicationConstant.AUDIT_ACTION_INSERT);
		reviewbolist.setAudit_date_time(new Date());
		int i = 0;
		ReviewBO dbReviewBO=  idbLoginDao.getreviewdata(remoteaddress);
		
		if(dbReviewBO.getIpaddress() == null){
			i = idbLoginDao.insertreview(reviewbolist);
		}else{
			if (!dbReviewBO.getReview().equals(userReview)) {
			reviewbolist.setAudit_action(ApplicationConstant.AUDIT_ACTION_UPDATE);
			i = idbLoginDao.updateReviewdata(reviewbolist);
			}
		}
		return i;
	}

}
