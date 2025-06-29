package com.nivesh.util;

import java.util.List;

import com.nivesh.bo.CompanyStockDetailsBO;

public class SensexComparisionServices {

	public static List<List<CompanyStockDetailsBO>> Comparision(List<List<CompanyStockDetailsBO>> movingAverageList){


		for (int i = 0; i < movingAverageList.size(); i++) {
			List<CompanyStockDetailsBO> BoList = movingAverageList.get(i);
			Float intialClosePrice = BoList.get(0).getCompanyClosePrice();
			for (int j = 0; j < BoList.size(); j++) {
				CompanyStockDetailsBO companyStockDetailsBO = BoList.get(j);
				Float price = companyStockDetailsBO.getCompanyClosePrice();
				price = (price/intialClosePrice)*100;
				companyStockDetailsBO.setMovingAverage(price);
			}
		}
		return movingAverageList;

	}

}
