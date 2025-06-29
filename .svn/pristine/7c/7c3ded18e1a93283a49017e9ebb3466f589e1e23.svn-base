package com.nivesh.dao.login;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import com.nivesh.bo.NewsBO;
import com.nivesh.bo.ReviewBO;
import com.nivesh.bo.UserLogBO;
import com.nivesh.bo.UserLogHistoryBO;
import com.nivesh.dao.LoginSqlConstants;

public class DBLoginDaoImpl implements IDBLoginDao {

	private JdbcTemplate jdbcTemplate;
	private NamedParameterJdbcTemplate npjt;

	public DBLoginDaoImpl(JdbcTemplate jdbcTemplate, NamedParameterJdbcTemplate npjt) {
		this.jdbcTemplate = jdbcTemplate;
		this.npjt = npjt;
	}

	/**
	 * NAME :SIGNIN VALIDATION PERPOSE :USERNAME & PASSWORD VERIFICATION
	 */
	@Override
	public List<UserLogBO> isUName_Pswd_Authenticate(UserLogBO userLogBO) {
		List<UserLogBO> list = null;

		list = jdbcTemplate.query(LoginSqlConstants.SQL_SIGNIN_VALIDATION,
				new Object[] { userLogBO.getUname(), userLogBO.getPassword() }, new RowMapper<UserLogBO>() {

			@Override
			public UserLogBO mapRow(ResultSet rs, int rowNumber) throws SQLException {
				UserLogBO userLogBO = null;
				userLogBO = new UserLogBO();
				userLogBO.setUname(rs.getString(1));
				userLogBO.setPassword(rs.getString(2));
				userLogBO.setFirst_Login(rs.getString(3));
				userLogBO.setSubscription(rs.getString(4));
				userLogBO.setDuration(rs.getString(5));
				userLogBO.setReg_date(rs.getDate(6));
				userLogBO.setPayment_date(rs.getDate(7));
				return userLogBO;
			}

		});

		return list;
	}

	@Override
	public int create(Object object) {
		return 0;

	}

	@Override
	public void update() {
		// TODO Auto-generated method stub

	}

	@Override
	public List find() {

		// query using jdbc template

		return null;
	}

	public List<NewsBO> getNews() {

		return npjt.query(LoginSqlConstants.SQL_NEWS, new NewsResulSetExtractor());

	}

	private class NewsResulSetExtractor implements ResultSetExtractor<List<NewsBO>> {
		@Override
		public List<NewsBO> extractData(ResultSet rs) throws SQLException, DataAccessException {
			List<NewsBO> newsList = null;
			newsList = new ArrayList<NewsBO>();
			while (rs.next()) {
				NewsBO bo = new NewsBO();
				bo.setSubject(rs.getString(1));
				newsList.add(bo);
			}

			return newsList;

		}

	}

	@Override
	public int delete(String pk) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public void delete() {
		// TODO Auto-generated method stub

	}

	@Override
	public int userloghistory(UserLogHistoryBO userLogHistoryBO) {
		return jdbcTemplate.update(LoginSqlConstants.INSERT_INTO_USERLOG_HISTORY, new Object[] {userLogHistoryBO.getUNAME(),userLogHistoryBO.getLAST_LOGIN_DATE_TIME(),userLogHistoryBO.getIP_ADDR(),userLogHistoryBO.getSYSTEM_NAME()});
	}

	@Override
	public int username(UserLogHistoryBO bo){
		return jdbcTemplate.queryForInt(LoginSqlConstants.SQL_GET_UNAME, new Object[]{bo.getUNAME()});
	}

	@Override
	public int updateloghistory(UserLogHistoryBO userLogHistoryBO) {
		return jdbcTemplate.update(LoginSqlConstants.UPDATE_USERLOG_HISTORY, new Object[]{userLogHistoryBO.getLAST_LOGIN_DATE_TIME(),userLogHistoryBO.getIP_ADDR(),userLogHistoryBO.getSYSTEM_NAME(),userLogHistoryBO.getUNAME()});
	}


	@Override
	public int updateSubscription(UserLogBO userLogBO) {
		return jdbcTemplate.update(LoginSqlConstants.UPDATE_SUBSCRIPTION_IN_USERLOG, new Object[]{userLogBO.getActive(),userLogBO.getAudit_action(),userLogBO.getAudit_date_time(),userLogBO.getSubscription(),userLogBO.getDuration(),userLogBO.getPayment_date(),userLogBO.getUname()});
	}

	@Override
	public List<UserLogBO> checkingSubscriptionAvability(String uname, String paidsubscription) {

		return jdbcTemplate.query(LoginSqlConstants.USER_SUBSCRIPTION_DETAILS, new Object[]{uname,paidsubscription},new Subscription_User_Details_ResulSetExtractor());

	}

	private class Subscription_User_Details_ResulSetExtractor implements ResultSetExtractor<List<UserLogBO>> {
		@Override
		public List<UserLogBO> extractData(ResultSet rs) throws SQLException, DataAccessException {
			List<UserLogBO> boList = null;
			boList = new ArrayList<UserLogBO>();
			while (rs.next()) {
				UserLogBO bo = new UserLogBO();

				bo.setDuration(rs.getString(1));
				bo.setPayment_date(rs.getDate(2));

				boList.add(bo);
			}

			return boList;

		}

	}



	@Override
	public int insertreview(ReviewBO reviewbolist) {
		return jdbcTemplate.update(LoginSqlConstants.INSERT_INTO_USERREVIEW, new Object[]{reviewbolist.getIpaddress(),reviewbolist.getReview(),reviewbolist.getAudit_action(),reviewbolist.getAudit_date_time()});
	}

	@Override
	public ReviewBO getreviewdata(String remoteaddress) {
		return jdbcTemplate.query(LoginSqlConstants.SQL_GET_REVIEWDATA,new Object[]{remoteaddress}, new ReviewResultSetExtractor());
	}
	private class ReviewResultSetExtractor implements ResultSetExtractor<ReviewBO> {
		@Override
		public ReviewBO extractData(ResultSet rs) throws SQLException, DataAccessException {
			ReviewBO reviewBO=new ReviewBO();
			while(rs.next()){
				reviewBO.setIpaddress(rs.getString(1));
				reviewBO.setReview(rs.getString(2));
			}
			return reviewBO;
		}
	}

	@Override
	public int updateReviewdata(ReviewBO reviewbolist) {
		return jdbcTemplate.update(LoginSqlConstants.UPDATE_USER_REVIEW, new Object[]{reviewbolist.getReview(),reviewbolist.getAudit_action(),reviewbolist.getAudit_date_time(),reviewbolist.getIpaddress()});
	}
}
