package com.nivesh.dao.security;

import java.util.List;
import java.util.Map;

import com.nivesh.bo.UserModuleMapBO;
import com.nivesh.bo.UserRoleBO;
import com.nivesh.dao.IDao;

public interface IDBUserModuleMapDao extends IDao {

	public static final String USERROLEMODULE_ID_FIELD="USERMODULEID";
	public static final String USERROLE_ID_FIELD="USERROLEID";
	public static final String MODULE_ID_FIELD="MODULEID";
	public static final String FEATURE_ID_FIELD="FEATUREID";
	public static final String STATUS_FIELD="STATUS";
	
	
	
	
	
	public List<UserRoleBO> searchUserRoleDAO(String userroleid1);

	public Map<String, String> getmodulesDao();

	public Map<String, String> getfeaturesDao();

	public void adduserrolemodulemapDao(List<UserModuleMapBO> userrolelist);

	public List<UserModuleMapBO> searchUserRoleModuleDAO(String status);

	public int updaterolemodule(UserModuleMapBO userModuleMapBO);

}
