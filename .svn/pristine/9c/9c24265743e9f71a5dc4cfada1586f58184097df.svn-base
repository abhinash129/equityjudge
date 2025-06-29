package com.nivesh.dao.portfolio;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
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

import com.nivesh.bo.BuyStockBO;
import com.nivesh.dao.PortfolioSqlConstants;

public class DBBuyStockDaoImp implements IDBBuyStockDao {
	private JdbcTemplate jdbcTemplate;
	private SimpleJdbcCall simplejdbccall;

	public DBBuyStockDaoImp(JdbcTemplate jdbcTemplate, SimpleJdbcCall simplejdbccall) {
		this.jdbcTemplate = jdbcTemplate;
		this.simplejdbccall = simplejdbccall;
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

	// this method is for finding all sc_code using user_id from nivpf_BuyStock
	// table

	/**
	 * PREPARED BY :SANDEEP KUMAR NAME :GET ALL SC_CODE USING USERID PURPOSE :TO
	 * GET LIST OF ALL SC_CODE BY USERID
	 */

	@Override
	public List<BuyStockBO> getAllSc_code_by_userID(String user_id) {
		return jdbcTemplate.query(PortfolioSqlConstants.SQL_GET_SC_CODE_BY_USERID, new Object[] { user_id },
				new AllScCodeResultSetExtractor());

	}

	public class AllScCodeResultSetExtractor implements ResultSetExtractor<List<BuyStockBO>> {

		@Override
		public List<BuyStockBO> extractData(ResultSet rs) throws SQLException, DataAccessException {
			List<BuyStockBO> list = new ArrayList<BuyStockBO>();
			while (rs.next()) {
				BuyStockBO bo = new BuyStockBO();
				bo.setSc_code(rs.getInt(1));
				list.add(bo);

			}
			return list;
		}
	}

	/**
	 * PREPARED BY :SANDEEP KUMAR NAME :GET ALL CALCULATED USER PORTFOLIO DATA
	 * PURPOSE :TO GET LIST OF ALL CALCULATED USER PORTFOLIO DATA BY CALLING
	 * PROCEDURE
	 */

	@Override
	public List<BuyStockBO> getPortfolioData(int sc_code, String userid) {

		simplejdbccall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("usp_get_portfolio_by_userID");// on
																											// 28
																											// jan

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("company_code", sc_code);
		args.put("userid", userid);
		SqlParameterSource in = new MapSqlParameterSource(args);

		Map<String, Object> out = simplejdbccall.execute(in);
		BuyStockBO buyStockBO = new BuyStockBO();

		buyStockBO.setSc_name((String) out.get("company_name"));

		// System.out.println("Comapny code : "+out.get("company_name"));

		buyStockBO.setBuy_rate((float) out.get("buy_rate"));

		buyStockBO.setQunatity((int) out.get("quantity"));

		buyStockBO.setCurrent_rate((float) out.get("current_rate"));
		buyStockBO.setDate((Date) out.get("buy_date")); //
		buyStockBO.setBuy_value((float) out.get("buy_value"));

		buyStockBO.setHolding_percentage((float) (Math.round(((float) out.get("percent_holding")) * 100.00) / 100.00));

		buyStockBO.setCurrent_value((float) out.get("current_value"));

		buyStockBO.setGain_or_loss((float) (Math.round(((float) out.get("gain_loss")) * 100.00) / 100.00));

		buyStockBO.setAppreciation((float) (Math.round(((float) out.get("appreciation")) * 100.00) / 100.00));

		/*
		 * buyStockBO.setHolding_percentage((float) out.get("percent_holding"));
		 * 
		 * buyStockBO.setCurrent_value((float) out.get("current_value"));
		 * 
		 * buyStockBO.setGain_or_loss((float) out.get("gain_loss"));
		 * 
		 * buyStockBO.setAppreciation((float) out.get("appreciation"));
		 */
		List<BuyStockBO> bos = new ArrayList<BuyStockBO>();
		bos.add(buyStockBO);

		return bos;
	}

	/**
	 * PREPARED BY :SANDEEP KUMAR NAME :INSERT THE BUY DATA INTO BUYSTOCK TABLE
	 * PURPOSE :TO INSERT THE BUYSTOCK DATA
	 */

	// batch insert
	@Override
	public int batchInsert(final List<BuyStockBO> portfoliobos) {
		jdbcTemplate.batchUpdate(PortfolioSqlConstants.SQL_INSERT, new BatchPreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException, ClassCastException {
				BuyStockBO portfoliobo = portfoliobos.get(i);
				ps.setInt(1, portfoliobo.getSc_code());

				Date buydate = portfoliobo.getDate();
				java.sql.Date sq = new java.sql.Date(buydate.getTime());

				ps.setDate(2, sq); //

				ps.setFloat(3, portfoliobo.getPrice());
				ps.setInt(4, portfoliobo.getNo_of_shrs());
				ps.setString(5, portfoliobo.getStatus());
				ps.setString(6, portfoliobo.getAudit_action());

				
				ps.setString(7, portfoliobo.getUser_id());
				
			}

			public int getBatchSize() {
				// TODO Auto-generated method stub
				return portfoliobos.size();
			}
		});
		return 1;
	}

	/**
	 * PREPARED BY :SANDEEP KUMAR NAME :GET DATA FOR SELL AFTER CLICKING ON SELL
	 * BUTTON PURPOSE :TO GET LIST OF PARTICULAR COMPANY TO SELL
	 */

	//
	@Override
	public List<BuyStockBO> findSell(String companyName, String username) {
		return jdbcTemplate.query(PortfolioSqlConstants.SQL_SELLLIST_BY_NAME,
				new Object[] { companyName, companyName, username }, new SellListResultSetExtractor());

	}

	public class SellListResultSetExtractor implements ResultSetExtractor<List<BuyStockBO>> {

		@Override
		public List<BuyStockBO> extractData(ResultSet rs) throws SQLException, DataAccessException {
			List<BuyStockBO> list = new ArrayList<BuyStockBO>();
			DecimalFormat decimalFormat=new DecimalFormat("#.00");
			while (rs.next()) {
				BuyStockBO bo = new BuyStockBO();

				bo.setP_id(rs.getInt(1));
				bo.setSc_code(rs.getInt(2));
				bo.setSc_name(rs.getString(3)); //
				bo.setDate(rs.getDate(4));
				//here no of share * price  for buy value
				bo.setPrice(rs.getFloat(5));
				bo.setBuy_value(Float.parseFloat(decimalFormat.format(rs.getFloat(5)*rs.getInt(6))));
				bo.setNo_of_shrs(rs.getInt(6));
				list.add(bo);

			}
			return list;
		}
	}

	/**
	 * PREPARED BY :SANDEEP KUMAR NAME :FIND OUT STATUS OF COMPANY PURPOSE :TO
	 * GET LIST OF STATUS
	 */

	// this i add on 4feb
	@Override
	public List<BuyStockBO> getDataForValidation(int p_id) {
		return jdbcTemplate.query(PortfolioSqlConstants.SQL_SELL_VALIDATION, new Object[] { p_id },
				new ValidationBuyExtractor());
	}

	public class ValidationBuyExtractor implements ResultSetExtractor<List<BuyStockBO>> {

		@Override
		public List<BuyStockBO> extractData(ResultSet rs) throws SQLException, DataAccessException {
			List<BuyStockBO> list = new ArrayList<BuyStockBO>();
			while (rs.next()) {
				BuyStockBO bo = new BuyStockBO();
				bo.setDate(rs.getDate(1));
				bo.setNo_of_shrs(rs.getInt(2));

				list.add(bo);

			}
			return list;
		}
	}
	// till here 4feb

	@Override
	public int[] batchDelete(final List<BuyStockBO> buyStockBOList) {

		return jdbcTemplate.batchUpdate(PortfolioSqlConstants.SQL_BATCHDELETE_ADDSTOCK,
				new BatchPreparedStatementSetter() {

					@Override
					public void setValues(PreparedStatement ps, int i) throws SQLException {

						BuyStockBO buyStockBO = buyStockBOList.get(i);
						ps.setString(1, buyStockBO.getStatus());
						ps.setLong(2, buyStockBO.getP_id());
						ps.setString(3, buyStockBO.getUser_id());

					}

					@Override
					public int getBatchSize() {
						return buyStockBOList.size();
					}
				});

	}

	@Override
	public int[] editList(final List<BuyStockBO> buy_sellStockBOList, String userName) {
		return jdbcTemplate.batchUpdate(PortfolioSqlConstants.SQL_BATCHUPDATE_BUYSTOCK,
				new BatchPreparedStatementSetter() {

					@Override
					public void setValues(PreparedStatement ps, int i) throws SQLException, ClassCastException {
						BuyStockBO portfoliobo = buy_sellStockBOList.get(i);

						Date buydate = portfoliobo.getDate();
						java.sql.Date sq = new java.sql.Date(buydate.getTime());

						ps.setDate(1, sq); //

						ps.setFloat(2, portfoliobo.getPrice());
						ps.setInt(3, portfoliobo.getNo_of_shrs());
						ps.setString(4, portfoliobo.getAudit_action());
						ps.setTimestamp(5, new java.sql.Timestamp(portfoliobo.getAudit_date_time().getTime()));
						ps.setLong(6, portfoliobo.getP_id());
						ps.setLong(7, portfoliobo.getSc_code());
						ps.setString(8, portfoliobo.getUser_id());

					}

					public int getBatchSize() {
						// TODO Auto-generated method stub
						return buy_sellStockBOList.size();
					}
				});

	}

}
