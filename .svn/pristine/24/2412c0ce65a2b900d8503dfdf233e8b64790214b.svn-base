package com.nivesh.dao;

public interface WatchListSqlConstant {
	
	
	public static final String CHECK_COMPANY_EXISTENCE = "SELECT COUNT(1) FROM `niv_watchlist` where `COMPANY_CODE`= ? AND USERID= ?";

	public static final String GET_COMPANY_SUGGESTION = "SELECT PATTERN_NAME,SUGGESTION,FORMING_DATE FROM `niv_daily_pattern_report` WHERE COMPANYNAME= :companyName "
			+ " AND FORMING_DATE=(SELECT MAX(FORMING_DATE) FROM `niv_daily_pattern_report` WHERE COMPANYNAME= :companyName)";
	
	public static final String INSERT_WATCHLIST = "INSERT INTO `niv_watchlist`(`COMPANY_CODE`,`COMPANYNAME`,`INITIATED_DATE`,`SUGGESTION`,`SUGGESTION_DATE`,`STATUS`,`AUDIT_ACTION`,`USERID`,`AUDIT_DATE_TIME`) "
			+ "VALUES(:company_code,:company_name,:initiated_date,:suggestion,:suggestion_Date,:status,:audit_action,:user_id,:audit_date_time)";

	public static final String FIND_WATCHLIST_BY_USERID = "SELECT `COMPANY_CODE` FROM `niv_watchlist` WHERE "
			+ "`USERID`=?";
	
	public static final String DELETE_WATCHLIST_BY_COMPANY_CODE = "DELETE FROM `niv_watchlist` WHERE `COMPANY_CODE`= ? AND USERID=?";
	
	
	public static final String SQL_COMPANYNAME_FOR_DROPDOWN="SELECT SC_CODE,SC_ID,COMPANYNAME,`GROUP`,FACEVALUE,INDUSTRY FROM niv_activecompanylist WHERE COMPANYNAME LIKE :COMPANYNAME";
}
