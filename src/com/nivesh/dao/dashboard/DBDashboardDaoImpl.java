package com.nivesh.dao.dashboard;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;

import com.nivesh.bo.AccuracyBO;
import com.nivesh.bo.ContactUsBO;
import com.nivesh.bo.CustomPriceBO;
import com.nivesh.bo.EmailBO;
import com.nivesh.bo.UserLogBO;
import com.nivesh.dao.LoginSqlConstants;
import com.nivesh.dao.SecuritySqlConstants;
import com.nivesh.util.ApplicationConstant;

public class DBDashboardDaoImpl implements IDBDashboardDao{
	private JdbcTemplate jdbcTemplate;
	private NamedParameterJdbcTemplate npjt;
	public DBDashboardDaoImpl(JdbcTemplate jdbcTemplate, NamedParameterJdbcTemplate npjt) {
		this.jdbcTemplate = jdbcTemplate;
		this.npjt = npjt;
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




	@Override
	public List<Integer> getPriceDao() {
		return jdbcTemplate.query(SecuritySqlConstants.SQL_GETALL_PRICE,new SearchResultSetExtractor());
	}
	public class SearchResultSetExtractor implements ResultSetExtractor<List<Integer>> {
		@Override
		public List<Integer> extractData(ResultSet rs) throws SQLException, DataAccessException {
			List<Integer>  price = new LinkedList<>();
			while (rs.next()) {
				price.add(rs.getInt(2));
			}
			return price;
		}
	}



	@Override
	public int contactUs(ContactUsBO contactUsBO) {
		SqlParameterSource paramSource=new BeanPropertySqlParameterSource(contactUsBO);
		return npjt.update(SecuritySqlConstants.SQL_INSERT_CONTACTUS, paramSource);
	}



//hello 
	@Override
	public List<CustomPriceBO> getCustomPrice() {
		return jdbcTemplate.query(SecuritySqlConstants.SQL_GETCUSTOM_PRICE,new SearchResultSetExtractorPrice());
	}
	public class SearchResultSetExtractorPrice implements ResultSetExtractor<List<CustomPriceBO>> {
		@Override
		public List<CustomPriceBO> extractData(ResultSet rs) throws SQLException, DataAccessException {
			List<CustomPriceBO>  list = new LinkedList<>();
			while (rs.next()) {
				CustomPriceBO customPriceBO = new CustomPriceBO();
				customPriceBO.setDuration(rs.getString(1));
				customPriceBO.setPrice(rs.getInt(2));

				list.add(customPriceBO);
			}
			return list;
		}
	}



	@Override
	public List<Map<String,Object>> forgotPassword(UserLogBO userLogBO) {
		List  infoList=jdbcTemplate.queryForList(LoginSqlConstants.SQL_FORGOT_PASSWORD,new Object[]{userLogBO.getUname()});
		return infoList;
	}



	@Override
	public int changePassword(String username, String old_password, String new_password) {
		int i=jdbcTemplate.queryForInt(LoginSqlConstants.SQL_CHECK_OLDPASSWORD, new Object[]{username,old_password});
		if (i==1) {
			return jdbcTemplate.update(LoginSqlConstants.SQL_CHANGE_PASSWORD, new Object[]{new_password,username});
		} else {
			return 2;
		}
	}




	@Override
	public EmailBO getSenderEmailId() {
		return jdbcTemplate.query(LoginSqlConstants.SQL_GETSENDER_IDPASS,new Object[]{ApplicationConstant.SENDER_MAIL_CODE},new SearchResultSetExtractorSenderIdPass());
		}
		public class SearchResultSetExtractorSenderIdPass implements ResultSetExtractor<EmailBO> {
			@Override
			public EmailBO extractData(ResultSet rs) throws SQLException, DataAccessException {
				EmailBO emailBO = new EmailBO();
				while (rs.next()) {
				emailBO.setSenderEmailId(rs.getString(1));
				emailBO.setSenderPassword(rs.getString(2));
				}
				return emailBO;
			}
	}




		@Override
		public String getReciverMailID() {
			return jdbcTemplate.queryForObject(LoginSqlConstants.SQL_GETRECIVER_EMAIL, new Object[]{ApplicationConstant.RECIVER_MAIL_CODE}, String.class);
		}
		@Override
		public List<AccuracyBO> getAccuracyList() {
			return jdbcTemplate.query(LoginSqlConstants.SQL_ACCURACY_PATTERN,new AccuracyResultSetExtractor());
		}
		public class AccuracyResultSetExtractor implements ResultSetExtractor<List<AccuracyBO>> {
			@Override
			public List<AccuracyBO> extractData(ResultSet rs) throws SQLException, DataAccessException {
				AccuracyBO bo=null;
				List<AccuracyBO> accList = new ArrayList<AccuracyBO>();
				while (rs.next()) {
					bo=new AccuracyBO();
					bo.setPatternName(rs.getString(1));
					bo.setSuggestion(rs.getString(2));
					bo.setWeeks(rs.getString(3));
					bo.setTotalCompanies(rs.getInt(4));
					bo.setAccuracy(rs.getString(5));
					bo.setCommulative_accuracy_15Days(rs.getString(6));
					bo.setAccdate(rs.getDate(7));
					
				accList.add(bo);	
				}
				return accList;
			}
	}


}
