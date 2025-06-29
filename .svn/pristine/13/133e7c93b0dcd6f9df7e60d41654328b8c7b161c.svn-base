package com.nivesh.dao.security;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;

import com.nivesh.bo.ClassificationBO;
import com.nivesh.bo.ModuleMasterBO;
import com.nivesh.dao.SecuritySqlConstants;
import com.nivesh.service.security.ModuleServiceImpl;

public class DBModuleDaoImpl implements IDBModuleDao{


	private JdbcTemplate jdbcTemplate;
	private NamedParameterJdbcTemplate npjt;
	public DBModuleDaoImpl(JdbcTemplate jdbcTemplate, NamedParameterJdbcTemplate npjt) {
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





	/*PURPOSE: FOR CREATE NEW MODULE IN DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: MODULEMSTR BO 
	 *OUTPUT: RETURN INT */
	@Override
	public int create(Object object) {
		ModuleMasterBO masterBO=(ModuleMasterBO)object;
		SqlParameterSource paramSource=new BeanPropertySqlParameterSource(masterBO);
		return npjt.update(SecuritySqlConstants.SQL_INSERT_NEWMODULE, paramSource);
	}





	/*PURPOSE: FOR GETTING MAX ID FOR MODULE, FEATURE , ROLE, USERROLE, USERROLEMODULEMAP
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: NAME OF TABLE AND PARTICULAR ROW 
	 *OUTPUT: RETURN MAX ID FROM PARTICULAR TABLE & ROW */
	@Override
	public String getMaxId(String tableName, String columnName) {
		tableName=tableName.toLowerCase();
		columnName=columnName.toLowerCase();
		String sqlQuery=null;
		sqlQuery=SecuritySqlConstants.SQL_GET_MAXID;
		String moduleName=jdbcTemplate.queryForObject(sqlQuery, new Object[]{tableName},String.class);
		moduleName=moduleName.toLowerCase();
		sqlQuery=new String("SELECT MAX("+columnName+") FROM niv"+moduleName+"_"+tableName);
		return jdbcTemplate.queryForObject(sqlQuery,String.class);
	}





	/*PURPOSE: FOR GET LABLE FOR CREATE ID(IF MAX ID IS NOT IN DATABASE IN TABLE)
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: TABLENAME
	 *OUTPUT: RETURN LABEL FOR CREATE MAX ID */
	@Override
	public String getLabelForId(String tableName) {
		return jdbcTemplate.queryForObject(SecuritySqlConstants.SQL_GET_LABELFORID, new Object[]{tableName},String.class);
	}





	/*PURPOSE: FOR SEARCH MODULE IN DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: STATUS
	 *OUTPUT: RETURN LIST OF MOSULES FROM DATABSE */
	@Override
	public List<ModuleMasterBO> search(String status) {

		Map<String , List<String>> map = ModuleServiceImpl.modulemap;
		String key=null;
		List<String> list=null;
		String pettern=null;
		StringBuilder query=new StringBuilder(SecuritySqlConstants.SQL_SEARCH_MODULE);

		for (Entry<String, List<String>> entry : map.entrySet()) {
			key = entry.getKey();
			list = entry.getValue();
			if (key.equals(MODULE_ID_FIELD)) {
				String pettern1 = makePettern(list.get(0), list.get(1));
				pettern = " "+MODULE_ID_FIELD+" LIKE '" +pettern1+ "' AND";
				query.append(pettern);
			}
			if (key.equals(MODULE_NAME_FIELD)) {
				String pettern2 = makePettern(list.get(0), list.get(1));
				pettern = " "+MODULE_NAME_FIELD+" LIKE '"+pettern2+ "' AND";
				query.append(pettern);
			}
		}

		pettern = " "+STATUS_FIELD+"='"+status+"'";
		query.append(pettern);

		return jdbcTemplate.query(query.toString(),new SearchResultSetExtractor());
	}
	public class SearchResultSetExtractor implements ResultSetExtractor<List<ModuleMasterBO>> {
		@Override
		public List<ModuleMasterBO> extractData(ResultSet rs) throws SQLException, DataAccessException {

			List<ModuleMasterBO>  list = new ArrayList<ModuleMasterBO>();
			while (rs.next()) {
				ModuleMasterBO bo = new ModuleMasterBO();
				bo.setModule_id(rs.getString(1));
				bo.setModule_name(rs.getString(2));
				bo.setDescription(rs.getString(3));
				bo.setStatus(rs.getString(4));
				bo.setAuditaction(rs.getString(5));
				bo.setAuditDatetime(rs.getDate(6));
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



	/*PURPOSE: FOR DELETE MODULE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: MODULE ID 
	 *OUTPUT: RETURN INT */
	@Override
	public int delete(String pk) {
		return jdbcTemplate.update(SecuritySqlConstants.SQL_DELETE_MODULE,
				new Object[] { pk });
	}




	/*PURPOSE: FOR CHECKING MODULE NAME IS EXIST OR NO
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: MODULE NAME 
	 *OUTPUT: RETURN INT */
	@Override
	public int isModuleName_Available(String moduleName) {
		return jdbcTemplate.queryForInt(SecuritySqlConstants.SQL_MODULENAME_VALIDATION,
				new Object[] { moduleName });
	}




	/*PURPOSE: FOR UPDATE MODULE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: MODULEMSTR BO 
	 *OUTPUT: RETURN INT */
	@Override
	public int updatemodule(ModuleMasterBO moduleMasterBO) {
		SqlParameterSource paramSource=new BeanPropertySqlParameterSource(moduleMasterBO);
		return npjt.update(SecuritySqlConstants.SQL_UPDATE_MODULE, paramSource);
	}


	@Override
	public void delete() {
		// TODO Auto-generated method stub

	}



	/*FOR DYNEMIC MODULE & FEATURES
	 * PREPARED BY: SUNIL GAUSWAMI
	 * PARAMETER: NA
	 * RESULT: LISY OF MAP IN LIST */
	@Override
	public List<ClassificationBO> getAllModules() {
		return jdbcTemplate.query(SecuritySqlConstants.SQL_GET_CLASSIFICATION,new ViewExtractor());

	}
	private class ViewExtractor implements ResultSetExtractor<List<ClassificationBO>> {
		@Override
		public List<ClassificationBO> extractData(ResultSet rs) throws SQLException, DataAccessException {
			List<ClassificationBO> getViewList = new ArrayList<ClassificationBO>();
			while (rs.next()) {
				ClassificationBO view = new ClassificationBO();
				view.setUsermoduleid(rs.getString(1));
				view.setUname(rs.getString(2));
				view.setRolename(rs.getString(3));
				view.setModulename(rs.getString(4));
				view.setFeaturename(rs.getString(5));
				view.setPath(rs.getString(7));
				view.setFeature_date(rs.getDate(6));

				getViewList.add(view);
			}
			return getViewList;
		}
	}



}
