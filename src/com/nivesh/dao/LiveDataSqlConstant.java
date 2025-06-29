package com.nivesh.dao;

public interface LiveDataSqlConstant {

//	public static final String SQL_GETLIVE_DATAFEEDS="SELECT OPEN_PRICE,HIGH_PRICE,LOW_PRICE,CLOSE_PRICE,PREV_CLOSE_PRICE,VOLUME,VALUE,AUDIT_DATE_TIME  "
//			+ "FROM niv_livedatafeeds WHERE COMPANYNAME=?";

	
	public static final String SQL_GETLIVE_DATAFEEDS="SELECT OPEN_PRICE,HIGH_PRICE,LOW_PRICE,CLOSE_PRICE,PREV_CLOSE_PRICE,VOLUME,VALUE,AUDIT_DATE_TIME  "
			+ "FROM niv_livedatafeeds WHERE REPLACE(TRIM(UPPER(COMPANYNAME)),'.','')=REPLACE(TRIM(UPPER(?)),'.','')";
	
	
/*	public static final String SQL_GETLIVE_DATAFEEDS="SELECT OPEN_PRICE,HIGH_PRICE,LOW_PRICE,CLOSE_PRICE,PREV_CLOSE_PRICE,VOLUME,VALUE,AUDIT_DATE_TIME  "
			+ "FROM niv_livedatafeeds WHERE sc_code=?";*/
	
//	public static final String SQL_GETCOMPANYFOR_TICKER="SELECT COMPANYNAME FROM niv_daily_pattern_report WHERE FORMING_DATE = (SELECT MAX(FORMING_DATE) "
//			+ "FROM niv_daily_pattern_report WHERE PATTERN_NAME!='UNAVAILABLE') AND (SUGGESTION='STRONG BUY' OR SUGGESTION='BUY') LIMIT 10";

	
	
	
	public static final String SQL_GETCOMPANYFOR_TICKER="SELECT\r\n" + 
			"    ndpr.COMPANYNAME,\r\n" + 
			"    ndpr.SUGGESTION,\r\n" + 
			"    nld.CLOSE_PRICE\r\n" + 
			"FROM\r\n" + 
			"    niv_daily_pattern_report ndpr\r\n" + 
			"JOIN\r\n" + 
			"    niv_livedatafeeds nld\r\n" + 
			"ON\r\n" + 
			"    TRIM(UPPER(ndpr.COMPANYNAME)) = TRIM(UPPER(nld.COMPANYNAME))\r\n" + 
			"WHERE\r\n" + 
			"    ndpr.FORMING_DATE = (SELECT MAX(FORMING_DATE)\r\n" + 
			"                          FROM niv_daily_pattern_report\r\n" + 
			"                          WHERE PATTERN_NAME != 'UNAVAILABLE')\r\n" + 
			"    AND (ndpr.SUGGESTION = 'STRONG BUY' OR ndpr.SUGGESTION = 'BUY')\r\n" + 
			"    AND nld.CLOSE_PRICE IS NOT NULL\r\n" + 
			"ORDER BY\r\n" + 
			"    nld.AUDIT_DATE_TIME DESC\r\n" + 
			"LIMIT 10;";

	
	
	
	public static final String SQL_GETGAINER_LOSER_TURNOVER_INTRADAY="SELECT `COMPANYNAME`,`CLOSE_PRICE`,`PREV_CLOSE_PRICE`,`VOLUME`,`VALUE`,`AUDIT_DATE_TIME` FROM `niv_livedatafeeds` "
			+ "WHERE `COMPANYNAME`!='BSE SENSEX' AND `OPEN_PRICE`>10 AND `AUDIT_DATE_TIME`>(SELECT MAX(DATE(`AUDIT_DATE_TIME`))  FROM `niv_livedatafeeds`) AND`PREV_CLOSE_PRICE` IS NOT NULL";
	
	public static String SQL_GETGAINER_LOSER_ALL ="SELECT COMPANYNAME,CLOSE_PRICE,1YEAR,6MONTH,1MONTH,1WEEK FROM `niv_gainerlosser` WHERE ";
	
	public static final String SQL_GET_TOP_TURNOVER="SELECT `COMPANYNAME`,`CLOSE_PRICE`,`VOLUME`,`VALUE` FROM `niv_livedatafeeds` WHERE `AUDIT_DATE_TIME`>((SELECT MAX(DATE(`AUDIT_DATE_TIME`)) FROM `niv_livedatafeeds`)) AND `COMPANYNAME`!='BSE SENSEX' ORDER BY `VALUE` DESC LIMIT 5";

   public static String SQL_NEWLYADDED_COMPANY="SELECT niv_activecompanylist.COMPANYNAME, niv_activecompanylist.`AUDIT_DATE_TIME`, niv_livedatafeeds.CLOSE_PRICE FROM `niv_activecompanylist` INNER JOIN `niv_livedatafeeds` ON niv_activecompanylist.SC_CODE= niv_livedatafeeds.SC_CODE WHERE niv_activecompanylist.`AUDIT_ACTION`='I' AND niv_livedatafeeds.CLOSE_PRICE!=0 ORDER BY `niv_activecompanylist`.`AUDIT_DATE_TIME` DESC LIMIT 5";
}
	
