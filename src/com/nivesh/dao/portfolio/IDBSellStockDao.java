package com.nivesh.dao.portfolio;

import java.util.Date;
import java.util.List;

import com.nivesh.bo.AfterSellBO;
import com.nivesh.bo.SellStockBO;
import com.nivesh.dao.IDao;

public interface IDBSellStockDao extends IDao{

	int batchInsert(List<SellStockBO> pList);

	List<SellStockBO> getAllSellPidandSccode_by_userID(String user_id);

	List<AfterSellBO> getSellPortfolioData(String userId, int sc_code, int p_id,Date date);

	List<SellStockBO> getAllSellStockData(String userName, Date today, Date prv_Date);

	List<AfterSellBO> getHistoryPortfolioData(String userName, int sc_code, int p_id, Date date);

}
