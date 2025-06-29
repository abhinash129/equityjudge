package com.nivesh.bo;

import java.io.Serializable;
import java.util.Date;

import com.nivesh.util.AllAnnotation;

public class FeaturMstrBO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@AllAnnotation.IdAnnotation
	private String featureid;
	private String featurename;
	private String description;
	private String status;
	private String path;
	private String auditaction;
	private Date auditdatetime;
	private String userid;
	public String getFeatureid() {
		return featureid;
	}
	public void setFeatureid(String featureid) {
		this.featureid = featureid;
	}
	public String getFeaturename() {
		return featurename;
	}
	public void setFeaturename(String featurename) {
		this.featurename = featurename;
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
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
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
