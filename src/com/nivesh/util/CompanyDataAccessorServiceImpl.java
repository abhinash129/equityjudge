package com.nivesh.util;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import com.nivesh.dao.masterdatasetup.ICompanyDao;


public class CompanyDataAccessorServiceImpl implements ICompanyAccessorService {

	
	
	 private ICompanyDao companydao;
	
	public void setCompanydao(ICompanyDao companydao) {
		this.companydao = companydao;
	}

	@Override
	public Map<String, Object> getData() {
		return null;
	}


	@Override
	public Map<String,Object> getData(String companyName) {
		Set  set=companydao.getCompanyList(companyName);
		Map map=null;
		map=new HashMap<String,Set>();
		map.put(companyName,set);
		return map;
	}
 
}
