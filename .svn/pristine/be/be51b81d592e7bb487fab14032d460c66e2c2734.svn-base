package com.nivesh.service.payment;



import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.http.conn.ssl.NoopHostnameVerifier;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.nivesh.bo.EmailBO;
import com.nivesh.bo.PaymentHistoryBO;
import com.nivesh.command.payment.UserPaymentCommand;
import com.nivesh.dao.dashboard.IDBDashboardDao;
import com.nivesh.dao.payment.IDBPaymentDao;
import com.nivesh.dto.payment.Payment;
import com.nivesh.dto.payment.Payment_request;
import com.nivesh.dto.payment.Refund;
import com.nivesh.dto.payment.Refund_request;
import com.nivesh.service.login.ILoginService;
import com.nivesh.util.ApplicationConstant;
import com.nivesh.util.DateHelper;
import com.nivesh.util.IEmailMessageSend;
import com.nivesh.util.IRest;

public class InstamojoPaymentServiceImpl implements IInstamojoPaymentService, IRest {
	
	
	@Resource
	private IDBDashboardDao idbDashboardDao;
	public void setIdbDashboardDao(IDBDashboardDao idbDashboardDao) {
		this.idbDashboardDao = idbDashboardDao;
	}
	
	@Autowired
	ILoginService iLoginService;
	
	@Resource
	IDBPaymentDao iDBPaymentDao;
	
	@Autowired
	private IEmailMessageSend emailMessageSend;

	
	public void setiDBPaymentDao(IDBPaymentDao iDBPaymentDao) {
		this.iDBPaymentDao = iDBPaymentDao;
	}
	private RestTemplate restTemplate;
	
	public InstamojoPaymentServiceImpl(RestTemplate restTemplate ) {
		this.restTemplate = restTemplate;
		
	}
	@Override
	public Map<String, String> callPayment(UserPaymentCommand userPaymentCommand, Map<String, String> contextPatameterMap)
	{
		
		Map<String,String> map=new HashMap<String,String>();
		
		
	CloseableHttpClient httpClient = 
			      HttpClients.custom()
			                 .setSSLHostnameVerifier(new NoopHostnameVerifier())
			                 .build();
		
	Payment_request payment=new   Payment_request();
	
	payment.setAmount(userPaymentCommand.getAmount());
	payment.setBuyer_name(userPaymentCommand.getBuyer_userId());
	payment.setEmail(userPaymentCommand.getEmail());
	payment.setPurpose(userPaymentCommand.getPurpose());
	payment.setPhone(userPaymentCommand.getPhone());
	payment.setRedirect_url(contextPatameterMap.get("redirect_url"));
	payment.setWebhook(contextPatameterMap.get("webhook_url"));
		 String url=contextPatameterMap.get("paymentRequestStatus_url");
		
		 HttpHeaders headers=new HttpHeaders();
		 headers.set("X-Api-Key", contextPatameterMap.get("api_key"));
		 headers.set("X-Auth-Token", contextPatameterMap.get("auth_token"));
		 MultiValueMap< String, String > multiValueMap=new LinkedMultiValueMap<String,String>();
			/* multiValueMap.add("buyer_name", userPaymentCommand.getBuyer_name());*/
			 multiValueMap.add("allow_repeated_payments", "false");
			 multiValueMap.add("amount",payment.getAmount());
			 multiValueMap.add("buyer_name",payment.getBuyer_name());
			multiValueMap.add("purpose",payment.getPurpose());
			 multiValueMap.add("redirect_url",payment.getRedirect_url());
			 multiValueMap.add("webhook",payment.getWebhook());
			 multiValueMap.add("email", payment.getEmail());
			 multiValueMap.add("phone",payment.getPhone());
			 HttpEntity<MultiValueMap< String, String>> requestEntity=new HttpEntity<MultiValueMap<String,String>>(multiValueMap,headers);
		
			 ResponseEntity<Payment> response=restTemplate.exchange(url, HttpMethod.POST, requestEntity, Payment.class);
			 
			// System.out.println("response.getStatusCode()"+response.getStatusCode());
			 int responsecode=response.getStatusCode().value();
			Payment paymentResponse=response.getBody();
			
			int insertStatus=0;
		    if(responsecode!=201){
		    	map.put("responseCode", "unsuccessful");
		    }else{
		    	
		    	//insert into database for first request data's response 
		    	PaymentHistoryBO paymentHistoryBO=new PaymentHistoryBO();
		    	paymentHistoryBO.setPurpose(paymentResponse.getPayment_request().getPurpose());
		    	paymentHistoryBO.setBuyer_userId(paymentResponse.getPayment_request().getBuyer_name());
		    	paymentHistoryBO.setPhone(Long.parseLong(paymentResponse.getPayment_request().getPhone()));
		    	paymentHistoryBO.setStatus(paymentResponse.getPayment_request().getStatus());
		    	paymentHistoryBO.setDeposit_date(paymentResponse.getPayment_request().getCreated_at());
		    	paymentHistoryBO.setPayment_request_id(paymentResponse.getPayment_request().getId());
		    	paymentHistoryBO.setAmount(Float.parseFloat(paymentResponse.getPayment_request().getAmount()));
		    	paymentHistoryBO.setEmail(paymentResponse.getPayment_request().getEmail());
		    	paymentHistoryBO.setActive(ApplicationConstant.ACTIVE);
		    	paymentHistoryBO.setAuditAction(ApplicationConstant.AUDIT_ACTION_INSERT);
		    	paymentHistoryBO.setAuditDateTime(DateHelper.todaysDateTimeInDBFormat());
		    	
		    	insertStatus=iDBPaymentDao.insertPaymentInfo(paymentHistoryBO);
		    	
		    	
		    	
		    String longurlValue=paymentResponse.getPayment_request().getLongurl()+"?"+"embed=form";
		    map.put("longurl",longurlValue);
			//System.out.println(paymentResponse);
		    }
			 return map;
		
	}
	@Override
	public List<PaymentHistoryBO> getPaymentStatus(String payment_request_id, String paymentRequestStatus_url,
			String api_key, String auth_token,String duration) throws JSONException, ClassNotFoundException {
		 List<PaymentHistoryBO> extractPaymentInfo=null;
		Payment_request payment=new   Payment_request();
		String https_url=paymentRequestStatus_url+payment_request_id+"/";
		//System.out.println("https_url"+https_url);
	      PaymentHistoryBO paymentHistoryBO=new PaymentHistoryBO();
	      
	      //System.out.println("api_key "+api_key+"auth_token "+auth_token);
	      HttpHeaders headers=new HttpHeaders();
			 headers.set("X-Api-Key", api_key);
			 headers.set("X-Auth-Token", auth_token);
			MultiValueMap< String, String > multiValueMap=new LinkedMultiValueMap<String,String>();
				/* multiValueMap.add("buyer_name", userPaymentCommand.getBuyer_name());*/
				multiValueMap.add("allow_repeated_payments", "false");
				 HttpEntity<MultiValueMap< String, String>> requestEntity=new HttpEntity<MultiValueMap<String,String>>(multiValueMap,headers);
				
				 
				 
				// ResponseEntity<String> response=restTemplate.exchange(https_url, HttpMethod.GET, requestEntity,String.class);
				 ResponseEntity<String> response=restTemplate.exchange(https_url, HttpMethod.GET, requestEntity,String.class);
				 
				
				
//				 int responsecode=response.getStatusCode().value();
				 String result=response.getBody();
				 StringBuilder sb=new StringBuilder(result);
				 
				 JSONObject json = new JSONObject(sb.toString());
				   JSONObject getSth = json.getJSONObject("payment_request");
				 //  String payment_requestid = (String) getSth.get("id");
				   String buyer_name = (String) getSth.get("buyer_name");
				   String email = (String) getSth.get("email");
				   String phone = (String) getSth.get("phone");
				   String purpose=(String) getSth.get("purpose");
				   String status=null;
				   String payment_id=null;
				   Float amount=null;
				   String currency=null;
				   String deposit_date=null;
				   Float fees=0.0f;
				   
			//	   System.out.println("after payment details "+" "+buyer_name+" "+email+" "+phone );
				   paymentHistoryBO.setPayment_request_id(payment_request_id);
				   paymentHistoryBO.setBuyer_userId(buyer_name);
				   paymentHistoryBO.setEmail(email);
				   paymentHistoryBO.setPurpose(purpose);
				   paymentHistoryBO.setPhone(Long.parseLong(phone));
				   paymentHistoryBO.setActive(ApplicationConstant.ACTIVE);
				   paymentHistoryBO.setAuditAction(ApplicationConstant.AUDIT_ACTION_INSERT);
				   paymentHistoryBO.setAuditDateTime(DateHelper.todaysDateTimeInDBFormat());
				   paymentHistoryBO.setSubscription_duration(duration);
				   
				   
				   
				   
				   JSONArray payments =json.getJSONObject("payment_request").getJSONArray("payments");
				  // System.out.println("payment array "+payments);
				  for (int i=0;i<payments.length();i++) {
					  JSONObject objects = payments.getJSONObject(i);
					 
					     status = objects.getString("status");
					     
				//	     System.out.println("Status "+status);
					     payment_id = objects.getString("payment_id");
					     amount=(float) objects.getDouble("amount");
						 currency=objects.getString("currency");
						 deposit_date=objects.getString("created_at");
						 fees=(float) objects.getDouble("fees");
						 
						 paymentHistoryBO.setStatus(status);
						 
						 paymentHistoryBO.setPayment_id(payment_id);
						 paymentHistoryBO.setAmount(amount);
						 paymentHistoryBO.setCurrency(currency);
						 paymentHistoryBO.setDeposit_date(deposit_date);
						 paymentHistoryBO.setFees(fees);
				 
				  }
				  
				  int insertStatus=1;
				  int checkForSameRequestId=iDBPaymentDao.checkSameRequestId(payment_id);
				  if(checkForSameRequestId==0){
				  if(status.equalsIgnoreCase("Credit")){
					//   System.out.println("=====insdie if status");
					  insertStatus=iDBPaymentDao.updatePaymentInfo(paymentHistoryBO);
				  
					  if(insertStatus==1)
					  {     
						  String userName=paymentHistoryBO.getBuyer_userId();
						  String created=paymentHistoryBO.getDeposit_date();
						   extractPaymentInfo=iDBPaymentDao.findPaymentUserInfo(userName,created);
						   
//							System.out.println("Duration in Updation :  " + duration);
							int update = iLoginService.updateSubscription(duration, userName);

//						System.out.println("Update details : " + update);
						   
						  return extractPaymentInfo;
					  }
					  
				  }
		      }else if(checkForSameRequestId>0)//here else collect data from data base of same request id
		      {//System.out.println(1);
		      
		      
		    	  String userName=paymentHistoryBO.getBuyer_userId();
				  String created=paymentHistoryBO.getDeposit_date();
				   extractPaymentInfo=iDBPaymentDao.findPaymentUserInfo(userName,created);
				  return extractPaymentInfo; 
		      }
				  
					  return extractPaymentInfo;
				  
			}
	@Override
	public void sendMailtoUser(PaymentHistoryBO paymentHistoryBO) {

		//For Getting SenderEmail ID
		EmailBO emailBODAO = idbDashboardDao.getSenderEmailId();

	/*	System.out.println("Payment Command : "+paymentHistoryBO);
		System.out.println("Email Bo : "+emailBODAO);
	*/
		String messages="<p>Hi, "+paymentHistoryBO.getBuyer_userId()+"</p>"
				+ "<h2>&nbsp; &nbsp; Equityujudge : Subscription Portal</h2>"
				+ "<p>&nbsp; &nbsp;</p><p>"
				+ "&nbsp; &nbsp; We hope you have enjoyed being a Equityjudge user.&nbsp;Your subcription for "+paymentHistoryBO.getSubscription_duration()+" period is successfully started.</p>"
				+ "<p>&nbsp;</p>"
				+ "<table style='height: 131px; width: 491px;' border='2' width='414'><caption>"
				+ "<h3>Subscription Details</h3></caption>"
				+ "<tbody><tr><td><h4>Payment Id :</h4></td><td>"
				+ "<h4>"+paymentHistoryBO.getPayment_id()+"</h4></td></tr><tr><td>"
				+ "<h4>Subscription Duration :</h4></td><td>"
				+ "<h4>"+paymentHistoryBO.getSubscription_duration()+"</h4></td></tr><tr><td>"
				+ "<h4>Paid Ammount :&nbsp;</h4></td><td>"
				+ "<h4>"+paymentHistoryBO.getAmount()+" "+paymentHistoryBO.getCurrency()+"</h4></td></tr><tr><td>"
				+ "<h4>Payment Date and Time :</h4></td><td>"
				+ "<h4>"+paymentHistoryBO.getAuditDateTime()+"</h4></td></tr></tbody></table>"
				+ "<p>Thank you for showing intrest in Equityjudge.</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>"
				+ "<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; For further query mail us on <u style='color:blue;'>info@equityjudge.com</u>"
				+ " mail id. Our support team will solved you query as soon as possible.</p><br>"
				+ "Thank You.<br>------------------------------</p><br>"
				+ "REGARDS"
				+ "<p style='font-size:17px; color:brown;'>Equityjudge Support Team  <br></p>"
				+ "<p style='font-size:16px; color:grey;'>Equityjudge is a product, brought out by Qualde Digital Services Private Limited.<br>"
				+ "QUALDE Digital Services Pvt. Ltd. | Nester Raga Apts, Unit - D, C - Block,"
				+ "Ground Floor, Outer Ring Rd, Mahadevapura, Bengaluru, Karnataka-560093.<br>"
				+ "chairman@qualde.com | "
				+ "<a href='http://www.qualde.com/' target='_blank'>[Website] QUALDE </a>";

		String subject = "EquityJudge Subscription Successfully Done.";

		EmailBO emailBO = new EmailBO();
		emailBO.setSenderEmailId(emailBODAO.getSenderEmailId());
		emailBO.setSenderPassword(emailBODAO.getSenderPassword());
		emailBO.setReciverEmailId(paymentHistoryBO.getEmail());
		emailBO.setSubject(subject);
		emailBO.setMessage(messages);

		try {
			emailMessageSend.sendMail(emailBO);
		} catch (Exception e) {
			System.out.println("Encryption Exception:---"+e);
		}
	}

	
	
	
	
	@Override
	public List<PaymentHistoryBO> getUserPaymentDEtails(UserPaymentCommand userPaymentCommand) {
		PaymentHistoryBO paymentHistoryBO=new PaymentHistoryBO();
		paymentHistoryBO.setBuyer_userId(userPaymentCommand.getBuyer_userId());
		paymentHistoryBO.setPayment_id(userPaymentCommand.getPayment_id());
		
		List<PaymentHistoryBO> historyBOs=iDBPaymentDao.getPaymentDetail(paymentHistoryBO);
		return historyBOs;
	}
	@Override
	public List<PaymentHistoryBO> getRefundRequest(UserPaymentCommand userPaymentCommand,
			Map<String, String> contextPatameterMap) {
		
		 List<PaymentHistoryBO> extractPaymentInfo=null;
		PaymentHistoryBO  paymentHistoryBO=new PaymentHistoryBO();
		
		Refund_request refund=new Refund_request();
		
		String api_key =contextPatameterMap.get("api_key");
		String auth_token =contextPatameterMap.get("auth_token");
		String refund_url =contextPatameterMap.get("refund_url");
		
		String https_url=refund_url;
		
		
	//	System.out.println("userPaymentCommand.getAmount()"+userPaymentCommand.getAmount());
		
		refund.setPayment_id(userPaymentCommand.getPayment_id());
		refund.setAmount(userPaymentCommand.getAmount());
		refund.setType(userPaymentCommand.getPurpose());
		refund.setBody(userPaymentCommand.getReason_of_refund());
		
		
		
		HttpHeaders headers=new HttpHeaders();
		 headers.set("X-Api-Key",api_key);
		 headers.set("X-Auth-Token",auth_token);
		 MultiValueMap< String, String > multiValueMap=new LinkedMultiValueMap<String,String>();
			/* multiValueMap.add("buyer_name", userPaymentCommand.getBuyer_name());*/
			 multiValueMap.add("type",refund.getType());
			 multiValueMap.add("payment_id", refund.getPayment_id());
			 multiValueMap.add("refund_amount",refund.getAmount());
			multiValueMap.add("body",refund.getBody());
			 
			 HttpEntity<MultiValueMap< String, String>> requestEntity=new HttpEntity<MultiValueMap<String,String>>(multiValueMap,headers);
		
			 ResponseEntity<Refund> response=restTemplate.exchange(https_url, HttpMethod.POST, requestEntity,Refund.class);
			 
		//	 System.out.println("response.getStatusCode()"+response.getStatusCode());
			 int responsecode=response.getStatusCode().value();
			Refund refundResponde=response.getBody();
		
		  /*     System.out.println("payment response "+refundResponde);
		       System.out.println(" refund amount    "+refundResponde.getRefund().getRefund_amount());
		       System.out.println(" body    "+refundResponde.getRefund().getBody());
		       System.out.println(" type    "+refundResponde.getRefund().getType());
		       System.out.println(" paymentid     "+refundResponde.getRefund().getPayment_id());
		       System.out.println("  status    "+refundResponde.getRefund().getStatus());
		    */   
		       paymentHistoryBO.setRefund_id(refundResponde.getRefund().getId());
			   paymentHistoryBO.setBuyer_userId(refundResponde.getRefund().getBuyer_name());
			   paymentHistoryBO.setPayment_id(refundResponde.getRefund().getPayment_id());
			   paymentHistoryBO.setStatus(refundResponde.getRefund().getStatus());
			   paymentHistoryBO.setType(refundResponde.getRefund().getType());
			   paymentHistoryBO.setBody(refundResponde.getRefund().getBody());
			   paymentHistoryBO.setRefund_amount(Float.parseFloat(refundResponde.getRefund().getRefund_amount()));
			   paymentHistoryBO.setTotal_amount(Float.parseFloat(refundResponde.getRefund().getTotal_amount()));
			   paymentHistoryBO.setRefund_date(refundResponde.getRefund().getCreated_at());
			   paymentHistoryBO.setActive(ApplicationConstant.INACTIVE);
			   paymentHistoryBO.setAuditAction(ApplicationConstant.AUDIT_ACTION_UPDATE);
			   paymentHistoryBO.setAuditDateTime(DateHelper.todaysDateTimeInDBFormat());
		       
			  
			   int update=iDBPaymentDao.updateRefundInfo(paymentHistoryBO);
				  if(update==1)
				  {   
					  String userName=contextPatameterMap.get("buyer_userId");
			//		System.out.println("refund UserNAme"+userName);
					  String duration=ApplicationConstant.AFTER_REFUND_DURATION;
				//     System.out.println("duration "+duration);
					   int updateDuration = iLoginService.updateSubscription(duration, userName);
		//			    System.out.println("Update details : "+updateDuration);
			//		  System.out.println("refund info updated successfully");
					 paymentHistoryBO.setPayment_id(refundResponde.getRefund().getPayment_id());;
					 extractPaymentInfo=iDBPaymentDao.findRefundInfo(paymentHistoryBO);
					  return extractPaymentInfo;
				  }
				  else
				  {
				//	  System.out.println("unsuccessful extract user info");
					  return extractPaymentInfo;
				  }
	}
	//save webhook data
		@Override
		public List<PaymentHistoryBO> saveAndExtractPayemntInfo(Map<String, String> requestMap)
		//public int savePayemntInfo(Map<String, String> requestMap, String duration)
		{
			//convertDate to String
			Date date=DateHelper.todaysDateTimeInDBFormat();
			String deposit_date=		DateHelper.convertDateToString(date);
			List<PaymentHistoryBO> extractPaymentInfo = null;
			
			
			PaymentHistoryBO paymentHistoryBO=null;
			paymentHistoryBO=new PaymentHistoryBO();
			paymentHistoryBO.setBuyer_userId(requestMap.get("buyer_userId"));
			paymentHistoryBO.setPayment_request_id(requestMap.get("payment_request_id"));
			paymentHistoryBO.setPayment_id(requestMap.get("payment_id"));
			//paymentHistoryBO.setEmail(requestMap.get("email"));
			//paymentHistoryBO.setPhone(Long.parseLong(requestMap.get("phone")));//
			paymentHistoryBO.setStatus(requestMap.get("status"));
			paymentHistoryBO.setCurrency(requestMap.get("currency"));
			paymentHistoryBO.setAmount(Float.parseFloat(requestMap.get("amount")));
			paymentHistoryBO.setFees(Float.parseFloat(requestMap.get("fees")));
			paymentHistoryBO.setDeposit_date(deposit_date);//
			paymentHistoryBO.setSubscription_duration(requestMap.get("duration"));
			paymentHistoryBO.setActive(ApplicationConstant.ACTIVE);
			paymentHistoryBO.setAuditAction(ApplicationConstant.AUDIT_ACTION_INSERT);
			paymentHistoryBO.setAuditDateTime(DateHelper.todaysDateTimeInDBFormat());
			
			String userName =requestMap.get("buyer_userId");
			String payment_request_id=requestMap.get("payment_request_id");
			String duration=requestMap.get("duration");
			
			   int checkForSameRequestId = iDBPaymentDao.checkSameRequestId(payment_request_id);
				
			   if (checkForSameRequestId <= 0) {
				   int saveRequest=iDBPaymentDao.insertWebhookPaymentInfo(paymentHistoryBO);
//					System.out.println("saverequest: " + saveRequest);
					if (saveRequest == 0) {

						// If Payment is Not successfully done....

						return null;//null
					} else {
						// here we get saveRequest response as list
						
						 extractPaymentInfo=iDBPaymentDao.findWebHookPaymentUserInfo(userName,deposit_date);

						// If Payment SuccessFully Done.....
//						System.out.println("Duration :  " + duration);
//						int update = iLoginService.updateSubscription(duration, userName);
//
//						 System.out.println("Update details : "+update);
						return extractPaymentInfo;
					}
				} else {
					
					 extractPaymentInfo=iDBPaymentDao.findWebHookPaymentUserInfo(userName,deposit_date);
					return extractPaymentInfo;
				}
			
			//call dao class to insert into db
//			int sucessInsert=iDBPaymentDao.insertPaymentInfo(paymentHistoryBO);
//			return sucessInsert;
		}

		@Override
		public List<PaymentHistoryBO>  updateAndExtractRefundInfo(Map<String, String> requestMap) {
			//convertDate to String
			Date date=DateHelper.todaysDateTimeInDBFormat();
			String refund_date=		DateHelper.convertDateToString(date);
			
			PaymentHistoryBO paymentHistoryBO=new PaymentHistoryBO();
			String  payment_id=requestMap.get("payment_id"); 
			String userName=requestMap.get("buyer_userId");
			paymentHistoryBO.setRefund_id(requestMap.get("refund_id"));
			paymentHistoryBO.setPayment_id(requestMap.get("payment_id"));
			paymentHistoryBO.setStatus(requestMap.get("status"));
			paymentHistoryBO.setType(requestMap.get("type"));
			paymentHistoryBO.setBody(requestMap.get("body"));
			paymentHistoryBO.setRefund_amount(Float.parseFloat(requestMap.get("refund_amount")));
			paymentHistoryBO.setRefund_date(refund_date);
			paymentHistoryBO.setTotal_amount(Float.parseFloat(requestMap.get("total_amount")));
			   paymentHistoryBO.setActive(ApplicationConstant.INACTIVE);
			   paymentHistoryBO.setAuditAction(ApplicationConstant.AUDIT_ACTION_UPDATE);
			   paymentHistoryBO.setAuditDateTime(DateHelper.todaysDateTimeInDBFormat());
		
		 int updateRefundInfo=iDBPaymentDao.updateWebhookRefundInfo(paymentHistoryBO);
		  if(updateRefundInfo==1)
		  {   
//			// If Payment SuccessFully Done.....
//			     String duration="0";
//			     System.out.println("duration "+duration);
//				   int updateDuration = iLoginService.updateSubscription(duration, userName);
//				    System.out.println("Update details : "+updateDuration);
//			         System.out.println("refund info updated successfully");
			  paymentHistoryBO.setPayment_id(payment_id);;
			  List<PaymentHistoryBO> extractPaymentInfo=iDBPaymentDao.findWebhookRefundInfo(paymentHistoryBO);
			  return extractPaymentInfo;
		  }
		  else
		  {
			  System.out.println("unsuccessful extract user info");
			  return null;
		  } 
		}

		@Override
		public List<PaymentHistoryBO> storeAndExtractPayFailureInfo(Map<String, String> requestMap) {
			//convertDate to String
			Date date=DateHelper.todaysDateTimeInDBFormat();
			String deposit_date=		DateHelper.convertDateToString(date);
			
			List<PaymentHistoryBO> extractPaymentInfo = null;
			PaymentHistoryBO paymentHistoryBO=null;
			paymentHistoryBO=new PaymentHistoryBO();
			paymentHistoryBO.setBuyer_userId(requestMap.get("buyer_userId"));
			paymentHistoryBO.setPayment_request_id(requestMap.get("payment_request_id"));
			paymentHistoryBO.setPayment_id(requestMap.get("payment_id"));
//			paymentHistoryBO.setEmail(requestMap.get("email"));
//			paymentHistoryBO.setPhone(Long.parseLong(requestMap.get("phone")));
			paymentHistoryBO.setStatus(requestMap.get("status"));
			paymentHistoryBO.setCurrency(requestMap.get("currency"));
			paymentHistoryBO.setAmount(Float.parseFloat(requestMap.get("amount")));
			paymentHistoryBO.setFees(Float.parseFloat(requestMap.get("fees")));
			paymentHistoryBO.setDeposit_date(deposit_date);
			paymentHistoryBO.setActive(ApplicationConstant.ACTIVE);
			   paymentHistoryBO.setAuditAction(ApplicationConstant.AUDIT_ACTION_INSERT);
			   paymentHistoryBO.setAuditDateTime(DateHelper.todaysDateTimeInDBFormat());
			
			String userName =requestMap.get("buyer_userId");
			String payment_request_id=requestMap.get("payment_request_id");
			
			   int checkForSameRequestId=iDBPaymentDao.checkSameRequestId(payment_request_id);
				
			   if (checkForSameRequestId <= 0) {
				   int saveRequest=iDBPaymentDao.insertWebhookPaymentInfo(paymentHistoryBO);
					System.out.println("saverequest: " + saveRequest);
					if (saveRequest == 0) {

						// If Payment is Not successfully done....

						return null;//null
					} else {
						// here we get saveRequest response as list
						
						 extractPaymentInfo=iDBPaymentDao.findWebHookPaymentUserInfo(userName,deposit_date);

						
					}
				} else {
					
					 extractPaymentInfo=iDBPaymentDao.findWebHookPaymentUserInfo(userName,deposit_date);
					return extractPaymentInfo;
				}
			return extractPaymentInfo;
			
		}
		
              
}
