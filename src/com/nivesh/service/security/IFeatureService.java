package com.nivesh.service.security;

import java.util.List;

import com.nivesh.bo.FeaturMstrBO;
import com.nivesh.command.security.FeatureInsertCommand;

public interface IFeatureService {

	public static final String FEATURE_ID_FIELD="FEATUREID";
	public static final String FEATURE_NAME_FIELD="FEATURENAME";
	
	public String featureInsert(FeatureInsertCommand featureInsertCommandCommand);
	
	public List<FeaturMstrBO> FeatureSearch(List<String> searchFeature);

	public int checkfeatureName(String featureName);

	public int deleteFeature(String featureid);

	public int featureupdate(FeatureInsertCommand featureInsertCommand);
		
	
}
