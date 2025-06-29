package com.nivesh.dao.security;

import java.util.List;
import java.util.Map;

import com.nivesh.bo.RoleMstrBO;
import com.nivesh.bo.UserMstrBO;
import com.nivesh.bo.UserRoleBO;
import com.nivesh.dao.IDao;

public interface IDBRoleDao extends IDao {

	public static final String ROLE_ID_FIELD="ROLEID";
	public static final String ROLE_NAME_FIELD="ROLENAME";
	public static final String STATUS_FIELD="STATUS";
	
	
	List<RoleMstrBO> searchRoleDAO(String status);
	List<UserMstrBO> searchUserDAO(String username);
	Map<String, String> getroles();
	void adduserrolemapDao(List<UserRoleBO> userrolelist);
	List<UserRoleBO> getroleUsers(String id, String name);
	int updaterole(RoleMstrBO roleMstrBO);
	int deleteuser(String uname);
	int updateuserrole(UserRoleBO userRoleBO);
	int deleteuserroleview(String userroleid);

}
