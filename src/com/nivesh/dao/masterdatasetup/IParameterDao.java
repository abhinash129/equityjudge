package com.nivesh.dao.masterdatasetup;

import java.util.List;

import com.nivesh.bo.ParameterAccessorBO;
import com.nivesh.dao.IDao;

public interface IParameterDao extends IDao{
	public int[] batchInsert(List<ParameterAccessorBO> accessorBOslist);
}
