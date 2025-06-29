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

import com.nivesh.bo.FeaturMstrBO;
import com.nivesh.dao.SecuritySqlConstants;
import com.nivesh.service.security.FeatureServiceImpl;

public class DBFeatureDaoImpl implements IDBFeatureDao {


	private JdbcTemplate jdbcTemplate;
	private NamedParameterJdbcTemplate npjt;
	public DBFeatureDaoImpl(JdbcTemplate jdbcTemplate, NamedParameterJdbcTemplate npjt) {
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




	/*PURPOSE: FOR DELETE FEATURE FROM DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: FEATURE NAME 
	 *OUTPUT: RETURN INT */
	@Override
	public int delete(String pk) {
		return jdbcTemplate.update(SecuritySqlConstants.SQL_DELETE_FEATURE,
				new Object[] { pk });
	}




	/*PURPOSE: FOR SEARCH FEATURE IN DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: FEATUREMSTR BO 
	 *OUTPUT: RETURN LIST OF FEATUREMSTRBO VALUES */
	@Override
	public List<FeaturMstrBO> search(String status) {
		Map<String , List<String>> map = FeatureServiceImpl.featuremap;
		String key=null;
		List<String> list=null;
		String pettern=null;
		StringBuilder query= new StringBuilder(SecuritySqlConstants.SQL_SEARCH_FEATURE);

		for (Entry<String, List<String>> entry : map.entrySet()) {
			key = entry.getKey();
			list = entry.getValue();
			if (key.equals(FEATURE_ID_FIELD)) {
				String pettern1 = makePettern(list.get(0), list.get(1));
				pettern = " "+FEATURE_ID_FIELD+" LIKE '" +pettern1+ "' AND";
				query.append(pettern);
			}
			if (key.equals(FEATURE_NAME_FIELD)) {
				String pettern2 = makePettern(list.get(0), list.get(1));
				pettern = " "+FEATURE_NAME_FIELD+" LIKE '"+pettern2+ "' AND";
				query.append(pettern);
			}
		}
		pettern = " "+STATUS_FIELD+"='"+status+"'";
		query.append(pettern);
		return jdbcTemplate.query(query.toString(),new SearchResultSetExtractor());
	}
	public class SearchResultSetExtractor implements ResultSetExtractor<List<FeaturMstrBO>> {
		@Override
		public List<FeaturMstrBO> extractData(ResultSet rs) throws SQLException, DataAccessException {
			List<FeaturMstrBO> l=new ArrayList<FeaturMstrBO>();
			while (rs.next()) {
				FeaturMstrBO bo=new FeaturMstrBO();
				bo.setFeatureid(rs.getString(1));
				bo.setFeaturename(rs.getString(2));
				bo.setDescription(rs.getString(3));
				bo.setPath(rs.getString(5));
				bo.setStatus(rs.getString(4));
				bo.setAuditaction(rs.getString(6));
				bo.setAuditdatetime(rs.getDate(7));
				bo.setUserid(rs.getString(8));

				l.add(bo);
			}

			return l;
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





	/*PURPOSE: FOR INSERT NEW FEATUTRE IN DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: FEATUREMSTR BO 
	 *OUTPUT: RETURN INT */
	@Override
	public int create(Object object) {
		FeaturMstrBO fBo=(FeaturMstrBO)object;
		SqlParameterSource paramSource=new BeanPropertySqlParameterSource(fBo);
		return npjt.update(SecuritySqlConstants.SQL_INSERT_NEWFEATURE, paramSource);
	}





	/*PURPOSE: FOR CHECKIN AVABILITY OF FEATURENAME IN DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: FEATURE NAME 
	 *OUTPUT: RETURN INT */
	@Override
	public int isFeatureName_Available(String featureName) {
		return jdbcTemplate.queryForInt(SecuritySqlConstants.SQL_FEATURENAME_VALIDATION,
				new Object[] { featureName });
	}




	/*PURPOSE: FOR UPDATE FEATURE FROM DATABASE
	 *CREATED BY: SUNIL GAUSWAMI 
	 *PARAMETER: FEATUREMSTR BO 
	 *OUTPUT: RETURN INT */
	@Override
	public int updatefeature(FeaturMstrBO fBo) {
		SqlParameterSource paramSource=new BeanPropertySqlParameterSource(fBo);
		return npjt.update(SecuritySqlConstants.SQL_UPDATE_FEATURE, paramSource);
	}


	@Override
	public void delete() {
		// TODO Auto-generated method stub
		
	}


	
}
