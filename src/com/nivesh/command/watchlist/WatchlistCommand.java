package com.nivesh.command.watchlist;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;

public class WatchlistCommand {

	
	
	
	@Override
	public String toString() {
		return "WatchlistCommand [companyName=" + companyName + ", companyCode=" + companyCode + ", buyDate=" + buyDate
				+ ", buyRate=" + buyRate + ", shares=" + shares + "]";
	}
	private String companyName;
	
	private int companyCode;
	
    @NotNull 
	private String buyDate;
	 
	@NotEmpty
	private String buyRate;
	
	@NotEmpty
	private String shares;
	
	
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
	
	public String getBuyDate() {
		return buyDate;
	}
	public void setBuyDate(String buyDate) {
		this.buyDate = buyDate;
	}

	
	
	public String getBuyRate() {
		return buyRate;
	}
	public void setBuyRate(String buyRate) {
		this.buyRate = buyRate;
	}
	public String getShares() {
		return shares;
	}
	public void setShares(String shares) {
		this.shares = shares;
	}
	public int getCompanyCode() {
		return companyCode;
	}
	public void setCompanyCode(int companyCode) {
		this.companyCode = companyCode;
	}
	
	

	
	
}
