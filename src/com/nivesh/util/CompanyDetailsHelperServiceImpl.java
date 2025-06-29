package com.nivesh.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nivesh.bo.CompanyStockDetailsBO;
@Service
@Transactional
public class CompanyDetailsHelperServiceImpl implements ICompanyDetailsHelperService{





	@Resource(name="companyCache")
	ICache icache;

	public void setIcache(ICache icache) {
		this.icache = icache;
	}



	@Override
	public List<CompanyStockDetailsBO> getCompanyStockPrice(String companyName, String startDate, String endDate) throws ParseException {

		List<CompanyStockDetailsBO> detailsBO=null;
		SimpleDateFormat format=null;
		Date newStartDate=null;
		Date newEndDate=null;
		Map companyMap=null;
		Set companySet=null;

		detailsBO=new ArrayList<CompanyStockDetailsBO>();
		format=new SimpleDateFormat("yyyy-MM-dd");
		newStartDate=format.parse(startDate);
		newEndDate=format.parse(endDate);
		
		companyMap=(Map)icache.get(companyName);
		companySet=(Set)companyMap.get(companyName);
		
		
		for(Object ob:companySet){

			CompanyStockDetailsBO companyStockDetailsBO=(CompanyStockDetailsBO)ob;

			

			if((format.parse(companyStockDetailsBO.getStockDate().toString()).equals((newStartDate)))||(format.parse(companyStockDetailsBO.getStockDate().toString()).after(newStartDate) && format.parse(companyStockDetailsBO.getStockDate().toString()).before(newEndDate))){


				detailsBO.add(companyStockDetailsBO);

			}
			else if ((format.parse(companyStockDetailsBO.getStockDate().toString()).equals(newEndDate))) {
				detailsBO.add(companyStockDetailsBO);
			}
		}


		return detailsBO;


	}





	//provide moving average data if we give company name,end date, points
	@Override
	public List<CompanyStockDetailsBO> getCompanyStockPrice(String companyName,String sDate, String eDate, int pts) throws ParseException {
		List<CompanyStockDetailsBO> companyStockDetailsBOList=null;
		companyStockDetailsBOList=new ArrayList<CompanyStockDetailsBO >();

		//logic to get start date and go back to points given
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
		Date startDate=formatter.parse(sDate);
		Map companyMap=(Map)icache.get(companyName);
		Set companySet=(Set)companyMap.get(companyName);
		for(Object ob:companySet){

			CompanyStockDetailsBO companyStockDetailsBO=(CompanyStockDetailsBO)ob;

			if(formatter.parse(companyStockDetailsBO.getStockDate().toString()).before(startDate)){
				companyStockDetailsBOList.add(companyStockDetailsBO);
			}
		}
		int count = 0;
		String newStartDate = null;

		if(companyStockDetailsBOList.size()==0){
			newStartDate=eDate;
			return companyStockDetailsBOList;
		}else if (companyStockDetailsBOList.size()<pts) {
		
			newStartDate = companyStockDetailsBOList.get(0).getStockDate().toString();
		} else{
			for(int i=companyStockDetailsBOList.size()-1;i>0;i--){
				count++;
				if(count==pts){
					newStartDate=companyStockDetailsBOList.get(i).getStockDate().toString();
					break;
				}else if(count<pts||count>pts){
					newStartDate=eDate;
				}
			}
		}
			companyStockDetailsBOList.clear();
			String newEndDate=eDate;
			companyStockDetailsBOList=getCompanyStockPrice(companyName, newStartDate, newEndDate);
			return companyStockDetailsBOList;
	}
	
	
	
	@Override
	public void clearCompanyCache() {
			icache.clear();
		
	}

}
