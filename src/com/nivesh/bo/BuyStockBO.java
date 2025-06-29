package com.nivesh.bo;

import java.io.Serializable;
import java.util.Date;


public class BuyStockBO implements Serializable{
	
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	@Override
	public String toString() {
		return "BuyStockBO [p_id=" + p_id + ", sc_code=" + sc_code + ", date=" + date + ", price=" + price
				+ ", no_of_shrs=" + no_of_shrs + ", status=" + status + ", audit_action=" + audit_action + ", user_id="
				+ user_id + ", audit_date_time=" + audit_date_time + ", current_rate=" + current_rate + ", buy_rate="
				+ buy_rate + ", current_value=" + current_value + ", buy_value=" + buy_value + ", qunatity=" + qunatity
				+ ", gain_or_loss=" + gain_or_loss + ", appreciation=" + appreciation + ", holding_percentage="
				+ holding_percentage + ", sc_name=" + sc_name + "]";
	}

	private int p_id;
	private int sc_code;
	private Date date;
	private float price;
	private int no_of_shrs;
	private String status;
	private String audit_action;
	private String user_id;
	private Date audit_date_time;
	private float current_rate;
	private float buy_rate;
	private float current_value;
	private float buy_value;
	private int qunatity;
	private float gain_or_loss;
	private float appreciation;
	private float holding_percentage;
	private String sc_name;
	
	
	public int getSc_code() {
		return sc_code;
	}
	
	public void setSc_code(int sc_code) {
		this.sc_code = sc_code;
	}
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
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


	public String getSc_name() {
		return sc_name;
	}

	public void setSc_name(String sc_name) {
		this.sc_name = sc_name;
	}
}