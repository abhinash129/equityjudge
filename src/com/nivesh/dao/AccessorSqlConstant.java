package com.nivesh.dao;

public interface AccessorSqlConstant {
	
	public static final String COMPANY_ACCESSOR_SQL = "SELECT * FROM niv_companystockdetails where SC_CODE=?";
		
	public static final String PARAMETER_ACCESSOR_DATA="SELECT ID,FIELDNAME,DISPLAYNAME,LOGICALVALUE,PARAMETERORDER,ACTIVE FROM niv_parameter ORDER BY PARAMETERORDER ASC";


	public static final String SQL_GETDETAILBASECOMPANYNAME = "SELECT SC_CODE,SC_ID,COMPANYNAME, `GROUP`,FACEVALUE, INDUSTRY FROM `niv_activecompanylist` WHERE companyname=?";

}
