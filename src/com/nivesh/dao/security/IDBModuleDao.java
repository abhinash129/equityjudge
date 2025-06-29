package com.nivesh.dao.security;

import java.util.List;

import com.nivesh.bo.ClassificationBO;
import com.nivesh.bo.ModuleMasterBO;
import com.nivesh.dao.IDao;

public interface IDBModuleDao extends IDao{

	public static final String MODULE_ID_FIELD="MODULE_ID";
	public static final String MODULE_NAME_FIELD="MODULE_NAME";
	public static final String STATUS_FIELD="STATUS";


	public List<ModuleMasterBO> search(String status);
	public String getMaxId(String tableName,String columnName);
	public String getLabelForId(String tableName);
	int updatemodule(ModuleMasterBO moduleMasterBO);
	public int isModuleName_Available(String moduleName);
	public List<ClassificationBO> getAllModules();
}
