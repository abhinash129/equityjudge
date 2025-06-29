package com.nivesh.dao.wachlist;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;

import com.nivesh.bo.ActiveCompanyListBO;
import com.nivesh.bo.DailyPatternReportBO;
import com.nivesh.bo.WatchListBO;
import com.nivesh.dao.PortfolioSqlConstants;
import com.nivesh.dao.WatchListSqlConstant;


public class WatchListDaoImpl implements IWatchListDao {

	private JdbcTemplate jdbcTemplate;
	private NamedParameterJdbcTemplate npjt;
	private SimpleJdbcCall simpleJdbcCall;

	public WatchListDaoImpl(JdbcTemplate jdbcTemplate, NamedParameterJdbcTemplate npjt, SimpleJdbcCall simpleJdbcCall) {
		super();
		this.jdbcTemplate = jdbcTemplate;
		this.npjt = npjt;
		this.simpleJdbcCall = simpleJdbcCall;
	}

	@Override
	public void update() {
		// TODO Auto-generated method stub

	}

	@Override
	public List<?> find() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String pk) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	
	@Override
	public List<ActiveCompanyListBO> findCompanyDropDown(String companyName) {
		MapSqlParameterSource mapSqlParameterSource = new MapSqlParameterSource();
		mapSqlParameterSource.addValue("COMPANYNAME", companyName.toUpperCase() + "%");
		return npjt.query(WatchListSqlConstant.SQL_COMPANYNAME_FOR_DROPDOWN, mapSqlParameterSource, new CompanyNameExtractor());
	}

	private class CompanyNameExtractor implements ResultSetExtractor<List<ActiveCompanyListBO>>{
	
		@Override
		public List<ActiveCompanyListBO> extractData(ResultSet rs) throws SQLException, DataAccessException {
	
			List<ActiveCompanyListBO> getCompanyList=new ArrayList<ActiveCompanyListBO>();
			while(rs.next()){
				ActiveCompanyListBO activeCompanyListBO=new ActiveCompanyListBO();
	
	
				activeCompanyListBO.setCompanyCode(rs.getInt(1));
				activeCompanyListBO.setCompanyId(rs.getString(2));
				activeCompanyListBO.setCompanyName(rs.getString(3));
				activeCompanyListBO.setCompanyGroup(rs.getString(4));
				activeCompanyListBO.setCompanyFaceValue(rs.getFloat(5));
				activeCompanyListBO.setCompanyIndustry(rs.getString(6));
	
				getCompanyList.add(activeCompanyListBO);
			}
			return getCompanyList;
		}

	}
	
	
	
	
	//Checking for company existence in DB
	@Override
	public int find(int companyCode, String userID) {
		return jdbcTemplate.queryForInt(WatchListSqlConstant.CHECK_COMPANY_EXISTENCE,
				new Object[] { companyCode, userID });
	}

	
	//Pulling existing company suggestion from DB 
	@Override
	public List<DailyPatternReportBO> find(String company_name) {
		SqlParameterSource sqlParameterSource = null;
		sqlParameterSource = new MapSqlParameterSource("companyName",company_name);
		return npjt.query(WatchListSqlConstant.GET_COMPANY_SUGGESTION,sqlParameterSource, new CompanySuggestionExtractor());
	}

	private class CompanySuggestionExtractor implements ResultSetExtractor<List<DailyPatternReportBO>> {

		@Override
		public List<DailyPatternReportBO> extractData(ResultSet rs) throws SQLException, DataAccessException {
			List<DailyPatternReportBO> dailyPatternReportBOList = null;
			dailyPatternReportBOList = new ArrayList<>();
			while (rs.next()) {
				DailyPatternReportBO dailyPatternReportBO = new DailyPatternReportBO();
				dailyPatternReportBO.setPattern_Name(rs.getString(1));
				dailyPatternReportBO.setSuggestion(rs.getString(2));
				dailyPatternReportBO.setForming_Date(rs.getDate(3));
				dailyPatternReportBOList.add(dailyPatternReportBO);
			}
			return dailyPatternReportBOList;

		}

	}
	
	@Override
	public int create(Object object) {

		WatchListBO watchListBO = null;
		watchListBO = (WatchListBO) object;
		SqlParameterSource sqlParameterSource = null;

		sqlParameterSource = new BeanPropertySqlParameterSource(watchListBO);
		return npjt.update(WatchListSqlConstant.INSERT_WATCHLIST, sqlParameterSource);
	}

	@Override
	public List<WatchListBO> getWatchListByUserId(String userID, int company_code) {

		simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("usp_watchList_by_userID");

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("user_id", userID);
		args.put("companycode", company_code);
		SqlParameterSource in = new MapSqlParameterSource(args);

		Map<String, Object> out = simpleJdbcCall.execute(in);

		WatchListBO watchListBO = new WatchListBO();

		
		watchListBO.setCompany_code((int) out.get("outcompanycode"));
		
		watchListBO.setCompany_name((String) out.get("company_name"));

		watchListBO.setLiveprice((float) out.get("liveprice"));
		
		watchListBO.setPrevious_closeprice((float) out.get("prev_closeprice"));

		watchListBO.setChange_in_value((float) (Math.round(((float) out.get("change_in_value")) * 100.00) / 100.00));

		watchListBO.setPercentage_Change((float) (Math.round(((float) out.get("percentage_change")) * 100.00) / 100.00));

		watchListBO.setIntraday_High((float) out.get("intraday_high"));

		watchListBO.setIntraday_Low((float) out.get("intraday_low")); 

		watchListBO.setInitiated_date((Date) out.get("watchlist_initiated_date"));
		
		watchListBO.setSuggestion((String) out.get("algorithmic_suggestion"));
		
		watchListBO.setSuggestion_Date((Date) out.get("suggestion_detected_date"));

		List<WatchListBO> bos = new ArrayList<WatchListBO>();
		bos.add(watchListBO);

		return bos;

	}

	@Override
	public List<WatchListBO> findAll(String userID) {

		return jdbcTemplate.query(WatchListSqlConstant.FIND_WATCHLIST_BY_USERID, new Object[] { userID },
				new WatchListExtractor());
	}

	private class WatchListExtractor implements ResultSetExtractor<List<WatchListBO>> {

		@Override
		public List<WatchListBO> extractData(ResultSet rs) throws SQLException, DataAccessException {
			List<WatchListBO> watchListBOList = null;
			watchListBOList = new ArrayList<>();
			while (rs.next()) {
				WatchListBO watchListBO = new WatchListBO();
				watchListBO.setCompany_code(rs.getInt(1));
				watchListBOList.add(watchListBO);
			}
			return watchListBOList;

		}

	}

	
	@Override
	public int delete(int companyCode, String userId) {
		return jdbcTemplate.update(WatchListSqlConstant.DELETE_WATCHLIST_BY_COMPANY_CODE,
				new Object[] { companyCode, userId });

	}

	@Override
	public void delete() {
		// TODO Auto-generated method stub

	}

}
