package com.nivesh.util;

public interface ICache {
	
	public void put(String key,Object value);
	public Object get(String key);
	public boolean containsKey(String key);
	public void clear();
}
