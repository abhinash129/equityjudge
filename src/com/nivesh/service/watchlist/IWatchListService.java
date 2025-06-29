package com.nivesh.service.watchlist;

import java.util.List;

import com.nivesh.bo.ActiveCompanyListBO;
import com.nivesh.bo.WatchListBO;

public interface IWatchListService {

	public int addToWatchList(WatchListBO watchListBO, String userName);

	public List<WatchListBO> getWatchList(String userName);

	public int deleteWatchList(int companyCode, String userId);

	public List<ActiveCompanyListBO> getCompanyDropDown(String companyName);

	

}
