package com.nivesh.service.dashboard;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nivesh.bo.AccuracyBO;
import com.nivesh.bo.ContactUsBO;
import com.nivesh.bo.CustomPriceBO;
import com.nivesh.bo.EmailBO;
import com.nivesh.bo.UserLogBO;
import com.nivesh.command.dashboard.ContactUsCommand;
import com.nivesh.dao.dashboard.IDBDashboardDao;
import com.nivesh.util.ApplicationConstant;
import com.nivesh.util.DateHelper;
import com.nivesh.util.IEmailMessageSend;
import com.nivesh.util.IEncryptDecryptServices;

@Service
@Transactional
public class DashboardServicesImpl implements IDashboardServices{

	@Resource
	private IDBDashboardDao idbDashboardDao;
	public void setIdbDashboardDao(IDBDashboardDao idbDashboardDao) {
		this.idbDashboardDao = idbDashboardDao;
	}

	@Autowired
	private IEmailMessageSend emailMessageSend;

	@Autowired
	IEncryptDecryptServices iEncryptDecryptServices;




	@Override
	public List<Integer> getPrice() {
		return idbDashboardDao.getPriceDao();

	}




	@Override
	public int contactUs(ContactUsCommand contactUsCommand) {


		ContactUsBO contactUsBO = new ContactUsBO();
		contactUsBO.setName(contactUsCommand.getFname()+"_"+contactUsCommand.getLname());
		contactUsBO.setEmail(contactUsCommand.getEmail());
		if (contactUsCommand.getPhone().equals("")) {
			contactUsCommand.setPhone(ApplicationConstant.NOT_APPLICABLE);
		}
		contactUsBO.setPhone(contactUsCommand.getPhone());
		contactUsBO.setMessage(contactUsCommand.getMessage());
		contactUsBO.setSend_date(DateHelper.todaysDateTimeInDBFormat());
		contactUsBO.setFeedback_category(ApplicationConstant.NOT_APPLICABLE);

		//For Getting SenderEmail ID
		EmailBO emailBODAO = idbDashboardDao.getSenderEmailId();

		//For Getting CEOEMail ID
		String reciverEmail = idbDashboardDao.getReciverMailID();

		int i = idbDashboardDao.contactUs(contactUsBO);
		
		
		
		String messages="<H1>Equityjudge : Contact Us </H1>"
				+ "<table>"
				+ "<tbody style='font-size:20px'>"
				+ "<tr><td>Name: </td><td> "+contactUsBO.getName()+"</td></tr>"
				+ "<tr><td>Email: </td><td> "+contactUsBO.getEmail()+"</td></tr>"
				+ "<tr><td>Date: </td><td> "+contactUsBO.getSend_date()+"</td></tr>"
				+ "<tr><td>Phone: </td><td> "+contactUsBO.getPhone()+"</td></tr><tr></tr>"
				+ "<tr><td><h4>Message:</h4> </td></tr>"
				+ "<tr><td colspan='2'> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
				+contactUsBO.getMessage()+"</td></tr>"
				+ "</tbody></table>";
		String subject = "EquityJudge : Contact Us ("+contactUsBO.getName()+")";

		EmailBO emailBO = new EmailBO();
		emailBO.setSenderEmailId(emailBODAO.getSenderEmailId());
		emailBO.setSenderPassword(emailBODAO.getSenderPassword());
		emailBO.setReciverEmailId(reciverEmail);
		emailBO.setSubject(subject);
		emailBO.setMessage(messages);
		emailMessageSend.sendMail(emailBO);

		
		emailBO.setReciverEmailId(contactUsBO.getEmail());
		SendAutoReplayMail(emailBO);
		

		if (i!=0) {
			return 1;
		} else {
			return 0;
		}
	}







	private void SendAutoReplayMail(EmailBO emailBO) {

		String messages="<p>Hello,&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>"
				+ "<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Thank you for contacting us/feedback. "
				+ "We are happy to help you. We will get back to you as soon&nbsp;as possible "
				+ "&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>"
				+ "<p>This is an auto-responder, please do not reply for this mail.</p>"
				+ "<p>_______________________________________________________________________________</p>"
				+ "<p>For further query mail us on info@equityjudge.com mail id or give<br />feedback on our"
				+ " website. Our support team will solved you query as soon as<br />possible.</p>"
				+ "<p>Thank You.<br />------------------------------<br />REGARDS<br />Equityjudge Support Team</p>"
				+ "<p>Equityjudge is a product, brought out by Qualde Digital Services Private<br />Limited."
				+ "<br />QUALDE Digital Services Pvt. Ltd. | Nester Raga Apts, Unit - D, C -<br />"
				+ "Block,Ground Floor, Outer Ring Rd, Mahadevapura, Bengaluru,<br />Karnataka-560093."
				+ "<br />chairman@qualde.com | [Website] QUALDE [1]</p>"
				+ "<p>Links:<br />------<br />[1] http://www.qualde.com</p>";
		
		
		String subject = "Auto Replay From EquityJudge";
		
		emailBO.setSubject(subject);
		emailBO.setMessage(messages);
		emailMessageSend.sendMail(emailBO);
	}




	@Override
	public int calculatePrice(List<String> priceSelection) {
		List<String> duarationlist=new LinkedList<String>();
		int total = 0;
		for (int i = 0; i < 2; i++) {
			if (priceSelection.get(i).equals("")) {
				duarationlist.add("0");
			}else{
				duarationlist.add(priceSelection.get(i));
			}
		}

		List<CustomPriceBO> list = idbDashboardDao.getCustomPrice();
		for (int i = 0; i < duarationlist.size(); i++) {
			String duration=null;
			int durationTime = Integer.parseInt(duarationlist.get(i));
			if (duarationlist.get(i).equals("0")) {
			}else{
				if (i==0) {
					duration="1 Month";
				}else if (i==1) {
					duration="1 Week";
				}
				for (int k = 0; k < list.size(); k++) {
					if (list.get(k).getDuration().equals(duration)) {
						total+=durationTime*list.get(k).getPrice();
					}
				}
			}
		}
		return total;
	}







	@Override
	public int submitFeedback(String name, String email, String category, String message) {


		ContactUsBO contactUsBO = new ContactUsBO();
		contactUsBO.setName(name);
		contactUsBO.setEmail(email);
		contactUsBO.setFeedback_category(category);
		contactUsBO.setMessage(message);
		contactUsBO.setPhone(ApplicationConstant.NOT_APPLICABLE);
		contactUsBO.setSend_date(DateHelper.todaysDateTimeInDBFormat());

		//For Getting SenderEmail ID
		EmailBO emailBODAO = idbDashboardDao.getSenderEmailId();

		//For Getting CEOEMail ID
		String reciverEmail = idbDashboardDao.getReciverMailID();

		int i = idbDashboardDao.contactUs(contactUsBO);


		String messages="<H1>Equityjudge : FeedBack  </H1>"
				+ "<table>"
				+ "<tbody style='font-size:20px'>"
				+ "<tr><td>Name: </td><td> "+contactUsBO.getName()+"</td></tr>"
				+ "<tr><td>Email: </td><td> "+contactUsBO.getEmail()+"</td></tr>"
				+ "<tr><td>Date: </td><td> "+contactUsBO.getSend_date()+"</td></tr>"
				+ "<tr><td>Feedback Category: </td><td> "+contactUsBO.getFeedback_category()+"</td></tr><tr></tr>"
				+ "<tr><td><h4>Message:</h4> </td></tr>"
				+ "<tr><td colspan='2'> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
				+contactUsBO.getMessage()+"</td></tr>"
				+ "</tbody></table>";

		String subject = "Equityjudge : Feedback of ("+contactUsBO.getName()+")";

		EmailBO emailBO = new EmailBO();
		emailBO.setSenderEmailId(emailBODAO.getSenderEmailId());
		emailBO.setSenderPassword(emailBODAO.getSenderPassword());
		emailBO.setReciverEmailId(reciverEmail);
		emailBO.setSubject(subject);
		emailBO.setMessage(messages);
		emailMessageSend.sendMail(emailBO);

		emailBO.setReciverEmailId(contactUsBO.getEmail());
		SendAutoReplayMail(emailBO);

		if (i!=0) {
			return 1;
		} else {
			return 0;
		}

	}







	@Override
	public int forgotPassword(String userName ,String email) {

		UserLogBO userLogBO=new UserLogBO();
		userLogBO.setUname(userName);
		List<Map<String, Object>> infoList=idbDashboardDao.forgotPassword(userLogBO);
		//System.out.println("......"+infoList);
		String uName=null,email_id=null,password=null;
		if(infoList.size()>0)
		{
			for (Map<String, Object> map : infoList) {
				for (Map.Entry<String, Object> entry : map.entrySet()) {
					String key = entry.getKey();
					Object value = entry.getValue();
					if(key.equals("UNAME"))
					{
						uName=(String) entry.getValue();
					}else if(key.equals("EMAIL_ID"))
					{
						email_id=(String) entry.getValue();
					}
					else{
						password=(String) entry.getValue();
					}
				}
			}
			if(email_id.equals(email)){
				try {
					password = iEncryptDecryptServices.decrypt(password);
				} catch (Exception e) {
					e.printStackTrace();
				}
				//For Getting SenderEmail ID
				EmailBO emailBODAO = idbDashboardDao.getSenderEmailId();

				/*	String messages="<H1>Equityudge : Password Recovery</H1>"
						+ "<table>"
						+ "<tbody style='font-size:20px'>"
						+ "<tr><td>User Name: </td><td> "+uName+"</td></tr>"
						+ "<tr><td>Password: </td><td> "+password+"</td></tr>"
						+ "<tr><td>Thank you.</td></tr>"
						+ "</tbody></table>";*/

				String messages="<h2>Equityudge : Password Recovery Portal</h2>"
						+ "<h3>Hello "+uName+",</h3>"
						+ "<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thank you for using our password recovery portal. We are happy to help you. "
						+ "Your Login Id and password is shown below.</p>"
						+ "<table><tbody style='font-size:17px; color:blue;'>"
						+ "<tr><td>User ID: </td><td> "+uName+"</td></tr>"
						+ "<tr><td>Password: </td><td> "+password+"</td></tr>"
						+ "</tbody></table>"
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

				String subject = "EquityJudge Password Recovery";

				EmailBO emailBO = new EmailBO();
				emailBO.setSenderEmailId(emailBODAO.getSenderEmailId());
				emailBO.setSenderPassword(emailBODAO.getSenderPassword());
				emailBO.setReciverEmailId(email_id);
				emailBO.setSubject(subject);
				emailBO.setMessage(messages);

				try {
					emailMessageSend.sendMail(emailBO);
				} catch (Exception e) {
					System.out.println("Encryption Exception:---"+e);
				}


				return 1;
			}else{
				return 0;
			}

		}
		return 0;
	}







	@Override
	public int changePassword(String username, String old_password, String new_password) {
		try {
			old_password = iEncryptDecryptServices.encrypt(old_password);
			new_password = iEncryptDecryptServices.encrypt(new_password);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return idbDashboardDao.changePassword(username,old_password,new_password);
	}




	@Override
	public List<AccuracyBO> getaccuracyList() {
		List<AccuracyBO> accList=new ArrayList<>();
		accList=idbDashboardDao.getAccuracyList();

		return accList;
	}






}
