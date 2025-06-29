package com.nivesh.bo;

import java.util.Date;

/**
 * @author DELL
 *
 */
public class PaymentHistoryBO {

	private String payment_request_id;
	private String payment_id;
	private String refund_id;
	private String type;
	private String body;
	private float refund_amount;
	private float total_amount;
	private String subscription_duration;
	private String purpose;
	private String buyer_userId;
	private String email;
	private Long phone;
	private String status;
	private String currency;
	private float amount;
	private float fees;
	private String deposit_date;
	private String refund_date;
	private String active;
	private String auditAction;
	private Date auditDateTime;
	
	
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getSubscription_duration() {
		return subscription_duration;
	}
	public void setSubscription_duration(String subscription_duration) {
		this.subscription_duration = subscription_duration;
	}
	public String getRefund_id() {
		return refund_id;
	}
	public void setRefund_id(String refund_id) {
		this.refund_id = refund_id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public float getRefund_amount() {
		return refund_amount;
	}
	public void setRefund_amount(float refund_amount) {
		this.refund_amount = refund_amount;
	}
	public float getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(float total_amount) {
		this.total_amount = total_amount;
	}
	
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
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
	public String getPayment_request_id() {
		return payment_request_id;
	}
	public void setPayment_request_id(String payment_request_id) {
		this.payment_request_id = payment_request_id;
	}
	public String getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Long getPhone() {
		return phone;
	}
	public String getBuyer_userId() {
		return buyer_userId;
	}
	public void setBuyer_userId(String buyer_userId) {
		this.buyer_userId = buyer_userId;
	}
	public void setPhone(Long phone) {
		this.phone = phone;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	public float getFees() {
		return fees;
	}
	public void setFees(float fees) {
		this.fees = fees;
	}
	public String getDeposit_date() {
		return deposit_date;
	}
	public void setDeposit_date(String deposit_date) {
		this.deposit_date = deposit_date;
	}
	public String getRefund_date() {
		return refund_date;
	}
	public void setRefund_date(String refund_date) {
		this.refund_date = refund_date;
	}
	
	
	@Override
	public String toString() {
		return "PaymentHistoryBO [payment_request_id=" + payment_request_id + ", payment_id=" + payment_id
				+ ", refund_id=" + refund_id + ", type=" + type + ", body=" + body + ", refund_amount=" + refund_amount
				+ ", total_amount=" + total_amount + ", subscription_duration=" + subscription_duration + ", purpose="
				+ purpose + ", buyer_userId=" + buyer_userId + ", email=" + email + ", phone=" + phone + ", status="
				+ status + ", currency=" + currency + ", amount=" + amount + ", fees=" + fees + ", deposit_date="
				+ deposit_date + ", refund_date=" + refund_date + ", active=" + active + ", auditAction=" + auditAction
				+ ", auditDateTime=" + auditDateTime + "]";
	}
	
	
	
	
	
}
