package com.nivesh.dao.masterdatasetup;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import com.nivesh.bo.CustomPriceBO;
import com.nivesh.dao.ParameterSqlConstant;

public class SubscriptionPriceDao implements ISubscriptionPriceDao{

	private JdbcTemplate jdbcTemplate;
	private NamedParameterJdbcTemplate npjt;
	public SubscriptionPriceDao(JdbcTemplate jdbcTemplate, NamedParameterJdbcTemplate npjt) {
		this.jdbcTemplate = jdbcTemplate;
		this.npjt = npjt;
	}
	
	@Override
	public void update() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List find() {
		return jdbcTemplate.query(ParameterSqlConstant.SQL_GETALl_PRICE,new SearchResultSetExtractorPrice());
	}
	public class SearchResultSetExtractorPrice implements ResultSetExtractor<List<CustomPriceBO>> {
		@Override
		public List<CustomPriceBO> extractData(ResultSet rs) throws SQLException, DataAccessException {
			List<CustomPriceBO>  list = new LinkedList<>();
			while (rs.next()) {
				CustomPriceBO customPriceBO = new CustomPriceBO();
				customPriceBO.setId(rs.getInt(1));
				customPriceBO.setDuration(rs.getString(2));
				customPriceBO.setPrice(rs.getInt(3));
				list.add(customPriceBO);
			}
			return list;
		}
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
