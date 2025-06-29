package com.nivesh.service.watchlist;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nivesh.bo.ActiveCompanyListBO;
import com.nivesh.bo.DailyPatternReportBO;
import com.nivesh.bo.WatchListBO;
import com.nivesh.dao.wachlist.IWatchListDao;
import com.nivesh.util.ApplicationConstant;

@Service
public class WatchListServiceImpl implements IWatchListService {

	@Resource
	IWatchListDao iWatchListDao;
	
	
	
	

	@Override
	public List<ActiveCompanyListBO> getCompanyDropDown(String companyName) {
		List<ActiveCompanyListBO> listBO;
		listBO=iWatchListDao.findCompanyDropDown(companyName);
		return listBO;
	}

	@Override
	public int addToWatchList(WatchListBO watchListBO, String userID) {
		int companyExist = iWatchListDao.find(watchListBO.getCompany_code(), userID);

		if (companyExist != 0) {
			return 0;
		} else {
			List<DailyPatternReportBO> companySuggestionList = null;
			companySuggestionList = iWatchListDao.find(watchListBO.getCompany_name());
			watchListBO.setInitiated_date(new Date());
			watchListBO.setSuggestion(companySuggestionList.get(0).getSuggestion());
			watchListBO.setSuggestion_Date(companySuggestionList.get(0).getForming_Date());
			watchListBO.setAudit_action(ApplicationConstant.AUDIT_ACTION_INSERT);
			watchListBO.setStatus(ApplicationConstant.ACTIVE);
			watchListBO.setAudit_date_time(new Date());
			watchListBO.setUser_id(userID);
			iWatchListDao.create(watchListBO);
			return 1;
		}

	}

	@Override
	public List<WatchListBO> getWatchList(String userID) {
		List<WatchListBO> watchListBOList = null;
		watchListBOList = new ArrayList<>();

		List<WatchListBO> companylist = null;
		companylist = new ArrayList<>();

		companylist = iWatchListDao.findAll(userID);

		List<WatchListBO> procedureWatchListBOList = null;

		for (int i = 0; i < companylist.size(); i++) {
			// from here i have to call a method in dao with company code and
			// userID as argument
			procedureWatchListBOList = iWatchListDao.getWatchListByUserId(userID, companylist.get(i).getCompany_code());

			watchListBOList.addAll(procedureWatchListBOList);

		}
		return watchListBOList;
	}


	@Override
	public int deleteWatchList(int companyCode, String userId) {

		return iWatchListDao.delete(companyCode, userId);
	}

}
