package com.nivesh.bo;

import java.util.Date;

public class SellStockBO {
	
	private int sc_code;
	private int p_id;
	private Date date;
	private float price;
	private int no_of_shrs;
	private String userId;
	private String status;
	private String auditAction;
	private Date auditDateTime;
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getNo_of_shrs() {
		return no_of_shrs;
	}
	public void setNo_of_shrs(int no_of_shrs) {
		this.no_of_shrs = no_of_shrs;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAuditAction() {
		return auditAction;
	}
	public void setAuditAction(String auditAction) {
		this.auditAction = auditAction;
	}
	public Date getAuditDateTime() {
		return auditDateTime;
	}
	public void setAuditDateTime(Date auditDateTime) {
		this.auditDateTime = auditDateTime;
	}
	public int getSc_code() {
		return sc_code;
	}
	public void setSc_code(int sc_code) {
		this.sc_code = sc_code;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	
	
	
	

}
