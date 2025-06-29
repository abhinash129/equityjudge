package com.nivesh.util;

import java.util.Map;

public class CacheManager {
	
	private ICache cache;
	private ICache companyCache;
	private ICache parameterCache;
	private Map<String,IAccessorService> accessorMap;
	
	public CacheManager(Map<String, IAccessorService> accessorMap) {
		
		this.accessorMap = accessorMap;
		
		
	}
	
	public void setCache(ICache cache) {
		this.cache = cache;
	}


	public void setCompanyCache(ICache companyCache) {
		this.companyCache = companyCache;
	}



	
	public void setParameterCache(ICache parameterCache) {
		this.parameterCache = parameterCache;
	}

	public void init(){
		getParameterData();
	}
	
	public void getCompanyData(String key){
		IAccessorService accessorService=accessorMap.get(ApplicationConstant.COMPANY_CONST);
		ICompanyAccessorService companyAccessorService=(ICompanyAccessorService)accessorService;
		Map map=companyAccessorService.getData(key);
		companyCache.put(key,map);
	}
	
	public void getParameterData(){
		
		IAccessorService accessorService=accessorMap.get(ApplicationConstant.PARAMETER_CONST);
		IParameterAccessorService parameterAccessorService=(IParameterAccessorService) accessorService;
		Map map=parameterAccessorService.getData();
		parameterCache.put(ApplicationConstant.PARAMETER_CONST, map);
		
	}
	

}
