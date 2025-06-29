package com.nivesh.service.security;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nivesh.bo.UserModuleMapBO;
import com.nivesh.bo.UserRoleBO;
import com.nivesh.command.security.UserRoleModuleEditCommand;
import com.nivesh.command.security.UserRoleModuleInsertCommand;
import com.nivesh.dao.security.IDBUserModuleMapDao;
import com.nivesh.util.ApplicationConstant;
import com.nivesh.util.DateHelper;
import com.nivesh.util.IMaxIdValue;

@Service
@Transactional
public class UserModuleMapServices implements IUserModuleMapService {

	//FOR SEARCH DYNEMICLY WITH ANY FILED TO LOAD VALUES
	public static  Map<String, List<String>> userrolemodulemap = new HashMap<String, List<String>>();

	@Resource
	private IDBUserModuleMapDao dbusermodulemapdao;
	@Inject
	private IMaxIdValue iMaxIdValue;
	public void setDbusermodulemapdao(IDBUserModuleMapDao dbusermodulemapdao) {
		this.dbusermodulemapdao = dbusermodulemapdao;
	}
	public void setiMaxIdValue(IMaxIdValue iMaxIdValue) {
		this.iMaxIdValue = iMaxIdValue;
	}




	/*PURPOSE: FOR SEARCH USER ROLE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: USERROLE ID
	 *OUTPUT: RETURN LIST OF USERROLES RESULT */
	@Override
	public List<UserRoleBO> searchUserRoleService(String userroleid) {
		String userroleid1=userroleid;
		List<UserRoleBO> list=dbusermodulemapdao.searchUserRoleDAO(userroleid1);
		return list;
	}




	/*PURPOSE: FOR GET ALL MODULES FORM DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: NA
	 *OUTPUT: RETURN LIST OF MODULE NAME & ID IN MAP */
	@Override
	public Map<String, String> getmodules() {
		return dbusermodulemapdao.getmodulesDao();
	}





	/*PURPOSE: FOR GET ALL FEATURES FORM DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: NA
	 *OUTPUT: RETURN LIST OF FEATURE NAME & ID IN MAP */
	@Override
	public Map<String, String> getfeatures() {
		return dbusermodulemapdao.getfeaturesDao();
	}





	/*PURPOSE: FOR ADD MULITIPLE USER IN ROLES OR SINGLE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: COMMAND WITH ARRAY VALUES
	 *OUTPUT: RETURN LIST OF NEW USERMODULE IDS */
	@Override
	public List<String> adduserRoleModule(UserRoleModuleInsertCommand userRoleModuleInsertCommand) {
		List<UserModuleMapBO> userrolelist = new ArrayList<UserModuleMapBO>();

		String userroleid[]  = userRoleModuleInsertCommand.getUserroleid();
		String uname[]  = userRoleModuleInsertCommand.getUname();
		String moduleid[]  = userRoleModuleInsertCommand.getModuleid();
		String featureid[]  = userRoleModuleInsertCommand.getFeatureid();
		String comments[] = userRoleModuleInsertCommand.getComments();
		String status[]  =userRoleModuleInsertCommand.getStatus();

		boolean flag=true;
		List<String> userrolemoduleid = new ArrayList<>();		

		UserModuleMapBO userModuleMapBO = null;
		String userrolemoduleidstr = null;

		for (int i = 0; i <= (userroleid.length)-1; i++) {
			userModuleMapBO = new UserModuleMapBO();

			String userroleidstr = userroleid[i];
			if (userroleidstr != null && userroleidstr.trim().length() > 0){
				userModuleMapBO.setUserroleid(userroleidstr);}
			else
				userModuleMapBO.setUserroleid(null);

			String unamestr = uname[i];
			if (unamestr != null && unamestr.trim().length() > 0){
				userModuleMapBO.setUname(unamestr);}
			else
				userModuleMapBO.setUname(null);

			if (flag) {
				//GET USERMODULE ID FROM AUTO GENERATED WITH OWN LOGIC
				userrolemoduleidstr = iMaxIdValue.getMaskIdValue(UserModuleMapBO.class);
				flag=false;
			}else{
				String value=userrolemoduleidstr.substring(2);
				String label=userrolemoduleidstr.substring(0, 2);
				int maxValue=Integer.parseInt(value)+1;

				if(maxValue>0&&maxValue<10)
					userrolemoduleidstr= String.valueOf(label+"0000"+maxValue);
				else if(maxValue>=10&&maxValue<100)
					userrolemoduleidstr= String.valueOf(label+"000"+maxValue);
				else if(maxValue>=100&&maxValue<1000)
					userrolemoduleidstr=String.valueOf(label+"00"+maxValue);
				else if(maxValue>=1000&&maxValue<10000)
					userrolemoduleidstr= String.valueOf(label+"0"+maxValue);
				else 
					userrolemoduleidstr= String.valueOf(label+maxValue);
			}
			userrolemoduleid.add(userrolemoduleidstr);
			userModuleMapBO.setUsermoduleid(userrolemoduleidstr);

			String moduleidstr = moduleid[i];
			if (moduleidstr != null && moduleidstr.trim().length() > 0)
				userModuleMapBO.setModuleid(moduleidstr);
			else
				userModuleMapBO.setModuleid(null);

			String featureidstr = featureid[i];
			if (featureidstr != null && featureidstr.trim().length() > 0)
				userModuleMapBO.setFeatureid(featureidstr);
			else
				userModuleMapBO.setFeatureid(null);


			String commentsstr = comments[i];
			if (commentsstr != null && commentsstr.trim().length() > 0)
				userModuleMapBO.setComments(commentsstr);
			else
				userModuleMapBO.setComments(null);

			String statusstr = status[i];
			if (statusstr != null && statusstr.trim().length() > 0)
				userModuleMapBO.setStatus(statusstr);
			else
				userModuleMapBO.setStatus(null);

			userModuleMapBO.setAuditaction(ApplicationConstant.AUDIT_ACTION_INSERT);
			userModuleMapBO.setUserid("sunil");
			userModuleMapBO.setAuditdatetime(DateHelper.todaysDateTimeInDBFormat());  

			userrolelist.add(userModuleMapBO);
		}
		dbusermodulemapdao.adduserrolemodulemapDao(userrolelist);
		return userrolemoduleid;
	}







	/*PURPOSE: FOR SEARCH USERROLEMODULES
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: LIST OF SERACH VALUES
	 *OUTPUT: RETURN LIST OF USERROLEMODULES IN LIST */
	@Override
	public List<UserModuleMapBO> searchUserRoleModuleServices(List<String> searchData) {

		//FOR DYNEMIC QUERY USING THAT MAP VALUES
		userrolemodulemap.clear();

		String prefix_userrolemoduleid= searchData.get(0);
		String userrolemoduleid= searchData.get(1);
		String prefix_userroleid= searchData.get(2);
		String userroleid= searchData.get(3);
		String prefix_moduleid= searchData.get(4);
		String moduleid= searchData.get(5);
		String prefix_featureid= searchData.get(6);
		String featureid= searchData.get(7);
		String status = searchData.get(8);

		if (userrolemoduleid!=null && userrolemoduleid.trim().length()>0) {
			List<String> list = new ArrayList<>();
			list.add(0, prefix_userrolemoduleid);
			list.add(1, userrolemoduleid);
			userrolemodulemap.put(USERROLEMODULE_ID_FIELD, list);
		}
		if (userroleid!=null && userroleid.trim().length()>0) {
			List<String> list = new ArrayList<>();
			list.add(0, prefix_userroleid);
			list.add(1, userroleid);
			userrolemodulemap.put(USERROLE_ID_FIELD, list);
		}
		if (moduleid!=null && moduleid.trim().length()>0) {
			List<String> list = new ArrayList<>();
			list.add(0, prefix_moduleid);
			list.add(1, moduleid);
			userrolemodulemap.put(MODULE_ID_FIELD, list);
		}
		if (featureid!=null && featureid.trim().length()>0) {
			List<String> list = new ArrayList<>();
			list.add(0, prefix_featureid);
			list.add(1, featureid);
			userrolemodulemap.put(FEATURE_ID_FIELD, list);
		}
		return  dbusermodulemapdao.searchUserRoleModuleDAO(status);
	}






	/*PURPOSE: FOR DELETE USER ROLE VIEW
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: USERMODULE ID
	 *OUTPUT: RETURN INT */
	@Override
	public int deleteUserRoleView(String usermoduleid) {
		return  dbusermodulemapdao.delete(usermoduleid);
	}





	/*PURPOSE: FOR UPDATE USER ROLE MODULE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: COMMAND
	 *OUTPUT: RETURN INT */
	@Override
	public int userrolemoduleupdate(UserRoleModuleEditCommand userRoleModuleEditCommand) {

		UserModuleMapBO userModuleMapBO = new UserModuleMapBO();
		userModuleMapBO.setUsermoduleid(userRoleModuleEditCommand.getUsermoduleid());
		userModuleMapBO.setModuleid(userRoleModuleEditCommand.getModuleid());
		userModuleMapBO.setFeatureid(userRoleModuleEditCommand.getFeatureid());
		userModuleMapBO.setComments(userRoleModuleEditCommand.getComments());
		userModuleMapBO.setStatus(userRoleModuleEditCommand.getStatus());

		userModuleMapBO.setAuditaction(ApplicationConstant.AUDIT_ACTION_UPDATE);
		userModuleMapBO.setAuditdatetime(DateHelper.todaysDateTimeInDBFormat());

		return  dbusermodulemapdao.updaterolemodule(userModuleMapBO);
	}
}
