package com.nivesh.util;

import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.nivesh.bo.ParameterAccessorBO;

public class ParameterCache implements ICache {


	Map<String,Object> parameterCacheMap=null;
	CacheManager cacheManager=null;
	
	public ParameterCache(){
		
		this.parameterCacheMap =new LinkedHashMap<String, Object>();
	}
	
	public void setCacheManager(CacheManager cacheManager) {
		this.cacheManager = cacheManager;
	}

	@Override
	public boolean containsKey(String key) {

		return parameterCacheMap.containsKey(key);
	}

	@Override
	public void put(String key, Object value) {
		
		parameterCacheMap.put(key, value);
		
	}



	@Override
	public Object get(String key) {
		List<Object> parameterList= null;
		parameterList = new LinkedList<Object>();
		Map<?, ?> pMap= new LinkedHashMap<>();
		pMap= (Map<?, ?>) parameterCacheMap.get(ApplicationConstant.PARAMETER_CONST);
		Set<?> parameterSet = (Set<?>) pMap.get("fieldName");
		for(Object ob:parameterSet){
			
			ParameterAccessorBO parameterAccessorBO=(ParameterAccessorBO)ob;
			if(parameterAccessorBO.getFieldname().equals(key)){
				parameterList.add(parameterAccessorBO);
			}
		}
		return parameterList;
	}

	@Override
	public void clear() {
		// TODO Auto-generated method stub
		
	}
}
