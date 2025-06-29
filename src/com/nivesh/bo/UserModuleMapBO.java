package com.nivesh.bo;

import java.io.Serializable;
import java.util.Date;

import com.nivesh.util.AllAnnotation;

public class UserModuleMapBO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@AllAnnotation.IdAnnotation
	private String usermoduleid;
	private String uname;
	private String userroleid;
	private String moduleid;
	private String featureid;
	private String status;
	private String comments;
	private String auditaction;
	private Date auditdatetime;
	private String userid;
	public String getUsermoduleid() {
		return usermoduleid;
	}
	public void setUsermoduleid(String usermoduleid) {
		this.usermoduleid = usermoduleid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUserroleid() {
		return userroleid;
	}
	public void setUserroleid(String userroleid) {
		this.userroleid = userroleid;
	}
	public String getModuleid() {
		return moduleid;
	}
	public void setModuleid(String moduleid) {
		this.moduleid = moduleid;
	}
	public String getFeatureid() {
		return featureid;
	}
	public void setFeatureid(String featureid) {
		this.featureid = featureid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
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
