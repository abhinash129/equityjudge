package com.nivesh.dto.payment;

public class Refund_request {
	@Override
	public String toString() {
		return "Refund_request [payment_id=" + payment_id + ", type=" + type + ", body=" + body + ", total_amount="
				+ total_amount + ", refund_amount=" + refund_amount + ", buyer_name=" + buyer_name + ", longurl="
				+ longurl + ", redirect_url=" + redirect_url + ", email_status=" + email_status + ", phone=" + phone
				+ ", status=" + status + ", sms_status=" + sms_status + ", created_at=" + created_at + ", id=" + id
				+ ", amount=" + amount + ", send_email=" + send_email + ", send_sms=" + send_sms + ", email=" + email
				+ ", webhook=" + webhook + ", getPayment_id()=" + getPayment_id() + ", getType()=" + getType()
				+ ", getBody()=" + getBody() + ", getTotal_amount()=" + getTotal_amount() + ", getRefund_amount()="
				+ getRefund_amount() + ", getBuyer_name()=" + getBuyer_name() + ", getLongurl()=" + getLongurl()
				+ ", getRedirect_url()=" + getRedirect_url() + ", getEmail_status()=" + getEmail_status()
				+ ", getPhone()=" + getPhone() + ", getStatus()=" + getStatus() + ", getSms_status()=" + getSms_status()
				+ ", getCreated_at()=" + getCreated_at() + ", getId()=" + getId() + ", getAmount()=" + getAmount()
				+ ", getSend_email()=" + getSend_email() + ", getSend_sms()=" + getSend_sms() + ", getEmail()="
				+ getEmail() + ", getWebhook()=" + getWebhook() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}


	@org.codehaus.jackson.annotate.JsonProperty("payment_id")
	private java.lang.String payment_id;

	
	public java.lang.String getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(java.lang.String payment_id) {
		this.payment_id = payment_id;
	}
	@org.codehaus.jackson.annotate.JsonProperty("type")
	private java.lang.String type;

	public java.lang.String getType() {
		return type;
	}

	public void setType(java.lang.String type) {
		this.type = type;
	}
	@org.codehaus.jackson.annotate.JsonProperty("body")
	private java.lang.String body;
	
	
	public java.lang.String getBody() {
		return body;
	}

	public void setBody(java.lang.String body) {
		this.body = body;
	}
	
	@org.codehaus.jackson.annotate.JsonProperty("total_amount")
	private java.lang.String total_amount;
	
	public java.lang.String getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(java.lang.String total_amount) {
		this.total_amount = total_amount;
	}

	public java.lang.String getRefund_amount() {
		return refund_amount;
	}

	public void setRefund_amount(java.lang.String refund_amount) {
		this.refund_amount = refund_amount;
	}
	@org.codehaus.jackson.annotate.JsonProperty("refund_amount")
	private java.lang.String refund_amount;
	@org.codehaus.jackson.annotate.JsonProperty("buyer_name")
	private java.lang.String buyer_name;

 	public void setBuyer_name(java.lang.String buyer_name) {
		this.buyer_name = buyer_name;
	}

	public java.lang.String getBuyer_name() {
		return buyer_name;
	}

	@org.codehaus.jackson.annotate.JsonProperty("longurl")
	private java.lang.String longurl;

 	public void setLongurl(java.lang.String longurl) {
		this.longurl = longurl;
	}

	public java.lang.String getLongurl() {
		return longurl;
	}

	@org.codehaus.jackson.annotate.JsonProperty("redirect_url")
	private java.lang.String redirect_url;

 	public void setRedirect_url(java.lang.String redirect_url) {
		this.redirect_url = redirect_url;
	}

	public java.lang.String getRedirect_url() {
		return redirect_url;
	}

	@org.codehaus.jackson.annotate.JsonProperty("email_status")
	private java.lang.String email_status;

 	public void setEmail_status(java.lang.String email_status) {
		this.email_status = email_status;
	}

	public java.lang.String getEmail_status() {
		return email_status;
	}

	@org.codehaus.jackson.annotate.JsonProperty("phone")
	private java.lang.String phone;

 	public void setPhone(java.lang.String phone) {
		this.phone = phone;
	}

	public java.lang.String getPhone() {
		return phone;
	}

	@org.codehaus.jackson.annotate.JsonProperty("status")
	private java.lang.String status;

 	public void setStatus(java.lang.String status) {
		this.status = status;
	}

	public java.lang.String getStatus() {
		return status;
	}

	@org.codehaus.jackson.annotate.JsonProperty("sms_status")
	private java.lang.String sms_status;

 	public void setSms_status(java.lang.String sms_status) {
		this.sms_status = sms_status;
	}

	public java.lang.String getSms_status() {
		return sms_status;
	}

	@org.codehaus.jackson.annotate.JsonProperty("created_at")
	private java.lang.String created_at;

 	public void setCreated_at(java.lang.String created_at) {
		this.created_at = created_at;
	}

	public java.lang.String getCreated_at() {
		return created_at;
	}

	@org.codehaus.jackson.annotate.JsonProperty("id")
	private java.lang.String id;

 	public void setId(java.lang.String id) {
		this.id = id;
	}

	public java.lang.String getId() {
		return id;
	}

	@org.codehaus.jackson.annotate.JsonProperty("amount")
	private java.lang.String amount;

 	public void setAmount(java.lang.String amount) {
		this.amount = amount;
	}

	public java.lang.String getAmount() {
		return amount;
	}

	@org.codehaus.jackson.annotate.JsonProperty("send_email")
	private java.lang.Boolean send_email;

 	public void setSend_email(java.lang.Boolean send_email) {
		this.send_email = send_email;
	}

	public java.lang.Boolean getSend_email() {
		return send_email;
	}

	@org.codehaus.jackson.annotate.JsonProperty("send_sms")
	private java.lang.Boolean send_sms;

 	public void setSend_sms(java.lang.Boolean send_sms) {
		this.send_sms = send_sms;
	}

	public java.lang.Boolean getSend_sms() {
		return send_sms;
	}

	@org.codehaus.jackson.annotate.JsonProperty("email")
	private java.lang.String email;

 	public void setEmail(java.lang.String email) {
		this.email = email;
	}

	public java.lang.String getEmail() {
		return email;
	}

	@org.codehaus.jackson.annotate.JsonProperty("webhook")
	private java.lang.String webhook;

 	public void setWebhook(java.lang.String webhook) {
		this.webhook = webhook;
	}

	public java.lang.String getWebhook() {
		return webhook;
	}
}
