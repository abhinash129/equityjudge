package com.nivesh.dao.userprofile;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import com.nivesh.bo.UserLogBO;
import com.nivesh.bo.UserMstrBO;
import com.nivesh.dao.UserProfileSqlConstants;

public class DBUserProfileDaoImpl implements IDBUserProfileDao {
	private JdbcTemplate jdbcTemplate;
	private NamedParameterJdbcTemplate npjt;


	public DBUserProfileDaoImpl(JdbcTemplate jdbcTemplate, NamedParameterJdbcTemplate npjt) {
		super();
		this.jdbcTemplate = jdbcTemplate;
		this.npjt = npjt;
	}

	@Override
	public List<UserMstrBO> find_UserSpecific_Info(UserMstrBO userMstrBO) {
		List<UserMstrBO> list = jdbcTemplate.query(UserProfileSqlConstants.SQL_USERSPECIFIC_INFO,
				new Object[] { userMstrBO.getUname() }, new RowMapper<UserMstrBO>() {

			@Override
			public UserMstrBO mapRow(ResultSet rs, int rowNumber) throws SQLException {
				UserMstrBO userMstrBO = null;

				userMstrBO = new UserMstrBO();
				userMstrBO.setUname(rs.getString(1));
				userMstrBO.setFirstname(rs.getString(2));
				userMstrBO.setLastname(rs.getString(3));
				userMstrBO.setPh_no(rs.getLong(8));
				userMstrBO.setEmail_id(rs.getString(9));
				userMstrBO.setOccupation(rs.getString(4));
				userMstrBO.setAddressLine(rs.getString(5));
				userMstrBO.setState(rs.getString(6));
				userMstrBO.setCountry(rs.getString(7));

				return userMstrBO;
			}

		});
		return list;
	}

	@Override
	public int insert_Userspecific_Data(Object obj) {
		UserMstrBO userMstrBO=null;


		if(obj.getClass().getSimpleName().equals("UserMstrBO")){
			userMstrBO=(UserMstrBO)obj;
//			System.out.println("In DAO MSTR : "+userMstrBO);
			return jdbcTemplate.update(UserProfileSqlConstants.SQL_INSERT_USERSPECIFICINFO,
					new Object[] { userMstrBO.getFirstname(), userMstrBO.getLastname(),
							userMstrBO.getOccupation(), userMstrBO.getAddressLine(), userMstrBO.getState(),
							userMstrBO.getCountry(), userMstrBO.getPh_no(), userMstrBO.getEmail_id(), userMstrBO.getActive(), userMstrBO.getAudit_action(), userMstrBO.getAudit_date_time(),
							userMstrBO.getUserId(),userMstrBO.getUname() });

		}
		else{
			UserLogBO userLogBO=null;
			userLogBO=(UserLogBO)obj;
//			System.out.println("In DAO LOG : "+userLogBO);
			return jdbcTemplate.update(UserProfileSqlConstants .SQL_UPDATE_FIRSTLOGIN, new Object[]{userLogBO.getFirst_Login(),userLogBO.getUname()});///object obj use

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
		return 0;
	}

	@Override
	public void delete() {

	}

}