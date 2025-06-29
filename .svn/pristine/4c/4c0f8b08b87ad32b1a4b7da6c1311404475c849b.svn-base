package com.nivesh.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.nivesh.bo.CompanyStockDetailsBO;

/**
 * @author Preveil
 * purpose:Commomn Calculation For entire application
 * 
 */

@Component
public class CommonCalculationServiceImpl implements ICommonCalculationService{

	
	
	
	/**
	 *This method will calculate moving average of particular company
	 *returntype=List<CompanyStockDetailsBO>
	 *param:List<CompanyStockDetailsBO> companyStockDetailList,int pts
	 */
	@Override
	public List<CompanyStockDetailsBO> getCompanyStockPrice(List<CompanyStockDetailsBO> companyStockDetailList,int pts) {

		
		//moving average calculation
		List<CompanyStockDetailsBO> movingAverageList=null;
		movingAverageList=new ArrayList<CompanyStockDetailsBO>();
		for(int i=0;i<companyStockDetailList.size()-pts;i++){
			CompanyStockDetailsBO  detailsBO=new CompanyStockDetailsBO();
			float averageValue=0;
			for(int j=i;j < (i+pts);j++){
				averageValue+=companyStockDetailList.get(j).getCompanyClosePrice();
			}
			Float movingAverage=averageValue/pts;
			detailsBO.setMovingAverage(movingAverage);
			detailsBO.setCompanyClosePrice(companyStockDetailList.get(i+pts).getCompanyClosePrice());
			detailsBO.setStockDate(companyStockDetailList.get(i+pts).getStockDate());
			detailsBO.setStockVolume(companyStockDetailList.get(i+pts).getStockVolume());
			movingAverageList.add(detailsBO);
		}
		
		return movingAverageList;
	}

	
}
