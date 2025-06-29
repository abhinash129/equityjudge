package com.nivesh.service.security;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nivesh.bo.FeaturMstrBO;
import com.nivesh.command.security.FeatureInsertCommand;
import com.nivesh.dao.security.IDBFeatureDao;
import com.nivesh.util.ApplicationConstant;
import com.nivesh.util.DateHelper;
import com.nivesh.util.IMaxIdValue;
@Service
@Transactional
public class FeatureServiceImpl implements IFeatureService {

	//FOR ADD VALUES FOR SEARCH DYNEMIC
	public static  Map<String, List<String>> featuremap = new HashMap<String, List<String>>();

	@Resource
	private IDBFeatureDao dbfeaturedao;
	@Inject
	private IMaxIdValue iMaxIdValue;
	public void setDbfeaturedao(IDBFeatureDao dbfeaturedao) {
		this.dbfeaturedao = dbfeaturedao;
	}
	public void setiMaxIdValue(IMaxIdValue iMaxIdValue) {
		this.iMaxIdValue = iMaxIdValue;
	}







	/*PURPOSE: FOR NEW FEATURE INSERT
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: COMMAND WITH VALUES 
	 *OUTPUT: RETURN NEW FEATURE ID */
	@Override
	public String featureInsert(FeatureInsertCommand fCommand) {

		String featureId=null;
		// FOR GETTING NEXT MAX FEATURE ID FROM TABLE
		featureId=iMaxIdValue.getMaskIdValue(FeaturMstrBO.class);

		FeaturMstrBO fBo=new FeaturMstrBO();
		fBo.setFeatureid(featureId);
		fBo.setFeaturename(fCommand.getFeaturename());
		fBo.setDescription(fCommand.getDescription());
		fBo.setStatus(fCommand.getStatus());
		fBo.setPath(fCommand.getPath());
		fBo.setAuditaction(ApplicationConstant.AUDIT_ACTION_INSERT);
		fBo.setAuditdatetime(DateHelper.todaysDateTimeInDBFormat());
		fBo.setUserid("mm001");

		dbfeaturedao.create(fBo);
		return featureId;
	}






	/*PURPOSE: FOR SEARCH FEATURE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: LIST OF SEARCH VALUES 
	 *OUTPUT: RETURN LIST OF FEATURES IN FEATUREMSTR BO */
	@Override
	public List<FeaturMstrBO> FeatureSearch(List<String> searchFeature) {
		featuremap.clear();

		// this is for module id prefix(Start With/Ends With/ Consist Of)
		String prefix_featureId=null;
		//this is for Module Name prefix(Start With/Ends With/ Consist Of)
		String prefix_featurename=null;

		prefix_featureId= searchFeature.get(0);
		String featureid= searchFeature.get(1);
		prefix_featurename= searchFeature.get(2);
		String featureName= searchFeature.get(3);
		String status = searchFeature.get(4);

		if (featureid!=null && featureid.trim().length()>0) {
			List<String> list = new ArrayList<>();
			list.add(0, prefix_featureId);
			list.add(1, featureid);
			featuremap.put(FEATURE_ID_FIELD, list);
		}

		if (featureName!=null && featureName.trim().length()>0) {
			List<String> list = new ArrayList<>();
			list.add(0, prefix_featurename);
			list.add(1, featureName);
			featuremap.put(FEATURE_NAME_FIELD, list);
		}
		return  dbfeaturedao.search(status);
	}







	/*PURPOSE: FOR CHECKIN AVABILITY IF FEATURE NAME IN DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: FEATURE NAME
	 *OUTPUT: RETURN INT */
	@Override
	public int checkfeatureName(String featureName) {
		int isAuth = dbfeaturedao.isFeatureName_Available(featureName);
		if (isAuth == 1) {
			return 1;
		}
		return 0;
	}





	/*PURPOSE: FOR DELETE FEATURE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: FEATURE ID 
	 *OUTPUT: RETURN INT */
	@Override
	public int deleteFeature(String featureid) {
		int falg = dbfeaturedao.delete(featureid);
		if (falg == 1) {
			return 1;
		}
		return 0;
	}






	/*PURPOSE: FOR UPDATE FEATURE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: COMMAND WITH VALUES 
	 *OUTPUT: RETURN INT */
	@Override
	public int featureupdate(FeatureInsertCommand featureInsertCommand) {

		FeaturMstrBO fBo=new FeaturMstrBO();
		fBo.setFeatureid(featureInsertCommand.getFeatureid());
		fBo.setFeaturename(featureInsertCommand.getFeaturename());
		fBo.setDescription(featureInsertCommand.getDescription());
		fBo.setPath(featureInsertCommand.getPath());
		fBo.setStatus(featureInsertCommand.getStatus());
		fBo.setAuditaction(ApplicationConstant.AUDIT_ACTION_UPDATE);
		fBo.setAuditdatetime(DateHelper.todaysDateTimeInDBFormat());

		return dbfeaturedao.updatefeature(fBo);
	}
}
