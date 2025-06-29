package com.nivesh.bo;

import java.io.Serializable;
import java.util.Date;

public class WatchListBO implements Serializable{

	private static final long serialVersionUID = 1L;

	private String company_name;
	private int company_code;
	private Date initiated_date;
	private float liveprice;
	private float previous_closeprice;
	private float intraday_High;
	private float intraday_Low;
	private Float change_in_value;
	private float  percentage_Change;
	private String suggestion;
	private Date suggestion_Date;
	private String status;
	private String audit_action;
	private String user_id;
	private Date audit_date_time;
	private float latest_value;
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public int getCompany_code() {
		return company_code;
	}
	public void setCompany_code(int company_code) {
		this.company_code = company_code;
	}
	public Date getInitiated_date() {
		return initiated_date;
	}
	public void setInitiated_date(Date initiated_date) {
		this.initiated_date = initiated_date;
	}
	public float getLiveprice() {
		return liveprice;
	}
	public void setLiveprice(float liveprice) {
		this.liveprice = liveprice;
	}
	public float getPrevious_closeprice() {
		return previous_closeprice;
	}
	public void setPrevious_closeprice(float previous_closeprice) {
		this.previous_closeprice = previous_closeprice;
	}
	public float getIntraday_High() {
		return intraday_High;
	}
	public void setIntraday_High(float intraday_High) {
		this.intraday_High = intraday_High;
	}
	public float getIntraday_Low() {
		return intraday_Low;
	}
	public void setIntraday_Low(float intraday_Low) {
		this.intraday_Low = intraday_Low;
	}
	public float getChange_in_value() {
		return change_in_value;
	}
	public void setChange_in_value(float change_in_value) {
		this.change_in_value = change_in_value;
	}
	public float getPercentage_Change() {
		return percentage_Change;
	}
	public void setPercentage_Change(float percentage_Change) {
		this.percentage_Change = percentage_Change;
	}
	public String getSuggestion() {
		return suggestion;
	}
	public void setSuggestion(String suggestion) {
		this.suggestion = suggestion;
	}
	
	public Date getSuggestion_Date() {
		return suggestion_Date;
	}
	public void setSuggestion_Date(Date suggestion_Date) {
		this.suggestion_Date = suggestion_Date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAudit_action() {
		return audit_action;
	}
	public void setAudit_action(String audit_action) {
		this.audit_action = audit_action;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getAudit_date_time() {
		return audit_date_time;
	}
	public void setAudit_date_time(Date audit_date_time) {
		this.audit_date_time = audit_date_time;
	}
	public float getLatest_value() {
		return latest_value;
	}
	public void setLatest_value(float latest_value) {
		this.latest_value = latest_value;
	}
	@Override
	public String toString() {
		return "WatchListBO [company_name=" + company_name + ", company_code=" + company_code + ", initiated_date="
				+ initiated_date + ", liveprice=" + liveprice + ", previous_closeprice=" + previous_closeprice
				+ ", intraday_High=" + intraday_High + ", intraday_Low=" + intraday_Low + ", change_in_value="
				+ change_in_value + ", percentage_Change=" + percentage_Change + ", suggestion=" + suggestion
				+ ", suggestion_Date=" + suggestion_Date + ", status=" + status + ", audit_action=" + audit_action
				+ ", user_id=" + user_id + ", audit_date_time=" + audit_date_time + ", latest_value=" + latest_value
				+ "]";
	}
	
	
	
	
	
	


}
