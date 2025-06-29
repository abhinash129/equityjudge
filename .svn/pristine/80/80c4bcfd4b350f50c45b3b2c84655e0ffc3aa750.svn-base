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

import com.nivesh.bo.UserModuleMapBO;
import com.nivesh.bo.UserRoleBO;
import com.nivesh.dao.SecuritySqlConstants;
import com.nivesh.service.security.UserModuleMapServices;

public class DBUserModuleMapDaoImpl implements IDBUserModuleMapDao {

	private JdbcTemplate jdbcTemplate;
	private NamedParameterJdbcTemplate npjt;
	public DBUserModuleMapDaoImpl(JdbcTemplate jdbcTemplate, NamedParameterJdbcTemplate npjt) {

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
	public int create(Object object) {
		// TODO Auto-generated method stub
		return 0;
	}








	/*PURPOSE: FOR SEARCH USER ROLE MODULE FROM DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: STATUS 
	 *OUTPUT: RETURN LIST OF USER ROLE MODULES */
	@Override
	public List<UserRoleBO> searchUserRoleDAO(String userroleid1) {
		userroleid1 = userroleid1+"%";
		return jdbcTemplate.query(SecuritySqlConstants.SQL_SEARCH_USERROLEID,new Object[] { userroleid1 },new SearchResultSetExtractoruser());
	}
	public class SearchResultSetExtractoruser implements ResultSetExtractor<List<UserRoleBO>> {
		@Override
		public List<UserRoleBO> extractData(ResultSet rs) throws SQLException, DataAccessException {
			List<UserRoleBO>  list = new ArrayList<UserRoleBO>();
			while (rs.next()) {
				UserRoleBO bo = new UserRoleBO();
				bo.setUserroleid(rs.getString(1));
				bo.setUname(rs.getString(2));
				bo.setRoleid(rs.getString(3));
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







	/*PURPOSE: FOR GET ALL MODULENAME AND ID FROM DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: NA
	 *OUTPUT: RETURN LIST OF ROLES */
	@Override
	public Map<String, String> getmodulesDao() {
		return jdbcTemplate.query(SecuritySqlConstants.SQL_GET_MODULES,new GetModulesResultSetExtractorrole());
	}
	public class GetModulesResultSetExtractorrole implements ResultSetExtractor< Map<String, String>> {
		@Override
		public  Map<String, String> extractData(ResultSet rs) throws SQLException, DataAccessException {
			Map<String, String> list = new HashMap<String, String>();
			String moduleid;
			String modulename;
			while (rs.next()) {
				moduleid = rs.getString(1);
				modulename = rs.getString(2);
				list.put(moduleid, modulename);				
			}
			return list;
		}
	}






	/*PURPOSE: FOR GET ALL FEATUREAME AND ID FROM DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: NA
	 *OUTPUT: RETURN LIST OF ROLES */
	@Override
	public Map<String, String> getfeaturesDao() {
		return jdbcTemplate.query(SecuritySqlConstants.SQL_GET_FEATURES,new GetFeaturesResultSetExtractorrole());
	}
	public class GetFeaturesResultSetExtractorrole implements ResultSetExtractor< Map<String, String>> {
		@Override
		public  Map<String, String> extractData(ResultSet rs) throws SQLException, DataAccessException {
			Map<String, String> list = new HashMap<String, String>();
			String featureid;
			String featurename;
			while (rs.next()) {
				featureid = rs.getString(1);
				featurename = rs.getString(2);
				list.put(featureid, featurename);				
			}
			return list;
		}
	}






	/*PURPOSE: FOR ADD USER ROLE MODULE MAP IN DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: LIST OF USERMODULEMAP BO
	 *OUTPUT: NA */
	@Override
	public void adduserrolemodulemapDao(final List<UserModuleMapBO> userrolelist) {
		jdbcTemplate.batchUpdate(SecuritySqlConstants.SQL_ADD_USERROLEMODULEMAP, new BatchPreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement pst, int i) throws SQLException {
				UserModuleMapBO userrolBo=userrolelist.get(i);
				pst.setString(1, userrolBo.getUsermoduleid());
				pst.setString(2, userrolBo.getUname());
				pst.setString(3, userrolBo.getUserroleid());
				pst.setString(4, userrolBo.getModuleid());
				pst.setString(5, userrolBo.getFeatureid());
				pst.setString(6, userrolBo.getStatus());
				pst.setString(7, userrolBo.getComments());
				pst.setString(8, userrolBo.getAuditaction());
				Date date = new Date(userrolBo.getAuditdatetime().getTime());
				pst.setDate(9, date);
				pst.setString(10, userrolBo.getUserid());
			}
			@Override
			public int getBatchSize() {
				return userrolelist.size();
			}
		});
	}







	/*PURPOSE: FOR SEARCH USER ROLE MODULE FROM DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: STATUS 
	 *OUTPUT: RETURN LIST OF USER ROLE MODULES */
	@Override
	public List<UserModuleMapBO> searchUserRoleModuleDAO(String status) {
		Map<String , List<String>> map = UserModuleMapServices.userrolemodulemap;
		String key=null;
		List<String> list=null;
		String pettern=null;
		StringBuilder query=new StringBuilder(SecuritySqlConstants.SQL_SEARCH_USERROLEMODULE);

		for (Entry<String, List<String>> entry : map.entrySet()) {
			key = entry.getKey();
			list = entry.getValue();

			if (key.equals(USERROLEMODULE_ID_FIELD)) {
				String pettern1 = makePettern(list.get(0), list.get(1));
				pettern = " "+USERROLEMODULE_ID_FIELD+" LIKE '" +pettern1+ "' AND";
				query.append(pettern);
			}
			if (key.equals(USERROLE_ID_FIELD)) {
				String pettern1 = makePettern(list.get(0), list.get(1));
				pettern = " "+USERROLE_ID_FIELD+" LIKE '" +pettern1+ "' AND";
				query.append(pettern);
			}
			if (key.equals(MODULE_ID_FIELD)) {
				String pettern1 = makePettern(list.get(0), list.get(1));
				pettern = " "+MODULE_ID_FIELD+" LIKE '" +pettern1+ "' AND";
				query.append(pettern);
			}
			if (key.equals(FEATURE_ID_FIELD)) {
				String pettern1 = makePettern(list.get(0), list.get(1));
				pettern = " "+FEATURE_ID_FIELD+" LIKE '" +pettern1+ "' AND";
				query.append(pettern);
			}
		}
		pettern = " "+STATUS_FIELD+"='"+status+"'";
		query.append(pettern);


		return jdbcTemplate.query(query.toString(),new SearchResultSetExtractor());
	}
	public class SearchResultSetExtractor implements ResultSetExtractor<List<UserModuleMapBO>> {
		@Override
		public List<UserModuleMapBO> extractData(ResultSet rs) throws SQLException, DataAccessException {
			List<UserModuleMapBO>  list = new ArrayList<UserModuleMapBO>();
			while (rs.next()) {
				UserModuleMapBO bo = new UserModuleMapBO();

				bo.setUsermoduleid(rs.getString(1));
				bo.setUname(rs.getString(2));
				bo.setUserroleid(rs.getString(3));
				bo.setModuleid(rs.getString(4));
				bo.setFeatureid(rs.getString(5));
				bo.setStatus(rs.getString(6));
				bo.setComments(rs.getString(7));
				bo.setAuditaction(rs.getString(8));
				bo.setAuditdatetime(rs.getDate(9));
				bo.setUserid(rs.getString(10));
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






	/*PURPOSE: FOR DELETE USER ROLE MODULE FROM DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: USERMODULEID 
	 *OUTPUT: RETURN INT */
	@Override
	public int delete(String pk) {
		return jdbcTemplate.update(SecuritySqlConstants.SQL_DELETE_USERROLEMODULE,
				new Object[] { pk });
	}






	/*PURPOSE: FOR UPADTE USER ROLE MODULE IN DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: USERMODULEMAP BO 
	 *OUTPUT: RETURN INT */
	@Override
	public int updaterolemodule(UserModuleMapBO userModuleMapBO) {
		SqlParameterSource paramSource=new BeanPropertySqlParameterSource(userModuleMapBO);
		return npjt.update(SecuritySqlConstants.SQL_UPDATE_USERROLEMODULE, paramSource);
	}



	@Override
	public void delete() {
		// TODO Auto-generated method stub
		
	}



}