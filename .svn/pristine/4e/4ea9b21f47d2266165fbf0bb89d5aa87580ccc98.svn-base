package com.nivesh.dao;

public interface PortfolioSqlConstants
 {
	
    
	
	public static final String SQL_GETCOMPANYNAME="SELECT SC_CODE,SC_ID,COMPANYNAME,`GROUP`,FACEVALUE,INDUSTRY FROM niv_activecompanylist WHERE COMPANYNAME LIKE :COMPANYNAME";

	public static final String SQL_INSERT="INSERT INTO  nivpof_buystock (SC_CODE,DATE,PRICE,NO_OF_SHRS,STATUS,AUDIT_ACTION,USER_ID)  VALUES(?,?,?,?,?,?,?)"; //here i change
      
    public static final String SQL_SHOW_COMPANYDATA="SELECT COMPANYNAME,DATE,PRICE,NO_OF_SHRS,SC_CODE FROM nivpof_buystock WHERE USER_ID=?";	
  
    public static final String SQL_GET_CURRENT_RATE="SELECT CLOSE_PRICE FROM niv_companystockdetails INNER JOIN niv_activecompanylist ON niv_activecompanylist.`SC_CODE`=NIV_COMPANYSTOCKDETAILS.`SC_CODE` WHERE niv_activecompanylist.`COMPANYNAME`=? AND DATE=?";
    public static final String SQL_GET_SELL_LIST="SELECT COMPANYNAME,DATE,PRICE,NO_OF_SHRS,AUDIT_DATE_TIME,SC_CODE FROM nivpof_buystock WHERE USER_ID=?";
    public static final String SQL_INSERT_SELL="INSERT INTO  nivpof_sellstock (P_ID,SC_CODE,DATE,PRICE,NO_OF_SHRS,USER_ID,STATUS,AUDIT_ACTION)  VALUES(?,?,?,?,?,?,?,?)";
    public static final String SQL_SHOW_COMPANYSELLDATA="SELECT COMPANYNAME,DATE,PRICE,NO_OF_SHRS FROM nivpof_sellstock WHERE USER_ID=?";
    
   
    
    public static final String SQL_PORT_COMPANY_COUNT="SELECT COUNT(COMPANYNAME) FROM `nivpof_buystock` WHERE COMPANYNAME=?";
    public static final String SQL_SELLLIST_BY_NAME="SELECT P_ID,SC_CODE,(SELECT COMPANYNAME FROM `niv_activecompanylist` WHERE COMPANYNAME=?),DATE,PRICE,NO_OF_SHRS FROM nivpof_buystock WHERE SC_CODE=(SELECT SC_CODE FROM `niv_activecompanylist` WHERE COMPANYNAME=?) AND (STATUS='Y' AND USER_ID=?)";

   // public static final String SQL_GET_SC_CODE_BY_USERID="SELECT SC_CODE FROM `nivpof_buystock` WHERE USER_ID=?";
    public static final String SQL_GET_SC_CODE_BY_USERID="SELECT SC_CODE FROM `nivpof_buystock` WHERE USER_ID=? and STATUS='Y' ORDER BY DATE ASC";
     
    public static final String SQL_GET_PID_AND_SCCODE_BY_USERID="SELECT P_ID,SC_CODE,`AUDIT_DATE_TIME` FROM `nivpof_sellstock` WHERE USER_ID=? ORDER BY `SERIAL_NO` DESC LIMIT 1";
    
    public static final String SQL_GET_STATUS="SELECT DISTINCT STATUS  FROM `nivpof_buystock` WHERE SC_CODE=?";
    public static final String SQL_SELL_VALIDATION="SELECT DATE,`NO_OF_SHRS` FROM `nivpof_buystock` WHERE P_ID=?"; //4feb
    
    //28/6
    public static String SQL_BATCHDELETE_ADDSTOCK="UPDATE  nivpof_buystock SET STATUS=? WHERE P_ID=?  AND USER_ID=?";
    public static String SQL_BATCHUPDATE_BUYSTOCK="UPDATE nivpof_buystock SET DATE=?,PRICE=?,NO_OF_SHRS=?,AUDIT_ACTION=?,AUDIT_DATE_TIME=?"
    		+ " WHERE P_ID=? AND SC_CODE=?  AND USER_ID=?";
    
    
    public static final String SQL_GET_PID_AND_SCCODE_BY_USERID_BTN_DATE="SELECT P_ID,SC_CODE,`AUDIT_DATE_TIME` FROM `nivpof_sellstock` WHERE USER_ID=? and DATE between ? and ?";
    
}
