package com.nivesh.dao.wachlist;

import java.util.List;

import com.nivesh.bo.ActiveCompanyListBO;
import com.nivesh.bo.DailyPatternReportBO;
import com.nivesh.bo.WatchListBO;
import com.nivesh.dao.IDao;

public interface IWatchListDao extends IDao{


	public int find(int companyCode, String userID);

	public List<WatchListBO> findAll(String userID);


	public int delete(int companyCode, String userId);

	
	public List<WatchListBO> getWatchListByUserId(String userID, int company_code);

	public List<DailyPatternReportBO> find(String company_name);

	public List<ActiveCompanyListBO> findCompanyDropDown(String companyName);
	



}
