package com.nivesh.service.payment;

import java.util.List;
import java.util.Map;

import org.json.JSONException;

import com.nivesh.bo.PaymentHistoryBO;
import com.nivesh.command.payment.UserPaymentCommand;

public interface IInstamojoPaymentService {
	
	public Map<String, String> callPayment(UserPaymentCommand userPaymentCommand, Map<String, String> contextPatameterMap);

	public List<PaymentHistoryBO> getPaymentStatus(String payment_request_id, String paymentRequestStatus_url,
			String api_key, String auth_token, String duration) throws JSONException, ClassNotFoundException;

	public List<PaymentHistoryBO> getUserPaymentDEtails(UserPaymentCommand userPaymentCommand);

	public List<PaymentHistoryBO> getRefundRequest(UserPaymentCommand userPaymentCommand,
			Map<String, String> contextPatameterMap);

	public List<PaymentHistoryBO> saveAndExtractPayemntInfo(Map<String, String> requestMap);

	public List<PaymentHistoryBO> storeAndExtractPayFailureInfo(Map<String, String> requestMap);

	public List<PaymentHistoryBO> updateAndExtractRefundInfo(Map<String, String> requestMap);

	public void sendMailtoUser(PaymentHistoryBO paymentHistoryBO);


}
