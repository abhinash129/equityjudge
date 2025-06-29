package com.nivesh.dao;

public interface AccuracyConstant {

	 public static final  String SQL_GET_ACCURACY=" SELECT DISTINCT  `a`.`COMPANYNAME`,`a`.`PATTERN_NAME` ,`a`.`SUGGESTION`,`a`.`FORMING_DATE`,`c`.`CLOSE_PRICE` AS BackPrice,`c`.`SC_CODE` FROM `niv_daily_pattern_report` AS `a`   JOIN `niv_livedatafeeds` AS `b` JOIN `niv_companystockdetails` AS `c` WHERE (((`PATTERN_NAME`='UPTREND' OR `PATTERN_NAME`='30DMA CROSSES 100DMA UPWARD'  OR `PATTERN_NAME`='DOUBLE BOTTOM')  AND (`SUGGESTION`='STRONG BUY' OR `SUGGESTION`='BUY') AND (`FORMING_DATE` BETWEEN ? AND ?)) AND `b`.`COMPANYNAME`=`a`.`COMPANYNAME` AND `b`.`SC_CODE`=`c`.`SC_CODE` AND (`DATE` BETWEEN ? AND ?)) ORDER BY `SC_CODE` ";
	
	 
	 public static final  String SQL_GET_ACCURACY1="SELECT CLOSE_PRICE FROM `niv_companystockdetails` WHERE SC_CODE=? AND `DATE`=?";
	 
	 public static final String SQL_GET_ACCURACY2="SELECT CLOSE_PRICE FROM `niv_companystockdetails` WHERE SC_CODE='999901' AND `DATE`=?";
	 
	 public static final String SQL_GET_ACCURACY3="SELECT CLOSE_PRICE FROM `niv_companystockdetails` WHERE SC_CODE='999901' AND `DATE`=?";
}
