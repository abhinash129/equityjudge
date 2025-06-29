package com.nivesh.bo;

import java.io.Serializable;

public class UserMstrBO extends BaseBO implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String uname;
	private String firstname;
	private String lastname;
	private String occupation;
	private String addressLine;
	private String state;
	private String country;
	private long ph_no;
	private String email_id;
	private String active;
	private String reachUs;
	

	
	@Override
	public String toString() {
		return "UserMstrBO [uname=" + uname + ", firstname=" + firstname + ", lastname=" + lastname + ", occupation="
				+ occupation + ", addressLine=" + addressLine + ", state=" + state + ", country=" + country + ", ph_no="
				+ ph_no + ", email_id=" + email_id + ", active=" + active + ", reachUs=" + reachUs + "]";
	}
	public String getReachUs() {
		return reachUs;
	}
	public void setReachUs(String reachUs) {
		this.reachUs = reachUs;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public String getAddressLine() {
		return addressLine;
	}
	public void setAddressLine(String addressLine) {
		this.addressLine = addressLine;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public long getPh_no() {
		return ph_no;
	}
	public void setPh_no(long ph_no) {
		this.ph_no = ph_no;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public void setGuest(String string) {
		// TODO Auto-generated method stub
		
	}
	
	

}
