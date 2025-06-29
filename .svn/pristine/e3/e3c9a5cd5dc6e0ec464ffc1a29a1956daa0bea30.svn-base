package com.nivesh.dao.portfolio;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;

import com.nivesh.bo.AfterSellBO;
import com.nivesh.bo.SellStockBO;
import com.nivesh.dao.PortfolioSqlConstants;

public class DBSellStockDaoImpl implements IDBSellStockDao{
	
	private JdbcTemplate jdbcTemplate;
	private SimpleJdbcCall simplejdbccall;
	
	public DBSellStockDaoImpl(JdbcTemplate jdbcTemplate, SimpleJdbcCall simplejdbccall ) {
		this.jdbcTemplate = jdbcTemplate;
		this.simplejdbccall = simplejdbccall;
	}

	
	
	
	/**
	 * PREPARED BY :SANDEEP KUMAR
	 * NAME        :BATCH SELL DATA INSERT
	 * PURPOSE     :TO INSERT SELL DATA INTO SELL STOCK TABLE
	 * */
	
	
	@Override
	public int batchInsert(final List<SellStockBO> portfoliobos) {
		jdbcTemplate.batchUpdate(PortfolioSqlConstants.SQL_INSERT_SELL,new BatchPreparedStatementSetter() {
			
			@Override
		public void setValues(PreparedStatement ps, int i) throws SQLException,ClassCastException {
	  SellStockBO portfoliobo=portfoliobos.get(i);
	  
	  ps.setInt(1,portfoliobo.getP_id());
	  ps.setInt(2, portfoliobo.getSc_code());

	   Date buydate=portfoliobo.getDate();
	   java.sql.Date sq = new java.sql.Date(buydate.getTime());  

	    ps.setDate(3,sq );  

	ps.setFloat(4, portfoliobo.getPrice());
	ps.setInt(5, portfoliobo.getNo_of_shrs());
	ps.setString(6,portfoliobo.getUserId());
	ps.setString(7,portfoliobo.getStatus());
	ps.setString(8,portfoliobo.getAuditAction());
		}
		
		
		public int getBatchSize() {
			// TODO Auto-generated method stub
			return portfoliobos.size();
		}
	});		
	return 1;
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

	
	
	/**
	 * PREPARED BY :SANDEEP KUMAR
	 * NAME        :GET ALL SELLPID AND SC_CODE 
	 * PURPOSE     :TO GET LIST OF ALL SELLPID AND SC_CODE BY USERID
	 * */
	
	@Override
	public List<SellStockBO>  getAllSellPidandSccode_by_userID(String user_id)
	{
	  return jdbcTemplate.query(PortfolioSqlConstants.SQL_GET_PID_AND_SCCODE_BY_USERID,new Object[]{user_id},new AllScCodeandPidResultSetExtractor());	
	
	}
	
	 public class AllScCodeandPidResultSetExtractor implements ResultSetExtractor<List<SellStockBO>> {

			@Override
			public List<SellStockBO> extractData(ResultSet rs) throws SQLException, DataAccessException {
				List<SellStockBO> list = new ArrayList<SellStockBO>();
				while (rs.next()) {
					SellStockBO bo = new SellStockBO();
					//bo.setSc_name(rs.getString(1));
					bo.setP_id(rs.getInt(1));
					bo.setSc_code(rs.getInt(2));
					bo.setDate(rs.getTimestamp(3));  //here 3feb getDate to getTimestamp
					
					list.add(bo);
					
				}
				return list;
			}
		}
	 
	 
	 @Override
		public List<SellStockBO> getAllSellStockData(String userName, Date today, Date prv_Date) {
		  return jdbcTemplate.query(PortfolioSqlConstants.SQL_GET_PID_AND_SCCODE_BY_USERID_BTN_DATE,new Object[]{userName,prv_Date,today},new AllScCodeandPidBtnDateResultSetExtractor());	
		
		}
		
		 public class AllScCodeandPidBtnDateResultSetExtractor implements ResultSetExtractor<List<SellStockBO>> {

				@Override
				public List<SellStockBO> extractData(ResultSet rs) throws SQLException, DataAccessException {
					List<SellStockBO> list = new ArrayList<SellStockBO>();
					while (rs.next()) {
						SellStockBO bo = new SellStockBO();
						bo.setP_id(rs.getInt(1));
						bo.setSc_code(rs.getInt(2));
						bo.setDate(rs.getTimestamp(3));
						
						list.add(bo);
						
					}
					return list;
				}
			}
		
	 
	 /**
		 * PREPARED BY :SANDEEP KUMAR
		 * NAME        :GET SELL PORTFOLIODATA
		 * PURPOSE     :TO GET LIST OF CALCULATED DATA AFTER SELL USING PROCEDURE
		 * */
	 
	 

	@Override
	public List<AfterSellBO> getSellPortfolioData(String userId, int sc_code, int p_id,Date date) {
		
		
		  simplejdbccall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("usp_get_selledstock_by_userID");//on 21 jan
		 
		 
		 Map<String,Object> args=new HashMap<String,Object>();
		 args.put("user_id",userId);
		 args.put("company_code",sc_code);
		 args.put("sellpid",p_id);
		 args.put("udate",date);//this 21 jan
		 SqlParameterSource in = new MapSqlParameterSource(args);
		 
		
		 Map<String,Object> out = simplejdbccall.execute(in);
		 AfterSellBO aSellStockBO=new AfterSellBO();
		 
		 aSellStockBO.setCompany_name((String) out.get("company_name"));
		 
		 aSellStockBO.setSell_date((Date) out.get("sell_date"));
		 
		 aSellStockBO.setQuantity((int) out.get("quantity"));
		 
		 aSellStockBO.setSell_price((float) out.get("sell_price"));
		 aSellStockBO.setAcquisition_cost((float) out.get("acquisition_cost"));
		 aSellStockBO.setAcquisition_date((Date)out.get("acquisition_date"));
		 aSellStockBO.setProfit((float) out.get("profit"));
		 aSellStockBO.setLong_short_term((String) out.get("long_short_term"));
		 List<AfterSellBO> bos=new ArrayList<AfterSellBO>();
		  bos.add(aSellStockBO);
		 
		 return bos;
		
		
		//till here 20jan
	}




	@Override
	public List<AfterSellBO> getHistoryPortfolioData(String userId, int sc_code, int p_id, Date date) {
		
//		System.out.println("Data : "+userId+", "+sc_code+", "+date+", "+p_id);
		 SimpleJdbcCall simplejdbccall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("usp_get_sellHistory_by_userID");//on 21 jan
		 
		 
		 Map<String,Object> args=new HashMap<String,Object>();
		 args.put("user_id",userId);
		 args.put("company_code",sc_code);
		 args.put("sellpid",p_id);
		 args.put("udate",date);//this 21 jan
		 SqlParameterSource in = new MapSqlParameterSource(args);
		 
		
		 Map<String,Object> out = simplejdbccall.execute(in);
		 AfterSellBO aSellStockBO=new AfterSellBO();
		 
		 aSellStockBO.setCompany_name((String) out.get("company_name"));
		 
		 aSellStockBO.setSell_date((Date) out.get("sell_date"));
		 
		 aSellStockBO.setQuantity((int) out.get("quantity"));
		 
		 aSellStockBO.setSell_price((float) out.get("sell_price"));
		 aSellStockBO.setAcquisition_cost((float) out.get("acquisition_cost"));
		 aSellStockBO.setAcquisition_date((Date)out.get("acquisition_date"));
		 aSellStockBO.setProfit((float) out.get("profit"));
		 aSellStockBO.setLong_short_term((String) out.get("long_short_term"));
		 List<AfterSellBO> bos=new ArrayList<AfterSellBO>();
		  bos.add(aSellStockBO);
		 
		 return bos;
		
		
		//till here 20jan
	}




	
	
	// till here 20jan
	

}
