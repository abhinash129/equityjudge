package com.nivesh.service.security;

import java.util.List;
import java.util.Map;

import com.nivesh.bo.UserModuleMapBO;
import com.nivesh.bo.UserRoleBO;
import com.nivesh.command.security.UserRoleModuleEditCommand;
import com.nivesh.command.security.UserRoleModuleInsertCommand;

public interface IUserModuleMapService {
	
	
	public static final String USERROLEMODULE_ID_FIELD="USERMODULEID";
	public static final String USERROLE_ID_FIELD="USERROLEID";
	public static final String MODULE_ID_FIELD="MODULEID";
	public static final String FEATURE_ID_FIELD="FEATUREID";
	
	
	

	public List<UserRoleBO> searchUserRoleService(String userroleid);

	public Map<String, String> getmodules();

	public Map<String, String> getfeatures();

	public List<String> adduserRoleModule(UserRoleModuleInsertCommand userRoleModuleInsertCommand);

	public List<UserModuleMapBO> searchUserRoleModuleServices(List<String> searchData);

	public int deleteUserRoleView(String usermoduleid);

	public int userrolemoduleupdate(UserRoleModuleEditCommand userRoleModuleEditCommand);

}
