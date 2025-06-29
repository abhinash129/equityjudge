package com.nivesh.dao;

public interface LoginSqlConstants {

	public static final String SQL_SIGNIN_VALIDATION="SELECT UNAME,PASSWORD,FIRST_LOGIN,SUBSCRIPTION,DURATION,REG_DATE,PAYMENT_DATE FROM niv_userlog WHERE UNAME= Binary ?  AND PASSWORD=?";
	public static final String SQL_NEWS="SELECT TEXT FROM niv_news WHERE ACTIVE='Y'";
	public static final String INSERT_INTO_niv_userlog="INSERT INTO niv_userlog(UNAME,PASSWORD,ACTIVE,AUDIT_ACTION,AUDIT_DATE_TIME,USERID,SUBSCRIPTION,REG_DATE) VALUES(:uname,:password,:active,:audit_action,:audit_date_time,:userId,:subscription,:reg_date) ";
	public static final String INSERT_INTO_niv_usermstr="INSERT INTO niv_usermstr(UNAME,FIRSTNAME,LASTNAME,OCCUPATION,ADDRESSLINE,STATE,COUNTRY,PH_NO,EMAIL_ID,ACTIVE,AUDIT_ACTION,AUDIT_DATE_TIME,USERID) VALUES(:uname,:firstname,:lastname,:occupation,:addressLine,:state,:country,:ph_no,:email_id,:active,:audit_action,:audit_date_time,:userId)";
	public static final String SQL_COMPNAME = "SELECT COMPANYNAME,SC_CODE,SC_ID,INDUSTRY FROM niv_activecompanylist WHERE COMPANYNAME LIKE ? OR SC_ID LIKE ? OR SC_CODE LIKE ?;";

	public static final String SQL_COMPANYNAME_FOR_TESTING="SELECT DISTINCT COMPANYNAME FROM niv_activecompanylist";
	public static final String SQL_FORGOT_PASSWORD = "SELECT UL.`UNAME`,`EMAIL_ID`,`PASSWORD`  FROM `niv_userlog` UL INNER JOIN  `niv_usermstr` UM ON UL.`UNAME`=UM.`UNAME` WHERE UL.UNAME=?";

	
	public static final String SQL_CHECK_OLDPASSWORD="SELECT COUNT(*) FROM niv_userlog WHERE UNAME=? AND PASSWORD=?";
	
	public static final String SQL_CHANGE_PASSWORD="UPDATE niv_userlog SET PASSWORD =? WHERE UNAME=?";
	
	public static final String SQL_GETSENDER_IDPASS="SELECT VALUE1,VALUE2 FROM niv_sysconfig WHERE PARENT_ID=?";
	public static final String SQL_GETRECIVER_EMAIL="SELECT VALUE1 FROM niv_sysconfig WHERE PARENT_ID=?";
	
	
	
	public static final String INSERT_INTO_USERLOG_HISTORY="INSERT INTO niv_userlog_history (UNAME,LAST_LOGIN_DATE_TIME,IP_ADDR,SYSTEM_NAME)VALUES(?,?,?,?)"; 

    public static final  String SQL_GET_UNAME="SELECT COUNT(*) FROM niv_userlog_history WHERE UNAME=?";
    public static final String UPDATE_USERLOG_HISTORY="UPDATE niv_userlog_history SET LAST_LOGIN_DATE_TIME=?,IP_ADDR=?,SYSTEM_NAME=? WHERE UNAME=?";

//    public static final String SQL_ACCURACY_PATTERN="SELECT `date`,`patternName`,suggestion,weeks,total_companies,`accuracy`,15Day_CommulativeAccuracy FROM `niv_patternaccuracy_data` WHERE  `accuracy`!='-1'";
    public static final String SQL_ACCURACY_PATTERN="SELECT `patternName`,suggestion,weeks,total_companies,`accuracy`,15Day_CommulativeAccuracy,`Date` FROM "
    		+ "`niv_patternaccuracy_data` WHERE  `accuracy`!=-1";

    public static final String UPDATE_SUBSCRIPTION_IN_USERLOG="UPDATE niv_userlog SET ACTIVE=?,AUDIT_ACTION=?,AUDIT_DATE_TIME=?,SUBSCRIPTION=?,DURATION=?,PAYMENT_DATE=? WHERE UNAME=?";


    public static final String USER_SUBSCRIPTION_DETAILS="SELECT DURATION,PAYMENT_DATE FROM niv_userlog WHERE UNAME=? AND SUBSCRIPTION=?";
    public static final String INSERT_INTO_USERREVIEW="INSERT INTO niv_review (IP_ADDRESS,REVIEW,AUDIT_ACTION,AUDIT_DATE_TIME)VALUES(?,?,?,?)";
    public static final String SQL_GET_REVIEWDATA="SELECT IP_ADDRESS,REVIEW FROM niv_review WHERE IP_ADDRESS=?";
    public static final String UPDATE_USER_REVIEW="UPDATE niv_review SET REVIEW=?,AUDIT_ACTION=?,AUDIT_DATE_TIME=? WHERE IP_ADDRESS=?";
}
