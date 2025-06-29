package com.nivesh.bo;

import java.io.Serializable;


public class Portfoliobo implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String sc_name;    //change all field name to String type by sandeep and generate setter and getter
	private String date;
	private String price;
	private String no_of_shrs;
	private String active;
	private String audit_action;
	private String user_id;
	private String audit_date_time;
	private float current_rate;
	private float buy_rate;
	private float current_value;
	private float buy_value;
	private int qunatity;
	private float gain_or_loss;
	private float appreciation;
	private float holding_percentage;
	
	public String getSc_name() {
		return sc_name;
	}
	public void setSc_name(String sc_name) {
		this.sc_name = sc_name;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getNo_of_shrs() {
		return no_of_shrs;
	}
	public void setNo_of_shrs(String no_of_shrs) {
		this.no_of_shrs = no_of_shrs;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
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
	public String getAudit_date_time() {
		return audit_date_time;
	}
	public void setAudit_date_time(String audit_date_time) {
		this.audit_date_time = audit_date_time;
	}
	public float getCurrent_rate() {
		return current_rate;
	}
	public void setCurrent_rate(float current_rate) {
		this.current_rate = current_rate;
	}
	public float getBuy_rate() {
		return buy_rate;
	}
	public void setBuy_rate(float buy_rate) {
		this.buy_rate = buy_rate;
	}
	public float getCurrent_value() {
		return current_value;
	}
	public void setCurrent_value(float current_value) {
		this.current_value = current_value;
	}
	public float getBuy_value() {
		return buy_value;
	}
	public void setBuy_value(float buy_value) {
		this.buy_value = buy_value;
	}
	public int getQunatity() {
		return qunatity;
	}
	public void setQunatity(int qunatity) {
		this.qunatity = qunatity;
	}
	@Override
	public String toString() {
		return "Portfoliobo [sc_name=" + sc_name + ", date=" + date + ", price=" + price + ", no_of_shrs=" + no_of_shrs
				+ ", active=" + active + ", audit_action=" + audit_action + ", user_id=" + user_id
				+ ", audit_date_time=" + audit_date_time + ", current_rate=" + current_rate + ", buy_rate=" + buy_rate
				+ ", current_value=" + current_value + ", buy_value=" + buy_value + ", qunatity=" + qunatity + "]";
	}
	public float getGain_or_loss() {
		return gain_or_loss;
	}
	public void setGain_or_loss(float gain_or_loss) {
		this.gain_or_loss = gain_or_loss;
	}
	public float getAppreciation() {
		return appreciation;
	}
	public void setAppreciation(float appreciation) {
		this.appreciation = appreciation;
	}
	public float getHolding_percentage() {
		return holding_percentage;
	}
	public void setHolding_percentage(float holding_percentage) {
		this.holding_percentage = holding_percentage;
	}



}