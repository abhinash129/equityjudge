package com.nivesh.util;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public  class Cache implements ICache{
	
	
		
	Map<String,Object> cacheMap=null;
	
	
	public Cache() {
		
		this.cacheMap =new ConcurrentHashMap<>();
	}

	@Override
	public boolean containsKey(String key) {
		return cacheMap.containsKey(key);
		
		
	}

	@Override
	public void put(String key, Object value) {
			cacheMap.put(key, value);
	}

	@Override
	public Object get(String key) {
		return cacheMap.get(key);
		
		
	}

	@Override
	public void clear() {
		// TODO Auto-generated method stub
		
	}


}
