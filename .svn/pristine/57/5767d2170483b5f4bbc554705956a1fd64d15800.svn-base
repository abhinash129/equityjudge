package com.nivesh.controller.security;

import java.util.List;

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

import com.nivesh.bo.FeaturMstrBO;
import com.nivesh.command.security.FeatureInsertCommand;
import com.nivesh.service.security.IFeatureService;

@Controller
@RequestMapping("/feature")
public class FeatureController {

	public static final String FEATURESEARCH="FeatureHome",FEATUREDETAILS="FeatureInsert",FEATUIREEDIT="FeatureEdit";
	
	@Inject
	IFeatureService ifeatureService;
	public void setFeatureService(IFeatureService ifeatureService) {
		this.ifeatureService = ifeatureService;
	}



	/*PURPOSE: FOR OPEN HOME PAGE OF FEATURE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: NA 
	 *OUTPUT: RETURN JSP PAGE VAR */
	@RequestMapping(value="/home",method=RequestMethod.GET)
	public String inserthome(HttpServletRequest request){
				return FEATURESEARCH;
	}




	/*PURPOSE: FOR OPEN INSERT FEATURE JSP PAGE(FEATUREDEATILS.JSP)
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: NA
	 *OUTPUT: RETURN NEW JSP PAGE VAR */
	@RequestMapping(value="/insertFeatureHome",method=RequestMethod.POST)
	public String InsertFeatureHome(Model model,HttpServletRequest request){
				FeatureInsertCommand featureInsertCommand = new FeatureInsertCommand();
				model.addAttribute("featureInsertCommand",featureInsertCommand);
				return FEATUREDETAILS;
	}



	/*PURPOSE: FOR INSERT NEW FEATURE TO PARTICULAR MODULE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: COMMAND WITH VALUES 
	 *OUTPUT: RETURN NEW FEATURE ID & SAME JSP PAGE VAR */
	@RequestMapping(value="/insertfeature",method=RequestMethod.POST)
	public String insertFeature( @Valid @ModelAttribute FeatureInsertCommand featureInsertCommand ,BindingResult result,ModelMap map,HttpServletRequest request){
				if (result.hasErrors()) {
					return FEATUREDETAILS;
				}
				String featureId=null;
				featureId=ifeatureService.featureInsert(featureInsertCommand);
				map.addAttribute("featureInsertCommand",featureInsertCommand);
				map.addAttribute("featureId",featureId);
				return FEATUREDETAILS;
	}










	/*PURPOSE: FOR SEARCH FEATURE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: LIST OF VALUES 
	 *OUTPUT: RETURN LIST OF FEATURES RESULT */
	@RequestMapping(value = "/searchfeature", method = RequestMethod.POST)
	public @ResponseBody List<FeaturMstrBO> getFeatures(@RequestParam List<String> searchFeature) {
		List<FeaturMstrBO> featureList = null;
		featureList =ifeatureService.FeatureSearch(searchFeature);
		return featureList;
	}




	/*PURPOSE: FOR DELETE FEATURE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: FEATURE ID 
	 *OUTPUT: RETURN YES OR NO & SAME JSP PAGE VAR */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public  String DeleteData(@RequestParam String id)
			throws Exception {
		String featureid = id;
		ifeatureService.deleteFeature(featureid);
		return FEATURESEARCH;
	}





	/*PURPOSE: FOR OPEN EDIT PAGE (FEATUREEDIT.JSP)
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: LIST OF PARTICULAR ROW VALUES 
	 *OUTPUT: RETURN NEW JSP PAGE VAR & COMMAND WITH VALUE */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String loadUpdatePage(@RequestParam List<String> editData, ModelMap modelMap) {
		FeatureInsertCommand featureInsertCommand=  new FeatureInsertCommand();
		featureInsertCommand.setFeatureid(editData.get(0));
		featureInsertCommand.setFeaturename(editData.get(1));
		featureInsertCommand.setDescription(editData.get(2));
		featureInsertCommand.setPath(editData.get(3));
		featureInsertCommand.setStatus(editData.get(4));
		modelMap.addAttribute("featureInsertCommand",featureInsertCommand);

		return FEATUIREEDIT;
	}





	/*PURPOSE: FOR UPDATE FEATURE 
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: COMMAND WITH NEW VALUES 
	 *OUTPUT: RETURN UPADTE SUCCESSFULL & SAME JSP PAGE VAR */
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public  String updatefeature(@ModelAttribute("featureInsertCommand")FeatureInsertCommand featureInsertCommand,BindingResult result,ModelMap map){
		ifeatureService.featureupdate(featureInsertCommand);
		map.addAttribute("featureupdate","Your Feature is update Successfully..");
		return FEATUIREEDIT;
	}
}
