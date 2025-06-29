//package com.nivesh.bo;
//
//import java.io.Serializable;
//import java.util.Date;
//
//public class DailyPatternReportBO extends BaseBO implements Serializable {
//	
//	/**
//	 * 
//	 */
//	private static final long serialVersionUID = 1L;
//	private String companyName;
//	private String pattern_Name;
//	private String suggestion;
//	private Date forming_Date;
//	private float close_price;
//	private String status;
//	public String getCompanyName() {
//		return companyName;
//	}
//	public void setCompanyName(String companyName) {
//		this.companyName = companyName;
//	}
//	public String getPattern_Name() {
//		return pattern_Name;
//	}
//	public void setPattern_Name(String pattern_Name) {
//		this.pattern_Name = pattern_Name;
//	}
//	public String getSuggestion() {
//		return suggestion;
//	}
//	public void setSuggestion(String suggestion) {
//		this.suggestion = suggestion;
//	}
//	
//	public Date getForming_Date() {
//		return forming_Date;
//	}
//	public void setForming_Date(Date forming_Date) {
//		this.forming_Date = forming_Date;
//	}
//	public String getStatus() {
//		return status;
//	}
//	public void setStatus(String status) {
//		this.status = status;
//	}
//	
//		public float getClose_price() {
//		return close_price;
//	}
//
//	public void setClose_price(float close_price) {
//		this.close_price = close_price;
//	}
//	
//	@Override
//    public String toString() {
//        return "DailyPatternReportBO{" +
//               "companyName='" + companyName + '\'' +
//               ", pattern_Name='" + pattern_Name + '\'' +
//               ", suggestion='" + suggestion + '\'' +
//               ", forming_Date=" + forming_Date +
//               "close_price='" + close_price + '\'' +
//               '}';
//    }
//
//	
//	
//}



package com.nivesh.bo;

import java.io.Serializable;
import java.util.Date;

public class DailyPatternReportBO extends BaseBO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String companyName;
	private String pattern_Name;
	private String suggestion;
	private Date forming_Date;
	private float value;
	private float close_price;
	private String status;

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getPattern_Name() {
		return pattern_Name;
	}

	public void setPattern_Name(String pattern_Name) {
		this.pattern_Name = pattern_Name;
	}

	public String getSuggestion() {
		return suggestion;
	}

	public void setSuggestion(String suggestion) {
		this.suggestion = suggestion;
	}

	public Date getForming_Date() {
		return forming_Date;
	}

	public void setForming_Date(Date forming_Date) {
		this.forming_Date = forming_Date;
	}

	public float getValue() {
		return value;
	}

	public void setValue(float value) {
		this.value =  value;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	public float getClose_price() {
		return close_price;
	}

	public void setClose_price(float close_price) { 	
		this.close_price = close_price;
	}

	@Override
	public String toString() {
		return "DailyPatternReportBO [companyName=" + companyName + ", pattern_Name=" + pattern_Name + ", suggestion="
				+ suggestion + ", forming_Date=" + forming_Date + ", value=" + value + ", close_price=" + close_price
				+ ", status=" + status + "]";
	}
	
}
