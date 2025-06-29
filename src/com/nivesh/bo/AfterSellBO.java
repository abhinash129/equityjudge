package com.nivesh.bo;

import java.io.Serializable;
import java.util.Date;

public class AfterSellBO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String user_id ;
	 private  int company_code ;
	 private int  sellpid ;
	 private String company_name;
	private Date sell_date;
	private int  quantity;
	 public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getCompany_code() {
		return company_code;
	}
	public void setCompany_code(int company_code) {
		this.company_code = company_code;
	}
	public int getSellpid() {
		return sellpid;
	}
	public void setSellpid(int sellpid) {
		this.sellpid = sellpid;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public Date getSell_date() {
		return sell_date;
	}
	public void setSell_date(Date sell_date) {
		this.sell_date = sell_date;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public float getSell_price() {
		return sell_price;
	}
	public void setSell_price(float sell_price) {
		this.sell_price = sell_price;
	}
	public float getAcquisition_cost() {
		return acquisition_cost;
	}
	public void setAcquisition_cost(float acquisition_cost) {
		this.acquisition_cost = acquisition_cost;
	}
	public Date getAcquisition_date() {
		return acquisition_date;
	}
	public void setAcquisition_date(Date acquisition_date) {
		this.acquisition_date = acquisition_date;
	}
	public float getProfit() {
		return profit;
	}
	public void setProfit(float profit) {
		this.profit = profit;
	}
	public String getLong_short_term() {
		return long_short_term;
	}
	public void setLong_short_term(String long_short_term) {
		this.long_short_term = long_short_term;
	}
	private float sell_price;
	private float acquisition_cost;
	 private Date acquisition_date;
	 private float profit;
	 private String long_short_term;
	
	

}
