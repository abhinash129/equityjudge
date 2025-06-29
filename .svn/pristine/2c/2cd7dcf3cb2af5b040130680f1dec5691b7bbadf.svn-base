package com.nivesh.service.masterdatasetup;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nivesh.bo.ParameterAccessorBO;
import com.nivesh.command.masterdatasetup.ParameterCommand;
import com.nivesh.dao.masterdatasetup.IParameterDao;
import com.nivesh.util.ApplicationConstant;
@Service
@Transactional
public class ParameterServiceImpl implements IParameterService{
@Resource
private IParameterDao iParameterDao;

	
	public void setiParameterDao(IParameterDao iParameterDao) {
	this.iParameterDao = iParameterDao;
}


	@Override
	public int[] updateParameter(ParameterCommand parameterCommand) {
		List<ParameterAccessorBO> parameterboList=null;
		parameterboList=new ArrayList<ParameterAccessorBO>();
		String[] fieldname=parameterCommand.getFieldName();
		String[] displayname=parameterCommand.getDisplayName();
		String[] logicalvalue=parameterCommand.getLogicalValue();
		String[] parameterorder=parameterCommand.getParameterOrder();
		for(int i=0;i<=(fieldname.length)-1;i++)
		{
			String fieldnameStr=fieldname[i];
			ParameterAccessorBO parameterAccessorBO=new ParameterAccessorBO();
			
			if(fieldnameStr!=null&&fieldnameStr.trim().length()>0)
				parameterAccessorBO.setFieldname(fieldnameStr);
			else
				parameterAccessorBO.setFieldname(null);
			if(displayname[i]!=null&&displayname[i].trim().length()>0)
				parameterAccessorBO.setDisplayname(displayname[i]);
			else
				parameterAccessorBO.setDisplayname(null);
			if(logicalvalue[i]!=null&&logicalvalue[i].trim().length()>0)
				parameterAccessorBO.setLogicalvalue(logicalvalue[i]);
			else
				parameterAccessorBO.setLogicalvalue(null);
			if(parameterorder[i]!=null&&parameterorder[i].trim().length()>0)
				parameterAccessorBO.setParameterorder(parameterorder[i]);
			else
				parameterAccessorBO.setParameterorder(null);
			parameterAccessorBO.setActive(ApplicationConstant.ACTIVE);
			
			parameterboList.add(parameterAccessorBO);
		}
	int[] b=iParameterDao.batchInsert(parameterboList);
		return b;
	}
	

}
