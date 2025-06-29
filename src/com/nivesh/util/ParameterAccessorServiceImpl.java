package com.nivesh.util;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import com.nivesh.bo.ParameterAccessorBO;
import com.nivesh.dao.masterdatasetup.IParameterAccessorDao;


public class ParameterAccessorServiceImpl implements IParameterAccessorService{

	
	private IParameterAccessorDao parameterdao;

	public void setParameterdao(IParameterAccessorDao parameterdao) {
		this.parameterdao = parameterdao;
	}


	@Override
	public Map<String, Object> getData() {
		Map<String,Object> map= new LinkedHashMap<String, Object>();
	    Set<ParameterAccessorBO> accessorSet=null;
	    accessorSet=parameterdao.getParameterAccessor();
	    
	    map.put("fieldName",accessorSet);
	    return map;
	}




}
