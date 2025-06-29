package com.nivesh.service.security;

import java.util.List;

import com.nivesh.bo.ModuleMasterBO;
import com.nivesh.command.security.ModuleInsertCommand;

public interface IModuleService {
	
	
	public static final String MODULE_ID_FIELD="MODULE_ID";
	public static final String MODULE_NAME_FIELD="MODULE_NAME";
	
	public String moduleInsert(ModuleInsertCommand moduleInsertCommand);
	public List<ModuleMasterBO> searchModules(List<String> serachmodule);
	public int checkmoduleName(String moduleName);
	public int deletemodule(String moduleid);
	public int moduleupdate(ModuleInsertCommand moduleInsertCommand);
	

}
