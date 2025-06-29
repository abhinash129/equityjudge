package com.nivesh.dao;

public interface SecuritySqlConstants {
	
	public static String SQL_GET_MAXID="SELECT MODULENAME FROM niv_maxidsetupdata WHERE TABLENAME=?";
	
	public static String SQL_GET_LABELFORID="SELECT TABLEIDLABEL FROM niv_maxidsetupdata WHERE TABLENAME=?";
	
	
	

	public static String SQL_SEARCH_MODULE="SELECT MODULE_ID,MODULE_NAME,DESCRIPTION,STATUS,AUDIT_ACTION,AUDIT_DATE_TIME,USERID from nivsec_modulemaster WHERE";
	
	public static String SQL_INSERT_NEWMODULE="INSERT INTO nivsec_modulemaster VALUES(:module_id,:module_name,:description,:status,:auditaction,:auditDatetime,:userid)";

	public static String SQL_UPDATE_MODULE="UPDATE nivsec_modulemaster SET MODULE_NAME =:module_name, DESCRIPTION =:description, STATUS=:status, AUDIT_ACTION=:auditaction, AUDIT_DATE_TIME=:auditDatetime WHERE MODULE_ID=:module_id;";

	public static final String SQL_DELETE_MODULE = "DELETE FROM nivsec_modulemaster WHERE MODULE_ID=? ";

	public static final String SQL_MODULENAME_VALIDATION = "SELECT COUNT(1) FROM nivsec_modulemaster WHERE MODULE_NAME=? ";
	
	
	public static String SQL_SEARCH_FEATURE = "SELECT FEATUREID,FEATURENAME,DESCRIPTION,STATUS,PATH,AUDIT_ACTION,AUDIT_DATE_TIME,USERID FROM nivsec_featurmstr WHERE"; 

	public static String SQL_INSERT_NEWFEATURE="INSERT INTO nivsec_featurmstr VALUES(:featureid,:featurename,:description,:status,:path,:auditaction,:auditdatetime,:userid)";

	public static final String SQL_DELETE_FEATURE = "DELETE FROM nivsec_featurmstr WHERE FEATUREID=? ";
	
	public static final String SQL_FEATURENAME_VALIDATION = "SELECT COUNT(1) FROM nivsec_featurmstr WHERE FEATURENAME=? ";
	
	public static String SQL_UPDATE_FEATURE="UPDATE nivsec_featurmstr SET FEATURENAME =:featurename, DESCRIPTION =:description, PATH =:path, STATUS=:status, AUDIT_ACTION=:auditaction, AUDIT_DATE_TIME=:auditdatetime WHERE FEATUREID=:featureid";
	
	
	
	
	
	public static String SQL_SEARCH_ROLE ="SELECT ROLEID,ROLENAME,COMMENTS,STATUS,AUDIT_ACTION,AUDIT_DATE_TIME,USERID from nivsec_rolemstr WHERE";
	
	public static String SQL_INSERT_NEWROLE="INSERT INTO nivsec_rolemstr VALUES(:roleid,:rolename,:comments,:status,:auditaction,:auditdatetime,:userid)";

	public static final String SQL_DELETE_ROLE = "DELETE FROM nivsec_rolemstr WHERE ROLEID=? ";

	public static final String SQL_UPDATE_ROLE="UPDATE nivsec_rolemstr SET ROLENAME =:rolename, COMMENTS =:comments, STATUS=:status, AUDIT_ACTION=:auditaction, AUDIT_DATE_TIME=:auditdatetime WHERE ROLEID=:roleid;";
	
	public static final String SQL_DELETE_USER="DELETE FROM niv_usermstr WHERE UNAME=? ";
	
	
	
	
	
	public static final String SQL_SEARCH_USERROLE = "SELECT UNAME,FIRSTNAME,LASTNAME,OCCUPATION,ADDRESSLINE,STATE,COUNTRY,PH_NO,EMAIL_ID,ACTIVE,AUDIT_ACTION,AUDIT_DATE_TIME,USERID FROM niv_usermstr WHERE UNAME LIKE ?";
	
	public static final String SQL_GET_ROLES = "SELECT ROLEID,ROLENAME FROM nivsec_rolemstr";
	
	public static final String SQL_ADD_USERROLEMAP ="INSERT INTO nivsec_userrole (USERROLEID,UNAME,ROLEID,DESCRIPTION,STATUS,AUDIT_ACTION,AUDIT_DATE_TIME,USERID) VALUES(?,?,?,?,?,?,?,?)";
	
	public static final String SQL_GET_USERROLES="SELECT USERROLEID,UNAME,ROLEID,DESCRIPTION,STATUS,AUDIT_ACTION,AUDIT_DATE_TIME,USERID FROM nivsec_userrole WHERE ROLEID=?";

	public static final String SQL_UPDATE_USERROLE="UPDATE nivsec_userrole SET ROLEID =:roleid, DESCRIPTION =:description, STATUS=:status, AUDIT_ACTION=:auditaction, AUDIT_DATE_TIME=:auditdatetime WHERE USERROLEID=:userroleid";
	
	public static final String SQL_DELETE_USERROLEVIEW="DELETE FROM nivsec_userrole WHERE USERROLEID=? ";
	
	




	public static final String SQL_SEARCH_USERROLEID=" SELECT USERROLEID, UNAME, ROLEID, DESCRIPTION, STATUS, AUDIT_ACTION, AUDIT_DATE_TIME, USERID FROM nivsec_userrole WHERE USERROLEID LIKE ? ";

	public static final String SQL_GET_MODULES = "SELECT MODULE_ID,MODULE_NAME FROM nivsec_modulemaster";
	
	public static final String SQL_GET_FEATURES = "SELECT FEATUREID,FEATURENAME FROM nivsec_featurmstr";
	
	public static final String SQL_ADD_USERROLEMODULEMAP ="INSERT INTO nivsec_usermodulemap (USERMODULEID, UNAME, USERROLEID, MODULEID, FEATUREID, STATUS, COMMENTS, AUDIT_ACTION, AUDIT_DATE_TIME, USERID) VALUES(?,?,?,?,?,?,?,?,?,?)";

	public static final String SQL_DELETE_USERROLEMODULE = "DELETE FROM nivsec_usermodulemap WHERE USERMODULEID=?";
	
	public static final String SQL_UPDATE_USERROLEMODULE="UPDATE nivsec_usermodulemap SET MODULEID =:moduleid, FEATUREID=:featureid, COMMENTS =:comments, STATUS=:status, AUDIT_ACTION=:auditaction, AUDIT_DATE_TIME=:auditdatetime WHERE USERMODULEID=:usermoduleid";
	
	public static String SQL_SEARCH_USERROLEMODULE = "SELECT USERMODULEID,UNAME,USERROLEID,MODULEID,FEATUREID,STATUS,COMMENTS,AUDIT_ACTION,AUDIT_DATE_TIME,USERID from nivsec_usermodulemap WHERE";
	
	
	public static final String SQL_GET_CLASSIFICATION="SELECT USERMODULEID, UNAME, ROLENAME, MODULE_NAME, FEATURENAME, AUDIT_DATE_TIME, PATH FROM module_classification ORDER BY MODULE_NAME,USERMODULEID";
	
	//THIS IS FOR DASHBOARD DAO
	public static final String SQL_GETALL_PRICE="SELECT DURATION,PRICE FROM niv_subscription_pricing";
	
	public static final String SQL_GETCUSTOM_PRICE="SELECT DURATION,PRICE FROM niv_subscription_pricing";
	
	public static String SQL_INSERT_CONTACTUS="INSERT INTO niv_contactus (NAME,EMAIL,PHONE,MESSAGE,SEND_DATE,FEEDBACK_CATEGORY) VALUES(:name,:email,:phone,:message,:send_date,:feedback_category)";
}
