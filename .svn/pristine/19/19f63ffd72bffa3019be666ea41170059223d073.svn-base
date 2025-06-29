package com.nivesh.controller.masterdatasetup;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nivesh.command.masterdatasetup.ParameterCommand;
import com.nivesh.service.masterdatasetup.IParameterService;
@Controller
@RequestMapping("/parameter")
public class ParameterController {

	public static final String PARAMETER="parameter";

	public ParameterController() {
	}
	@Resource
	IParameterService iParameterService;

	public ParameterController(IParameterService iParameterService) {
		this.iParameterService = iParameterService;
	}
	@RequestMapping(value="/parameterdata/home",method=RequestMethod.GET)
	public String parameterhome(HttpServletRequest request){
				return PARAMETER;
	}	
	
	
	@RequestMapping(value="/parameterdata",method=RequestMethod.POST)    
	public String parameterdata(@ModelAttribute("parameterform") ParameterCommand rcommand,ModelMap map){
		int[] b=iParameterService.updateParameter(rcommand);
		if(b!=null){
			map.addAttribute("result","successfully updated");
			return PARAMETER;
		}else{
			map.addAttribute("result","updation failed");
			return PARAMETER;

		}



	}
}
