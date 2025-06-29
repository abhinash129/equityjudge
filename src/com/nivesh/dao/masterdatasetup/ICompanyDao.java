package com.nivesh.dao.masterdatasetup;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.nivesh.bo.ActiveCompanyListBO;
import com.nivesh.bo.CompanyStockDetailsBO;
import com.nivesh.bo.DailyPatternReportBO;
import com.nivesh.bo.GainerLoserBO;
import com.nivesh.bo.LiveBSESensexBO;
import com.nivesh.bo.UserLogHistoryBO;
import com.nivesh.dao.IDao;

public interface ICompanyDao extends IDao{
	
	public Set<CompanyStockDetailsBO> getCompanyList(String companyName);


	public List<DailyPatternReportBO> getLatestPatternReport();
	public List<ActiveCompanyListBO> getCompanyNameList(String companyname);
	public List<ActiveCompanyListBO> getCompanyList();
	public List<ActiveCompanyListBO> getCompanyData(String companyname);

	public CompanyStockDetailsBO getLiveDataDAO(String companyName);

	public List<String> getCompnyListsForTicker();

	public Map<String, Object> getCompanySuggestion(String companyName);

	public List<DailyPatternReportBO> getHilightesCompanyDataReport(int numberofCompany);


	public List<LiveBSESensexBO> getGainerLoserTurnover();
	public List<DailyPatternReportBO> getHighLights();


	public List<GainerLoserBO> getGainerOrLoserValue(String duration, String orderBy, int start_price, int end_price,
			int limit);

   public List<LiveBSESensexBO> getnewlyaddedcompany();


public ActiveCompanyListBO getdetailsBaseCompanyName(String companyName);

}
