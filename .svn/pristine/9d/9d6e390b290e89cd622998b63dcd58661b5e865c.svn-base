package com.nivesh.dao;

public class SignupSqlConstants {
	public static final String SQL_USERNAME_VALIDATION = "SELECT COUNT(1) FROM niv_userlog WHERE UNAME=? ";
	public static final String SQL_EMAIL_VALIDATION = "SELECT COUNT(1) FROM niv_usermstr WHERE EMAIL_ID=? ";
	public static final String SQL_PHONE_VALIDATION = "SELECT COUNT(1) FROM niv_usermstr WHERE PH_NO LIKE ? ";
	public static final String INSERT_INTO_niv_userlog = "INSERT INTO niv_userlog(UNAME,PASSWORD,FIRST_LOGIN,ACTIVE,"
			+ "AUDIT_ACTION,AUDIT_DATE_TIME,USERID,SUBSCRIPTION,DURATION,REG_DATE) VALUES(?,?,?,?,?,?,?,?,?,?) ";
	public static final String INSERT_INTO_niv_usermstr = "INSERT INTO niv_usermstr(UNAME,FIRSTNAME,LASTNAME,OCCUPATION,ADDRESSLINE,STATE,COUNTRY,PH_NO,EMAIL_ID,ACTIVE,AUDIT_ACTION,AUDIT_DATE_TIME,USERID,REACHUS) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	public static final String UPDATE_EMAIL = "UPDATE niv_usermstr SET EMAIL_ID=? WHERE UNAME=?";
	public static final String UPDATE_MOBILE = "UPDATE niv_usermstr SET PH_NO=? WHERE UNAME=?";
}
