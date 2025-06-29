package com.nivesh.dao.security;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;

import com.nivesh.bo.RoleMstrBO;
import com.nivesh.bo.UserMstrBO;
import com.nivesh.bo.UserRoleBO;
import com.nivesh.dao.SecuritySqlConstants;
import com.nivesh.service.security.RoleServiceImpl;

public class DBRoleDaoImpl  implements IDBRoleDao{

	private JdbcTemplate jdbcTemplate;
	private NamedParameterJdbcTemplate npjt;
	public DBRoleDaoImpl(JdbcTemplate jdbcTemplate, NamedParameterJdbcTemplate npjt) {
		this.jdbcTemplate = jdbcTemplate;
		this.npjt = npjt;
	}


	@Override
	public List find() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void update() {
		// TODO Auto-generated method stub
	}




	/*PURPOSE: FOR INSERT NEW ROLE IN DATBASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: ROLEMSTR BI OBJECT 
	 *OUTPUT: RETURN INT */
	@Override
	public int create(Object object) {
		RoleMstrBO roleMstrBo=(RoleMstrBO)object;
		SqlParameterSource paramSource=new BeanPropertySqlParameterSource(roleMstrBo);
		return npjt.update(SecuritySqlConstants.SQL_INSERT_NEWROLE, paramSource);
	}





	/*PURPOSE: FOR DELETE ROLE FROM DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: ROLEID 
	 *OUTPUT: RETURN INT */
	@Override
	public int delete(String pk) {
		return jdbcTemplate.update(SecuritySqlConstants.SQL_DELETE_ROLE,
				new Object[] { pk });
	}




	/*PURPOSE: FOR SEARCH ROLE FROM DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: STATUS 
	 *OUTPUT: RETURN LIST OF ROLES */
	@Override
	public List<RoleMstrBO> searchRoleDAO(String status) {
		Map<String , List<String>> map = RoleServiceImpl.rolemap;
		String key=null;
		List<String> list=null;
		String pettern=null;
		StringBuilder query=new StringBuilder(SecuritySqlConstants.SQL_SEARCH_ROLE);

		for (Entry<String, List<String>> entry : map.entrySet()) {
			key = entry.getKey();
			list = entry.getValue();
			if (key.equals(ROLE_ID_FIELD)) {
				String pettern1 = makePettern(list.get(0), list.get(1));
				pettern = " "+ROLE_ID_FIELD+" LIKE '" +pettern1+ "' AND";
				query.append(pettern);
			}
			if (key.equals(ROLE_NAME_FIELD)) {
				String pettern2 = makePettern(list.get(0), list.get(1));
				pettern = " "+ROLE_NAME_FIELD+" LIKE '"+pettern2+ "' AND";
				query.append(pettern);
			}
		}
		pettern = " "+STATUS_FIELD+"='"+status+"'";
		query.append(pettern);
		return jdbcTemplate.query(query.toString(),new SearchResultSetExtractor());
	}
	public class SearchResultSetExtractor implements ResultSetExtractor<List<RoleMstrBO>> {
		@Override
		public List<RoleMstrBO> extractData(ResultSet rs) throws SQLException, DataAccessException {
			List<RoleMstrBO>  list = new ArrayList<RoleMstrBO>();
			while (rs.next()) {
				RoleMstrBO bo = new RoleMstrBO();
				bo.setRoleid(rs.getString(1));
				bo.setRolename(rs.getString(2));
				bo.setComments(rs.getString(3));
				bo.setStatus(rs.getString(4));
				bo.setAuditaction(rs.getString(5));
				bo.setAuditdatetime(rs.getDate(6));
				bo.setUserid(rs.getString(7));
				list.add(bo);
			}
			return list;
		}
	}

	/*PURPOSE: FOR MAKE PETERN FOR LIKE QUERY
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: PREFIX AND VALUE 
	 *OUTPUT: RETURN PETTERN WITH PARTICULAR MATCHES */
	private String makePettern(String pre_id, String id) {
		String pettern=null;
		if (pre_id.equals("sw")) {
			pettern = id+"%";
		} else if(pre_id.equals("ew")){
			pettern = "%"+id;
		}else if(pre_id.equals("co")){
			pettern = "%"+id+"%";
		}else{
			pettern = null;
		}
		return pettern;
	}






	/*PURPOSE: FOR SEARCH USER FOR USER ROLE ASSIGN FROM DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: USERNAME PETTERN 
	 *OUTPUT: RETURN LIST OF USERS WITH PERSONAL INFO */
	@Override
	public List<UserMstrBO> searchUserDAO(String username) {
		username = username+"%";
		return jdbcTemplate.query(SecuritySqlConstants.SQL_SEARCH_USERROLE,new Object[] { username },new SearchResultSetExtractoruser());
	}
	public class SearchResultSetExtractoruser implements ResultSetExtractor<List<UserMstrBO>> {
		@Override
		public List<UserMstrBO> extractData(ResultSet rs) throws SQLException, DataAccessException {
			List<UserMstrBO>  list = new ArrayList<UserMstrBO>();
			while (rs.next()) {
				UserMstrBO bo = new UserMstrBO();
				bo.setUname(rs.getString(1));
				bo.setFirstname(rs.getString(2));
				bo.setLastname(rs.getString(3));
				bo.setPh_no(rs.getLong(8));
				bo.setEmail_id(rs.getString(9));
				list.add(bo);
			}
			return list;
		}

	}





	/*PURPOSE: FOR GET ALL ROLENAME AND ID FROM DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: NA
	 *OUTPUT: RETURN LIST OF ROLES */
	@Override
	public Map<String, String> getroles() {
		return jdbcTemplate.query(SecuritySqlConstants.SQL_GET_ROLES,new SearchResultSetExtractorrole());
	}
	public class SearchResultSetExtractorrole implements ResultSetExtractor< Map<String, String>> {
		@Override
		public  Map<String, String> extractData(ResultSet rs) throws SQLException, DataAccessException {
			Map<String, String> list = new HashMap<String, String>();
			String roleid;
			String rolename;
			while (rs.next()) {
				roleid = rs.getString(1);
				rolename = rs.getString(2);
				list.put(roleid, rolename);				
			}
			return list;
		}
	}




	/*PURPOSE: FOR ADD USER ROLE MAP IN DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: LIST OF USEROLE BO
	 *OUTPUT: NA */
	@Override
	public void adduserrolemapDao(final List<UserRoleBO> userrolelist) {
		jdbcTemplate.batchUpdate(SecuritySqlConstants.SQL_ADD_USERROLEMAP, new BatchPreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement pst, int i) throws SQLException {
				UserRoleBO userrolBo=userrolelist.get(i);
				pst.setString(1, userrolBo.getUserroleid());
				pst.setString(2, userrolBo.getUname());
				pst.setString(3, userrolBo.getRoleid());
				pst.setString(4, userrolBo.getDescription());
				pst.setString(5, userrolBo.getStatus());
				pst.setString(6, userrolBo.getAuditaction());
				Date date = new Date(userrolBo.getAuditdatetime().getTime());
				pst.setDate(7, date);
				pst.setString(8, userrolBo.getUserid());
			}
			@Override
			public int getBatchSize() {
				return userrolelist.size();
			}
		});
	}





	/*PURPOSE: FOR GET ROLE USER FOR PARICULAR ROLE FROM DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: ROLEID & ROLENAME
	 *OUTPUT: RETURN LIST OF USERROLES IN USERROLE BO */
	public String rolename;
	@Override
	public List<UserRoleBO> getroleUsers(String id,String name) {
		this.rolename=name;
		return jdbcTemplate.query(SecuritySqlConstants.SQL_GET_USERROLES,new Object[] { id }, new GetuserrolesResultset());
	}
	public class GetuserrolesResultset implements ResultSetExtractor<List<UserRoleBO>>
	{
		@Override
		public List<UserRoleBO> extractData(ResultSet rs) throws SQLException, DataAccessException {
			List<UserRoleBO>  list = new ArrayList<UserRoleBO>();
			while (rs.next()) {
				UserRoleBO bo = new UserRoleBO();
				bo.setUserroleid(rs.getString(1));
				bo.setUname(rs.getString(2));
				bo.setRoleid(rs.getString(3));
				bo.setRolename(rolename);
				bo.setDescription(rs.getString(4));
				bo.setStatus(rs.getString(5));
				bo.setAuditaction(rs.getString(6));
				bo.setAuditdatetime(rs.getDate(7));
				bo.setUserid(rs.getString(8));
				list.add(bo);
			}
			return list;
		}
	}





	/*PURPOSE: FOR UPADTE ROLE IN DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: ROLEMSTR BO 
	 *OUTPUT: RETURN INT */
	@Override
	public int updaterole(RoleMstrBO roleMstrBO) {
		SqlParameterSource paramSource=new BeanPropertySqlParameterSource(roleMstrBO);
		return npjt.update(SecuritySqlConstants.SQL_UPDATE_ROLE, paramSource);
	}





	/*PURPOSE: FOR DELETE USER FROM DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: USERNAME
	 *OUTPUT: RETURN INT */
	@Override
	public int deleteuser(String uname) {
		return jdbcTemplate.update(SecuritySqlConstants.SQL_DELETE_USER,
				new Object[] { uname });
	}





	/*PURPOSE: FOR UPDATE USERROLE IN DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: USERROLE BO
	 *OUTPUT: RETURN INT */
	@Override
	public int updateuserrole(UserRoleBO userRoleBO) {
		SqlParameterSource paramSource=new BeanPropertySqlParameterSource(userRoleBO);
		return npjt.update(SecuritySqlConstants.SQL_UPDATE_USERROLE, paramSource);
	}



	/*PURPOSE: FOR DELETE USER ROLE VIEW IN DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: USER ROLE ID
	 *OUTPUT: RETURN INT */
	@Override
	public int deleteuserroleview(String userroleid) {
		return jdbcTemplate.update(SecuritySqlConstants.SQL_DELETE_USERROLEVIEW,
				new Object[] { userroleid });
	}




	@Override
	public void delete() {
		// TODO Auto-generated method stub
		
	}




}
