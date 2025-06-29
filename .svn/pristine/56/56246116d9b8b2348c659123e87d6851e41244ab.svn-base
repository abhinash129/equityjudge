package com.nivesh.controller.security;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nivesh.bo.ModuleMasterBO;
import com.nivesh.command.security.ModuleInsertCommand;
import com.nivesh.service.security.IModuleService;

@Controller
@RequestMapping("/module")
public class ModuleController {

	public static final String MODULESEARCH="ModuleHome",MODULEDETAILS="ModuleCreate",MODULEEDIT="moduleedit";	

	
	@Autowired
	IModuleService iModuleService;

	
	/*PURPOSE: FOR LOAD FIRST PAGE OF MODULE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: NA
	 *OUTPUT: RETURN NAME OF JSP VAR */
	@RequestMapping(value="/home",method=RequestMethod.GET)
	public String inserthome(HttpServletRequest request){
				return MODULESEARCH;
	}


	/*PURPOSE: FOR SEARCH MODULE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: LIST OF VALUES 
	 *OUTPUT: RETURN LIST OF MODULES RESULT */
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public @ResponseBody List<ModuleMasterBO> getModules(@RequestParam List<String> searchData) {
		List<ModuleMasterBO> moduleList = null;
		moduleList = iModuleService.searchModules(searchData);
		return moduleList;
	}


	/*PURPOSE: FOR LOAD MODULEEDIT.JSP PAGE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: LIST OF VALUE FROM PARTICULAR TABLE ROW 
	 *OUTPUT: RETURN NAME OF JSP AND COMMAND WITH BINDING VALUES */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String loadUpdatePage(@RequestParam List<String> editData, ModelMap modelMap) {

		ModuleInsertCommand moduleInsertCommand=new ModuleInsertCommand();
		moduleInsertCommand.setModuleId(editData.get(0));
		moduleInsertCommand.setModulename(editData.get(1));
		moduleInsertCommand.setDescription(editData.get(2));
		moduleInsertCommand.setStatus(editData.get(3));
		modelMap.addAttribute("moduleInsertCommand",moduleInsertCommand);

		return MODULEEDIT;
	}



	/*PURPOSE: FOR UPADTE MODULE DETAILS
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: COMMAND WITH NEW VALUES 
	 *OUTPUT: RETURN SUCCESSFULL MESSAGE AND JSP PAGE */
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public  String updatemodule(@ModelAttribute("moduleInsertCommand") ModuleInsertCommand moduleInsertCommand,ModelMap map){
		iModuleService.moduleupdate(moduleInsertCommand);
		map.addAttribute("moduleupdate","Module Update Suuccessfully");
		return MODULEEDIT;
	}




	/*PURPOSE: FOR DELETE TABLE ROW DATA OF MODULE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: MODULE ID FOR DELETE BASE 
	 *OUTPUT: RETURN MODULE HOME JSP PAGE */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public  String DeleteData(@RequestParam String id)
			throws Exception {

		String moduleid = id;
		iModuleService.deletemodule(moduleid);
		return MODULESEARCH;


	}



	/*PURPOSE: FOR LOAD CREATE MODULE PAGE(MODULEDETAILS.JSP)
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: NA
	 *OUTPUT: RETURN NAME OF JSP PAGE */
	@RequestMapping(value="/createModule",method=RequestMethod.POST)
	public String createModule(Model model,HttpServletRequest request){
				ModuleInsertCommand moduleInsertCommand=new ModuleInsertCommand();
				model.addAttribute("moduleInsertCommand",moduleInsertCommand);
				return MODULEDETAILS;
	}


	/*PURPOSE: FOR CREATE NEW MODULE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: LIST OF VALUES OF INSERTED IN COMMAND 
	 *OUTPUT: RETURN LIST OF NEW MODULE ID & SAME JSP PAGE */
	@RequestMapping(value="/create",method=RequestMethod.POST)
	public  String insertModule(@ModelAttribute("moduleInsertCommand") @Valid ModuleInsertCommand moduleInsertCommand,BindingResult result,ModelMap map){

		if (result.hasErrors()) {
			return MODULEDETAILS;
		}
		String moduleId=null;
		moduleId=iModuleService.moduleInsert(moduleInsertCommand);
		map.addAttribute("moduleId",moduleId);
		return MODULEDETAILS;
	}
}
