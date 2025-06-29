package com.nivesh.dao;

public class PaymentSqlConstant {
    //webhook
	//1.
	public static final String INSERT_WEBHOOKPAYMENT_INFO="insert into niv_webhook_history(payment_request_id,payment_id,subscription_duration,buyer_userId,status,currency,amount,fees,deposit_date,active,AUDIT_ACTION,AUDIT_DATE_TIME) values(?,?,?,?,?,?,?,?,?,?,?,?)";
	//2.
	public static final String EXTRACT_WEBHOOKPAYMENT_INFO="select payment_request_id,payment_id,buyer_userId,status,currency,amount,fees,deposit_date from niv_webhook_history where buyer_userId=? and deposit_date=?";
	//3.
	public static final String UPDATE_WEBHOOKREFUND_INFO="update niv_webhook_history set refund_id=?,status=?,type=?,body=?,refund_amount=?,total_amount=?,refund_date=?,active=?,AUDIT_ACTION=?,AUDIT_DATE_TIME=? where payment_id=?" ;
	//4.
	public static final String EXTRACT_WEBHOOKREFUND_INFO="select payment_id,refund_id,buyer_userId,status,type,body,refund_amount,total_amount,refund_date from niv_webhook_history where payment_id=?";
	
	public static final String INSERT_USERPAYMENT_INFO="insert into niv_payment_history(payment_request_id,payment_id,subscription_duration,buyer_userId,email,phone,status,currency,amount,fees,deposit_date,active,AUDIT_ACTION,AUDIT_DATE_TIME) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	public static final String EXTRACT_USERPAYMENT_INFO="select payment_request_id,payment_id,buyer_userId,email,phone,status,currency,amount,fees,deposit_date,subscription_duration,audit_date_time from niv_payment_history where buyer_userId=? and deposit_date=?";
	public static final String EXTRACT_PAYMENTREFUND_INFO="select payment_request_id,payment_id,buyer_userId,email,phone,status,currency,amount,fees,deposit_date from niv_payment_history where buyer_userId=? and payment_id=?";
	
	public static final String UPDATE_USERREFUND_INFO="update niv_payment_history set refund_id=?,status=?,type=?,body=?,refund_amount=?,total_amount=?,refund_date=?,active=?,AUDIT_ACTION=?,AUDIT_DATE_TIME=? where payment_id=?" ;
	
	public static final String EXTRACT_USERREFUND_INFO="select payment_id,refund_id,buyer_userId,status,type,body,refund_amount,total_amount,refund_date from niv_payment_history where payment_id=?";
	
	public static final String CHECK_REQUESTID_DUPLICATION="select count(*) from niv_payment_history where payment_id=?";
	
	
	public static final String UPDATE_USERRPAYMENT_INFO="update niv_payment_history set buyer_userId=?,payment_request_id=?,payment_id=?,purpose=?,subscription_duration=?,email=?,phone=?,status=?,currency=?,amount=?,fees=?,deposit_date=?,active=?,audit_action=?,audit_date_time=? where payment_request_id=?" ;
	
	
}
