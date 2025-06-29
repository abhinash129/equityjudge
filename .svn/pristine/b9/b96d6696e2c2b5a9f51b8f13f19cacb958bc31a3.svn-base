package com.nivesh.service.security;

import java.util.List;
import java.util.Map;

import com.nivesh.bo.RoleMstrBO;
import com.nivesh.bo.UserMstrBO;
import com.nivesh.bo.UserRoleBO;
import com.nivesh.command.security.RoleInsertCommand;
import com.nivesh.command.security.UserRoleEditCommand;
import com.nivesh.command.security.UserRoleInsertCommand;

public interface IRoleService {
	
	public static final String ROLE_ID_FIELD="ROLEID";
	public static final String ROLE_NAME_FIELD="ROLENAME";
	
	
	public String roleInsert(RoleInsertCommand rCommand);

	public List<RoleMstrBO> searchRoleServices(List<String> searchData);

	public int deleterole(String roleid);

	public List<UserMstrBO> searchUserService(String username);

	public Map<String, String> getroles();

	public List<String> adduserRole(UserRoleInsertCommand userRoleInsertCommand);

	public List<UserRoleBO> getroleUser(String id, String name);

	public int roleupdate(RoleInsertCommand roleInsertCommand);

	public int deleteuser(String uname);

	public int roleviewupdate(UserRoleEditCommand userRoleEditCommand);

	public int deleteuserroleview(String userroleid);



}
