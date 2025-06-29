package com.nivesh.dao.portfolio;

import java.util.List;

import com.nivesh.bo.BuyStockBO;
import com.nivesh.dao.IDao;

public interface IDBBuyStockDao extends IDao {

	int batchInsert(List<BuyStockBO> portfoliobos);

	List<BuyStockBO> getAllSc_code_by_userID(String user_id);

	List<BuyStockBO> getPortfolioData(int sc_code, String user_id);


	List<BuyStockBO> findSell(String companyName, String username);

	List<BuyStockBO> getDataForValidation(int p_id);//this 4feb

	int[] batchDelete(List<BuyStockBO> buy_sellStockBOList);

	int[] editList(List<BuyStockBO> buy_sellStockBOList, String userName);
	

	

	
	
}
