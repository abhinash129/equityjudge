package com.nivesh.service.portfolio;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nivesh.bo.ActiveCompanyListBO;
import com.nivesh.bo.AfterSellBO;
import com.nivesh.bo.BuyStockBO;
import com.nivesh.bo.CapitalgainlossBO;
import com.nivesh.bo.SellStockBO;
import com.nivesh.command.portfolio.Portfolicommand;
import com.nivesh.command.portfolio.PortfolioHistorycommand;
import com.nivesh.dao.masterdatasetup.ICompanyDao;
import com.nivesh.dao.portfolio.IDBBuyStockDao;
import com.nivesh.dao.portfolio.IDBSellStockDao;
import com.nivesh.util.ApplicationConstant;
import com.nivesh.util.DateHelper;

@Service

public class PortfolioDataServiceImp implements IPortfoliodataService {


	@Resource
	private ICompanyDao iDBCompanyDao;

	public void setiDBCompanyDao(ICompanyDao iDBCompanyDao) {
		this.iDBCompanyDao =iDBCompanyDao;
	}

	@Resource
	private IDBBuyStockDao iDBBuyStockDao ;

	public void setiDBBuyStockDao(IDBBuyStockDao iDBBuyStockDao) {
		this.iDBBuyStockDao =iDBBuyStockDao;
	}

	//this i add 18jan
	@Resource
	private IDBSellStockDao iDBSellStockDao ;

	public void setiDBBuyStockDao(IDBSellStockDao iDBSellStockDao) {
		this.iDBSellStockDao =iDBSellStockDao;
	}


	//till here

	/**
	 * PREPARED BY :SANDEEP KUMAR
	 * NAME        :FOR INSERTING THE BUYSTOCK DATA BY PASSING DATA TO DAO AND CALLING PROCEDURE
	 * PURPOSE     :TO RETURN LIST TO CONTROLLER
	 * */


	@Override
	public List<BuyStockBO> insert(Portfolicommand portfolicommand,String userName) throws ParseException  {
		List<BuyStockBO> pList = null;
		pList = new ArrayList<BuyStockBO>();
		String[] scname = portfolicommand.getCompany();
		String[] date = portfolicommand.getDate();
		String[] price = portfolicommand.getPrice();
		String[] no_of_shrs = portfolicommand.getShares();
		String[] sc_code=portfolicommand.getSc_code();  //8 march
		BuyStockBO portfoliobo = null;
		BuyStockBO bo=null;      //
		List<BuyStockBO> bos=null;  //
		for (int i = 0; i <= (scname.length) - 1; i++) {

			portfoliobo = new BuyStockBO();
			String companyName = scname[i];

			if (companyName != null && companyName.trim().length() > 0)
			{
				portfoliobo.setSc_code(Integer.parseInt(sc_code[i]));
			}	
			else
			{portfoliobo.setSc_code(0);}

			String dateString = date[i];
			if (dateString != null && dateString.trim().length() > 0)
			{	Date buyDate =DateHelper.convertStringToDateInINR(dateString);
			portfoliobo.setDate(buyDate);}
			else
				portfoliobo.setDate(null);

			String pricestr = price[i];
			if (pricestr != null && pricestr.trim().length() > 0)
			{portfoliobo.setPrice(Float.parseFloat(pricestr)/Integer.parseInt(no_of_shrs[i]));}
			else
			{portfoliobo.setPrice(0.0f);}

			String no_of_shrsstr = no_of_shrs[i];
			if (no_of_shrsstr != null && no_of_shrsstr.trim().length() > 0)
			{portfoliobo.setNo_of_shrs(Integer.parseInt(no_of_shrsstr));}
			else
			{portfoliobo.setNo_of_shrs(0);}

			portfoliobo.setAudit_action(ApplicationConstant.AUDIT_ACTION_INSERT);
			portfoliobo.setStatus(ApplicationConstant.ACTIVE);


			portfoliobo.setUser_id(userName);

			portfoliobo.setAudit_date_time(DateHelper.todaysDateTimeInDBFormat());

			pList.add(portfoliobo);

		}//for
	
		int b =iDBBuyStockDao.batchInsert(pList);     //
		
		List<BuyStockBO> sc_codelist=null;

		List<BuyStockBO> bosPro=null;
		bos=new ArrayList<BuyStockBO>();
		if(b==1)
		{
			sc_codelist=new ArrayList<BuyStockBO>();

			sc_codelist=iDBBuyStockDao.getAllSc_code_by_userID(userName); //change 27jan
			//removing duplicates from sc_codelist and again store into list
			Map<Integer,BuyStockBO> map = new LinkedHashMap<>();
			for (BuyStockBO ays : sc_codelist) {
				map.put(ays.getSc_code(), ays);
			}
			sc_codelist.clear();
			sc_codelist.addAll(map.values());


			for(int i=0;i<sc_codelist.size();i++)
			{    
				bo=new BuyStockBO();

				bosPro=iDBBuyStockDao.getPortfolioData(sc_codelist.get(i).getSc_code(),userName);

				DecimalFormat decimalFormat=new DecimalFormat("#.00");



				bo.setSc_name(bosPro.get(0).getSc_name());
				bo.setBuy_rate(bosPro.get(0).getBuy_rate());
				bo.setQunatity(bosPro.get(0).getQunatity());
				bo.setBuy_value(bosPro.get(0).getBuy_value());
				bo.setCurrent_rate(bosPro.get(0).getCurrent_rate());
				bo.setDate(bosPro.get(0).getDate());//this on 28 jan
				bo.setCurrent_value(bosPro.get(0).getCurrent_value());
				bo.setHolding_percentage(Float.parseFloat(decimalFormat.format(bosPro.get(0).getHolding_percentage()))); //here for rounding logic on 3jun
				bo.setGain_or_loss(bosPro.get(0).getGain_or_loss());
				bo.setAppreciation(Float.parseFloat(decimalFormat.format(bosPro.get(0).getAppreciation())));//here for rounding logic on 3jun
				bos.add(bo);


			}//for i

		}//if

		return bos;
	}

	@Override
	public int insertTrendToPortfolio(List<Object> stockListFromTrendToPorfolio,
			String userName) throws ParseException {		

		List<BuyStockBO> pList = null;
		pList = new ArrayList<BuyStockBO>();
		BuyStockBO portfoliobo = null;
		portfoliobo = new BuyStockBO();


		portfoliobo.setSc_code(Integer.parseInt((String) stockListFromTrendToPorfolio.get(0)));

		Date buyDate1 =DateHelper.convertStringToDateInINR((String) stockListFromTrendToPorfolio.get(1));
		
		
		portfoliobo.setDate(buyDate1);
		

		portfoliobo.setPrice(Float.parseFloat((String) stockListFromTrendToPorfolio.get(2))/Integer.parseInt((String) stockListFromTrendToPorfolio.get(3)));

		
		
		portfoliobo.setNo_of_shrs(Integer.parseInt((String) stockListFromTrendToPorfolio.get(3)));
		portfoliobo.setAudit_action(ApplicationConstant.AUDIT_ACTION_INSERT);
		portfoliobo.setStatus(ApplicationConstant.ACTIVE);
		portfoliobo.setUser_id(userName);
		portfoliobo.setAudit_date_time(DateHelper.todaysDateTimeInDBFormat());
		pList.add(portfoliobo);

		return iDBBuyStockDao.batchInsert(pList);   
	}


	@Override
	public int batchInsert(List<BuyStockBO> portfoliobos) {
		return 0;
	}
	/**
	 * PREPARED BY :SANDEEP KUMAR
	 * NAME        :FOR GETTING THE SELLDETAILS 
	 * PURPOSE     :TO RETURN LIST TO CONTROLLER AFTER CALLING THE PROCEDURE
	 * */



	@Override
	public List<BuyStockBO> getSellDetails(String username) {

		List<BuyStockBO> sc_codelist=null;
		BuyStockBO bo=null;      //
		List<BuyStockBO> bos=null;  //
		List<BuyStockBO> bosPro=null;
		bos=new ArrayList<BuyStockBO>();
		sc_codelist=new ArrayList<BuyStockBO>();
		sc_codelist=iDBBuyStockDao.getAllSc_code_by_userID(username);
		//removing duplicates from sc_codelist and again store into list
		Map<Integer,BuyStockBO> map = new LinkedHashMap<>();
		for (BuyStockBO ays : sc_codelist) {
			map.put(ays.getSc_code(), ays);
		}
		sc_codelist.clear();
		sc_codelist.addAll(map.values());


		DecimalFormat decimalFormat=new DecimalFormat("#.00");
		for(int i=0;i<sc_codelist.size();i++)
		{    
			bo=new BuyStockBO();
			bosPro=iDBBuyStockDao.getPortfolioData(sc_codelist.get(i).getSc_code(),username);

			bo.setSc_name(bosPro.get(0).getSc_name());
			bo.setBuy_rate(Float.parseFloat(decimalFormat.format(bosPro.get(0).getBuy_rate())));
			bo.setQunatity(bosPro.get(0).getQunatity());
			bo.setBuy_value(Float.parseFloat(decimalFormat.format(bosPro.get(0).getBuy_value())));
			bo.setDate(bosPro.get(0).getDate());      //
			bo.setCurrent_rate(Float.parseFloat(decimalFormat.format(bosPro.get(0).getCurrent_rate())));
			bo.setCurrent_value(Float.parseFloat(decimalFormat.format(bosPro.get(0).getCurrent_value())));
			bo.setHolding_percentage(Float.parseFloat(decimalFormat.format(bosPro.get(0).getHolding_percentage()))); //here for rounding logic on 3jun
			bo.setGain_or_loss(Float.parseFloat(decimalFormat.format(bosPro.get(0).getGain_or_loss())));
			bo.setAppreciation(Float.parseFloat(decimalFormat.format(bosPro.get(0).getAppreciation())));//here for rounding logic on 3jun

			bos.add(bo);

		}//for




		return bos;
	}

	/**
	 * PREPARED BY :SANDEEP KUMAR
	 * NAME        :FOR INSERTING THE SELLSTOCK DATA BY PASSING DATA TO DAO AND CALLING PROCEDURE
	 * PURPOSE     :TO RETURN LIST TO CONTROLLER AFTER INSERTION CALCULATION
	 * */

	//this method is for inserting sell data into sellstock table and return the list of calculated data
	@Override
	public List<AfterSellBO> insertsell(Portfolicommand portfolicommand,String userName) throws ParseException {
		//here 
		List<SellStockBO> pList = null;
		pList = new ArrayList<SellStockBO>();
		String[] pids = portfolicommand.getP_id();   //c
		String[] sccode = portfolicommand.getSc_code();
		String[] date = portfolicommand.getDate();
		String[] price = portfolicommand.getPrice();
		String[] no_of_shrs = portfolicommand.getShares();


		SellStockBO portfoliobo = null;
		//

		AfterSellBO bo=null;      //
		List<AfterSellBO> bos=null;


		//



		for (int i = 0; i <= (sccode.length) - 1; i++) {   //

			portfoliobo = new SellStockBO();
			// here 18 jan
			String p_ids = pids[i];
			if (p_ids != null && p_ids.trim().length() > 0)
			{portfoliobo.setP_id(Integer.parseInt(p_ids));}
			else
			{portfoliobo.setP_id(0);}

			//tilll
			String sccodes = sccode[i];

			if (sccodes != null && sccodes.trim().length() > 0)   //
			{


				portfoliobo.setSc_code(Integer.parseInt(sccodes));
			}	
			else
			{portfoliobo.setSc_code(0);}

			String dateString = date[i];
			if (dateString != null && dateString.trim().length() > 0)
			{	Date buyDate =DateHelper.convertStringToDateInINR(dateString);
			portfoliobo.setDate(buyDate);}
			else
				portfoliobo.setDate(null);

			String pricestr = price[i];
			if (pricestr != null && pricestr.trim().length() > 0)
			{portfoliobo.setPrice(Float.parseFloat(pricestr)/Integer.parseInt(no_of_shrs[i]));}
			else
			{portfoliobo.setPrice(0.0f);}

			String no_of_shrsstr = no_of_shrs[i];
			if (no_of_shrsstr != null && no_of_shrsstr.trim().length() > 0)
			{portfoliobo.setNo_of_shrs(Integer.parseInt(no_of_shrsstr));}
			else
			{portfoliobo.setNo_of_shrs(0);}

			portfoliobo.setAuditAction(ApplicationConstant.AUDIT_ACTION_INSERT);
			portfoliobo.setStatus(ApplicationConstant.ACTIVE);
			portfoliobo.setUserId(userName);

			pList.add(portfoliobo);

		}//for

		//start from here feb 4
		List<BuyStockBO> date_shrs_buy=iDBBuyStockDao.getDataForValidation(pList.get(0).getP_id());    
		Date buydate=date_shrs_buy.get(0).getDate();
		int buyshrs=date_shrs_buy.get(0).getNo_of_shrs();
		int b=0;
		if(!pList.get(0).getDate().before(buydate)&&pList.get(0).getNo_of_shrs()<=buyshrs)
		{
			
			b =iDBSellStockDao.batchInsert(pList);
		}



		
		List<SellStockBO> selllist=null;

		List<AfterSellBO> bosPro=null;//
		bos=new ArrayList<AfterSellBO>();
		if(b>=1)
		{
			selllist=new ArrayList<SellStockBO>();

			selllist=iDBSellStockDao.getAllSellPidandSccode_by_userID(userName);
			DecimalFormat decimalFormat=new DecimalFormat("#.00");
			for(int i=0;i<selllist.size();i++)
			{    
				bo=new AfterSellBO();  //this for test


				bosPro=iDBSellStockDao.getSellPortfolioData(userName,selllist.get(i).getSc_code(),selllist.get(i).getP_id(),selllist.get(i).getDate());//add date here as parameter 21jan



				bo.setCompany_name(bosPro.get(0).getCompany_name());
				bo.setSell_date(bosPro.get(0).getSell_date());
				bo.setQuantity(bosPro.get(0).getQuantity());
				bo.setSell_price(bosPro.get(0).getSell_price());
				bo.setAcquisition_cost((Float.parseFloat(decimalFormat.format(bosPro.get(0).getAcquisition_cost()))));
				bo.setAcquisition_date(bosPro.get(0).getAcquisition_date());

				
				bo.setProfit((Float.parseFloat(decimalFormat.format(bosPro.get(0).getProfit()))));
				bo.setLong_short_term(bosPro.get(0).getLong_short_term());

				bos.add(bo);



			}//for i

		}//if


		return bos;



		//till here 20jan
		//return null;
	}

	//till here
	/**
	 * PREPARED BY :SANDEEP KUMAR
	 * NAME        :FOR GETING SELL LIST 
	 * PURPOSE     :TO RETURN LIST TO CONTROLLER FOR DISPLAY LIST OF SELL ITEMS
	 * */


	@Override
	public List<BuyStockBO> getSellList(String companyName,String username) {
		List<BuyStockBO> portfoliobos=null;
		portfoliobos=iDBBuyStockDao.findSell(companyName,username);
		return portfoliobos;
	}




	@Override
	public List<ActiveCompanyListBO> getCompanyList(String companyname) {
		List<ActiveCompanyListBO> listBO;
		listBO=iDBCompanyDao.getCompanyData(companyname);
		return listBO;
	}

	@Override
	public int[] getDeleteList(List listofP_id, String userName) {
		//		System.out.println(listofP_id);

		List<BuyStockBO> buy_sellStockBOList=null;
		buy_sellStockBOList=new ArrayList<BuyStockBO>();
		//Delete News Data
		//buyStockBO.deleteAllNewsData();
		//insert updated new data

		for(int i=0;i<=listofP_id.size()-1;i++)
		{
			String s1=(String) listofP_id.get(i);
			int p_id= Integer.parseInt(s1) ;
			BuyStockBO buyStockBO=new BuyStockBO();

			if(p_id!=0&&listofP_id.size()>0){
				buyStockBO.setP_id(p_id);
				buyStockBO.setUser_id(userName);
				buyStockBO.setStatus(ApplicationConstant.INACTIVE);
			}

			buy_sellStockBOList.add(buyStockBO);

		}
		int []b=iDBBuyStockDao.batchDelete(buy_sellStockBOList);
		return b;

	}

	@Override
	public int[] getEditList(Portfolicommand portfolicommand, String userName) throws ParseException {
		List<BuyStockBO> buy_sellStockBOList=null;
		buy_sellStockBOList=new ArrayList<BuyStockBO>();
		String userName1=userName;
		String[] p_id=portfolicommand.getP_id();
		String[] sc_code=portfolicommand.getSc_code();
		String[] date=portfolicommand.getDate();
		String[] price=portfolicommand.getPrice();
		String[] noofshrs=portfolicommand.getShares();
		for(int i=0;i<=(sc_code.length)-1;i++)
		{
			BuyStockBO buyStockBO=new BuyStockBO();
			String p_ids = p_id[i];
			if (p_ids != null && p_ids.trim().length() > 0)
			{buyStockBO.setP_id(Integer.parseInt(p_ids));}
			else
			{buyStockBO.setP_id(0);}

			//tilll
			String sccodes = sc_code[i];

			if (sccodes != null && sccodes.trim().length() > 0)   //
			{


				buyStockBO.setSc_code(Integer.parseInt(sccodes));
			}	
			else
			{buyStockBO.setSc_code(0);}

			String dateString = date[i];
			if (dateString != null && dateString.trim().length() > 0)
			{	Date buyDate =DateHelper.convertStringToDateInINR(dateString);
			buyStockBO.setDate(buyDate);}
			else
				buyStockBO.setDate(null);

			String pricestr = price[i];
			if (pricestr != null && pricestr.trim().length() > 0)
				//here buy value divide byno of share to get particular shar value
			{buyStockBO.setPrice(Float.parseFloat(pricestr)/Integer.parseInt(noofshrs[i]));}
			else
			{buyStockBO.setPrice(0.0f);}

			String no_of_shrsstr = noofshrs[i];
			if (no_of_shrsstr != null && no_of_shrsstr.trim().length() > 0)
			{buyStockBO.setNo_of_shrs(Integer.parseInt(no_of_shrsstr));}
			else
			{buyStockBO.setNo_of_shrs(0);}

			buyStockBO.setAudit_action(ApplicationConstant.AUDIT_ACTION_UPDATE);
			buyStockBO.setStatus(ApplicationConstant.ACTIVE);
			buyStockBO.setUser_id(userName1);
			buyStockBO.setAudit_date_time(DateHelper.todaysDateTimeInDBFormat());

			buy_sellStockBOList.add(buyStockBO);
		}
		int a[]=iDBBuyStockDao.editList(buy_sellStockBOList,userName);
		return a;
	}





	@Override
	public List<AfterSellBO> getHistoryData(PortfolioHistorycommand portfolioHistoryCommand, String userName) throws ParseException {

		List<AfterSellBO> bos=new ArrayList<AfterSellBO>();
		AfterSellBO bo=null;


		String fromDateStr = portfolioHistoryCommand.getStartDate();
		String toDateStr = portfolioHistoryCommand.getEndDate(); 


		Date fromDate = DateHelper.convertStringToDateInINR(fromDateStr);
		Date toDate = DateHelper.convertStringToDateInINR(toDateStr);

		/*			System.out.println("Date :"+fromDate);
					System.out.println("Prv Date : "+toDate);
*/

		List<SellStockBO> selllistforHistory=iDBSellStockDao.getAllSellStockData(userName,toDate,fromDate);


		//	System.out.println("Size : "+selllistforHistory.size());
		DecimalFormat decimalFormat=new DecimalFormat("#.00");
		for(int i=0;i<selllistforHistory.size();i++)
		{    
			bo=new AfterSellBO();  //this for test


			List<AfterSellBO> bosPro=iDBSellStockDao.getHistoryPortfolioData(userName,selllistforHistory.get(i).getSc_code(),selllistforHistory.get(i).getP_id(),selllistforHistory.get(i).getDate());//add date here as parameter 21jan



			bo.setCompany_name(bosPro.get(0).getCompany_name());
			bo.setSell_date(bosPro.get(0).getSell_date());
			bo.setQuantity(bosPro.get(0).getQuantity());
			bo.setSell_price(bosPro.get(0).getSell_price());
			bo.setAcquisition_cost((Float.parseFloat(decimalFormat.format(bosPro.get(0).getAcquisition_cost()))));
			bo.setAcquisition_date(bosPro.get(0).getAcquisition_date());
			
			bo.setProfit((Float.parseFloat(decimalFormat.format(bosPro.get(0).getProfit()))));
			bo.setLong_short_term(bosPro.get(0).getLong_short_term());

			bos.add(bo);



		}



		return bos;
	}


	@Override
	public List<CapitalgainlossBO> getCapitalData(List<AfterSellBO> portfoliobolist) {
		CapitalgainlossBO capitalbo=null;
		List<CapitalgainlossBO> capbolist= null;
		Float capshorttermgain=0.0f;
		Float capshorttermloss=0.0f;
		Float caplongtermgain=0.0f;
		Float caplongtermloss=0.0f;
		for(int i=0; i<portfoliobolist.size();i++){
			String capital=portfoliobolist.get(i).getLong_short_term();
			if(capital.equals("SHORT")){
				Float profit=portfoliobolist.get(i).getProfit();
				if(profit>0){
					capshorttermgain=capshorttermgain+(portfoliobolist.get(i).getProfit());
				}
				if(profit<0){
					capshorttermloss=capshorttermloss+(portfoliobolist.get(i).getProfit());
				}

			}
			if(capital.equals("LONG")){
				Float profit=portfoliobolist.get(i).getProfit();
				if(profit>0){
					caplongtermgain=caplongtermgain+(portfoliobolist.get(i).getProfit());
				}
				if(profit<0){
					caplongtermloss=caplongtermloss+(portfoliobolist.get(i).getProfit());
				}
			}
		}
		capitalbo=new CapitalgainlossBO();
		capitalbo.setCapitalshortterm_gain(capshorttermgain);
		capitalbo.setCapitalshortterm_loss(capshorttermloss);
		capitalbo.setCapitallongterm_gain(caplongtermgain);
		capitalbo.setCapitallongterm_loss(caplongtermloss);
		capbolist=new ArrayList<CapitalgainlossBO>();
		capbolist.add(capitalbo);
		return capbolist;
	}


	@Override
	public List<Float> calculateTotalInvest(List<BuyStockBO> portfoliobos) {

		float investment=0;
		float latest_value=0;
		float overall_gain_loss=0;
		float overall_gain_loss_perc=0;
		List<Float> listofTotalInvestment = new ArrayList<>();

		for (int i = 0; i < portfoliobos.size(); i++) {
			BuyStockBO buyStockBO = portfoliobos.get(i);

			investment=investment+buyStockBO.getBuy_value();
			latest_value=latest_value+buyStockBO.getCurrent_value();

		}

		overall_gain_loss=latest_value-investment;
		overall_gain_loss = (float) (Math.round(overall_gain_loss*100.00)/100.00);
		overall_gain_loss_perc = (overall_gain_loss*100)/latest_value;
		overall_gain_loss_perc=(float) (Math.round(overall_gain_loss_perc*100.00)/100.00);

		listofTotalInvestment.add(investment);
		listofTotalInvestment.add(overall_gain_loss);
		listofTotalInvestment.add(latest_value);
		listofTotalInvestment.add(overall_gain_loss_perc);


		/*		System.out.println("investment :"+investment);
		System.out.println("Latest Value :"+latest_value);
		System.out.println("overall Gain :"+overall_gain_loss);
		 */		
		return listofTotalInvestment;
	}
}