package com.nivesh.dao.userprofile;

import java.util.List;

import com.nivesh.bo.UserMstrBO;
import com.nivesh.dao.IDao;

public interface IDBUserProfileDao  extends IDao{

	public int insert_Userspecific_Data(Object obj);

	public List<UserMstrBO> find_UserSpecific_Info(UserMstrBO userMstrBO);

}
