package com.nivesh.util;



import java.lang.reflect.Field;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.nivesh.dao.security.IDBModuleDao;

@Component("maxIdImpl")
public class MaximumIdValueImpl implements IMaxIdValue{
	@Resource
	private IDBModuleDao dbmoduledao;
	public void setDbmoduledao(IDBModuleDao dbmoduledao) {
		this.dbmoduledao = dbmoduledao;
	}


	/*	Thats method for Geting Max Id
	created by: Sunil
	Parameter: Class name of BO(Modulemaster/Featuremstr)
	oputput: return simple moduleid
*/
	public String getMaskIdValue(Class tableclassname)
	{
		String tablename=null;
		String colName=null;
		
		tablename=tableclassname.getSimpleName();

		String[] tableName=tablename.split("BO");

		Field[] fields=tableclassname.getDeclaredFields();
		for(Field field:fields)
		{
			if(field.isAnnotationPresent(AllAnnotation.IdAnnotation.class))
				colName=field.getName();
		}
		
		
		//this method call for get maximum id from table(modulemaster/featuremstr)
		String maxid=dbmoduledao.getMaxId(tableName[0].toUpperCase(),colName.toUpperCase());
		if(maxid!=null)
		{
			String value=maxid.substring(2);
			String label=maxid.substring(0, 2);
			int maxValue=Integer.parseInt(value)+1;
			
			if(maxValue>0&&maxValue<10)
				return String.valueOf(label+"0000"+maxValue);
			else if(maxValue>=10&&maxValue<100)
				return String.valueOf(label+"000"+maxValue);
			else if(maxValue>=100&&maxValue<1000)
				return String.valueOf(label+"00"+maxValue);
			else if(maxValue>=1000&&maxValue<10000)
				return String.valueOf(label+"0"+maxValue);
			else 
				return String.valueOf(label+maxValue);
		}
		else
		{
			String labelName=dbmoduledao.getLabelForId(tableName[0]);
			return labelName+"00001";
			
		}

	}

}
