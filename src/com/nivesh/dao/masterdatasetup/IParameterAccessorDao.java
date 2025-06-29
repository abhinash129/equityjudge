package com.nivesh.dao.masterdatasetup;

import java.util.Set;

import com.nivesh.bo.ParameterAccessorBO;
import com.nivesh.dao.IDao;

public interface IParameterAccessorDao extends IDao{


public Set<ParameterAccessorBO> getParameterAccessor();

}
