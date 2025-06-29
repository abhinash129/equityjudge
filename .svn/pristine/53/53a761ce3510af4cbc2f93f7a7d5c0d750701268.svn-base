package com.nivesh.dao.payment;

import java.util.List;

import com.nivesh.bo.PaymentHistoryBO;
import com.nivesh.dao.IDao;

public interface IDBPaymentDao extends IDao{
    
	
	
	int insertPaymentInfo(PaymentHistoryBO paymentHistoryBO);

	List<PaymentHistoryBO> findPaymentUserInfo(String userName,String created);

	List<PaymentHistoryBO> getPaymentDetail(PaymentHistoryBO paymentHistoryBO);

	int updateRefundInfo(PaymentHistoryBO paymentHistoryBO);

	List<PaymentHistoryBO> findRefundInfo(PaymentHistoryBO paymentHistoryBO);

	int checkSameRequestId(String payment_request_id);

	int updatePaymentInfo(PaymentHistoryBO paymentHistoryBO);

	
	//webhook
	int insertWebhookPaymentInfo(PaymentHistoryBO paymentHistoryBO);

	List<PaymentHistoryBO> findWebHookPaymentUserInfo(String userName, String deposit_date);

	int updateWebhookRefundInfo(PaymentHistoryBO paymentHistoryBO);

	List<PaymentHistoryBO> findWebhookRefundInfo(PaymentHistoryBO paymentHistoryBO);

}
