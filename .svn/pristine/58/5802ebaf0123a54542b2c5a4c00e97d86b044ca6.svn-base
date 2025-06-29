package com.nivesh.controller.security;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nivesh.util.IModuleServiceHelper;

@Controller
@RequestMapping("/getmodules")
public class GetMoulesController {
	
	@Autowired
	IModuleServiceHelper imoduleServiceHelper;

	/*FOR DYNEMIC MODULE & FEATURES
	 * PREPARED BY: SUNIL GAUSWAMI
	 * PARAMETER: USERNAME
	 * RESULT: LIST OF MAP IN LIST */
	@RequestMapping(value = "/getmodule", method = RequestMethod.POST)
	public @ResponseBody List<Map<String, Map<String, Map<String, Date>>>> getModulesBaseRole(@RequestParam String role,ModelMap modelMap) {
		List<Map<String, Map<String, Map<String, Date>>>> listmodules = imoduleServiceHelper.getmoduleByRole(role);
		return listmodules;
	}


	/*FOR DYNEMIC MODULE & FEATURES FOR MAIN PAGE BEFORE LOGIN
	 * PREPARED BY: SUNIL GAUSWAMI
	 * PARAMETER: NO
	 * RESULT: LIST OF MAP IN LIST */
	@RequestMapping(value = "/getFirstModules", method = RequestMethod.POST)
	public @ResponseBody List<Map<String, Map<String, Map<String, Date>>>> getModulesForHome() {
		List<Map<String, Map<String, Map<String, Date>>>> listmodules = imoduleServiceHelper.getHomepageModules();
		return listmodules;
	}
}
