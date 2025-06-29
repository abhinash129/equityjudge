package com.nivesh.bo;

import java.sql.Date;

public class AccuracyBO {
	
	
	public String patternName;
	public String suggestion;
	public String weeks;
	public String accuracy;
	public Date accdate;
	public int totalCompanies;
	public String commulative_accuracy_15Days;
	
	
	
	
	
	public int getTotalCompanies() {
		return totalCompanies;
	}
	public void setTotalCompanies(int totalCompanies) {
		this.totalCompanies = totalCompanies;
	}
	public String getCommulative_accuracy_15Days() {
		return commulative_accuracy_15Days;
	}
	public void setCommulative_accuracy_15Days(String commulative_accuracy_15Days) {
		this.commulative_accuracy_15Days = commulative_accuracy_15Days;
	}
	public String getPatternName() {
		return patternName;
	}
	public void setPatternName(String patternName) {
		this.patternName = patternName;
	}
	public String getSuggestion() {
		return suggestion;
	}
	public void setSuggestion(String suggestion) {
		this.suggestion = suggestion;
	}
	public String getWeeks() {
		return weeks;
	}
	public void setWeeks(String weeks) {
		this.weeks = weeks;
	}
	public String getAccuracy() {
		return accuracy;
	}
	public void setAccuracy(String accuracy) {
		this.accuracy = accuracy;
	}
	public Date getAccdate() {
		return accdate;
	}
	public void setAccdate(Date accdate) {
		this.accdate = accdate;
	}
	
	
}
