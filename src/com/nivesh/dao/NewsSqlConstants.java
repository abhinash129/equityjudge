package com.nivesh.dao;

public interface NewsSqlConstants {
	public static String SQL_INSERT_NEWSMODULE="INSERT INTO niv_news (SUBJECT,TEXT,ACTIVE,AUDIT_ACTION,AUDIT_DATE_TIME)VALUES(?,?,?,?,?)";
	public static String SQL_UPDATE_NEWS = "UPDATE niv_news SET TEXT=? WHERE SUBJECT=?";
	public static String SQL_DELETE_NEWS = "DELETE FROM niv_news WHERE ID=?";
	public static final String SQL_UPDATEFOR_NEWS="SELECT ID,SUBJECT,TEXT FROM niv_news";
	public static final String SQL_DELETE_ALL_NEWS="DELETE FROM niv_news";
	
	public static String SQL_BATCHINSERT_NEWSDATA="INSERT INTO niv_news (SUBJECT,TEXT,ACTIVE,AUDIT_ACTION,AUDIT_DATE_TIME)VALUES(?,?,?,?,?)";

}
