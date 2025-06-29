package com.nivesh.util;

import java.util.HashMap;
import java.util.Map;

public class CompanyCache implements ICache{
	
	Map<String,Object> companycacheMap=null;
	CacheManager cacheManager=null;
	
	public CompanyCache() {
		
		this.companycacheMap =new HashMap();//concurrentHaslMap
	}
	
	

	public void setCacheManager(CacheManager cacheManager) {
		this.cacheManager = cacheManager;
	}



	@Override
	public boolean containsKey(String key) {

		return companycacheMap.containsKey(key);
		
		
	}

	@Override
	public void put(String key, Object value) {
		
			companycacheMap.put(key, value);
		
	}

	@Override
	public Object get(String key) {
		
		if (companycacheMap.size()==1000) 
			clear();

		if(companycacheMap.get(key)==null)
			 cacheManager.getCompanyData(key);
		

			return companycacheMap.get(key);
		
		
	}

	@Override
	public void clear() {
	
		companycacheMap.clear();
	}

	

}
