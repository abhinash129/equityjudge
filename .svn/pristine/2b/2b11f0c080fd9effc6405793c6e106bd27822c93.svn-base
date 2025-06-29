package com.nivesh.controller.payment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nivesh.bo.PaymentHistoryBO;
import com.nivesh.bo.UserMstrBO;
import com.nivesh.command.login.LoginCommand;
import com.nivesh.command.payment.UserPaymentCommand;
import com.nivesh.command.userprofile.UserProfileCommand;
import com.nivesh.service.login.ILoginService;
import com.nivesh.service.payment.IInstamojoPaymentService;


@Controller

public class PaymentController {

	
	public static final String PAYMENT_REFUND_HOME = "paymentRefund", USER_REFUND_DETAILS = "userRefundInfoFrmDb",
			SUCCESSFULLY_REFUND_HOME = "successUserRefund", BEFORE_LOGIN_AUTHENTICATION = "beforeLoginPayment",
			USER_PAYMENT_DETAILS = "userPaymentRequestInfo", PAYMENT_ERROR = "paymentErrorPage",
			PAYMENT_SUCCESSFULLY_PAGE = "userPaymentResponseInfo";

	@Autowired
	ServletContext servletContext;

	@Autowired
	ILoginService iLoginService;

	
	
	@Autowired
	IInstamojoPaymentService iInstamojoPaymentService; //this i add 14 jun

	// refund
	@RequestMapping(value = "/refund", method = { RequestMethod.GET })
	public String getRefund() throws Exception {
		return PAYMENT_REFUND_HOME;
	}
	
	String duration_global;

	// refund user info from database
	@RequestMapping(value = "/refundInfoFrmDb", method = { RequestMethod.POST })
	public String getUserRefundInfo(@ModelAttribute UserPaymentCommand userPaymentCommand, ModelMap modelMap) {

		List<PaymentHistoryBO> userInfoList = iInstamojoPaymentService.getUserPaymentDEtails(userPaymentCommand);
		if (userInfoList == null || userInfoList.size() <= 0) {
			// with message youe payment is is not matching
			// System.out.println("from db we getting null as user info");
			modelMap.addAttribute("status", "Login ID/Payment Id incorrect");
			return PAYMENT_REFUND_HOME;
		} else {
			UserPaymentCommand userPaymentCommand1 = new UserPaymentCommand();
			userPaymentCommand1.setBuyer_userId(userInfoList.get(0).getBuyer_userId());
			userPaymentCommand1.setPhone(Long.toString(userInfoList.get(0).getPhone()));
			userPaymentCommand1.setEmail(userInfoList.get(0).getEmail());
			userPaymentCommand1.setAmount(Float.toString(userInfoList.get(0).getAmount()));
			userPaymentCommand1.setPayment_id(userInfoList.get(0).getPayment_id());
			modelMap.addAttribute("userList", userPaymentCommand1);
			return USER_REFUND_DETAILS;
		}
	}

	// refund user info from database
	@RequestMapping(value = "/refund/amount", method = { RequestMethod.POST })
	public String getRequestForRefund(@ModelAttribute UserPaymentCommand userPaymentCommand, ModelMap modelMap,
			HttpServletRequest httpServletRequest) throws JSONException {
		// System.out.println(userPaymentCommand.getPurpose());
		// List<PaymentHistoryBO>
		// userList=iPaymentService.getUserPaymentDEtails(userPaymentCommand);
		// System.out.println("moving forward to server to get refunf
		// response");
		Map<String, String> contextPatameterMap = null;
		ServletContext context = httpServletRequest.getServletContext();
		contextPatameterMap = new HashMap<String, String>();

		String api_key = context.getInitParameter("api_key");
		String auth_token = context.getInitParameter("auth_token");
		// String
		// paymentRequestStatus_url=servletContext.getInitParameter("paymentRequestStatus_url");
		// String redirect_url=servletContext.getInitParameter("redirect_url");
		// String webhook_url=servletContext.getInitParameter("webhook_url");
		String refund_url = servletContext.getInitParameter("refund_url");
        String buyer_userId=userPaymentCommand.getBuyer_userId();
		contextPatameterMap.put("api_key", api_key);
		contextPatameterMap.put("auth_token", auth_token);
		contextPatameterMap.put("refund_url", refund_url);
		contextPatameterMap.put("buyer_userId", buyer_userId);

		List<PaymentHistoryBO> userInfo1 = null;
		userInfo1 =iInstamojoPaymentService.getRefundRequest(userPaymentCommand, contextPatameterMap);
		if (userInfo1 == null || userInfo1.size() <= 0) {
			modelMap.addAttribute("status", "Refund might be failed due to already refund or wrong user info");
		} else
			modelMap.addAttribute("userInfo1", userInfo1);

		// If Refund is suuscessfully done

		return SUCCESSFULLY_REFUND_HOME;
	}

	// after subscrition fiest controller
	@RequestMapping(value = "/suscribe", method = { RequestMethod.GET })
	public String getPayemntGateway(HttpServletRequest httpServletRequest, ModelMap modelMap) throws Exception {
		HttpSession session = httpServletRequest.getSession(false);

		String time = httpServletRequest.getParameter("time");
		String price = httpServletRequest.getParameter("price");

		session.setAttribute("duration", time);
		session.setAttribute("duration_price", price);
		modelMap.addAttribute("time", time);
		modelMap.addAttribute("price", price);

		return BEFORE_LOGIN_AUTHENTICATION;

	}

	/**
	 * PREPARED BY :JITENDRA KUMAR NAME :LOGIN VALIDATION PURPOSE :TO CHECK
	 * WHETHER USER EXISTS OR NOT
	 */
	// after login click
	@RequestMapping(value = "/paymentAuthenticate", method = { RequestMethod.POST })
	public String getPayemntGateway(@Valid @ModelAttribute LoginCommand logincommand, ModelMap modelMap,
			BindingResult bindingResult, HttpServletRequest httpServletRequest) throws Exception {
		if (bindingResult.hasErrors()) {
			return BEFORE_LOGIN_AUTHENTICATION;
		} else {
			HttpSession ses = httpServletRequest.getSession();

			String time = (String) ses.getAttribute("duration");
			String price = (String) ses.getAttribute("duration_price");
			//System.out.println("In Authentication :"+time);
			List<UserMstrBO> userInfoList = null;
			userInfoList = iLoginService.checkUserName_pswd_beforeLogin(logincommand);
			if (userInfoList == null || userInfoList.size() <= 0) {
				modelMap.addAttribute("status", "Incorrect Login ID/Password");
				return BEFORE_LOGIN_AUTHENTICATION;
			} else {
				UserProfileCommand userProfileCommand = new UserProfileCommand();
				userProfileCommand.setUserName(userInfoList.get(0).getUname());
				userProfileCommand.setFirstName(userInfoList.get(0).getFirstname());
				userProfileCommand.setLastName(userInfoList.get(0).getLastname());
				userProfileCommand.setMobile("" + userInfoList.get(0).getPh_no());
				userProfileCommand.setEmail(userInfoList.get(0).getEmail_id());
				userProfileCommand.setAddressLine(userInfoList.get(0).getAddressLine());
				userProfileCommand.setOccupation(userInfoList.get(0).getOccupation());
				userProfileCommand.setState(userInfoList.get(0).getState());
				userProfileCommand.setCountry(userInfoList.get(0).getCountry());
				modelMap.addAttribute("time", time);
				modelMap.addAttribute("price", price);
				modelMap.addAttribute("UserDate", userProfileCommand);

			}
			return USER_PAYMENT_DETAILS;
		}
	}

	// after make payment click
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public String getPaymentInfo(@ModelAttribute UserPaymentCommand userPaymentCommand, ModelMap modelMap,
			BindingResult bindingResult,HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
		if (bindingResult.hasErrors()) {
			return BEFORE_LOGIN_AUTHENTICATION;
		} else {
		
		Map<String, String> contextPatameterMap = null;
		ServletContext context = httpServletRequest.getServletContext();
		contextPatameterMap = new HashMap<String, String>();
		
		String api_key = context.getInitParameter("api_key");
		String auth_token = context.getInitParameter("auth_token");
		String paymentRequestStatus_url = servletContext.getInitParameter("paymentRequestStatus_url");
		String redirect_url = servletContext.getInitParameter("redirect_url");
		String webhook_url = servletContext.getInitParameter("webhook_url");
		// System.out.println(webhook_url);

		contextPatameterMap.put("api_key", api_key);
		contextPatameterMap.put("auth_token", auth_token);
		contextPatameterMap.put("paymentRequestStatus_url", paymentRequestStatus_url);
		contextPatameterMap.put("redirect_url", redirect_url);
		contextPatameterMap.put("webhook_url", webhook_url);
		
		Map<String, String> map = iInstamojoPaymentService.callPayment(userPaymentCommand, contextPatameterMap);
		if (map == null || map.size() <= 0) {
			if (map.get("responseCode").equalsIgnoreCase("unsuccessful")) {
				return PAYMENT_ERROR;
			}
		}
		
		String longurlValue = map.get("longurl");
		httpServletResponse.sendRedirect(longurlValue);
		return BEFORE_LOGIN_AUTHENTICATION;
		}
	}

	@RequestMapping(value = "/paymentRedirect", method = RequestMethod.GET)
	public ModelAndView getPaymentRedirect(@ModelAttribute UserPaymentCommand userPaymentCommand,
			HttpServletRequest httpRequest) throws Exception {
		ModelAndView modelAndView = null;
		modelAndView = new ModelAndView(PAYMENT_SUCCESSFULLY_PAGE);

		String payment_request_id = httpRequest.getParameter("payment_request_id");
		HttpSession session = httpRequest.getSession();
		String duration = (String) session.getAttribute("duration");
		duration_global=duration;
		//System.out.println("Duration in LongURL : "+duration);
		ServletContext context = httpRequest.getServletContext();
		String paymentRequestStatus_url = servletContext.getInitParameter("paymentRequestStatus_url");
		String api_key = context.getInitParameter("api_key");
		String auth_token = context.getInitParameter("auth_token");

		List<PaymentHistoryBO> paymentInfo = null;

		paymentInfo = iInstamojoPaymentService.getPaymentStatus(payment_request_id, paymentRequestStatus_url, api_key,
				auth_token, duration);
		if (paymentInfo == null || paymentInfo.get(0) == null) {
			modelAndView = new ModelAndView(BEFORE_LOGIN_AUTHENTICATION);
			modelAndView.addObject("status", " Payment Request Failed... Try Again...");
			return modelAndView;
		} else {
			modelAndView.addObject("userInfo", paymentInfo);
			
			//Payment SuccessFully Done...
			iInstamojoPaymentService.sendMailtoUser(paymentInfo.get(0));
			
			return modelAndView;
		}
	}
	// webhook url as post request

	@RequestMapping(value =  "/webhook", method = RequestMethod.POST)//"/webhook"
	public ModelAndView getWebhook_url(HttpServletRequest httpRequest) throws Exception {
		ModelAndView modelAndView = null;
		

		String duration = duration_global;
		String buyer_userId = httpRequest.getParameter("buyer_name");
		String payment_request_id = httpRequest.getParameter("payment_request_id");
		String payment_id = httpRequest.getParameter("payment_id");
		String email = httpRequest.getParameter("email");
		String phone = httpRequest.getParameter("phone");
		String status = httpRequest.getParameter("status");
		String currency = httpRequest.getParameter("currency");
		String amount = httpRequest.getParameter("amount");
		String fees = httpRequest.getParameter("fees");
		String deposit_date = httpRequest.getParameter("created_at");
		String refund_id = httpRequest.getParameter("refund_id");
		String type = httpRequest.getParameter("type");
		String body = httpRequest.getParameter("body");
		String refund_amount = httpRequest.getParameter("refund_amount");
		String refund_date = httpRequest.getParameter("created_at");
		String total_amount = httpRequest.getParameter("total_amount");

		// insert into table after every success/or failure
		Map<String, String> requestMap = new HashMap<String, String>();
		requestMap.put("buyer_userId", buyer_userId);
		requestMap.put("payment_request_id", payment_request_id);
		requestMap.put("payment_id", payment_id);
		requestMap.put("email", email);
		requestMap.put("phone", phone);
		requestMap.put("status", status);
		requestMap.put("currency", currency);
		requestMap.put("amount", amount);
		requestMap.put("fees", fees);
		requestMap.put("deposit_date", deposit_date);
		requestMap.put("refund_id", refund_id);
		requestMap.put("type", type);
		requestMap.put("body", body);
		requestMap.put("refund_amount", refund_amount);
		requestMap.put("refund_date", refund_date);
		requestMap.put("total_amount", total_amount);
		requestMap.put("duration", duration);
		
	//	int checkForSameRequestId = iPaymentService.checkSameRequestId(payment_request_id);

		if (status.equalsIgnoreCase("Credit")) {
			
			List<PaymentHistoryBO> paymentHistoryBOs=iInstamojoPaymentService.saveAndExtractPayemntInfo(requestMap);
			
			if(paymentHistoryBOs==null||paymentHistoryBOs.size()<0)
			{
				modelAndView = new ModelAndView("404_error");
				modelAndView.addObject("status", "Internal problem Contact to equityjudge team...");
				return modelAndView;
				// If Payment is Not successfully done....
			}
			else{
				modelAndView=new ModelAndView("PAYMENT_SUCCESSFULLY_PAGE");
				modelAndView.addObject("userInfo", paymentHistoryBOs);

				// If Payment SuccessFully Done.....

					
				return modelAndView;
			}
			
		} else if (status.equalsIgnoreCase("Refunded")) {
			// update and response
			modelAndView=new ModelAndView(SUCCESSFULLY_REFUND_HOME);
		
		 List<PaymentHistoryBO> extractRefundInfo=iInstamojoPaymentService.updateAndExtractRefundInfo(requestMap);
			if (extractRefundInfo == null || extractRefundInfo.size() <= 0) {
				modelAndView.addObject("status", "Refund Already Done");
				return modelAndView;
			} else
				duration="0 Days";
			    iLoginService.updateSubscription(duration, buyer_userId);
				modelAndView.addObject("userInfo1", extractRefundInfo);

			// If Refund is suuscessfully done

			return modelAndView;
		 
		  
		} 
	
	
	else {
			// insert and response in case of failure
		
		 List<PaymentHistoryBO> extractPaymentInfo=iInstamojoPaymentService.storeAndExtractPayFailureInfo(requestMap);
			if (extractPaymentInfo == null || extractPaymentInfo.size() <= 0) {
				return new ModelAndView("404_error");
			} else
				 modelAndView=new ModelAndView("PAYMENT_SUCCESSFULLY_PAGE");
				modelAndView.addObject("userInfo1", extractPaymentInfo);


			return modelAndView;
		}

	}
	
	
	
	
	
	
	
	
	
	

}
