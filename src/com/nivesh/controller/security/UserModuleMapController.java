package com.nivesh.controller.security;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nivesh.bo.UserModuleMapBO;
import com.nivesh.bo.UserRoleBO;
import com.nivesh.command.security.RoleInsertCommand;
import com.nivesh.command.security.UserRoleModuleEditCommand;
import com.nivesh.command.security.UserRoleModuleInsertCommand;
import com.nivesh.service.security.IUserModuleMapService;

@Controller
@RequestMapping("/userrolemodule")
public class UserModuleMapController {

	public static final String USERROLEMODULESEARCH="UserRoleModuleHome",USERROLEMODULEDETAILS="CreateUserRoleModule"
			, USERROLEMODULEEDIT="UserRoleModuleEdit";

	@Inject
	IUserModuleMapService iUserModuleMapService;
	public void setiUserModuleMapService(IUserModuleMapService iUserModuleMapService) {
		this.iUserModuleMapService = iUserModuleMapService;
	}


	/*PURPOSE: FOR OPEN HOME PAGE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: NA 
	 *OUTPUT: RETURN JSP PAGE VAR */
	@RequestMapping(value="/home",method=RequestMethod.GET)
	public String inserthome(HttpServletRequest request){
				return USERROLEMODULESEARCH;
		}





	/*PURPOSE: FOR OPEN CREATE NEW ROLE MODULE PAGE(USERMODULEMAPDETAILS.JSP)
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: NA 
	 *OUTPUT: RETURN JSP PAGE VAR */
	@RequestMapping(value="/createRoleModule",method=RequestMethod.POST)
	public String createRoleModule(HttpServletRequest request){
				return USERROLEMODULEDETAILS;
		}




	/*PURPOSE: FOR SEARCH USER ROLE MODULE MAP
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: LIST OF VALUES
	 *OUTPUT: RETURN LIST OF USER ROLE MODULE MAP & SAME JSP PAGE VAR */
	@RequestMapping(value="/search",method=RequestMethod.POST)
	public @ResponseBody List<UserModuleMapBO> getUserRoleModule(@RequestParam List<String> searchData) {
		List<UserModuleMapBO> roleList = null;
		roleList = iUserModuleMapService.searchUserRoleModuleServices(searchData);
		return roleList;
	}




	/*PURPOSE: FOR SEARCH USER ROLE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: USER ROLE ID 
	 *OUTPUT: RETURN LIST OF USER ROLE & SAME JSP PAGE VAR */
	@RequestMapping(value="/searchuserrole",method=RequestMethod.POST)
	public @ResponseBody List<UserRoleBO> searchUserRole(@RequestParam String userroleid){
		List<UserRoleBO> userList = null;
		userList = iUserModuleMapService.searchUserRoleService(userroleid);
		return userList;
	}



	/*PURPOSE: FOR GET MODULE NAME AND MODULE NAME FOR USER ASIGN
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: NA 
	 *OUTPUT: RETURN LIST OF MODULE NAME AS VALUE AND MODULEID AS A KEY IN MAP */
	@RequestMapping(value = "/getmodulename", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> getModulename(ModelMap map) {
		Map<String, String> list = null;
		list = iUserModuleMapService.getmodules();
		return list;
	}




	/*PURPOSE: FOR GET FEATURE NAME AND FEATURE NAME FOR USER ASIGN
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: NA 
	 *OUTPUT: RETURN LIST OF FEATURE NAME AS VALUE AND FEATUREID AS A KEY IN MAP */
	@RequestMapping(value = "/getfeaturename", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> getFeaturename(ModelMap map) {
		Map<String, String> list = null;
		list = iUserModuleMapService.getfeatures();
		return list;
	}






	/*PURPOSE: FOR INSERT MODULE AND FEATURE TO PARTICULAR USER ROLE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: USERROLEMOSULEINSERT COMMAND 
	 *OUTPUT: RETURN LIST OF USERROLEMODULE ID */
	@RequestMapping(value = "/insertuserrole", method = RequestMethod.POST)
	public  String adduserRoleModuleMap(@ModelAttribute("userRoleModuleInsertCommand") UserRoleModuleInsertCommand userRoleModuleInsertCommand,ModelMap map,HttpServletRequest request) {
		

				List<String> userrolemoduleid = null;

				userrolemoduleid = iUserModuleMapService.adduserRoleModule(userRoleModuleInsertCommand);

				RoleInsertCommand roleInsertCommand=new RoleInsertCommand();
				map.addAttribute("roleInsertCommand",roleInsertCommand);

				String message = "User Roll Map is Submit success Fully and Your Id is: "+userrolemoduleid;
				map.addAttribute("userrolemoduleid",message);
				map.addAttribute("userRoleModuleInsertCommand",userRoleModuleInsertCommand);

				return USERROLEMODULEDETAILS;
	}






	/*PURPOSE: FOR DELETE USER ROLE MODULE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: PARTICULAR USERMODULE ID
	 *OUTPUT: RETURN YES OR NO WITH JSP PAGE VAR */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public  String deleteUserRoleView(@RequestParam String id,ModelMap map)
			throws Exception {
		iUserModuleMapService.deleteUserRoleView(id);
		return USERROLEMODULESEARCH;
	}



	/*PURPOSE: FOR OPEN UPADTE USER ROLE MODULE PAGE(USERMODULEMAP.JSP)
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: LIST OF VALUE OF PARTICULAR TABLE ROW 
	 *OUTPUT: RETURN COMMAND & JSP PAGE NAME */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String loadUpdatePage(@RequestParam List<String> editData, ModelMap modelMap) {

		UserRoleModuleEditCommand userRoleModuleEditCommand = new UserRoleModuleEditCommand();
		userRoleModuleEditCommand.setUsermoduleid(editData.get(0));
		userRoleModuleEditCommand.setModuleid(editData.get(1));
		userRoleModuleEditCommand.setFeatureid(editData.get(2));
		userRoleModuleEditCommand.setComments(editData.get(3));
		userRoleModuleEditCommand.setStatus(editData.get(4));

		Map<String, String> features = null;
		features = iUserModuleMapService.getfeatures();


		Map<String, String> modules = null;
		modules = iUserModuleMapService.getmodules();

		modelMap.addAttribute("modules",modules);
		modelMap.addAttribute("features",features);
		modelMap.addAttribute("userRoleModuleEditCommand",userRoleModuleEditCommand);

		return USERROLEMODULEEDIT;
	}





	/*PURPOSE: FOR UPADTE USER ROLE MODULE WITH NEW VALUE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: LIST OF NEW VALUES  IN COMMAND 
	 *OUTPUT: RETURN SUCCESSFULL UPADATE USERROLEMODULEMESSAGE WITH SAME JSP */
	@RequestMapping(value="/updateuserrolemodule",method=RequestMethod.POST)
	public  String updateuserrolemodule(@ModelAttribute("userRoleModuleEditCommand") UserRoleModuleEditCommand userRoleModuleEditCommand,ModelMap map){
		iUserModuleMapService.userrolemoduleupdate(userRoleModuleEditCommand);


		Map<String, String> features = null;
		features = iUserModuleMapService.getfeatures();


		Map<String, String> modules = null;
		modules = iUserModuleMapService.getmodules();

		map.addAttribute("modules",modules);
		map.addAttribute("features",features);

		map.addAttribute("userroleviewupdate","User Role Module  is Update Successfully..");
		return USERROLEMODULEEDIT;
	}

}
