package com.nivesh.dao.algoefficacy;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;

import com.nivesh.bo.AlgoEfficacyBO;
import com.nivesh.bo.BuyStockBO;
import com.nivesh.dao.AccuracyConstant;
import com.nivesh.dao.PortfolioSqlConstants;
import com.nivesh.dao.portfolio.DBBuyStockDaoImp.AllScCodeResultSetExtractor;


public class AlgoEfficacyDaoImpl implements IAlgoEfficacyDao{
	private JdbcTemplate jdbcTemplate;
	private SimpleJdbcCall npjt;


	public AlgoEfficacyDaoImpl(JdbcTemplate jdbcTemplate, SimpleJdbcCall simplejdbccall) {
		super();
		this.jdbcTemplate = jdbcTemplate;
		this.npjt = simplejdbccall;
	}
	@Override
	public List<AlgoEfficacyBO> findAlgoEfficacy(AlgoEfficacyBO algoEfficacyBO) {
		algoEfficacyBO.getGivendate();
		algoEfficacyBO.getPrevgivendate();
		return jdbcTemplate.query(AccuracyConstant.SQL_GET_ACCURACY, new Object[] {algoEfficacyBO.getPrevgivendate(),algoEfficacyBO.getGivendate(),algoEfficacyBO.getPrevgivendate(),algoEfficacyBO.getGivendate()},
				new AllScCodeResultSetExtractor());
	}
	
	public class AllScCodeResultSetExtractor implements ResultSetExtractor<List<AlgoEfficacyBO>> {
		@Override
		public List<AlgoEfficacyBO> extractData(ResultSet rs) throws SQLException, DataAccessException {
			List<AlgoEfficacyBO> list = new ArrayList<AlgoEfficacyBO>();
			while (rs.next()) {
				AlgoEfficacyBO bo = new AlgoEfficacyBO();
				
				bo.setCompanyname(rs.getString(1));
				bo.setPattern_name(rs.getString(2));
				bo.setSuggestion(rs.getString(3));
				bo.setForming_date(rs.getDate(4));
				bo.setBackPrice(rs.getFloat(5));
				bo.setSc_code(rs.getInt(6));
				list.add(bo);
			//	System.out.println(list);
			}
			return list;
		}
	}
	
	@Override
	public AlgoEfficacyBO findCurrentPrice(int sc_code,Date searchdate) {
		System.out.println(sc_code);
		System.out.println(searchdate);
		System.out.println("here");
		return jdbcTemplate.query(AccuracyConstant.SQL_GET_ACCURACY1, new Object[] {sc_code,searchdate},
				new ClosePriceExtractor());
		
		
	}
	
	
	
	public class ClosePriceExtractor implements ResultSetExtractor<AlgoEfficacyBO> {

		@Override
		public AlgoEfficacyBO extractData(ResultSet rs) throws SQLException, DataAccessException {
			
			AlgoEfficacyBO algobo = new AlgoEfficacyBO();
			
			while (rs.next()) {
				
				algobo.setTodayClosePrice((rs.getFloat(1)));
				
			}
			return algobo;
		}
	}
	
	
	@Override
	public AlgoEfficacyBO findBsePrice(Date bsesearchdate) {
		return jdbcTemplate.query(AccuracyConstant.SQL_GET_ACCURACY2, new Object[] {bsesearchdate},
				new BseClosePriceExtractor());
		
		
	}
	
	
	
	public class BseClosePriceExtractor implements ResultSetExtractor<AlgoEfficacyBO> {

		@Override
		public AlgoEfficacyBO extractData(ResultSet rs) throws SQLException, DataAccessException {
			
			AlgoEfficacyBO algobo1 = new AlgoEfficacyBO();
			
			while (rs.next()) {
				
				algobo1.setBsePrice((rs.getFloat(1)));
				
			}
			return algobo1;
		}
	}
	
	
	
	
	@Override
	public AlgoEfficacyBO findBseBackPrice(Date bsebackdate) {
		return jdbcTemplate.query(AccuracyConstant.SQL_GET_ACCURACY3, new Object[] {bsebackdate},
				new BsePrevPriceExtractor());
		
		
	}
	
	
	
	public class BsePrevPriceExtractor implements ResultSetExtractor<AlgoEfficacyBO> {
		@Override
		public AlgoEfficacyBO extractData(ResultSet rs) throws SQLException, DataAccessException {
			
			AlgoEfficacyBO algobo2 = new AlgoEfficacyBO();
			
			while (rs.next()) {
				
				algobo2.setBseBackPrice((rs.getFloat(1)));
				
			}
			return algobo2;
		}
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
	

}
