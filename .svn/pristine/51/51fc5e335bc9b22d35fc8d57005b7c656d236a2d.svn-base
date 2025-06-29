package com.nivesh.dao.masterdatasetup;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import com.nivesh.bo.ParameterAccessorBO;
import com.nivesh.dao.ParameterSqlConstant;

public class ParameterDaoImpl implements IParameterDao{
private JdbcTemplate jdbcTemplate;

public ParameterDaoImpl(JdbcTemplate jdbcTemplate, NamedParameterJdbcTemplate npjt) {
	this.jdbcTemplate = jdbcTemplate;
}

@Override
public int[] batchInsert(final List<ParameterAccessorBO> accessorBOslist) {
	return jdbcTemplate.batchUpdate(ParameterSqlConstant.SQL_INSERT_PARAMETER, new BatchPreparedStatementSetter() {
		
		@Override
		public void setValues(PreparedStatement ps, int i) throws SQLException {
ParameterAccessorBO accessorBO=accessorBOslist.get(i);	
ps.setString(1, accessorBO.getFieldname());
ps.setString(2,accessorBO.getDisplayname());
ps.setString(3, accessorBO.getLogicalvalue());
ps.setString(4, accessorBO.getParameterorder());
//ps.setString(6, ApplicationConstant.ACTIVE);
//ps.setString(7, ApplicationConstant.AUDIT_ACTION_INSERT);
		}
		
		@Override
		public int getBatchSize() {
			return accessorBOslist.size();
		}
	});
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
