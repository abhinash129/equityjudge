package com.nivesh.service.security;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nivesh.bo.RoleMstrBO;
import com.nivesh.bo.UserMstrBO;
import com.nivesh.bo.UserRoleBO;
import com.nivesh.command.security.RoleInsertCommand;
import com.nivesh.command.security.UserRoleEditCommand;
import com.nivesh.command.security.UserRoleInsertCommand;
import com.nivesh.dao.security.IDBRoleDao;
import com.nivesh.util.ApplicationConstant;
import com.nivesh.util.DateHelper;
import com.nivesh.util.IMaxIdValue;
@Service
@Transactional
public class RoleServiceImpl implements IRoleService {

	//FOR SEARCH DYNEMICLY WITH ANY FILED TO LOAD VALUES
	public static  Map<String, List<String>> rolemap = new HashMap<String, List<String>>();

	@Resource
	private IDBRoleDao dbroledao;
	@Inject
	private IMaxIdValue iMaxIdValue;
	public void setDbroledao(IDBRoleDao dbroledao) {
		this.dbroledao = dbroledao;
	}
	public void setiMaxIdValue(IMaxIdValue iMaxIdValue) {
		this.iMaxIdValue = iMaxIdValue;
	}





	/*PURPOSE: FOR NEW ROLE INSERT IN DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: COMMAND WITH VALUES 
	 *OUTPUT: RETURN NEW ROLE ID */
	@Override
	public String roleInsert(RoleInsertCommand rCommand) {

		String roleId=null;
		//GET ROLE ID FROM AUTO GENERATED WITH OWN LOGIC
		roleId=iMaxIdValue.getMaskIdValue(RoleMstrBO.class);

		RoleMstrBO rBo=new RoleMstrBO();
		rBo.setRoleid(roleId);
		rBo.setRolename(rCommand.getRolename());
		rBo.setComments(rCommand.getComments());
		rBo.setStatus(rCommand.getStatus());
		rBo.setAuditaction(ApplicationConstant.AUDIT_ACTION_INSERT);
		rBo.setAuditdatetime(DateHelper.todaysDateTimeInDBFormat());
		rBo.setUserid("rm001");

		dbroledao.create(rBo);
		return roleId;
	}





	/*PURPOSE: FOR SEARCH ROLE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: LIST OF DATA FOR SEARCH 
	 *OUTPUT: RETURN LIST OF ROLE IN ROLEMSTR BO */
	@Override
	public List<RoleMstrBO> searchRoleServices(List<String> searchData) {
		rolemap.clear();

		// this is for role id prefix(Start With/Ends With/ Consist Of)
		String prefix_roleid=null;
		//this is for role Name prefix(Start With/Ends With/ Consist Of)
		String prefix_rolename=null;

		prefix_roleid= searchData.get(0);
		String roleid= searchData.get(1);
		prefix_rolename= searchData.get(2);
		String rolename= searchData.get(3);
		String status = searchData.get(4);

		if (roleid!=null && roleid.trim().length()>0) {
			List<String> list = new ArrayList<>();
			list.add(0, prefix_roleid);
			list.add(1, roleid);
			rolemap.put(ROLE_ID_FIELD, list);
		}
		if (rolename!=null && rolename.trim().length()>0) {
			List<String> list = new ArrayList<>();
			list.add(0, prefix_rolename);
			list.add(1, rolename);
			rolemap.put(ROLE_NAME_FIELD, list);
		}

		return  dbroledao.searchRoleDAO(status);
	}






	/*PURPOSE: FOR DELETE ROLE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: ROLEID 
	 *OUTPUT: RETURN INT */
	@Override
	public int deleterole(String roleid) {
		int falg = dbroledao.delete(roleid);
		if (falg == 1) {
			return 1;
		}
		return 0;
	}





	/*PURPOSE: FOR USER FOR ASSIGN ROLE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: UAERNAME STRING
	 *OUTPUT: RETURN LIST OF USER IN USERMSTR BO */
	@Override
	public List<UserMstrBO> searchUserService(String username) {
		return  dbroledao.searchUserDAO(username);
	}





	/*PURPOSE: FOR GET ALL ROLE FROM ROLEMSTR TABLE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: NA
	 *OUTPUT: RETURN LIST OF ROLE NAME & ID IN MAP */
	@Override
	public Map<String, String> getroles() {
		return dbroledao.getroles();
	}






	/*PURPOSE: FOR CREATE NEW USER ROLE MAP
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: COMMAND WITH VALUES
	 *OUTPUT: RETURN LIST OF NEW USERROLE ID IN LIST */
	@Override
	public List<String> adduserRole(UserRoleInsertCommand userRoleInsertCommand) {
		List<UserRoleBO> userrolelist = new ArrayList<UserRoleBO>();
		String uname[]  = userRoleInsertCommand.getUname();
		String roleid[]  = userRoleInsertCommand.getRoleid();
		String description[] = userRoleInsertCommand.getDescription();
		String status[]  =userRoleInsertCommand.getStatus();
		boolean flag=true;
		List<String> userroleid = new ArrayList<>();		

		UserRoleBO userRoleBo = null;
		String userroleidstr = null;
		for (int i = 0; i <= (uname.length)-1; i++) {
			userRoleBo = new UserRoleBO();
			String unamestr = uname[i];
			if (unamestr != null && unamestr.trim().length() > 0){
				userRoleBo.setUname(unamestr);}
			else
				userRoleBo.setUname(null);

			if (flag) {
				//FOR GET A MAX USER ROLE ID FORM TBALE 
				userroleidstr = iMaxIdValue.getMaskIdValue(UserRoleBO.class);
				flag=false;
			}else{
				String value=userroleidstr.substring(2);
				String label=userroleidstr.substring(0, 2);
				int maxValue=Integer.parseInt(value)+1;

				if(maxValue>0&&maxValue<10)
					userroleidstr= String.valueOf(label+"0000"+maxValue);
				else if(maxValue>=10&&maxValue<100)
					userroleidstr= String.valueOf(label+"000"+maxValue);
				else if(maxValue>=100&&maxValue<1000)
					userroleidstr=String.valueOf(label+"00"+maxValue);
				else if(maxValue>=1000&&maxValue<10000)
					userroleidstr= String.valueOf(label+"0"+maxValue);
				else 
					userroleidstr= String.valueOf(label+maxValue);
			}
			userroleid.add(userroleidstr);
			userRoleBo.setUserroleid(userroleidstr);

			String roleidstr = roleid[i];
			if (roleidstr != null && roleidstr.trim().length() > 0)
				userRoleBo.setRoleid(roleidstr);
			else
				userRoleBo.setRoleid(null);

			String descriptionstr = description[i];
			if (descriptionstr != null && descriptionstr.trim().length() > 0)
				userRoleBo.setDescription(descriptionstr);
			else
				userRoleBo.setDescription(null);

			String statusstr = status[i];
			if (statusstr != null && statusstr.trim().length() > 0)
				userRoleBo.setStatus(statusstr);
			else
				userRoleBo.setStatus(null);

			userRoleBo.setAuditaction(ApplicationConstant.AUDIT_ACTION_INSERT);
			userRoleBo.setUserid(ApplicationConstant.ADMIN_ROLE);
			userRoleBo.setAuditdatetime(DateHelper.todaysDateTimeInDBFormat());  

			userrolelist.add(userRoleBo);
		}
		dbroledao.adduserrolemapDao(userrolelist);
		return userroleid;
	}





	/*PURPOSE: FOR GET ROLEUSER FOR PARTICULAR ROLEID
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: ROLE NAME & ROLE ID 
	 *OUTPUT: RETURN LIST OF VALUES IN USERROLE BO */
	@Override
	public List<UserRoleBO> getroleUser(String id,String name) {
		return dbroledao.getroleUsers(id,name);
	}






	/*PURPOSE: FOR UPDATE ROLE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: COMMAND WITH VALUES 
	 *OUTPUT: RETURN INT */
	@Override
	public int roleupdate(RoleInsertCommand roleInsertCommand) {

		RoleMstrBO roleMstrBO = new RoleMstrBO();
		roleMstrBO.setRoleid(roleInsertCommand.getRoleid());
		roleMstrBO.setRolename(roleInsertCommand.getRolename());
		roleMstrBO.setComments(roleInsertCommand.getComments());
		roleMstrBO.setStatus(roleInsertCommand.getStatus());
		roleMstrBO.setAuditaction(ApplicationConstant.AUDIT_ACTION_UPDATE);
		roleMstrBO.setAuditdatetime(DateHelper.todaysDateTimeInDBFormat());

		return dbroledao.updaterole(roleMstrBO);
	}






	/*PURPOSE: FOR DELETE USER 
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: USERNAME 
	 *OUTPUT: RETURN INT */
	@Override
	public int deleteuser(String uname) {
		int falg = dbroledao.deleteuser(uname);
		if (falg == 1) {
			return 1;
		}
		return 0;
	}






	/*PURPOSE: FOR UPDATE USER ROLE VIEW
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: COMMAND WITH VALUES 
	 *OUTPUT: RETURN INT */
	@Override
	public int roleviewupdate(UserRoleEditCommand userRoleEditCommand) {

		UserRoleBO userRoleBO = new UserRoleBO();
		userRoleBO.setUserroleid(userRoleEditCommand.getUserroleid());
		userRoleBO.setDescription(userRoleEditCommand.getDescription());
		userRoleBO.setRoleid(userRoleEditCommand.getRoleid());
		userRoleBO.setStatus(userRoleEditCommand.getStatus());
		userRoleBO.setAuditaction(ApplicationConstant.AUDIT_ACTION_UPDATE);
		userRoleBO.setAuditdatetime(DateHelper.todaysDateTimeInDBFormat());

		return dbroledao.updateuserrole(userRoleBO);
	}






	/*PURPOSE: FOR DELETE USER ROLE VIEW
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: USER ROLE ID
	 *OUTPUT: RETURN INT */
	@Override
	public int deleteuserroleview(String userroleid) {
		int falg = dbroledao.deleteuserroleview(userroleid);
		if (falg == 1) {
			return 1;
		}
		return 0;
	}
}

