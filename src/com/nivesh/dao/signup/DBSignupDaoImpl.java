package com.nivesh.dao.signup;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import com.nivesh.bo.UserLogBO;
import com.nivesh.bo.UserMstrBO;
import com.nivesh.dao.SignupSqlConstants;

public class DBSignupDaoImpl implements IDBSignupDao {
	private JdbcTemplate jdbcTemplate;
	private NamedParameterJdbcTemplate npjt;
	
	public DBSignupDaoImpl(JdbcTemplate jdbcTemplate,NamedParameterJdbcTemplate npjt) {
		this.jdbcTemplate = jdbcTemplate;
		this.npjt=npjt;
	}
	
	
	
	/**
	 * NAME    :USERNAME VALIDATION
	 * PERPOSE :USERNAME VERIFICATION
	 */
	@Override
	public int isUName_Authenticate(UserLogBO userLogBO) {
		return jdbcTemplate.queryForInt(SignupSqlConstants.SQL_USERNAME_VALIDATION,
				new Object[] { userLogBO.getUname() });
	}

	
	/**
	 * NAME    :EMAIL VALIDATION
	 * PERPOSE :EMAIL VERIFICATION
	 */
	@Override
	public int isEmail_Authenticate(UserMstrBO userMstrBO) {
		return jdbcTemplate.queryForInt(SignupSqlConstants.SQL_EMAIL_VALIDATION,
				new Object[] { userMstrBO.getEmail_id() });
	}
	
	

	/**
	 * NAME    :PHONE VALIDATION
	 * PERPOSE :PHONE VERIFICATION
	 */
	@Override
	public int isPhone_Authenticate(String phone) {
		phone = "%"+phone;
		return jdbcTemplate.queryForInt(SignupSqlConstants.SQL_PHONE_VALIDATION,
				new Object[] { phone });
	}

	
	
	/**
	 * NAME    :SIGNUP INSERTION
	 * PERPOSE :HANDLING SIGNUP DATA AND STORING INTO TWO TABLES
	 */
	public int insert(Object obj) {
		
		if(obj.getClass().getSimpleName().equals("UserLogBO")){
			UserLogBO userLogBO=null;
			userLogBO=(UserLogBO)obj;
	       return jdbcTemplate.update(SignupSqlConstants.INSERT_INTO_niv_userlog, new Object[] { userLogBO.getUname(),
	    		   userLogBO.getPassword(), userLogBO.getFirst_Login(),userLogBO.getActive(),userLogBO.getAudit_action(),userLogBO.getAudit_date_time(),userLogBO.getUserId(),userLogBO.getSubscription(),userLogBO.getDuration(),userLogBO.getReg_date() });
		}else{
			UserMstrBO userMstrBO=null;
			userMstrBO=(UserMstrBO)obj;
		 return jdbcTemplate.update(SignupSqlConstants.INSERT_INTO_niv_usermstr,
				new Object[] { userMstrBO.getUname(), userMstrBO.getFirstname(), userMstrBO.getLastname(), null, null, null,
						null, userMstrBO.getPh_no(), userMstrBO.getEmail_id(), userMstrBO.getActive(), userMstrBO.getAudit_action(), userMstrBO.getAudit_date_time()
						, userMstrBO.getUserId(),userMstrBO.getReachUs() });
		}
		
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
	public int updateemailAddress(String email, String uname) {
		  return jdbcTemplate.update(SignupSqlConstants.UPDATE_EMAIL, new Object[] { email,uname });
	}



	@Override
	public int updatePhoneNo(String mobile, String uname) {
		  return jdbcTemplate.update(SignupSqlConstants.UPDATE_MOBILE, new Object[] { mobile,uname });
	}



	@Override
	public int insertGuest(UserMstrBO userMstrBO) {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public int insertGuest(UserLogBO userLogBO) {
		// TODO Auto-generated method stub
		return 0;
	}


}