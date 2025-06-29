package com.nivesh.controller.algoefficacy;

import java.text.ParseException;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.nivesh.bo.AlgoEfficacyBO;
import com.nivesh.command.algoefficacy.AlgoEfficacyCommand;
import com.nivesh.service.algoefficacy.IAlgoEfficacyService;

@Controller

@RequestMapping(value="/algoEfficacy")

public class AlgoEfficacyController {
	@Autowired
	IAlgoEfficacyService ialgoafficacy;

	@RequestMapping(value = "/findTop10List", method = RequestMethod.POST)
	public String  efficacyResult(@ModelAttribute AlgoEfficacyCommand efficacyCommand,ModelMap modelMap  ) throws ParseException{
		Map efficacylist=ialgoafficacy.findAlgoEfficacy(efficacyCommand);
		//System.out.println("efficacylist map"+efficacylist);
		modelMap.addAttribute("efficacylist", efficacylist);
		List<AlgoEfficacyBO> algoEfficacyBO=  (List<AlgoEfficacyBO>) efficacylist.get("bse");
		AlgoEfficacyBO efficacyBO=algoEfficacyBO.get(0);
		//System.out.println("givendate"+efficacyBO.getGivendate());
		modelMap.addAttribute("backDate",efficacyBO.getGivendate());
		modelMap.addAttribute("crrDateto10daybackDate", efficacylist.get("prevdate"));
		//System.out.println("crrDateto10daybackDate"+efficacyBO.getPrevSearchdate());
		modelMap.addAttribute("userSearchDate", efficacylist.get("curdate"));
		//System.out.println("crrDateto10daybackDate"+efficacyBO.getPrevSearchdate());
		modelMap.addAttribute("duration", efficacylist.get("month"));
		modelMap.addAttribute("todayDate", efficacylist.get("currentDate"));
		modelMap.addAttribute("efficacylist", efficacylist);
		
		return "algoEfficacy";
	}
}
