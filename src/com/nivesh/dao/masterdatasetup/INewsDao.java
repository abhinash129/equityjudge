package com.nivesh.dao.masterdatasetup;

import java.util.List;

import com.nivesh.bo.NewsBO;
import com.nivesh.dao.IDao;

public interface INewsDao extends IDao{
	public List<NewsBO> newsForUpdation(NewsBO nbo);
	public int deleteAllNewsData();
	
	public int[] batchInsert(List<NewsBO> newsBoList);
	
	//public List<NewsBO> getNewsDetails();

}
