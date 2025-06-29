package com.nivesh.dao.dashboard;

import java.util.List;
import java.util.Map;

import com.nivesh.bo.AccuracyBO;
import com.nivesh.bo.ContactUsBO;
import com.nivesh.bo.CustomPriceBO;
import com.nivesh.bo.EmailBO;
import com.nivesh.bo.UserLogBO;
import com.nivesh.dao.IDao;

public interface IDBDashboardDao extends IDao {

	public List<Integer> getPriceDao();

	public int contactUs(ContactUsBO contactUsBO);

	public List<CustomPriceBO> getCustomPrice();
     
	public List<Map<String, Object>> forgotPassword(UserLogBO userLogBO);

	public int changePassword(String username, String old_password, String new_password);

	public EmailBO getSenderEmailId();

	public String getReciverMailID();
	public List<AccuracyBO> getAccuracyList();

}
