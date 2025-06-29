package com.nivesh.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.nivesh.bo.ClassificationBO;
import com.nivesh.dao.security.IDBModuleDao;

public class ModuleServiceHelperImpl implements IModuleServiceHelper {

	@Autowired
	private IDBModuleDao dbmoduledao;
	public static  List<ClassificationBO> listBO;
	static List<Map<String, Map<String,Map<String, Date>>>> homelist;

	public void init(){
		listBO = dbmoduledao.getAllModules();
		setHomepageModule("HomePageModule");
	}

	@Override
	public void setHomepageModule(String rolename) {

		Map<String, Date> fetuaredetails = null;
		Map<String,Map<String, Date>> features = null;
		Map<String, Map<String,Map<String, Date>>> modules = null;
		Set<String> module =  new LinkedHashSet<String>();
		homelist = new ArrayList<>();
		List<ClassificationBO> listBOUser = new ArrayList<>();

		for (int j = 0; j < listBO.size(); j++) {
			if (listBO.get(j).getRolename().equals(rolename)) {
				listBOUser.add(listBO.get(j));
			}
		}

		for (int i = 0; i < listBOUser.size(); i++) {
			ClassificationBO bo = listBOUser.get(i);
			module.add(bo.getModulename());
		}

		for (String modulename : module) {
			modules = new LinkedHashMap<>();
			features  = new LinkedHashMap<>();

			for (int i = 0; i < listBOUser.size(); i++) {
				ClassificationBO bo = null ;
				bo = listBOUser.get(i);
				if (modulename.equals(bo.getModulename())) {
					fetuaredetails = new LinkedHashMap<>();
					fetuaredetails.put(bo.getFeaturename(), bo.getFeature_date());
					features.put(bo.getPath(),fetuaredetails);
				}
			}
			modules.put(modulename, features);
			homelist.add(modules);
		}		

	}

	@Override
	public List<Map<String, Map<String, Map<String, Date>>>> getHomepageModules() {
		return homelist;
	}

	@Override
	public List<Map<String, Map<String, Map<String, Date>>>> getmoduleByRole(String rolename) {
		Map<String, Date> fetuaredetails = null;
		Map<String,Map<String, Date>> features = null;
		Map<String, Map<String,Map<String, Date>>> modules = null;
		List<Map<String, Map<String,Map<String, Date>>>> list = new ArrayList<>() ;
		Set<String> module =  new LinkedHashSet<String>();

		List<ClassificationBO> listBOUser = new ArrayList<>();

		for (int j = 0; j < listBO.size(); j++) {
			if (listBO.get(j).getRolename().equals(rolename)) {
				listBOUser.add(listBO.get(j));
			}
		}

		for (int i = 0; i < listBOUser.size(); i++) {
			ClassificationBO bo = listBOUser.get(i);
			module.add(bo.getModulename());
		}

		for (String modulename : module) {
			modules = new LinkedHashMap<>();
			features  = new LinkedHashMap<>();

			for (int i = 0; i < listBOUser.size(); i++) {
				ClassificationBO bo = null ;
				bo = listBOUser.get(i);
				if (modulename.equals(bo.getModulename())) {
					fetuaredetails = new LinkedHashMap<>();
					fetuaredetails.put(bo.getFeaturename(), bo.getFeature_date());
					features.put(bo.getPath(),fetuaredetails);
				}
			}
			modules.put(modulename, features);
			list.add(modules);
		}		
		return list;
	}







}
