package com.nivesh.service.portfolio;

import java.text.ParseException;
import java.util.List;

import com.nivesh.bo.ActiveCompanyListBO;
import com.nivesh.bo.AfterSellBO;
import com.nivesh.bo.BuyStockBO;
import com.nivesh.bo.CapitalgainlossBO;
import com.nivesh.command.portfolio.Portfolicommand;
import com.nivesh.command.portfolio.PortfolioHistorycommand;

public interface IPortfoliodataService {
	public List<BuyStockBO> insert(Portfolicommand portfolicommand, String userName) throws ParseException;

	public int batchInsert(List<BuyStockBO> portfoliobos);
	public List<BuyStockBO> getSellDetails(String userName);

	public List<AfterSellBO> insertsell(Portfolicommand portfolicommand, String userName) throws ParseException;

	public List<BuyStockBO> getSellList(String companyName, String userName);
	public List<ActiveCompanyListBO> getCompanyList(String companyname);


	public int[] getEditList(Portfolicommand portfolicommand, String userName) throws ParseException;

	public int[] getDeleteList(List listofP_id, String userName);


	public List<AfterSellBO> getHistoryData(PortfolioHistorycommand portfolioHistoryCommand, String userName) throws ParseException;

	public List<CapitalgainlossBO> getCapitalData(List<AfterSellBO> portfoliobolist);

	public List<Float> calculateTotalInvest(List<BuyStockBO> portfoliobos);

	public int insertTrendToPortfolio(List<Object> stockListFromTrendToPorfolio,
			String userName) throws ParseException;
	
	
}
