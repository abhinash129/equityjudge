package com.nivesh.bo;

import java.io.Serializable;
import java.util.Date;

import com.nivesh.util.AllAnnotation;

public class UserRoleBO implements Serializable 
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@AllAnnotation.IdAnnotation
	private String userroleid;
	private String uname;
	private String roleid;
	private String description;
	private String status;
	private String auditaction;
	private Date auditdatetime;
	private String userid;
	private String rolename;
	
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public String getUserroleid() {
		return userroleid;
	}
	public void setUserroleid(String userroleid) {
		this.userroleid = userroleid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getRoleid() {
		return roleid;
	}
	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAuditaction() {
		return auditaction;
	}
	public void setAuditaction(String auditaction) {
		this.auditaction = auditaction;
	}

	public Date getAuditdatetime() {
		return auditdatetime;
	}
	public void setAuditdatetime(Date auditdatetime) {
		this.auditdatetime = auditdatetime;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
	
}
