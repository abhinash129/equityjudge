package com.nivesh.service.company;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import com.nivesh.bo.ActiveCompanyListBO;
import com.nivesh.bo.CompanyStockDetailsBO;
import com.nivesh.bo.DailyPatternReportBO;
import com.nivesh.bo.LiveBSESensexBO;
import com.nivesh.command.dashboard.GainerAndLosserCommand;

public interface ICompanyService {
	
	public static final String UNAVAILABLE = "SUGGESTIONS NOT AVAILABLE FOR THIS STOCK";
	public static final String IRREGULAR = "IRREGULAR STOCK :: STAY AWAY";
	public static final String PENNY = "PENNY STOCK :: STAY AWAY";
	public static final String ILLIQUID = "ILLIQUID STOCK :: STAY AWAY";
	public static final String REGULAR = "REGULAR STOCK";
	public static final int IRREGULARITY_DURATION=10;
	public static final int PENNYSTOCK_DURATION=3;
	public static final int WEEK_DURATION=7;
	
	public List<ActiveCompanyListBO> getCompanyList(String companyName);
	public Map<String, Object> getCompanySuggestion(String companyName) throws ParseException;
	public List<List<CompanyStockDetailsBO>> getCompanyMovingAverage(List<String> compnyList, String year, int[] average) throws ParseException;
	public List<ActiveCompanyListBO> getCompanyList();
	public List<DailyPatternReportBO> getLatestPatternReport();
	public List<Object> getCompanyQuotesCalculation(List<List<CompanyStockDetailsBO>> companyMovingAverageList, CompanyStockDetailsBO companyStockDetailsBO);
	public  List<LiveBSESensexBO> getTickerData() throws ParseException;
	
	
	public CompanyStockDetailsBO getlivedataFeeds(String compnyName) throws ParseException;
	public List<LiveBSESensexBO> getDataForBanners(List<String> compnyList) throws ParseException;
	public List<String> getCompanyForTicker();
	public LiveBSESensexBO getLiveData(String firstgraphcompany) throws ParseException;
	public List<DailyPatternReportBO> getHilightesCompanyData(int numberofCompany);
	public Map<String, List<LiveBSESensexBO>> getLiveGainerLosserTurnover();
	public Map<String, List<DailyPatternReportBO>> getHighLight();
	public Map<String, Object> getWholeGainerLoser(GainerAndLosserCommand gainerAndLosserCommand);
	public List<LiveBSESensexBO> getnewlyaddedcompany();
	public ActiveCompanyListBO getsc_codeBaseCompanyName(String companyName);
}
