package com.nivesh.service.security;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nivesh.bo.ModuleMasterBO;
import com.nivesh.command.security.ModuleInsertCommand;
import com.nivesh.dao.security.IDBModuleDao;
import com.nivesh.util.ApplicationConstant;
import com.nivesh.util.DateHelper;
import com.nivesh.util.IMaxIdValue;

@Service
@Transactional
public class ModuleServiceImpl implements IModuleService {

	//FOR ADD VALUE FOR DYNEMIC SEARCH
	public static  Map<String, List<String>> modulemap = new HashMap<String, List<String>>();

	@Resource
	private IDBModuleDao dbmoduledao;
	@Inject
	private IMaxIdValue iMaxIdValue;
	public void setDbmoduledao(IDBModuleDao dbmoduledao) {
		this.dbmoduledao = dbmoduledao;
	}
	public void setiMaxIdValue(IMaxIdValue iMaxIdValue) {
		this.iMaxIdValue = iMaxIdValue;
	}






	/*PURPOSE: FOR CREATE NEW MODULE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: COMMAND WITH VALUES 
	 *OUTPUT: RETURN NEW MODULE ID */
	@Override
	public String moduleInsert(ModuleInsertCommand moCommand) {

		String moduleId=null;
		// FOR GET MAX MODULE ID FROM TABLE
		moduleId=iMaxIdValue.getMaskIdValue(ModuleMasterBO.class);

		ModuleMasterBO moduleMasterBO=new ModuleMasterBO();
		moduleMasterBO.setModule_name(moCommand.getModulename());
		moduleMasterBO.setDescription(moCommand.getDescription());
		moduleMasterBO.setStatus(moCommand.getStatus());
		moduleMasterBO.setAuditaction(ApplicationConstant.AUDIT_ACTION_INSERT);
		moduleMasterBO.setAuditDatetime(DateHelper.todaysDateTimeInDBFormat());
		moduleMasterBO.setUserid("mm001");
		moduleMasterBO.setModule_id(moduleId);

		int i = dbmoduledao.create(moduleMasterBO);
		if (i!=0) {
			return moduleId;
		} else {
			return null;
		}
	}






	/*PURPOSE: FOR SEARCH MODULES
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: LIST OF VALUES FOR SEARCH 
	 *OUTPUT: RETURN LIST OF MODULEMASTR BO WITH VALUES */
	@Override
	public List<ModuleMasterBO> searchModules(List<String> searchData) {

		modulemap.clear();

		// this is for module id prefix(Start With/Ends With/ Consist Of)
		String prefix_moduleid=null;
		//this is for Module Name prefix(Start With/Ends With/ Consist Of)
		String prefix_modulename=null;

		prefix_moduleid= searchData.get(0);
		String moduleid= searchData.get(1);
		prefix_modulename= searchData.get(2);
		String modulename= searchData.get(3);
		String status = searchData.get(4);

		if (moduleid!=null && moduleid.trim().length()>0) {
			List<String> list = new ArrayList<>();
			list.add(0, prefix_moduleid);
			list.add(1, moduleid);
			modulemap.put(MODULE_ID_FIELD, list);
		}

		if (modulename!=null && modulename.trim().length()>0) {
			List<String> list = new ArrayList<>();
			list.add(0, prefix_modulename);
			list.add(1, modulename);
			modulemap.put(MODULE_NAME_FIELD, list);
		}
		return  dbmoduledao.search(status);
	}





	/*PURPOSE: FOR CHECK AVABILITY OF MODULE NAME IN DATABSE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: MODULENAME
	 *OUTPUT: RETURN INT */
	@Override
	public int checkmoduleName(String moduleName) {
		int isAuth = dbmoduledao.isModuleName_Available(moduleName);
		if (isAuth == 1) {
			return 1;
		}
		return 0;
	}






	/*PURPOSE: FOR DELETE MODULE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: MODULE ID 
	 *OUTPUT: RETURN INT */
	@Override
	public int deletemodule(String moduleid) {
		int falg = dbmoduledao.delete(moduleid);
		if (falg == 1) {
			return 1;
		}
		return 0;
	}






	/*PURPOSE: FOR UPDATE MODULE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: COMMAND WITH VALUES 
	 *OUTPUT: RETURN INT */
	@Override
	public int moduleupdate(ModuleInsertCommand moCommand) {

		ModuleMasterBO moduleMasterBO=new ModuleMasterBO();
		moduleMasterBO.setModule_id(moCommand.getModuleId());
		moduleMasterBO.setModule_name(moCommand.getModulename());
		moduleMasterBO.setDescription(moCommand.getDescription());
		moduleMasterBO.setStatus(moCommand.getStatus());
		moduleMasterBO.setAuditaction(ApplicationConstant.AUDIT_ACTION_UPDATE);
		moduleMasterBO.setAuditDatetime(DateHelper.todaysDateTimeInDBFormat());

		return dbmoduledao.updatemodule(moduleMasterBO);
	}
}
