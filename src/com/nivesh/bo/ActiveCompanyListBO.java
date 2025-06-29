package com.nivesh.bo;

import java.io.Serializable;

public class ActiveCompanyListBO implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private int companyCode;
	private String companyId;
	private String companyName;
	private String companyGroup;
	private Float companyFaceValue;
	private String companyIndustry;
	
	public int getCompanyCode() {
		return companyCode;
	}
	public void setCompanyCode(int companyCode) {
		this.companyCode = companyCode;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyGroup() {
		return companyGroup;
	}
	public void setCompanyGroup(String companyGroup) {
		this.companyGroup = companyGroup;
	}
	public Float getCompanyFaceValue() {
		return companyFaceValue;
	}
	public void setCompanyFaceValue(Float companyFaceValue) {
		this.companyFaceValue = companyFaceValue;
	}
	public String getCompanyIndustry() {
		return companyIndustry;
	}
	public void setCompanyIndustry(String companyIndustry) {
		this.companyIndustry = companyIndustry;
	}
	@Override
	public String toString() {
		return "ActiveCompanyListBO [companyCode=" + companyCode + ", companyId=" + companyId + ", companyName="
				+ companyName + ", companyGroup=" + companyGroup + ", companyFaceValue=" + companyFaceValue
				+ ", companyIndustry=" + companyIndustry + "]";
	}

	
	
	
	
	}
	
	
	