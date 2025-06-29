package com.nivesh.dao.payment;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;

import com.nivesh.bo.PaymentHistoryBO;
import com.nivesh.dao.PaymentSqlConstant;

public class DBPaymentDaoImpl implements IDBPaymentDao {
	
	private JdbcTemplate jdbcTemplate;
	private SimpleJdbcCall simplejdbccall;
	
	public DBPaymentDaoImpl(JdbcTemplate jdbcTemplate, SimpleJdbcCall simplejdbccall ) {
		this.jdbcTemplate = jdbcTemplate;
		this.simplejdbccall = simplejdbccall;
	}

	@Override
	public int insertPaymentInfo(final PaymentHistoryBO paymentHistoryBO) {
		return jdbcTemplate.update(PaymentSqlConstant.INSERT_USERPAYMENT_INFO,new Object[]{paymentHistoryBO.getPayment_request_id(),paymentHistoryBO.getPayment_id(),
				paymentHistoryBO.getSubscription_duration(),paymentHistoryBO.getBuyer_userId(),paymentHistoryBO.getEmail(),paymentHistoryBO.getPhone(),paymentHistoryBO.getStatus(),
				paymentHistoryBO.getCurrency(),paymentHistoryBO.getAmount(),paymentHistoryBO.getFees(),paymentHistoryBO.getDeposit_date(),
				paymentHistoryBO.getActive(),paymentHistoryBO.getAuditAction(),paymentHistoryBO.getAuditDateTime()
				});
			
		}
	@Override
	public List<PaymentHistoryBO> findPaymentUserInfo(String userName,String created) {
		
		List<PaymentHistoryBO> list = jdbcTemplate.query(PaymentSqlConstant.EXTRACT_USERPAYMENT_INFO,
				new Object[] { userName,created }, new RowMapper<PaymentHistoryBO>() {

			@Override
			public PaymentHistoryBO mapRow(ResultSet rs, int rowNumber) throws SQLException {
				PaymentHistoryBO paymentHistoryBO= null;

				paymentHistoryBO = new PaymentHistoryBO();
				paymentHistoryBO.setPayment_request_id(rs.getString(1));
				paymentHistoryBO.setPayment_id(rs.getString(2));
				paymentHistoryBO.setBuyer_userId(rs.getString(3));
				paymentHistoryBO.setEmail(rs.getString(4));
				paymentHistoryBO.setPhone(rs.getLong(5));
				paymentHistoryBO.setStatus(rs.getString(6));
				paymentHistoryBO.setCurrency(rs.getString(7));
				paymentHistoryBO.setAmount(rs.getFloat(8));
				paymentHistoryBO.setFees(rs.getFloat(9));
				paymentHistoryBO.setDeposit_date(rs.getString(10));
				paymentHistoryBO.setSubscription_duration(rs.getString(11));
				paymentHistoryBO.setAuditDateTime(rs.getTimestamp(12));

				return paymentHistoryBO;
			}

		});
		return list;
	}
//getting  user info from database beofre refund
	@Override
	public List<PaymentHistoryBO> getPaymentDetail(PaymentHistoryBO paymentHistoryBO) {
		
		List<PaymentHistoryBO> list = jdbcTemplate.query(PaymentSqlConstant.EXTRACT_PAYMENTREFUND_INFO,
				new Object[] {paymentHistoryBO.getBuyer_userId(),paymentHistoryBO.getPayment_id()}, new RowMapper<PaymentHistoryBO>() {

			@Override
			public PaymentHistoryBO mapRow(ResultSet rs, int rowNumber) throws SQLException {
				PaymentHistoryBO paymentHistoryBO= null;

				paymentHistoryBO = new PaymentHistoryBO();
				paymentHistoryBO.setPayment_request_id(rs.getString(1));
				paymentHistoryBO.setPayment_id(rs.getString(2));
				paymentHistoryBO.setBuyer_userId(rs.getString(3));
				paymentHistoryBO.setEmail(rs.getString(4));
				paymentHistoryBO.setPhone(rs.getLong(5));
				paymentHistoryBO.setStatus(rs.getString(6));
				paymentHistoryBO.setCurrency(rs.getString(7));
				paymentHistoryBO.setAmount(rs.getFloat(8));
				paymentHistoryBO.setFees(rs.getFloat(9));
				paymentHistoryBO.setDeposit_date(rs.getString(10));

				return paymentHistoryBO;
			}

		});
		return list;
	}
	@Override
	public int updateRefundInfo(PaymentHistoryBO paymentHistoryBO) {
		return jdbcTemplate.update(PaymentSqlConstant.UPDATE_USERREFUND_INFO,new Object[]{paymentHistoryBO.getRefund_id(),
				paymentHistoryBO.getStatus(),
				paymentHistoryBO.getType(),paymentHistoryBO.getBody(),paymentHistoryBO.getRefund_amount(),
				paymentHistoryBO.getTotal_amount(),
				paymentHistoryBO.getRefund_date(),
				paymentHistoryBO.getActive(),paymentHistoryBO.getAuditAction(),paymentHistoryBO.getAuditDateTime(),
				paymentHistoryBO.getPayment_id()
				});
	}
	
	@Override
	public List<PaymentHistoryBO> findRefundInfo(PaymentHistoryBO paymentHistoryBO) {
		List<PaymentHistoryBO> list = jdbcTemplate.query(PaymentSqlConstant.EXTRACT_USERREFUND_INFO,
				new Object[] { paymentHistoryBO.getPayment_id() }, new RowMapper<PaymentHistoryBO>() {

			@Override
			public PaymentHistoryBO mapRow(ResultSet rs, int rowNumber) throws SQLException {
				PaymentHistoryBO paymentHistoryBO= null;

				paymentHistoryBO = new PaymentHistoryBO();
				paymentHistoryBO.setPayment_id(rs.getString(1));
				paymentHistoryBO.setRefund_id(rs.getString(2));
				paymentHistoryBO.setBuyer_userId(rs.getString(3));
				paymentHistoryBO.setStatus(rs.getString(4));
				paymentHistoryBO.setType(rs.getString(5));
				paymentHistoryBO.setBody(rs.getString(6));
				paymentHistoryBO.setTotal_amount(rs.getFloat(8));
				paymentHistoryBO.setRefund_amount(rs.getFloat(7));
				paymentHistoryBO.setRefund_date(rs.getString(9));

				return paymentHistoryBO;
			}

		});
		return list;
	}
	
	
	
	
	@Override
	public int checkSameRequestId(String payment_id) {
		int check=jdbcTemplate.queryForInt(PaymentSqlConstant.CHECK_REQUESTID_DUPLICATION, new Object[]{payment_id});
		return check;
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
	public int updatePaymentInfo(PaymentHistoryBO paymentHistoryBO) {
		return jdbcTemplate.update(PaymentSqlConstant.UPDATE_USERRPAYMENT_INFO,new Object[]{paymentHistoryBO.getBuyer_userId(),paymentHistoryBO.getPayment_request_id(),
				paymentHistoryBO.getPayment_id(),paymentHistoryBO.getPurpose(),paymentHistoryBO.getSubscription_duration(),paymentHistoryBO.getEmail(),
				paymentHistoryBO.getPhone(),paymentHistoryBO.getStatus(),paymentHistoryBO.getCurrency(),paymentHistoryBO.getAmount(),paymentHistoryBO.getFees(),paymentHistoryBO.getDeposit_date(),
				paymentHistoryBO.getActive(),paymentHistoryBO.getAuditAction(),paymentHistoryBO.getAuditDateTime(),paymentHistoryBO.getPayment_request_id()
				
				});
	}
	//webhook
	//1.
	@Override
	public int insertWebhookPaymentInfo(final PaymentHistoryBO paymentHistoryBO) {
		return jdbcTemplate.update(PaymentSqlConstant.INSERT_WEBHOOKPAYMENT_INFO,new Object[]{paymentHistoryBO.getPayment_request_id(),paymentHistoryBO.getPayment_id(),
				paymentHistoryBO.getSubscription_duration(),paymentHistoryBO.getBuyer_userId(),paymentHistoryBO.getStatus(),
				paymentHistoryBO.getCurrency(),paymentHistoryBO.getAmount(),paymentHistoryBO.getFees(),paymentHistoryBO.getDeposit_date(),
				paymentHistoryBO.getActive(),paymentHistoryBO.getAuditAction(),paymentHistoryBO.getAuditDateTime()
				});
			
		}
	//2.
	@Override
	public List<PaymentHistoryBO> findWebHookPaymentUserInfo(String userName, String deposit_date) {
		List<PaymentHistoryBO> list = jdbcTemplate.query(PaymentSqlConstant.EXTRACT_USERPAYMENT_INFO,
				new Object[] { userName,deposit_date }, new RowMapper<PaymentHistoryBO>() {

			@Override
			public PaymentHistoryBO mapRow(ResultSet rs, int rowNumber) throws SQLException {
				PaymentHistoryBO paymentHistoryBO= null;

				paymentHistoryBO = new PaymentHistoryBO();
				paymentHistoryBO.setPayment_request_id(rs.getString(1));
				paymentHistoryBO.setPayment_id(rs.getString(2));
				paymentHistoryBO.setBuyer_userId(rs.getString(3));
				//paymentHistoryBO.setEmail(rs.getString(4"));
				//paymentHistoryBO.setPhone(rs.getLong(5));
				paymentHistoryBO.setStatus(rs.getString(6));
				paymentHistoryBO.setCurrency(rs.getString(7));
				paymentHistoryBO.setAmount(rs.getFloat(8));
				paymentHistoryBO.setFees(rs.getFloat(9));
				paymentHistoryBO.setDeposit_date(rs.getString(10));

				return paymentHistoryBO;
			}

		});
		return list;
	}
	//3
	@Override
	public int updateWebhookRefundInfo(PaymentHistoryBO paymentHistoryBO) {
			return jdbcTemplate.update(PaymentSqlConstant.UPDATE_WEBHOOKREFUND_INFO,new Object[]{paymentHistoryBO.getRefund_id(),
					paymentHistoryBO.getStatus(),
					paymentHistoryBO.getType(),paymentHistoryBO.getBody(),paymentHistoryBO.getRefund_amount(),
					paymentHistoryBO.getTotal_amount(),
					paymentHistoryBO.getRefund_date(),
					paymentHistoryBO.getActive(),paymentHistoryBO.getAuditAction(),paymentHistoryBO.getAuditDateTime(),
					paymentHistoryBO.getPayment_id()
					});
		
	}

	@Override
	public List<PaymentHistoryBO> findWebhookRefundInfo(PaymentHistoryBO paymentHistoryBO) {
		List<PaymentHistoryBO> list = jdbcTemplate.query(PaymentSqlConstant.EXTRACT_USERREFUND_INFO,
				new Object[] { paymentHistoryBO.getPayment_id() }, new RowMapper<PaymentHistoryBO>() {

			@Override
			public PaymentHistoryBO mapRow(ResultSet rs, int rowNumber) throws SQLException {
				PaymentHistoryBO paymentHistoryBO= null;

				paymentHistoryBO = new PaymentHistoryBO();
				paymentHistoryBO.setPayment_id(rs.getString(1));
				paymentHistoryBO.setRefund_id(rs.getString(2));
				paymentHistoryBO.setBuyer_userId(rs.getString(3));
				paymentHistoryBO.setStatus(rs.getString(4));
				paymentHistoryBO.setType(rs.getString(5));
				paymentHistoryBO.setBody(rs.getString(6));
				paymentHistoryBO.setTotal_amount(rs.getFloat(8));
				paymentHistoryBO.setRefund_amount(rs.getFloat(7));
				paymentHistoryBO.setRefund_date(rs.getString(9));

				return paymentHistoryBO;
			}

		});
		return list;
	}

	


	




	

}
