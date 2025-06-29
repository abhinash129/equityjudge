package com.nivesh.controller.security;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nivesh.bo.RoleMstrBO;
import com.nivesh.bo.UserMstrBO;
import com.nivesh.bo.UserRoleBO;
import com.nivesh.command.security.RoleInsertCommand;
import com.nivesh.command.security.UserRoleEditCommand;
import com.nivesh.command.security.UserRoleInsertCommand;
import com.nivesh.service.security.IRoleService;
import com.nivesh.util.ApplicationConstant;

@Controller
@RequestMapping("/role")
public class RoleController {

	public static final String ROLESEARCH="RoleHome",ROLEDETAILS="RoleInsert",ROLEEDIT="RoleEdit",USERROLEEDIT="UserRoleEdit";

	@Inject
	IRoleService irRoleService;
	public void setIrRoleService(IRoleService irRoleService) {
		this.irRoleService = irRoleService;
	}


	/*PURPOSE: FOR LOADING FIRST HOME PAGE OF ROLE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: NA 
	 *OUTPUT: RETURN NAME OF JSP VAR */
	@RequestMapping(value="/home",method=RequestMethod.GET)
	public String inserthome(HttpServletRequest request){
				return ROLESEARCH;
	}



	/*PURPOSE: FOR SEARCH ROLE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: LIST OF VALUES 
	 *OUTPUT: RETURN LIST OF ROLES RESULT */
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public @ResponseBody List<RoleMstrBO> getroles(@RequestParam List<String> searchData) {
		List<RoleMstrBO> roleList = null;
		roleList = irRoleService.searchRoleServices(searchData);
		return roleList;
	}



	/*PURPOSE: FOR DELETE PARTICULA TABLE ROW DATA
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: LIST OF  ROLEID
	 *OUTPUT: RETURN YES OR NO */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public  String DeleteData(@RequestParam String id)
			throws Exception {
		String roleid = id;
		irRoleService.deleterole(roleid);
		return ROLESEARCH;
	}



	/*PURPOSE: FOR CRAETE NEW ROLE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: LIST OF VALUES IN COMMAND 
	 *OUTPUT: RETURN NEW ROLE ID & JSP PAGE */
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String insertRole(@Valid @ModelAttribute  RoleInsertCommand rCommand,BindingResult result,ModelMap map){
		if (result.hasErrors()) {
			return ROLEDETAILS;
		}
		String roleId=null;
		roleId=irRoleService.roleInsert(rCommand);
		UserRoleInsertCommand userRoleInsertCommand=new UserRoleInsertCommand();
		map.addAttribute("roleInsertCommand",rCommand);
		map.addAttribute("userRoleInsertCommand",userRoleInsertCommand);
		map.addAttribute("roleId",roleId);
		return ROLEDETAILS;
	}



	/*PURPOSE: FOR OPEN NEW INSERT ROLE JSP PAGE(ROLEDETAILS.JSP)
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: NA 
	 *OUTPUT: RETURN NAME OF JSP */
	@RequestMapping(value="/insertRole",method=RequestMethod.POST)
	public String createrole(Model model){
		RoleInsertCommand roleInsertCommand=new RoleInsertCommand();
		UserRoleInsertCommand userRoleInsertCommand=new UserRoleInsertCommand();
		model.addAttribute("roleInsertCommand",roleInsertCommand);
		model.addAttribute("userRoleInsertCommand",userRoleInsertCommand);

		return ROLEDETAILS;
	}



	/*PURPOSE: FOR SEARCH USERNAME FOR ROLEMAP (REGISTRED USER FROM USERMSTR TABLE)
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: USERNAME PETTERN 
	 *OUTPUT: RETURN LIST OF USERS */
	@RequestMapping(value = "/searchuser", method = RequestMethod.POST)
	public @ResponseBody List<UserMstrBO> getusers(@RequestParam String username) {
		List<UserMstrBO> userList = null;
		userList = irRoleService.searchUserService(username);
		return userList;
	}



	/*PURPOSE: FOR OPEN UPADTE ROLE PAGE(ROLEEDIT.JSP)
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: LIST OF VALUE OF PARTICULAR TABLE ROW 
	 *OUTPUT: RETURN COMMAND & JSP PAGE NAME */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String loadUpdatePage(@RequestParam List<String> editData, ModelMap modelMap) {
		RoleInsertCommand roleInsertCommand  =new RoleInsertCommand();
		roleInsertCommand.setRoleid(editData.get(0));
		roleInsertCommand.setRolename(editData.get(1));
		roleInsertCommand.setComments(editData.get(2));
		roleInsertCommand.setStatus(editData.get(3));
		modelMap.addAttribute("roleInsertCommand",roleInsertCommand);

		return ROLEEDIT;
	}



	/*PURPOSE: FOR UPDATE A ROLE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: COMMAND WITH NEW VALUES 
	 *OUTPUT: RETURN SUCCESSFULL MESSAGE & SAME PAGE */
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public  String updaterole(@ModelAttribute("roleInsertCommand") RoleInsertCommand roleInsertCommand,ModelMap map){
		irRoleService.roleupdate(roleInsertCommand);
		map.addAttribute("roleupdate","Role is Update Successfully..");
		return ROLEEDIT;
	}



	/*PURPOSE: FOR GET ROLENAME AND ROLEID FOR USER ASIGN
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: NA 
	 *OUTPUT: RETURN LIST OF ROLENAME AS VALUE AND ROLEID AS A KEY IN MAP */
	@RequestMapping(value = "/getrolename", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> getRolename(ModelMap map) {
		Map<String, String> list = null;
		list = irRoleService.getroles();
		return list;
	}



	/*PURPOSE: FOR VIEW ROLE FOR PARTICULAR ROLENAME AND ID
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: ROLE ID & ROLE NAME 
	 *OUTPUT: RETURN LIST OF USER ROLE IN LIST OF BO */
	@RequestMapping(value = "/viewrole", method = RequestMethod.POST)
	public @ResponseBody List<UserRoleBO> viewData(@RequestParam String id, String name, ModelMap map){
		List<UserRoleBO> list;
		list = irRoleService.getroleUser(id,name);
		return list;
	}




	/*PURPOSE: FOR ASIGN A PARTICULAR USER TO PARTICULAR ROLE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: COMMAND WITH VALUES 
	 *OUTPUT: RETURN NEW USERROLE ID AND SUCCESSFULL MESSAGE */
	@RequestMapping(value = "/userrolemap", method = RequestMethod.POST)
	public  String adduserRoleMap(@ModelAttribute("userRoleInsertCommand") UserRoleInsertCommand userRoleInsertCommand,ModelMap map) {
		List<String> userroleid = null;

		//IF DESCRIPTION IS EMPTY
		String [] description = userRoleInsertCommand.getDescription();
		if (userRoleInsertCommand.getDescription().length==0) {
			String [] desc = new String[1];
			desc[0] = ApplicationConstant.NOT_APPLICABLE;
			description = desc;
		}
		for (int i = 0; i < userRoleInsertCommand.getUname().length; i++) {
			if (description[i].equals("")) {
				description[i] = ApplicationConstant.NOT_APPLICABLE;
			}
		}
		userRoleInsertCommand.setDescription(description);


		userroleid = irRoleService.adduserRole(userRoleInsertCommand);

		RoleInsertCommand roleInsertCommand=new RoleInsertCommand();
		map.addAttribute("roleInsertCommand",roleInsertCommand);

		String message = "User Roll Map is Submit success Fully and Your Id is: "+userroleid;
		map.addAttribute("userroleids",message);
		map.addAttribute("userRoleInsertCommand",userRoleInsertCommand);

		return ROLEDETAILS;

	}


	/*PURPOSE: FOR DELETE USER FROM USERMSTR
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: PARTICULAR USERNAME
	 *OUTPUT: RETURN YES OR NO WITH JSP PAGE VAR */
	@RequestMapping(value = "/deleteuser", method = RequestMethod.GET)
	public  String DeleteUser(@RequestParam String uname,ModelMap map)
			throws Exception {
		irRoleService.deleteuser(uname);
		RoleInsertCommand roleInsertCommand=new RoleInsertCommand();
		map.addAttribute("roleInsertCommand",roleInsertCommand);
		return ROLEDETAILS;
	}



	/*PURPOSE: FOR OPEN EDIT USER ROLE PAGE(USERROLEEDIT.JSP)
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: LIST OF PARTICULAR TABLE ROW 
	 *OUTPUT: RETURN COMMAND WITH PARTICULAR VALUE WITH NEW JSP PAGE */
	@RequestMapping(value = "/edituserrole", method = RequestMethod.GET)
	public String loadUpdatePageRoleView(@RequestParam List<String> editData, ModelMap modelMap) {
		UserRoleEditCommand userRoleEditCommand = new UserRoleEditCommand();

		userRoleEditCommand.setUserroleid(editData.get(0));
		userRoleEditCommand.setRoleid(editData.get(1));
		userRoleEditCommand.setUname(editData.get(2));
		userRoleEditCommand.setDescription(editData.get(3));
		userRoleEditCommand.setStatus(editData.get(4));

		Map<String, String> list = null;
		list = irRoleService.getroles();
		modelMap.addAttribute("roles",list);

		modelMap.addAttribute("userRoleEditCommand",userRoleEditCommand);


		return USERROLEEDIT;
	}



	/*PURPOSE: FOR UPADTE USER ROLE WITH NEW VALUE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: LIST OF NEW VALUES  IN COMMAND 
	 *OUTPUT: RETURN SUCCESSFULL UPADATE USERROLEMESSAGE WITH SAME JSP */
	@RequestMapping(value="/updateuserrole",method=RequestMethod.POST)
	public  String updateuserrole(@ModelAttribute("userRoleEditCommand") UserRoleEditCommand userRoleEditCommand,ModelMap map){
		irRoleService.roleviewupdate(userRoleEditCommand);
		Map<String, String> list = null;
		list = irRoleService.getroles();
		map.addAttribute("roles",list);
		map.addAttribute("roleviewupdate","User Role View is Update Successfully..");
		return USERROLEEDIT;
	}



	/*PURPOSE: FOR DELETE A ROLEVIEW OF PARTICULAR TABLE ROW
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: LIST OF USERROLE ID 
	 *OUTPUT: RETURN YES OR NO WITH SAME JSP */
	@RequestMapping(value = "/deleteroleview", method = RequestMethod.POST)
	public  String deleteUserRolView(@RequestParam String id,ModelMap map)
			throws Exception {
		irRoleService.deleteuserroleview(id);
		return ROLESEARCH;
	}
}
