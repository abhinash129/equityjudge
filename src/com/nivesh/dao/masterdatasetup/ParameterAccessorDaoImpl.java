package com.nivesh.dao.masterdatasetup;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.nivesh.bo.ParameterAccessorBO;
import com.nivesh.dao.AccessorSqlConstant;

public class ParameterAccessorDaoImpl implements IParameterAccessorDao{
	
	public JdbcTemplate jdbcTemplate;
	

	public ParameterAccessorDaoImpl(JdbcTemplate jdbcTemplate) {
		super();
		this.jdbcTemplate = jdbcTemplate;
	}
	@Override
	public Set<ParameterAccessorBO> getParameterAccessor() {
		return jdbcTemplate.query(AccessorSqlConstant.PARAMETER_ACCESSOR_DATA,new parameterExtractor());
	}
private class parameterExtractor implements ResultSetExtractor<Set<ParameterAccessorBO>>{

	@Override
	public Set<ParameterAccessorBO> extractData(ResultSet rs) throws SQLException, DataAccessException {
		Set<ParameterAccessorBO> AccessorSet=new LinkedHashSet<ParameterAccessorBO>();
		while(rs.next()){
		ParameterAccessorBO accessorBO=new ParameterAccessorBO();
		
		accessorBO.setId(rs.getInt(1));
		accessorBO.setFieldname(rs.getString(2));
		accessorBO.setDisplayname(rs.getString(3));
		accessorBO.setLogicalvalue(rs.getString(4));
		accessorBO.setActive(null);
		AccessorSet.add(accessorBO);
	}
		return AccessorSet;
	}
}
@Override
public void update() {
	// TODO Auto-generated method stub
	
}
@Override
public List find() {
	// TODO Auto-generated method stub
	return null;
}
@Override
public int delete(String pk) {
	// TODO Auto-generated method stub
	return 0;
}

@Override
public int create(Object object) {
	// TODO Auto-generated method stub
	return 0;
}
@Override
public void delete() {
	// TODO Auto-generated method stub
	
}
}
