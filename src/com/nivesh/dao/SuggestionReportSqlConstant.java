package com.nivesh.dao;

public interface SuggestionReportSqlConstant {
	
	public static final String GET_PATTERN_SUGGESTION ="SELECT `COMPANYNAME`,`PATTERN_NAME`,SUGGESTION ,`FORMING_DATE`,`STATUS`  FROM `niv_daily_pattern_report` "
			+ "WHERE `COMPANYNAME` LIKE ? AND `FORMING_DATE`=(SELECT MAX(`FORMING_DATE`) FROM `niv_daily_pattern_report` WHERE `COMPANYNAME`LIKE ?)";
	
//	public static final String GET_LATEST_PATTERN_DATA="SELECT `COMPANYNAME`,`PATTERN_NAME`,`SUGGESTION`,`FORMING_DATE` FROM `niv_daily_pattern_report`"
//			+ "WHERE `FORMING_DATE` =(SELECT MAX(FORMING_DATE) FROM `niv_daily_pattern_report`) AND `PATTERN_NAME`!='UNAVAILABLE' AND `SUGGESTION` "
//					+ "NOT LIKE '%TO BUY %'";
	
	
	public static final String GET_LATEST_PATTERN_DATA = "SELECT t.COMPANYNAME ,t.PATTERN_NAME,t.SUGGESTION,t.FORMING_DATE,l.VALUE,l.CLOSE_PRICE FROM niv_daily_pattern_report t LEFT JOIN niv_livedatafeeds l ON (t.COMPANYNAME=l.COMPANYNAME) WHERE  t.FORMING_DATE=(SELECT MAX(FORMING_DATE) FROM niv_daily_pattern_report) AND t.PATTERN_NAME!='UNAVAILABLE' AND (t.SUGGESTION NOT LIKE '%TO BUY %')";
	
	public static final String GET_HILIGHTES_COMPANY_DATA_REPORT ="SELECT `COMPANYNAME`,`PATTERN_NAME`,SUGGESTION ,`FORMING_DATE`,`STATUS`,AUDIT_DATE_TIME "
			+ " FROM `niv_daily_pattern_report` WHERE `FORMING_DATE`=(SELECT MAX(`FORMING_DATE`) FROM `niv_daily_pattern_report`) AND pattern_name='UPTREND' "
			+ "AND (SUGGESTION='STRONG BUY' OR SUGGESTION='BUY') AND `status`='REGULAR STOCK' LIMIT ?";
	
//	public static final String GET_HIGHLIGHTS ="SELECT `COMPANYNAME`,`PATTERN_NAME`,SUGGESTION ,`FORMING_DATE`,AUDIT_DATE_TIME FROM `niv_daily_pattern_report`"
//			+ "WHERE (SUGGESTION='STRONG BUY' OR SUGGESTION='BUY' OR SUGGESTION='BOOK PARTIAL PROFIT' OR SUGGESTION='SELL' OR SUGGESTION='SHORTTERM BUY' OR SUGGESTION='HOLD')  AND  `FORMING_DATE`=(SELECT MAX(`FORMING_DATE`) "
//			+ "FROM `niv_daily_pattern_report`) AND `status`='REGULAR STOCK'";
//	
	
	public static final String GET_HIGHLIGHTS = 
		    "SELECT t.COMPANYNAME, t.PATTERN_NAME, t.SUGGESTION, t.FORMING_DATE, t.AUDIT_DATE_TIME, " +
		    "       l.CLOSE_PRICE " +  // Fetching CLOSE_PRICE from niv_livedatafeeds
		    "FROM niv_daily_pattern_report t " +
		    "LEFT JOIN niv_livedatafeeds l ON t.COMPANYNAME = l.COMPANYNAME " +
		    "WHERE (t.SUGGESTION = 'STRONG BUY' OR t.SUGGESTION = 'BUY' OR " +
		    "       t.SUGGESTION = 'BOOK PARTIAL PROFIT' OR t.SUGGESTION = 'SELL' OR " +
		    "       t.SUGGESTION = 'SHORTTERM BUY' OR t.SUGGESTION = 'HOLD') " +
		    "AND t.FORMING_DATE = (SELECT MAX(FORMING_DATE) FROM niv_daily_pattern_report) " +
		    "AND t.STATUS = 'REGULAR STOCK'";

}


