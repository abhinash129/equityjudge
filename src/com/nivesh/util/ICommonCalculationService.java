package com.nivesh.util;

import java.util.List;

import com.nivesh.bo.CompanyStockDetailsBO;

public interface ICommonCalculationService {
	
	public static final int ACCEPATABLE_INDEX_FOR_REGULARSTOCK=180;
	
	public static final int STANDARD_STOCK_VALUE = 200000;
	
	public List<CompanyStockDetailsBO> getCompanyStockPrice(List<CompanyStockDetailsBO> companyStockDetailList,int pts);



}
