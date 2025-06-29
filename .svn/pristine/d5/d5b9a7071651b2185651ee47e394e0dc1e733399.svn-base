package com.nivesh.dao.login;

import java.util.List;

import com.nivesh.bo.ReviewBO;
import com.nivesh.bo.UserLogBO;
import com.nivesh.bo.UserLogHistoryBO;
import com.nivesh.dao.IDao;

public interface IDBLoginDao extends IDao{
	
	public List getNews();
	public List<UserLogBO> isUName_Pswd_Authenticate(UserLogBO userLogBO);
	
	public  int userloghistory(UserLogHistoryBO userLogHistoryBO);
	public int username(UserLogHistoryBO loghistory);
	public int updateloghistory(UserLogHistoryBO userLogHistoryBO);
	public int updateSubscription(UserLogBO userLogBO);
	public List<UserLogBO> checkingSubscriptionAvability(String uname, String paidsubscription);	
	public int insertreview(ReviewBO reviewbolist);
	public ReviewBO getreviewdata(String remoteaddress);
	public int updateReviewdata(ReviewBO reviewbolist);
	
}
