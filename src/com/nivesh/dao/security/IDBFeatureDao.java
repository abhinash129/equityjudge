package com.nivesh.dao.security;

import java.util.List;

import com.nivesh.bo.FeaturMstrBO;
import com.nivesh.dao.IDao;

public interface IDBFeatureDao extends  IDao{

	public static final String FEATURE_ID_FIELD="FEATUREID";
	public static final String FEATURE_NAME_FIELD="FEATURENAME";
	public static final String STATUS_FIELD="STATUS";

	public List<FeaturMstrBO> search(String status);
	public int isFeatureName_Available(String featureName);
	public int updatefeature(FeaturMstrBO fBo);
}
