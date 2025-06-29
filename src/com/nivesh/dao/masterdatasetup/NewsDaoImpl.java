package com.nivesh.dao.masterdatasetup;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.nivesh.bo.NewsBO;
import com.nivesh.dao.NewsSqlConstants;
  //Name-NewsDao
  //purpose - Transfering news
public class NewsDaoImpl implements INewsDao{
	
	private JdbcTemplate jdbcTemplate;
	
	public NewsDaoImpl(JdbcTemplate jdbcTemplate) {
	
		this.jdbcTemplate = jdbcTemplate;
	}
	@Override
	public void update() {
	}
	@Override
	public List find() {
		return null;
	}
	@Override
	public int delete(String pk) {
		
		return jdbcTemplate.update(NewsSqlConstants.SQL_DELETE_NEWS,new Object[]{pk});
	}

	@Override
	public List<NewsBO> newsForUpdation(NewsBO newsBO) {
		return jdbcTemplate.query(NewsSqlConstants.SQL_UPDATEFOR_NEWS,new newsExtractor());
	
	}
	private class newsExtractor implements ResultSetExtractor <List<NewsBO>>{

		@Override
		public List<NewsBO> extractData(ResultSet rs) throws SQLException, DataAccessException {
			List<NewsBO> list1 = new ArrayList<NewsBO>();
			while (rs.next()) {
				NewsBO bo = new NewsBO();
				bo.setSubject(rs.getString(2));
				bo.setText(rs.getString(3));
				bo.setId(rs.getInt(1));
				list1.add(bo);
			}
			return list1;
		}
	}
	
	


	
	@Override
	public int deleteAllNewsData() {
		
		
		return jdbcTemplate.update(NewsSqlConstants.SQL_DELETE_ALL_NEWS);
		
		
		
	}
	
	
	@Override
	public int[] batchInsert(final List<NewsBO> newsBoList) {
		
	return jdbcTemplate.batchUpdate(NewsSqlConstants.SQL_BATCHINSERT_NEWSDATA,new BatchPreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				
				NewsBO newsBO=newsBoList.get(i);
				ps.setString(1,newsBO.getSubject());
				ps.setString(2,newsBO.getText());
				ps.setString(3,newsBO.getActive());
				ps.setString(4,newsBO.getAuditaction());
				
				
				Date utilDate = new java.util.Date();
				java.sql.Date sq = new java.sql.Date(utilDate.getTime());  

				
			ps.setDate(5,sq);
			}
			
			@Override
			public int getBatchSize() {
				return newsBoList.size();
			}
		});
	}
	@Override
	public int create(Object object) {
		return jdbcTemplate.update(NewsSqlConstants.SQL_INSERT_NEWSMODULE, new Object[]{((NewsBO) object).getSubject(),((NewsBO) object).getText(),((NewsBO) object).getActive(),((NewsBO) object).getAuditaction(),((NewsBO) object).getAuditdatetime()});
	}
	@Override
	public void delete() {
		// TODO Auto-generated method stub
		
	}
	
	
	

}
