package com.nivesh.service.company;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.Resource;

import org.apache.commons.lang.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nivesh.bo.ActiveCompanyListBO;
import com.nivesh.bo.CompanyStockDetailsBO;
import com.nivesh.bo.DailyPatternReportBO;
import com.nivesh.bo.GainerLoserBO;
import com.nivesh.bo.LiveBSESensexBO;
//import com.nivesh.bo.QuotationBO;
import com.nivesh.command.dashboard.GainerAndLosserCommand;
import com.nivesh.dao.masterdatasetup.ICompanyDao;
import com.nivesh.util.ApplicationConstant;
import com.nivesh.util.DateHelper;
import com.nivesh.util.ICommonCalculationService;
import com.nivesh.util.ICompanyDetailsHelperService;
import com.nivesh.util.SensexComparisionServices;

@Service
public class CompanyServiceImpl implements ICompanyService {

	@Resource
	private ICompanyDao companydao;

	@Autowired
	private ICompanyDetailsHelperService iCompanyDetailsHelper;

	@Autowired
	private ICommonCalculationService iCommonCalculationService;

	public void setCompanydao(ICompanyDao companydao) {
		this.companydao = companydao;
	}

	DecimalFormat dfm = new DecimalFormat("#.00");
	@Override
	public List<ActiveCompanyListBO> getCompanyList(String companyName) {
		List<ActiveCompanyListBO> listBO;
		listBO = companydao.getCompanyNameList(companyName);
		return listBO;

	}

	@Override
	public List<ActiveCompanyListBO> getCompanyList() {
		List<ActiveCompanyListBO> companyList = null;
		companyList = companydao.getCompanyList();
		return companyList;
	}
	
//	@Override
//	public QuotationBO getData(ActiveCompanyListBO activeCompanyListBO) {
//		int sc_code=activeCompanyListBO.getCompanyCode();
//		QuotationBO quotationBO=companydao.getPriceData(sc_code);
//		
//		return quotationBO;
//	}
	@Override
	public  List<LiveBSESensexBO> getTickerData() throws ParseException{
		List<String> companyList = getCompanyForTicker();

		String companyName = ApplicationConstant.BSE_SENSEX_NAME;
		companyList.add(companyName);
		return getDataForBanners(companyList);	
	}
	

	@Override
	public List<List<CompanyStockDetailsBO>> getCompanyMovingAverage(List<String> companyList, String period, int[] average)
			throws ParseException {

		List<String> updatedList = new ArrayList<>();

		for (int i = 1; i < companyList.size(); i++) {
			updatedList.add(companyList.get(i));
		}


		List<CompanyStockDetailsBO> closePriceList = null;
		List<CompanyStockDetailsBO> companyStockDetailsBOList = null;
		List<List<CompanyStockDetailsBO>> movingAverageList = null;
		Date date = null;
		String startDate;
		String endDate;
		date=DateHelper.todaysDateTimeInDBFormat();
		endDate=DateHelper.convertDateToString(date);
		String dateIdentifier = period.substring(2);
		if (dateIdentifier.equals("Year")) {
			startDate=DateHelper.previousDateYearWise(date, (Integer.parseInt(period.substring(0, 1))));
		} else if (dateIdentifier.equals("Month")) {
			startDate=DateHelper.previousDateMonthWise(date, (Integer.parseInt(period.substring(0, 1))));
		} else  if(dateIdentifier.equals("Week")){
			startDate=DateHelper.previousDateDayWise(date, WEEK_DURATION);
		}
		else{
			startDate="2015-04-01";
		}
		movingAverageList = new ArrayList<List<CompanyStockDetailsBO>>();
		for (int j = 0; j < updatedList.size(); j++) {
			if (average[0] == 0) {
				closePriceList = iCompanyDetailsHelper.getCompanyStockPrice(updatedList.get(j), startDate, endDate);
				movingAverageList.add(closePriceList);
			} else {
				for (int i = 0; i < average.length; i++) {

					companyStockDetailsBOList = iCompanyDetailsHelper.getCompanyStockPrice(updatedList.get(j),
							startDate, endDate, average[i]);
					closePriceList = iCommonCalculationService.getCompanyStockPrice(companyStockDetailsBOList,
							average[i]);
					if (closePriceList.size()!=0) {
						movingAverageList.add(closePriceList);
					} else {
						closePriceList = iCompanyDetailsHelper.getCompanyStockPrice(updatedList.get(j), startDate, endDate);
						movingAverageList.add(closePriceList);
					}

				}
			}
		}
		if (updatedList.size() == 1) {
			return movingAverageList;
		} else {
			return SensexComparisionServices.Comparision(movingAverageList);
		}

	}


	@Override
	public CompanyStockDetailsBO getlivedataFeeds(String companyName) throws ParseException {
		CompanyStockDetailsBO companyStockDetailsBO;
		companyStockDetailsBO = companydao.getLiveDataDAO(companyName);	

		
		
		
		Float closePrice = companyStockDetailsBO.getCompanyClosePrice();
		if(closePrice==null) {
			
			return new CompanyStockDetailsBO();
		}
		
		
		

		
		
		if (closePrice!=0.0f) {
			boolean flag = checkingDateDiffrance(new Date(),companyStockDetailsBO.getStockDate());
			if (!flag) {
				Date stock_date = DateUtils.truncate(companyStockDetailsBO.getStockDate(), Calendar.DATE);
				companyStockDetailsBO.setStockDate(stock_date);
			}
			return companyStockDetailsBO;
		}
		return null;
	}


	private boolean checkingDateDiffrance(Date cur_date, Date stockDate) {

		if (DateUtils.isSameDay(cur_date,stockDate)) {
			int cur_hour = cur_date.getHours();
			if (cur_hour <= 16 && cur_hour >= 9) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}


//	@Override
//	public List<Object> getCompanyQuotesCalculation(List<List<CompanyStockDetailsBO>> companyQuotesCalculation,CompanyStockDetailsBO companyStockDetailsBOLive){
//		List<Object> quotesCalculation = new ArrayList<>(); 
//
//		Float variation= null;
//		Float closePrice = null;
//		Float openPrice= null;
//		Float highPrice= null;
//		Float lowPrice= null;
//		Float change_points= null;
//		int volume= 0;
//		Float value= null;
//		Date date = null;
//		String Currdate= null;
//		Float highClosePrice= null;
//		Float lowClosePrice= null;
//
//
//		for (int i = 0; i < companyQuotesCalculation.size(); i++) {
//			List<CompanyStockDetailsBO> BoList = companyQuotesCalculation.get(i);
//
//			List<Float> highclosePrice = new ArrayList<>();
//			List<Float> lowclosePrice = new ArrayList<>();
//			DecimalFormat dfm = new DecimalFormat("#.00");
//		
//			closePrice = companyStockDetailsBOLive.getCompanyClosePrice();
//			openPrice = companyStockDetailsBOLive.getCompanyOpenPrice();
//			highPrice = companyStockDetailsBOLive.getCompanyHighPrice();
//			lowPrice = companyStockDetailsBOLive.getCompanyLowPrice();
//			volume = companyStockDetailsBOLive.getStockVolume();
//			if (companyStockDetailsBOLive.getCompanyPrevClosePrice()!=0.0) {
//				change_points = companyStockDetailsBOLive.getCompanyClosePrice()-companyStockDetailsBOLive.getCompanyPrevClosePrice();
//				variation = (((companyStockDetailsBOLive.getCompanyClosePrice()/companyStockDetailsBOLive.getCompanyPrevClosePrice())-1)*100);
//
//			}else{
//				change_points=00.0f;
//				variation=00.0f;
//			}
//			
//			value = (float) companyStockDetailsBOLive.getCompanyTurnover();
//			date = companyStockDetailsBOLive.getStockDate();
//			Currdate = date.toString();
//			
//			if (BoList.size()== 0.0) {
//				highClosePrice = highPrice;
//				lowClosePrice = lowPrice;
//			}else{
//				for (int j = 0; j < BoList.size(); j++) {
//					CompanyStockDetailsBO companyStockDetailsBO1 = BoList.get(j);
//					highclosePrice.add(companyStockDetailsBO1.getCompanyHighPrice());
//					lowclosePrice.add(companyStockDetailsBO1.getCompanyLowPrice());
//				}
//				highClosePrice = java.util.Collections.max(highclosePrice);
//				lowClosePrice = java.util.Collections.min(lowclosePrice);
//			}
//
//			variation = Float.parseFloat(dfm.format(variation));
//			change_points = Float.parseFloat(dfm.format(change_points));
//
//			quotesCalculation.add(closePrice);
//			quotesCalculation.add(openPrice);
//			quotesCalculation.add(highPrice);
//			quotesCalculation.add(lowPrice);
//
//			quotesCalculation.add(variation);
//			quotesCalculation.add( volume);
//			quotesCalculation.add(value);
//
//			quotesCalculation.add(highClosePrice);
//			quotesCalculation.add(lowClosePrice);
//
//			quotesCalculation.add(Currdate);
//			quotesCalculation.add(change_points);
//		}
//		return quotesCalculation;
//	}

	
	
	@Override
	public List<Object> getCompanyQuotesCalculation(List<List<CompanyStockDetailsBO>> companyQuotesCalculation, CompanyStockDetailsBO companyStockDetailsBOLive) {
	    List<Object> quotesCalculation = new ArrayList<>();
	   
	    // Initialize DecimalFormat outside the loop
	    DecimalFormat dfm = new DecimalFormat("#.00");
	   
	    for (List<CompanyStockDetailsBO> boList : companyQuotesCalculation) {
	       
	        // Basic values from live data
	        Float closePrice = companyStockDetailsBOLive.getCompanyClosePrice();
	        Float openPrice = companyStockDetailsBOLive.getCompanyOpenPrice();
	        Float highPrice = companyStockDetailsBOLive.getCompanyHighPrice();
	        Float lowPrice = companyStockDetailsBOLive.getCompanyLowPrice();
	        int volume = companyStockDetailsBOLive.getStockVolume();
	        Float value = (float) companyStockDetailsBOLive.getCompanyTurnover();
	        Date date = companyStockDetailsBOLive.getStockDate();
	        String currDate = (date != null) ? date.toString() : "";

	        Float variation = 0.0f;
	        Float changePoints = 0.0f;
	       
//	        if (companyStockDetailsBOLive.getCompanyPrevClosePrice() != 0.0) {
//	            changePoints = closePrice - companyStockDetailsBOLive.getCompanyPrevClosePrice();
//	            variation = ((closePrice / companyStockDetailsBOLive.getCompanyPrevClosePrice()) - 1) * 100;
//	        }
	        
	        
	        
	        if (companyStockDetailsBOLive!= null && companyStockDetailsBOLive.getCompanyPrevClosePrice()!=null &&  companyStockDetailsBOLive.getCompanyPrevClosePrice()!=0.0) {
	            changePoints = closePrice - companyStockDetailsBOLive.getCompanyPrevClosePrice();
	            variation = ((closePrice / companyStockDetailsBOLive.getCompanyPrevClosePrice()) - 1) * 100;
	        }

	        // Round to 2 decimal places
	        variation = Float.parseFloat(dfm.format(variation));
	        changePoints = Float.parseFloat(dfm.format(changePoints));

	        Float highClosePrice = highPrice;
	        Float lowClosePrice = lowPrice;

	        // Handle historical data if available
	        if (boList != null && !boList.isEmpty()) {
	            List<Float> highClosePrices = new ArrayList<>();
	            List<Float> lowClosePrices = new ArrayList<>();

	            for (CompanyStockDetailsBO historicalBO : boList) {
	                if (historicalBO != null) {
	                    highClosePrices.add(historicalBO.getCompanyHighPrice());
	                    lowClosePrices.add(historicalBO.getCompanyLowPrice());
	                }
	            }

	            if (!highClosePrices.isEmpty()) {
	                highClosePrice = Collections.max(highClosePrices);
	            }
	            if (!lowClosePrices.isEmpty()) {
	                lowClosePrice = Collections.min(lowClosePrices);
	            }
	        }

	        // Add all calculated values to result list
	        quotesCalculation.add(closePrice);
	        quotesCalculation.add(openPrice);
	        quotesCalculation.add(highPrice);
	        quotesCalculation.add(lowPrice);
	        quotesCalculation.add(variation);
	        quotesCalculation.add(volume);
	        quotesCalculation.add(value);
	        quotesCalculation.add(highClosePrice);
	        quotesCalculation.add(lowClosePrice);
	        quotesCalculation.add(currDate);
	        quotesCalculation.add(changePoints);
	    }
	    return quotesCalculation;
	}

	
	
	
	/**
	 * This method will calculate pattern formation for a particular company
	 * returntype=String param:String companyName
	 */
	@Override
	public Map<String, Object> getCompanySuggestion(String companyName) throws ParseException {
		Map<String, Object> finalSuggestion = null;
		finalSuggestion=companydao.getCompanySuggestion(companyName);
		if(finalSuggestion.containsValue(REGULAR)){
			finalSuggestion.remove("Caution");
		}
		return finalSuggestion;			
	}





	@Override
	public List<DailyPatternReportBO> getLatestPatternReport() {

		List<DailyPatternReportBO> suggestionReportList = null;
		suggestionReportList = companydao.getLatestPatternReport();

		return suggestionReportList;
	}


	
	

	@Override
	public List<LiveBSESensexBO> getDataForBanners(List<String> compnyList) throws ParseException {

		List<LiveBSESensexBO> liveBSEList = new ArrayList<>(); 

		CompanyStockDetailsBO companyStockDetailsBO =null;

		for (int i = 0; i < compnyList.size(); i++) {
			String companyName = compnyList.get(i);

			companyStockDetailsBO=getlivedataFeeds(companyName);

			List<Object> listValues = getBannerDataCalculation(companyStockDetailsBO);

			LiveBSESensexBO liveBSESensexBO = new LiveBSESensexBO();

			liveBSESensexBO.setCompanyName(companyName);
			liveBSESensexBO.setCurrent_Value((Float) listValues.get(0));
			liveBSESensexBO.setChang_points((Float) listValues.get(1));
			liveBSESensexBO.setChange_per((Float) listValues.get(2));
			liveBSEList.add(liveBSESensexBO);
		}

		return liveBSEList;

	}


	
	private List<Object> getBannerDataCalculation(CompanyStockDetailsBO companyStockDetailsBO) {
	    List<Object> variationCalculation = new ArrayList<>();

	    Float variation = null;
	    Float closePrice = null;
	    Float changePoints = null;
	    DecimalFormat dfm = new DecimalFormat("#.00");

	    // Get prices safely
	    closePrice = companyStockDetailsBO.getCompanyClosePrice();
	    Float prevClosePrice = companyStockDetailsBO.getCompanyPrevClosePrice();

	    // Check if closePrice and prevClosePrice are not null before calculation
	    if (closePrice != null && prevClosePrice != null) {
	        changePoints = closePrice - prevClosePrice;

	        // Check to prevent division by zero
	        if (prevClosePrice != 0) {
	            variation = (((closePrice / prevClosePrice) - 1) * 100);
	        }

	        // Format the values safely
	        changePoints = Float.parseFloat(dfm.format(changePoints));
	        if (variation != null) {
	            variation = Float.parseFloat(dfm.format(variation));
	        }
	    } else {
	        // Handle the case where one of the values is null, e.g., set to 0 or log an error
	        changePoints = 0f;
	        variation = 0f;
	    }

	    variationCalculation.add(closePrice);
	    variationCalculation.add(changePoints);
	    variationCalculation.add(variation);
	    return variationCalculation;
	}


	
//	private List<Object> getBannerDataCalculation(CompanyStockDetailsBO companyStockDetailsBO) {
//
//		// if data is not there in livedata feed table for portfolio live data
//
//
//		List<Object> variationCalculation = new ArrayList<>(); 
//
//		Float variation;
//		Float closePrice;
//		Float change_points;
//		DecimalFormat dfm = new DecimalFormat("#.00");
//
//		closePrice = companyStockDetailsBO.getCompanyClosePrice();
//		change_points = companyStockDetailsBO.getCompanyClosePrice()-companyStockDetailsBO.getCompanyPrevClosePrice();
//		variation = (((companyStockDetailsBO.getCompanyClosePrice()/companyStockDetailsBO.getCompanyPrevClosePrice())-1)*100);
//
//		variation = Float.parseFloat(dfm.format(variation));
//		change_points = Float.parseFloat(dfm.format(change_points));
//
//
//
//		variationCalculation.add(closePrice);
//		variationCalculation.add(change_points);
//		variationCalculation.add(variation);
//		return variationCalculation;
//
//	}


	@Override
	public List<String> getCompanyForTicker() {
		return companydao.getCompnyListsForTicker();
	}


	@Override
	public LiveBSESensexBO getLiveData(String firstgraphcompany) throws ParseException {
		List<String> compnyList = null;
		compnyList=new ArrayList<>();
		compnyList.add(firstgraphcompany);
		List<LiveBSESensexBO> liveSensexBOs =  getDataForBanners(compnyList);
		return liveSensexBOs.get(0);
	}



	@Override
	public Map<String,List<LiveBSESensexBO>> getLiveGainerLosserTurnover() {

		List<LiveBSESensexBO> gainerLoserBoList=null;
		List<LiveBSESensexBO> gainerBoList=null;
		List<LiveBSESensexBO> loserBoList=null;
		List<LiveBSESensexBO> topTurnOverList=null;
		List<LiveBSESensexBO> liveBSESensexAlteredList=null;

		Map<String,List<LiveBSESensexBO>> gainerLoserTurnoverMap=null;
		Map<Float, List<LiveBSESensexBO>> gainerLoserMap=null;
		Map<Float, List<LiveBSESensexBO>> turnOverMap=null;
		Map<Float, List<LiveBSESensexBO>> iterationMap=null;

		gainerLoserMap = new TreeMap<>();
		turnOverMap = new TreeMap<>();

		gainerLoserBoList=companydao.getGainerLoserTurnover();

		Float closeprice=null;
		Float prvcloseprice=null;
		Float var=null;
		Float percentage=null;
		Float turnOver=null;



		for(int i=0;i<gainerLoserBoList.size()-1;i++){

			closeprice=gainerLoserBoList.get(i).getCurrent_Value();
			prvcloseprice=gainerLoserBoList.get(i).getPrev_Close_Price();
			if(prvcloseprice==0){
				prvcloseprice=closeprice;
			}
			var=Float.parseFloat(dfm.format((closeprice-prvcloseprice)));
			percentage=Float.parseFloat(dfm.format(((closeprice/prvcloseprice)*100)-100));
			turnOver=gainerLoserBoList.get(i).getTurnOver();

			liveBSESensexAlteredList=new ArrayList<>();

			LiveBSESensexBO liveBSESensexBO=new LiveBSESensexBO();
			liveBSESensexBO.setCompanyName(gainerLoserBoList.get(i).getCompanyName());
			liveBSESensexBO.setCurrent_Value(closeprice);
			liveBSESensexBO.setChang_points(var);
			liveBSESensexBO.setChange_per(percentage);
			liveBSESensexBO.setVolume(gainerLoserBoList.get(i).getVolume());
			liveBSESensexBO.setTurnOver(gainerLoserBoList.get(i).getTurnOver());
			liveBSESensexBO.setAuditDateTime(gainerLoserBoList.get(i).getAuditDateTime());
			liveBSESensexAlteredList.add(liveBSESensexBO);

			gainerLoserMap.put(percentage, liveBSESensexAlteredList);
			turnOverMap.put(turnOver, liveBSESensexAlteredList);
		}


		int loserCount=0;
		loserBoList=new ArrayList<>();
		for (Map.Entry<Float, List<LiveBSESensexBO>> entry1 : gainerLoserMap.entrySet()) {
			loserBoList.addAll(entry1.getValue());
			loserCount++;

			if(loserCount==5){
				break;
			}
		}

		int gainerCount=0;
		gainerBoList=new ArrayList<>();
		iterationMap=((TreeMap<Float, List<LiveBSESensexBO>>) gainerLoserMap).descendingMap();
		for (Map.Entry<Float, List<LiveBSESensexBO>> entry1 : iterationMap.entrySet()) {
			gainerBoList.addAll(entry1.getValue());
			gainerCount++;

			if(gainerCount==5){
				break;
			}
		}

		topTurnOverList=new ArrayList<>();
		int turnOverCount=0;
		iterationMap=((TreeMap<Float, List<LiveBSESensexBO>>) turnOverMap).descendingMap();
		for (Map.Entry<Float, List<LiveBSESensexBO>> entry1 : iterationMap.entrySet()) {
			topTurnOverList.addAll(entry1.getValue());
			turnOverCount++;

			if(turnOverCount==5){
				break;
			}
		}

		gainerLoserTurnoverMap=new LinkedHashMap<>();
		gainerLoserTurnoverMap.put("Gainer", gainerBoList);
		gainerLoserTurnoverMap.put("Loser", loserBoList);
		gainerLoserTurnoverMap.put("TurnOver", topTurnOverList);
		return gainerLoserTurnoverMap;

	}


	@Override
	public Map<String,List<DailyPatternReportBO>> getHighLight() {

		List<DailyPatternReportBO> highLightList=null;
		List<DailyPatternReportBO> strongBuyList=null;
		List<DailyPatternReportBO> buyList=null;
		List<DailyPatternReportBO> sellList=null;
		List<DailyPatternReportBO> holdList=null;
		List<DailyPatternReportBO> bookProfitList=null;


		Map<String,List<DailyPatternReportBO>> gainerLoserTurnoverMap=null;


		highLightList = new ArrayList<>();
		highLightList=companydao.getHighLights();

		buyList= new ArrayList<>();
		sellList = new ArrayList<>();
		holdList = new ArrayList<>();
		bookProfitList = new ArrayList<>();
		strongBuyList = new ArrayList<>();

		for(int i=0;i<highLightList.size()-1;i++){

			if(highLightList.get(i).getSuggestion().equalsIgnoreCase("STRONG BUY")){
				if(strongBuyList.size()<5){
					strongBuyList.add(highLightList.get(i));
				}
			}else if(highLightList.get(i).getSuggestion().equalsIgnoreCase("BUY")){
				if(buyList.size()<5){
					buyList.add(highLightList.get(i));
				}
			}else if(highLightList.get(i).getSuggestion().equalsIgnoreCase("SELL")){
				if(sellList.size()<5){
					sellList.add(highLightList.get(i));
				}

			}else if(highLightList.get(i).getSuggestion().equalsIgnoreCase("HOLD")){
				if(holdList.size()<5){
					holdList.add(highLightList.get(i));
				}

			}else if(highLightList.get(i).getSuggestion().equalsIgnoreCase("BOOK PARTIAL PROFIT")){
				if(bookProfitList.size()<5){
					bookProfitList.add(highLightList.get(i));
				}

			}
		}	

		gainerLoserTurnoverMap=new LinkedHashMap<>();
		gainerLoserTurnoverMap.put("strongBuyList", strongBuyList);
		gainerLoserTurnoverMap.put("buyList", buyList);
		gainerLoserTurnoverMap.put("sellList", sellList);
		gainerLoserTurnoverMap.put("holdList", holdList);
		gainerLoserTurnoverMap.put("bookProfitList", bookProfitList);
		return gainerLoserTurnoverMap;
	}

	@Override
	public List<DailyPatternReportBO> getHilightesCompanyData(int numberofCompany) {


		List<DailyPatternReportBO> suggestionReportList = null;
		suggestionReportList = companydao.getHilightesCompanyDataReport(numberofCompany);

		return suggestionReportList;
	}



	@Override
	public Map<String, Object> getWholeGainerLoser(GainerAndLosserCommand gainerAndLosserCommand) {

		String durationCategory = gainerAndLosserCommand.getDurationRange();
		String priceRange = gainerAndLosserCommand.getPriceRange();
		String indexRange = gainerAndLosserCommand.getIndexRange();

		String category = durationCategory.substring(0, 1);
		String duration = durationCategory.substring(2);
		String durationString= durationCategory.substring(2);
		String type = null;
		String orderBy = null;
		if (category.equals("G")) {
			orderBy="DESC";
			type="GAINERS";
		}
		if (category.equals("L")) {
			orderBy="ASC";
			type="LOSERS";
		}


		int start_price = Integer.parseInt(priceRange.substring(0, 2));
		int end_price;
		String headings;
		if (!priceRange.substring(6, 8).equals("99")) {
			end_price =  Integer.parseInt(priceRange.substring(6, 8));	
			headings=type+" Over "+durationString+": BSE (RS "+start_price+" to "+end_price+")";
		} else {
			end_price =  ApplicationConstant.MAX_PRICE;
			headings=type+" Over "+durationString+": BSE (Above Rs 20)";
		}


		int limit = Integer.parseInt(indexRange);	


		List<GainerLoserBO> listofGainerOrLoserBOList= companydao.getGainerOrLoserValue(duration,orderBy,start_price,end_price,limit);

		Iterator<GainerLoserBO> itr = null;
		itr = listofGainerOrLoserBOList.iterator(); 
		if(orderBy.equals("ASC")){

			while (itr.hasNext()) {
				GainerLoserBO  gainerLoserBO =  itr.next(); 
				if (gainerLoserBO.getPercentageVariation()>=0) { 
					itr.remove(); 
				}
			}


		}else{

			while (itr.hasNext()) {
				GainerLoserBO  gainerLoserBO =  itr.next(); 
				if (gainerLoserBO.getPercentageVariation()<0) { 
					itr.remove(); 
				}
			}
		}

		Map<String, Object> map = new HashMap<>();
		map.put("GainerORLoser", listofGainerOrLoserBOList);
		map.put("Headings", headings);


		return map;
	}


	@Override
	public List<LiveBSESensexBO> getnewlyaddedcompany() {

		List<LiveBSESensexBO> list=null;
		list=companydao.getnewlyaddedcompany();
		return list;
	}


	@Override
	public ActiveCompanyListBO getsc_codeBaseCompanyName(String companyName) {
		ActiveCompanyListBO activeCompanyListBO = companydao.getdetailsBaseCompanyName(companyName);
		return activeCompanyListBO;
	}




	/**
	 * This method will entire company names from DB for testing purpose
	 * returntype=List<ActiveCompanyListBO> param:null
	 */




}













//package com.nivesh.service.company;
//
//import java.text.DecimalFormat;
//import java.text.ParseException;
//import java.util.ArrayList;
//import java.util.Calendar;
//import java.util.Date;
//import java.util.HashMap;
//import java.util.Iterator;
//import java.util.LinkedHashMap;
//import java.util.List;
//import java.util.Map;
//import java.util.TreeMap;
//
//import javax.annotation.Resource;
//
//import org.apache.commons.lang.time.DateUtils;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.nivesh.bo.ActiveCompanyListBO;
//import com.nivesh.bo.CompanyStockDetailsBO;
//import com.nivesh.bo.DailyPatternReportBO;
//import com.nivesh.bo.GainerLoserBO;
//import com.nivesh.bo.LiveBSESensexBO;
//import com.nivesh.command.dashboard.GainerAndLosserCommand;
//import com.nivesh.dao.masterdatasetup.ICompanyDao;
//import com.nivesh.util.ApplicationConstant;
//import com.nivesh.util.DateHelper;
//import com.nivesh.util.ICommonCalculationService;
//import com.nivesh.util.ICompanyDetailsHelperService;
//import com.nivesh.util.SensexComparisionServices;
//
//@Service
//public class CompanyServiceImpl implements ICompanyService {
//
//	@Resource
//	private ICompanyDao companydao;
//
//	@Autowired
//	private ICompanyDetailsHelperService iCompanyDetailsHelper;
//
//	@Autowired
//	private ICommonCalculationService iCommonCalculationService;
//
//	public void setCompanydao(ICompanyDao companydao) {
//		this.companydao = companydao;
//	}
//
//	DecimalFormat dfm = new DecimalFormat("#.00");
//	@Override
//	public List<ActiveCompanyListBO> getCompanyList(String companyName) {
//		List<ActiveCompanyListBO> listBO;
//		listBO = companydao.getCompanyNameList(companyName);
//		return listBO;
//
//	}
//
//	@Override
//	public List<ActiveCompanyListBO> getCompanyList() {
//		List<ActiveCompanyListBO> companyList = null;
//		companyList = companydao.getCompanyList();
//		return companyList;
//	}
//
//
//	@Override
//	public  List<LiveBSESensexBO> getTickerData() throws ParseException{
//		List<String> companyList = getCompanyForTicker();
//
//		String companyName = ApplicationConstant.BSE_SENSEX_NAME;
//		companyList.add(companyName);
//		return getDataForBanners(companyList);	
//	}
//	@Override
//	public List<List<CompanyStockDetailsBO>> getCompanyMovingAverage(List<String> companyList, String period, int[] average)
//			throws ParseException {
//
//		List<String> updatedList = new ArrayList<>();
//
//		for (int i = 1; i < companyList.size(); i++) {
//			updatedList.add(companyList.get(i));
//		}
//
//
//		List<CompanyStockDetailsBO> closePriceList = null;
//		List<CompanyStockDetailsBO> companyStockDetailsBOList = null;
//		List<List<CompanyStockDetailsBO>> movingAverageList = null;
//		Date date = null;
//		String startDate;
//		String endDate;
//		date=DateHelper.todaysDateTimeInDBFormat();
//		endDate=DateHelper.convertDateToString(date);
//		String dateIdentifier = period.substring(2);
//		if (dateIdentifier.equals("Year")) {
//			startDate=DateHelper.previousDateYearWise(date, (Integer.parseInt(period.substring(0, 1))));
//		} else if (dateIdentifier.equals("Month")) {
//			startDate=DateHelper.previousDateMonthWise(date, (Integer.parseInt(period.substring(0, 1))));
//		} else {
//			startDate=DateHelper.previousDateDayWise(date, WEEK_DURATION);
//		}
//		movingAverageList = new ArrayList<List<CompanyStockDetailsBO>>();
//		for (int j = 0; j < updatedList.size(); j++) {
//			if (average[0] == 0) {
//				closePriceList = iCompanyDetailsHelper.getCompanyStockPrice(updatedList.get(j), startDate, endDate);
//				movingAverageList.add(closePriceList);
//			} else {
//				for (int i = 0; i < average.length; i++) {
//
//					companyStockDetailsBOList = iCompanyDetailsHelper.getCompanyStockPrice(updatedList.get(j),
//							startDate, endDate, average[i]);
//					closePriceList = iCommonCalculationService.getCompanyStockPrice(companyStockDetailsBOList,
//							average[i]);
//					if (closePriceList.size()!=0) {
//						movingAverageList.add(closePriceList);
//					} else {
//						closePriceList = iCompanyDetailsHelper.getCompanyStockPrice(updatedList.get(j), startDate, endDate);
//						movingAverageList.add(closePriceList);
//					}
//
//				}
//			}
//		}
//		if (updatedList.size() == 1) {
//			return movingAverageList;
//		} else {
//			return SensexComparisionServices.Comparision(movingAverageList);
//		}
//
//	}
//
//	@Override
//	public CompanyStockDetailsBO getlivedataFeeds(String companyName) throws ParseException {
//	    CompanyStockDetailsBO companyStockDetailsBO = companydao.getLiveDataDAO(companyName);
//
//	    if (companyStockDetailsBO == null) {
//	        // Handle null case
//	        System.err.println("No data found for company: " + companyName);
//	        return new CompanyStockDetailsBO(); // Or throw an exception
//	    }
//
//	    // Validate data if necessary
//	    if (companyStockDetailsBO.getCompanyClosePrice() == null || !isValidNumber(companyStockDetailsBO.getCompanyClosePrice())) {
//	        // Handle invalid data
//	        //System.err.println("Invalid close price for company: " + companyName);
//	        return new CompanyStockDetailsBO(); // Or throw an exception
//	    }
//
//	    // Rest of your method logic
//	    if (companyStockDetailsBO.getCompanyClosePrice() != 0.0) {
//	        boolean flag = checkingDateDiffrance(new Date(), companyStockDetailsBO.getStockDate());
//	        if (!flag) {
//	            Date stock_date = DateUtils.truncate(companyStockDetailsBO.getStockDate(), Calendar.DATE);
//	            companyStockDetailsBO.setStockDate(stock_date);
//	        }
//	        return companyStockDetailsBO;
//	    }
//	    return null;
//	}
//
//	private boolean checkingDateDiffrance(Date cur_date, Date stockDate) {
//
//		if (DateUtils.isSameDay(cur_date,stockDate)) {
//			int cur_hour = cur_date.getHours();
//			if (cur_hour <= 16 && cur_hour >= 9) {
//				return true;
//			} else {
//				return false;
//			}
//		} else {
//			return false;
//		}
//	}
//
//	@Override
//	public List<Object> getCompanyQuotesCalculation(List<List<CompanyStockDetailsBO>> companyQuotesCalculation,CompanyStockDetailsBO companyStockDetailsBOLive){
//		List<Object> quotesCalculation = new ArrayList<>(); 
//
//		Float variation= null;
//		Float closePrice = null;
//		Float openPrice= null;
//		Float highPrice= null;
//		Float lowPrice= null;
//		Float change_points= null;
//		int volume= 0;
//		Float value= null;
//		Date date = null;
//		String Currdate= null;
//		Float highClosePrice= null;
//		Float lowClosePrice= null;
//
//
//		for (int i = 0; i < companyQuotesCalculation.size(); i++) {
//			List<CompanyStockDetailsBO> BoList = companyQuotesCalculation.get(i);
//
//			List<Float> highclosePrice = new ArrayList<>();
//			List<Float> lowclosePrice = new ArrayList<>();
//			DecimalFormat dfm = new DecimalFormat("#.00");
//		
//			closePrice = companyStockDetailsBOLive.getCompanyClosePrice();
//			openPrice = companyStockDetailsBOLive.getCompanyOpenPrice();
//			highPrice = companyStockDetailsBOLive.getCompanyHighPrice();
//			lowPrice = companyStockDetailsBOLive.getCompanyLowPrice();
//			volume = companyStockDetailsBOLive.getStockVolume();
//			if (companyStockDetailsBOLive.getCompanyPrevClosePrice()!=0.0) {
//				change_points = companyStockDetailsBOLive.getCompanyClosePrice()-companyStockDetailsBOLive.getCompanyPrevClosePrice();
//				variation = (((companyStockDetailsBOLive.getCompanyClosePrice()/companyStockDetailsBOLive.getCompanyPrevClosePrice())-1)*100);
//
//			}else{
//				change_points=00.0f;
//				variation=00.0f;
//			}
//			
//			value = (float) companyStockDetailsBOLive.getCompanyTurnover();
//			date = companyStockDetailsBOLive.getStockDate();
//			Currdate = date.toString();
//			
//			if (BoList.size()== 0.0) {
//				highClosePrice = highPrice;
//				lowClosePrice = lowPrice;
//			}else{
//				for (int j = 0; j < BoList.size(); j++) {
//					CompanyStockDetailsBO companyStockDetailsBO1 = BoList.get(j);
//					highclosePrice.add(companyStockDetailsBO1.getCompanyHighPrice());
//					lowclosePrice.add(companyStockDetailsBO1.getCompanyLowPrice());
//				}
//				highClosePrice = java.util.Collections.max(highclosePrice);
//				lowClosePrice = java.util.Collections.min(lowclosePrice);
//			}
//
//			variation = Float.parseFloat(dfm.format(variation));
//			change_points = Float.parseFloat(dfm.format(change_points));
//
//			quotesCalculation.add(closePrice);
//			quotesCalculation.add(openPrice);
//			quotesCalculation.add(highPrice);
//			quotesCalculation.add(lowPrice);
//
//			quotesCalculation.add(variation);
//			quotesCalculation.add( volume);
//			quotesCalculation.add(value);
//
//			quotesCalculation.add(highClosePrice);
//			quotesCalculation.add(lowClosePrice);
//
//			quotesCalculation.add(Currdate);
//			quotesCalculation.add(change_points);
//		}
//		return quotesCalculation;
//	}
//
//	/**
//	 * This method will calculate pattern formation for a particular company
//	 * returntype=String param:String companyName
//	 */
//	@Override
//	public Map<String, Object> getCompanySuggestion(String companyName) throws ParseException {
//		Map<String, Object> finalSuggestion = null;
//		finalSuggestion=companydao.getCompanySuggestion(companyName);
//		if(finalSuggestion.containsValue(REGULAR)){
//			finalSuggestion.remove("Caution");
//		}
//		return finalSuggestion;			
//	}
//
//
//
//
//
//	@Override
//	public List<DailyPatternReportBO> getLatestPatternReport() {
//
//		List<DailyPatternReportBO> suggestionReportList = null;
//		suggestionReportList = companydao.getLatestPatternReport();
//
//		return suggestionReportList;
//	}
//
//
//
//	@Override
//	public List<LiveBSESensexBO> getDataForBanners(List<String> compnyList) throws ParseException {
//
//		List<LiveBSESensexBO> liveBSEList = new ArrayList<>(); 
//
//		CompanyStockDetailsBO companyStockDetailsBO =null;
//
//		for (int i = 0; i < compnyList.size(); i++) {
//			String companyName = compnyList.get(i);
//
//			companyStockDetailsBO=getlivedataFeeds(companyName);
//
//			List<Object> listValues = getBannerDataCalculation(companyStockDetailsBO);
//
//			LiveBSESensexBO liveBSESensexBO = new LiveBSESensexBO();
//
//			liveBSESensexBO.setCompanyName(companyName);
//			liveBSESensexBO.setCurrent_Value((Float) listValues.get(0));
//			liveBSESensexBO.setChang_points((Float) listValues.get(1));
//			liveBSESensexBO.setChange_per((Float) listValues.get(2));
//			liveBSEList.add(liveBSESensexBO);
//		}
//
//		return liveBSEList;
//
//	}
//
//
//	private List<Object> getBannerDataCalculation(CompanyStockDetailsBO companyStockDetailsBO) {
//	    List<Object> variationCalculation = new ArrayList<>(); 
//
//	    Float variation = null;
//	    Float closePrice = null;
//	    Float changePoints = null;
//	    DecimalFormat dfm = new DecimalFormat("#.00");
//
//	    // Get prices safely
//	    closePrice = companyStockDetailsBO.getCompanyClosePrice();
//	    Float prevClosePrice = companyStockDetailsBO.getCompanyPrevClosePrice();
//
//	    // Log values for debugging
//	   // System.out.println("Close Price: " + closePrice);
//	    //System.out.println("Previous Close Price: " + prevClosePrice);
//
//	    // Check for null and invalid values
//	    if (closePrice != null && prevClosePrice != null) {
//	        try {
//	            // Ensure values are not "?" or any other invalid format
//	            if (!isValidNumber(closePrice) || !isValidNumber(prevClosePrice)) {
//	                throw new NumberFormatException("Invalid number format for close prices");
//	            }
//
//	            changePoints = closePrice - prevClosePrice;
//
//	            // Check to prevent division by zero
//	            if (prevClosePrice != 0) {
//	                variation = ((closePrice / prevClosePrice - 1) * 100);
//	            } else {
//	                variation = 0.0f; // Handle case where prevClosePrice is zero
//	            }
//
//	            // Format the values safely
//	            changePoints = Float.parseFloat(dfm.format(changePoints));
//	            variation = Float.parseFloat(dfm.format(variation));
//	        } catch (NumberFormatException e) {
//	            System.out.println("Error: " + e.getMessage());
//	            variation = 0.0f; // Set a default value
//	            changePoints = 0.0f; // Set a default value
//	        }
//	    } else {
//	        //System.out.println("Close price or previous close price is null");
//	    }
//
//	    variationCalculation.add(closePrice);
//	    variationCalculation.add(changePoints);
//	    variationCalculation.add(variation);
//	    return variationCalculation;
//	}
//
//	private boolean isValidNumber(Float value) {
//	    // Check if the float is not null and not an invalid format
//	    return value != null && !value.toString().equals("?");
//	}
//
//	@Override
//	public List<String> getCompanyForTicker() {
//		return companydao.getCompnyListsForTicker();
//	}
//
//
//	@Override
//	public LiveBSESensexBO getLiveData(String firstgraphcompany) throws ParseException {
//		List<String> compnyList = null;
//		compnyList=new ArrayList<>();
//		compnyList.add(firstgraphcompany);
//		List<LiveBSESensexBO> liveSensexBOs =  getDataForBanners(compnyList);
//		return liveSensexBOs.get(0);
//	}
//
//
//
//	@Override
//	public Map<String,List<LiveBSESensexBO>> getLiveGainerLosserTurnover() {
//
//		List<LiveBSESensexBO> gainerLoserBoList=null;
//		List<LiveBSESensexBO> gainerBoList=null;
//		List<LiveBSESensexBO> loserBoList=null;
//		List<LiveBSESensexBO> topTurnOverList=null;
//		List<LiveBSESensexBO> liveBSESensexAlteredList=null;
//
//		Map<String,List<LiveBSESensexBO>> gainerLoserTurnoverMap=null;
//		Map<Float, List<LiveBSESensexBO>> gainerLoserMap=null;
//		Map<Float, List<LiveBSESensexBO>> turnOverMap=null;
//		Map<Float, List<LiveBSESensexBO>> iterationMap=null;
//
//		gainerLoserMap = new TreeMap<>();
//		turnOverMap = new TreeMap<>();
//
//		gainerLoserBoList=companydao.getGainerLoserTurnover();
//
//		Float closeprice=null;
//		Float prvcloseprice=null;
//		Float var=null;
//		Float percentage=null;
//		Float turnOver=null;
//
//
//
//		for(int i=0;i<gainerLoserBoList.size()-1;i++){
//
//			closeprice=gainerLoserBoList.get(i).getCurrent_Value();
//			prvcloseprice=gainerLoserBoList.get(i).getPrev_Close_Price();
//			if(prvcloseprice==0){
//				prvcloseprice=closeprice;
//			}
//			var=Float.parseFloat(dfm.format((closeprice-prvcloseprice)));
//			percentage=Float.parseFloat(dfm.format(((closeprice/prvcloseprice)*100)-100));
//			turnOver=gainerLoserBoList.get(i).getTurnOver();
//
//			liveBSESensexAlteredList=new ArrayList<>();
//
//			LiveBSESensexBO liveBSESensexBO=new LiveBSESensexBO();
//			liveBSESensexBO.setCompanyName(gainerLoserBoList.get(i).getCompanyName());
//			liveBSESensexBO.setCurrent_Value(closeprice);
//			liveBSESensexBO.setChang_points(var);
//			liveBSESensexBO.setChange_per(percentage);
//			liveBSESensexBO.setVolume(gainerLoserBoList.get(i).getVolume());
//			liveBSESensexBO.setTurnOver(gainerLoserBoList.get(i).getTurnOver());
//			liveBSESensexBO.setAuditDateTime(gainerLoserBoList.get(i).getAuditDateTime());
//			liveBSESensexAlteredList.add(liveBSESensexBO);
//
//			gainerLoserMap.put(percentage, liveBSESensexAlteredList);
//			turnOverMap.put(turnOver, liveBSESensexAlteredList);
//		}
//
//
//		int loserCount=0;
//		loserBoList=new ArrayList<>();
//		for (Map.Entry<Float, List<LiveBSESensexBO>> entry1 : gainerLoserMap.entrySet()) {
//			loserBoList.addAll(entry1.getValue());
//			loserCount++;
//
//			if(loserCount==5){
//				break;
//			}
//		}
//
//		int gainerCount=0;
//		gainerBoList=new ArrayList<>();
//		iterationMap=((TreeMap<Float, List<LiveBSESensexBO>>) gainerLoserMap).descendingMap();
//		for (Map.Entry<Float, List<LiveBSESensexBO>> entry1 : iterationMap.entrySet()) {
//			gainerBoList.addAll(entry1.getValue());
//			gainerCount++;
//
//			if(gainerCount==5){
//				break;
//			}
//		}
//
//		topTurnOverList=new ArrayList<>();
//		int turnOverCount=0;
//		iterationMap=((TreeMap<Float, List<LiveBSESensexBO>>) turnOverMap).descendingMap();
//		for (Map.Entry<Float, List<LiveBSESensexBO>> entry1 : iterationMap.entrySet()) {
//			topTurnOverList.addAll(entry1.getValue());
//			turnOverCount++;
//
//			if(turnOverCount==5){
//				break;
//			}
//		}
//
//		gainerLoserTurnoverMap=new LinkedHashMap<>();
//		gainerLoserTurnoverMap.put("Gainer", gainerBoList);
//		gainerLoserTurnoverMap.put("Loser", loserBoList);
//		gainerLoserTurnoverMap.put("TurnOver", topTurnOverList);
//		return gainerLoserTurnoverMap;
//
//	}
//
//
//	@Override
//	public Map<String,List<DailyPatternReportBO>> getHighLight() {
//
//		List<DailyPatternReportBO> highLightList=null;
//		List<DailyPatternReportBO> strongBuyList=null;
//		List<DailyPatternReportBO> buyList=null;
//		List<DailyPatternReportBO> sellList=null;
//		List<DailyPatternReportBO> holdList=null;
//		List<DailyPatternReportBO> bookProfitList=null;
//
//
//		Map<String,List<DailyPatternReportBO>> gainerLoserTurnoverMap=null;
//
//
//		highLightList = new ArrayList<>();
//		highLightList=companydao.getHighLights();
//
//		buyList= new ArrayList<>();
//		sellList = new ArrayList<>();
//		holdList = new ArrayList<>();
//		bookProfitList = new ArrayList<>();
//		strongBuyList = new ArrayList<>();
//
//		for(int i=0;i<highLightList.size()-1;i++){
//
//			if(highLightList.get(i).getSuggestion().equalsIgnoreCase("STRONG BUY")){
//				if(strongBuyList.size()<5){
//					strongBuyList.add(highLightList.get(i));
//				}
//			}else if(highLightList.get(i).getSuggestion().equalsIgnoreCase("BUY")){
//				if(buyList.size()<5){
//					buyList.add(highLightList.get(i));
//				}
//			}else if(highLightList.get(i).getSuggestion().equalsIgnoreCase("SELL")){
//				if(sellList.size()<5){
//					sellList.add(highLightList.get(i));
//				}
//
//			}else if(highLightList.get(i).getSuggestion().equalsIgnoreCase("HOLD")){
//				if(holdList.size()<5){
//					holdList.add(highLightList.get(i));
//				}
//
//			}else if(highLightList.get(i).getSuggestion().equalsIgnoreCase("BOOK PARTIAL PROFIT")){
//				if(bookProfitList.size()<5){
//					bookProfitList.add(highLightList.get(i));
//				}
//
//			}
//		}	
//
//		gainerLoserTurnoverMap=new LinkedHashMap<>();
//		gainerLoserTurnoverMap.put("strongBuyList", strongBuyList);
//		gainerLoserTurnoverMap.put("buyList", buyList);
//		gainerLoserTurnoverMap.put("sellList", sellList);
//		gainerLoserTurnoverMap.put("holdList", holdList);
//		gainerLoserTurnoverMap.put("bookProfitList", bookProfitList);
//		return gainerLoserTurnoverMap;
//	}
//
//	@Override
//	public List<DailyPatternReportBO> getHilightesCompanyData(int numberofCompany) {
//
//
//		List<DailyPatternReportBO> suggestionReportList = null;
//		suggestionReportList = companydao.getHilightesCompanyDataReport(numberofCompany);
//
//		return suggestionReportList;
//	}
//
//
//
//	@Override
//	public Map<String, Object> getWholeGainerLoser(GainerAndLosserCommand gainerAndLosserCommand) {
//
//		String durationCategory = gainerAndLosserCommand.getDurationRange();
//		String priceRange = gainerAndLosserCommand.getPriceRange();
//		String indexRange = gainerAndLosserCommand.getIndexRange();
//
//		String category = durationCategory.substring(0, 1);
//		String duration = durationCategory.substring(2);
//		String durationString= durationCategory.substring(2);
//		String type = null;
//		String orderBy = null;
//		if (category.equals("G")) {
//			orderBy="DESC";
//			type="GAINERS";
//		}
//		if (category.equals("L")) {
//			orderBy="ASC";
//			type="LOSERS";
//		}
//
//
//		int start_price = Integer.parseInt(priceRange.substring(0, 2));
//		int end_price;
//		String headings;
//		if (!priceRange.substring(6, 8).equals("99")) {
//			end_price =  Integer.parseInt(priceRange.substring(6, 8));	
//			headings=type+" Over "+durationString+": BSE (RS "+start_price+" to "+end_price+")";
//		} else {
//			end_price =  ApplicationConstant.MAX_PRICE;
//			headings=type+" Over "+durationString+": BSE (Above Rs 20)";
//		}
//
//
//		int limit = Integer.parseInt(indexRange);	
//
//
//		List<GainerLoserBO> listofGainerOrLoserBOList= companydao.getGainerOrLoserValue(duration,orderBy,start_price,end_price,limit);
//
//		Iterator<GainerLoserBO> itr = null;
//		itr = listofGainerOrLoserBOList.iterator(); 
//		if(orderBy.equals("ASC")){
//
//			while (itr.hasNext()) {
//				GainerLoserBO  gainerLoserBO =  itr.next(); 
//				if (gainerLoserBO.getPercentageVariation()>=0) { 
//					itr.remove(); 
//				}
//			}
//
//
//		}else{
//
//			while (itr.hasNext()) {
//				GainerLoserBO  gainerLoserBO =  itr.next(); 
//				if (gainerLoserBO.getPercentageVariation()<0) { 
//					itr.remove(); 
//				}
//			}
//		}
//
//		Map<String, Object> map = new HashMap<>();
//		map.put("GainerORLoser", listofGainerOrLoserBOList);
//		map.put("Headings", headings);
//
//
//		return map;
//	}
//
//
//	@Override
//	public List<LiveBSESensexBO> getnewlyaddedcompany() {
//
//		List<LiveBSESensexBO> list=null;
//		list=companydao.getnewlyaddedcompany();
//		return list;
//	}
//
//
//	@Override
//	public ActiveCompanyListBO getsc_codeBaseCompanyName(String companyName) {
//		ActiveCompanyListBO activeCompanyListBO = companydao.getdetailsBaseCompanyName(companyName);
//		return activeCompanyListBO;
//	}
//
//
//
//
//	/**
//	 * This method will entire company names from DB for testing purpose
//	 * returntype=List<ActiveCompanyListBO> param:null
//	 */
//
//
//
//
//}
