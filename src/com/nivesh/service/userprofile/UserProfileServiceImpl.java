package com.nivesh.service.userprofile;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nivesh.bo.UserLogBO;
import com.nivesh.bo.UserMstrBO;
import com.nivesh.command.userprofile.UserProfileCommand;
import com.nivesh.dao.userprofile.IDBUserProfileDao;
import com.nivesh.util.ApplicationConstant;
import com.nivesh.util.DateHelper;

@Service
@Transactional
public class UserProfileServiceImpl implements IUserProfileService {
	
	@Resource(name="userProfileDaoImpl")
	IDBUserProfileDao idbUserProfileDao;


	public void setIdbUserProfileDao(IDBUserProfileDao idbUserProfileDao) {
		this.idbUserProfileDao = idbUserProfileDao;
	}

	@Override
	public List<UserMstrBO> listof_UserSpecific_Info(String userName) {

		UserMstrBO userMstrBO = null;
		List<UserMstrBO> list = null;
		userMstrBO = new UserMstrBO();
		list = new ArrayList<UserMstrBO>();
		userMstrBO.setUname(userName);

		list = idbUserProfileDao.find_UserSpecific_Info(userMstrBO);
		return list;
	}

	@Override
	public int insert_UserSpecificInfo(UserProfileCommand profileCommand) {
		
//		System.out.println("in Service 1 : "+profileCommand);
		UserMstrBO userMstrBO = null;
		UserLogBO userLogBO = null;
		userMstrBO = new UserMstrBO();
		userLogBO = new UserLogBO();
		userMstrBO.setUname(profileCommand.getUserName());
		userMstrBO.setFirstname(profileCommand.getFirstName());
		userMstrBO.setLastname(profileCommand.getLastName());
		userMstrBO.setOccupation(profileCommand.getOccupation());
		userMstrBO.setAddressLine(profileCommand.getAddressLine());
		userMstrBO.setState(profileCommand.getState());
		userMstrBO.setCountry(profileCommand.getCountry());
		userMstrBO.setPh_no(Long.parseLong(profileCommand.getMobile()));
		userMstrBO.setEmail_id(profileCommand.getEmail());
		userMstrBO.setActive(ApplicationConstant.ACTIVE);
		userMstrBO.setAudit_action(ApplicationConstant.AUDIT_ACTION_UPDATE);
		userMstrBO.setAudit_date_time(DateHelper.todaysDateTimeInDBFormat());
		userMstrBO.setUserId(profileCommand.getUserName());
		
		

		userLogBO.setFirst_Login("N");
		userLogBO.setUname(profileCommand.getUserName());
		
//		System.out.println("In Service 2 : LOG : "+userLogBO+" MSTR : "+userMstrBO);
		
		int userMstrInsert = idbUserProfileDao.insert_Userspecific_Data(userMstrBO);
		
//		System.out.println("In Service MSTR Update : "+userMstrInsert);
		
		int userLogInsert = idbUserProfileDao.insert_Userspecific_Data(userLogBO);
		
//		System.out.println("In Service LOG Update : "+userLogInsert);
		
		if (userMstrInsert == 1 && userLogInsert == 1) {
			 return 1;
		}else{
			return 0;
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
