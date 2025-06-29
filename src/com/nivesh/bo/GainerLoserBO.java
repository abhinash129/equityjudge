package com.nivesh.bo;

public class GainerLoserBO extends BaseBO {
	private String companyName;
	private float closePrice;
	private float prevClosePrice;
	private float change_in_point;
	private float percentageVariation;
	
	
	
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public float getClosePrice() {
		return closePrice;
	}
	public void setClosePrice(float closePrice) {
		this.closePrice = closePrice;
	}
	public float getPrevClosePrice() {
		return prevClosePrice;
	}
	public void setPrevClosePrice(float prevClosePrice) {
		this.prevClosePrice = prevClosePrice;
	}
	public float getPercentageVariation() {
		return percentageVariation;
	}
	public void setPercentageVariation(float percentageVariation) {
		this.percentageVariation = percentageVariation;
	}
	public float getChange_in_point() {
		return change_in_point;
	}
	public void setChange_in_point(float change_in_point) {
		this.change_in_point = change_in_point;
	}
	@Override
	public String toString() {
		return "GainerLoserBO [companyName=" + companyName + ", closePrice=" + closePrice + ", prevClosePrice="
				+ prevClosePrice + ", change_in_point=" + change_in_point + ", percentageVariation="
				+ percentageVariation + "]";
	}
	
	

}
