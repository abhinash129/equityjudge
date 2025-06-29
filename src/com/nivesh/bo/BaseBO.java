package com.nivesh.bo;

import java.util.Date;

public abstract class BaseBO {
	
	private String audit_action;
	private Date audit_date_time;
	private String userId;
	
	public String getAudit_action() {
		return audit_action;
	}
	public void setAudit_action(String audit_action) {
		this.audit_action = audit_action;
	}
	public Date getAudit_date_time() {
		return audit_date_time;
	}
	public void setAudit_date_time(Date audit_date_time) {
		this.audit_date_time = audit_date_time;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}
