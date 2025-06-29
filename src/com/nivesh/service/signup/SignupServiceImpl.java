package com.nivesh.service.signup;

import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.nivesh.bo.EmailBO;
import com.nivesh.bo.UserLogBO;
import com.nivesh.bo.UserMstrBO;
import com.nivesh.command.signup.SignupCommand;
import com.nivesh.dao.dashboard.IDBDashboardDao;
import com.nivesh.dao.signup.IDBSignupDao;
import com.nivesh.util.ApplicationConstant;
import com.nivesh.util.DateHelper;
import com.nivesh.util.IEmailMessageSend;
import com.nivesh.util.IEncryptDecryptServices;

@Service
@Transactional
public class SignupServiceImpl implements ISignupService {

    @Resource
    private IDBDashboardDao idbDashboardDao;
    public void setIdbDashboardDao(IDBDashboardDao idbDashboardDao) {
        this.idbDashboardDao = idbDashboardDao;
    }

    @Resource
    private IDBSignupDao idbSignupDao;
    public void setIdbSignupDao(IDBSignupDao idbSignupDao) {
        this.idbSignupDao = idbSignupDao;
    }

    @Autowired
    private IEncryptDecryptServices iEncryptDecryptServices;

    @Autowired
    private IEmailMessageSend emailMessageSend;

    @Override
    public int checkUserName(String userName) {
        UserLogBO userLogBO = new UserLogBO();
        userLogBO.setUname(userName);
        return idbSignupDao.isUName_Authenticate(userLogBO);
    }

    @Override
    @Transactional(readOnly = false)
    public String userRegistration(SignupCommand signupCommand) {
        UserLogBO userLogBO = new UserLogBO();
        UserMstrBO userMstrBO = new UserMstrBO();

        userLogBO.setUname(signupCommand.getUserName().trim());
        try {
            userLogBO.setPassword(iEncryptDecryptServices.encrypt(signupCommand.getPassword()));
        } catch (Exception e) {
            System.out.println("Encryption Exception: " + e);
        }

        userLogBO.setFirst_Login(ApplicationConstant.ACTIVE);
        userLogBO.setSubscription(ApplicationConstant.FIRSTSUBSCRIPTION);
        userLogBO.setDuration(ApplicationConstant.TRIAL_DURATION);
        userLogBO.setActive(ApplicationConstant.ACTIVE);
        userLogBO.setAudit_action(ApplicationConstant.AUDIT_ACTION_INSERT);
        userLogBO.setAudit_date_time(DateHelper.todaysDateTimeInDBFormat());
        userLogBO.setUserId(signupCommand.getUserName());
        userLogBO.setReg_date(DateHelper.todaysDateTimeInDBFormat());

        String fullname = signupCommand.getTitle() + "." + signupCommand.getFirstName();
        userMstrBO.setFirstname(fullname);
        userMstrBO.setLastname(signupCommand.getLastName());
        userMstrBO.setReachUs(signupCommand.getReachUs());

        userMstrBO.setPh_no(Long.valueOf(signupCommand.getPhoneNo()));
        userMstrBO.setEmail_id(signupCommand.getEmailAddress());
        userMstrBO.setUname(signupCommand.getUserName().trim());
        userMstrBO.setActive(ApplicationConstant.ACTIVE);
        userMstrBO.setAudit_action(ApplicationConstant.AUDIT_ACTION_INSERT);
        userMstrBO.setAudit_date_time(DateHelper.todaysDateTimeInDBFormat());
        userMstrBO.setGuest("N");

        int j = 0;
        int i = idbSignupDao.insert(userLogBO);
        if (i == 1) {
            j = idbSignupDao.insert(userMstrBO);
        }

        if (i == 1 && j == 1) {
//            sendMailToUser(signupCommand);
            return userLogBO.getUname() + "##" + userLogBO.getPassword();
        } else {
            return "unsuccess";
        }
    }

    private void sendMailToUser(SignupCommand signupCommand) {
        EmailBO emailBODAO = idbDashboardDao.getSenderEmailId();
        String reciverEmail = signupCommand.getEmailAddress();

        String messages = "<div align='center' style='border:groove; border-radius:100px; border-width:50px; background-color: snow; border-color:#CCC'>"
                + "<p><img src='http://www.equityjudge.com/resources/header/images/logo.png' width='306' height='76' /></p>"
                + "<hr width='90%' /><p><strong>Registration at EquityJudge</strong></p>"
                + "<p>Congratulations! You have successfully registered at Equityjudge.com.</p>"
                + "<p>Your UserID: <strong>" + signupCommand.getUserName() + "</strong></p>"
                + "<p>Your Password: <strong>" + signupCommand.getPassword() + "</strong></p>"
                + "<p><a href='http://www.equityjudge.com/loginfirst' target='_blank'>Login Now</a></p>"
                + "<p><strong>Note:</strong> This e-mail was sent automatically, please do not reply.</p></div>";

        EmailBO emailBO = new EmailBO();
        emailBO.setSenderEmailId(emailBODAO.getSenderEmailId());
        emailBO.setSenderPassword(emailBODAO.getSenderPassword());
        emailBO.setReciverEmailId(reciverEmail);
        emailBO.setSubject("EquityJudge Registration Completed");
        emailBO.setMessage(messages);
        emailMessageSend.sendMail(emailBO);
    }

    @Override
    public int checkEmailId(String emailAddress) {
        UserMstrBO userMstrBO = new UserMstrBO();
        userMstrBO.setEmail_id(emailAddress);
        return idbSignupDao.isEmail_Authenticate(userMstrBO);
    }

    @Override
    public int checkPhoneId(String phoneNO) {
        return idbSignupDao.isPhone_Authenticate(phoneNO);
    }

    @Override
    @Transactional(readOnly = false)
    public int updateEmailId(String email, String uname) {
        return idbSignupDao.updateemailAddress(email, uname);
    }

    @Override
    @Transactional(readOnly = false)
    public int updatePhoneNo(String mobile, String uname) {
        return idbSignupDao.updatePhoneNo(mobile, uname);
    }

    @Override
    @Transactional(readOnly = false)
    public String guestUserRegistration(SignupCommand signupCommand) {
        UserLogBO userLogBO = new UserLogBO();
        UserMstrBO userMstrBO = new UserMstrBO();

        userLogBO.setUname(signupCommand.getUserName().trim());
        try {
            userLogBO.setPassword(iEncryptDecryptServices.encrypt(signupCommand.getPassword()));
        } catch (Exception e) {
            System.out.println("Encryption Exception: " + e);
        }

        userLogBO.setFirst_Login(ApplicationConstant.ACTIVE);
        userLogBO.setSubscription(ApplicationConstant.FIRSTSUBSCRIPTION);
        userLogBO.setDuration(ApplicationConstant.ZERO_DURATION);
        userLogBO.setActive(ApplicationConstant.ACTIVE);
        userLogBO.setAudit_action(ApplicationConstant.AUDIT_ACTION_INSERT);
        userLogBO.setAudit_date_time(DateHelper.todaysDateTimeInDBFormat());
        userLogBO.setUserId(signupCommand.getUserName());
        userLogBO.setReg_date(DateHelper.todaysDateTimeInDBFormat());

        userMstrBO.setEmail_id(signupCommand.getEmailAddress());
        userMstrBO.setUname(signupCommand.getUserName().trim());
        userMstrBO.setActive(ApplicationConstant.ACTIVE);
        userMstrBO.setAudit_action(ApplicationConstant.AUDIT_ACTION_INSERT);
        userMstrBO.setAudit_date_time(DateHelper.todaysDateTimeInDBFormat());
        userMstrBO.setGuest("Y");

        int j = 0;
        int i = idbSignupDao.insertGuest(userLogBO);
        if (i == 1) {
            j = idbSignupDao.insertGuest(userMstrBO);
        }

        if (i == 1 && j == 1) {
            sendMailToUser(signupCommand);
            return userLogBO.getUname() + "##" + userLogBO.getPassword();
        } else {
            return "unsuccess";
        }
    }
}













//package com.nivesh.service.signup;
//
//import javax.annotation.Resource;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//import com.nivesh.bo.EmailBO;
//import com.nivesh.bo.UserLogBO;
//import com.nivesh.bo.UserMstrBO;
//import com.nivesh.command.signup.SignupCommand;
//import com.nivesh.dao.dashboard.IDBDashboardDao;
//import com.nivesh.dao.signup.IDBSignupDao;
//import com.nivesh.util.ApplicationConstant;
//import com.nivesh.util.DateHelper;
//import com.nivesh.util.IEmailMessageSend;
//import com.nivesh.util.IEncryptDecryptServices;
//
//
//@Service
//@Transactional
//public class SignupServiceImpl  implements ISignupService{
//
//	@Resource
//	private IDBDashboardDao idbDashboardDao;
//	public void setIdbDashboardDao(IDBDashboardDao idbDashboardDao) {
//		this.idbDashboardDao = idbDashboardDao;
//	}
//
//	
//	@Resource
//	IDBSignupDao idbSignupDao;
//	public void setIdbSignupDao(IDBSignupDao idbSignupDao) {
//		this.idbSignupDao = idbSignupDao;
//	}
//	
//	
//	@Autowired
//	IEncryptDecryptServices iEncryptDecryptServices;
//
//	@Autowired
//	private IEmailMessageSend emailMessageSend;
//
//	
//
//
//	/**
//	 * NAME :USERNAME VALIDATION
//	 * PURPOSE :USERNAME VERIFICATION
//	 */
//	@Override
//	public int checkUserName(String userName) {
//		UserLogBO userLogBO = null;
//		userLogBO = new UserLogBO();
//		userLogBO.setUname(userName);
//		int isAuth = idbSignupDao.isUName_Authenticate(userLogBO);
//		if (isAuth == 1) {
//			return 1;
//		}
//		return 0;
//
//	}
//	@Override
//    @Transactional(readOnly=false)
//	public String userRegistration(SignupCommand signupCommand) 
//	{
//
//		UserLogBO userLogBO=null;
//		UserMstrBO userMstrBO=null;
//		userLogBO=new UserLogBO();
//		userMstrBO=new UserMstrBO();
//
//		userLogBO.setUname(signupCommand.getUserName().trim());
//		//userLogBO.setPassword(signupCommand.getPassword());
//		
//		try {
//			userLogBO.setPassword(iEncryptDecryptServices.encrypt(signupCommand.getPassword()));
//		} catch (Exception e) {
//			System.out.println("Encryption Exception:---"+e);
//		}
//		 
//		userLogBO.setFirst_Login(ApplicationConstant.ACTIVE);
//		userLogBO.setSubscription(ApplicationConstant.FIRSTSUBSCRIPTION);
//		userLogBO.setDuration(ApplicationConstant.TRIAL_DURATION);
//		userLogBO.setActive(ApplicationConstant.ACTIVE);
//		userLogBO.setAudit_action(ApplicationConstant.AUDIT_ACTION_INSERT);
//		userLogBO.setAudit_date_time(DateHelper.todaysDateTimeInDBFormat());
//		userLogBO.setUserId(signupCommand.getUserName());
//		userLogBO.setReg_date(DateHelper.todaysDateTimeInDBFormat());
//	
//		String fullname=signupCommand.getTitle()+"."+signupCommand.getFirstName();
//
//		userMstrBO.setFirstname(fullname);
//		userMstrBO.setLastname(signupCommand.getLastName());
//		userMstrBO.setReachUs(signupCommand.getReachUs());
//		
//		
//		String code = signupCommand.getCode();
//	//	code = code.substring(1, 3);
//		if (code != null && code.length() > 1) { 
//		    code = code.substring(1, Math.min(3, code.length())); 
//		} else { 
//		    code = ""; // Default handling if code is too short 
//		}
//
//		String phone = signupCommand.getPhoneNo();
//		phone = phone.substring(1, 11);
//		phone = code+phone;
//		userMstrBO.setPh_no(Long.valueOf(phone));
//
//		userMstrBO.setEmail_id(signupCommand.getEmailAddress());
//		userMstrBO.setUname(signupCommand.getUserName().trim());
//		userMstrBO.setActive(ApplicationConstant.ACTIVE);
//		userMstrBO.setAudit_action(ApplicationConstant.AUDIT_ACTION_INSERT);
//		userMstrBO.setAudit_date_time(DateHelper.todaysDateTimeInDBFormat());
//
//		int j=0;
//		int i=idbSignupDao.insert(userLogBO);
//		if (i==1) {
//			j=idbSignupDao.insert(userMstrBO);	
//		}
//
//		if(i==1&&j==1){
//			sendMailToUser(signupCommand);
//			return userLogBO.getUname()+"##"+userLogBO.getPassword();
//		}else{
//			return "unsuccess";
//		}
//
//	}
//
//	private void sendMailToUser(SignupCommand signupCommand) {
//		
//		//For Getting SenderEmail ID
//		EmailBO emailBODAO = idbDashboardDao.getSenderEmailId();
//		String reciverEmail = signupCommand.getEmailAddress();
//
//		String messages="<div align='center' style='border:groove; border-radius:100px; border-width:50px; background-color: snow; border-color:#CCC'>"
//				+ "<p><img style='display: block; margin-left: auto; margin-right: auto;' src='http://192.168.0.148:8080/Nivesh_Development/resources/header/images/logo.png' alt='' width='306' height='76' /> </p>"
//				+ "<hr width='90%' />"
//				+ "<p>&nbsp; <strong style='font-size: x-large; color: green;'>Registration at Equityjudge</strong> </p>"
//				+ "<p> <span style='font-size: large;'> Congratulations! You have successfully registered an account at Equityjudge.com.&nbsp; </span> </p>"
//				+ "<p style='margin-left:-45px'> <span style='font-size: medium; font-family: 'times new roman', times;'> Your UserID : <span style='text-decoration: underline;'> <strong>"+signupCommand.getUserName()+"</strong> </span> </span> </p>"
//				+ "<p> <span style='font-size: medium; font-family: 'times new roman', times;'> Your Password : <span> <strong>"+signupCommand.getPassword()+"</strong> </span> </span> </p>"
//				+ "<p> <span style='font-size: medium; font-family: 'times new roman', times;'> Now you can login with your Credential. Thank you. </span> </p>"
//				+ "<p>&nbsp;</p>  <p> <span style='font-size: medium;padding:10px 10px 10px 10px; border:groove; background-color: #00C;'> <strong> <a href='http://192.168.0.148:8080/Nivesh_Development/loginfirst' target='_blank' style='color: #ffffff;'> Login Now </a> </strong> </span> </p>"
//				+ "<p>&nbsp;</p><p> <strong>Note:</strong>&nbsp;this e-mail was sent automatically, please, do not reply to it. </p>"
//				+ "</div>";
//
//		String subject = "Equityjudge Registration completed";
//
//		EmailBO emailBO = new EmailBO();
//		emailBO.setSenderEmailId(emailBODAO.getSenderEmailId());
//		emailBO.setSenderPassword(emailBODAO.getSenderPassword());
//		emailBO.setReciverEmailId(reciverEmail);
//		emailBO.setSubject(subject);
//		emailBO.setMessage(messages);
//		emailMessageSend.sendMail(emailBO);
//
//			
//		
//	}
//	
//	
//
//	/**
//	 * NAME :EMAIL VALIDATION
//	 * PURPOSE :EMAIL VERIFICATION
//	 */
//	@Override
//	public int checkEmailId(String emailAddress) {
//		UserMstrBO userMstrBO = null;
//		userMstrBO = new UserMstrBO();
//		userMstrBO.setEmail_id(emailAddress);
//		int isAuth = idbSignupDao.isEmail_Authenticate(userMstrBO);
//		if (isAuth >= 1) {
//			return 1;
//		}
//		return 0;
//	}
//
//
//	
//	/**
//	 * NAME :PHONE VALIDATION
//	 * PURPOSE :PHONE VERIFICATION
//	 */
//	@Override
//	public int checkPhoneId(String phoneNO) {
//		int isAuth = idbSignupDao.isPhone_Authenticate(phoneNO);
//		if (isAuth >= 1) {
//			return 1;
//		}
//		return 0;
//	}
//
//	/**
//	 * NAME :EMAIL UPDATE
//	 * PURPOSE :EMAIL UPDATE
//	 */
//	@Override
//	@Transactional(readOnly=false)
//	public int updateEmailId(String email,String uname) {
//		return idbSignupDao.updateemailAddress(email,uname);
//	}
//
//	@Override
//	@Transactional(readOnly=false)
//	public int updatePhoneNo(String mobile, String uname) {
//		return idbSignupDao.updatePhoneNo(mobile,uname);
//	}
//
//
//
//}
//
//
