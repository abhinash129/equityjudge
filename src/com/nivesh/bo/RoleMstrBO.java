package com.nivesh.bo;

import java.io.Serializable;
import java.util.Date;

import com.nivesh.util.AllAnnotation;

public class RoleMstrBO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@AllAnnotation.IdAnnotation
	private String roleid;
	private String rolename;
	private String comments;
	private String status;
	private String auditaction;
	private Date auditdatetime;
	private String userid;
	
	public String getRoleid() {
		return roleid;
	}
	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
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
