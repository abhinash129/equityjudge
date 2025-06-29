package com.nivesh.dao.algoefficacy;

import java.util.Date;
import java.util.List;

import com.nivesh.bo.AlgoEfficacyBO;
import com.nivesh.dao.IDao;

public interface IAlgoEfficacyDao extends IDao {

	List<?> findAlgoEfficacy(AlgoEfficacyBO algoEfficacyBO);

	

	AlgoEfficacyBO findCurrentPrice(int sc_code, Date searchdate);



	AlgoEfficacyBO findBsePrice(Date bsesearchdate);



	AlgoEfficacyBO findBseBackPrice(Date bsebackdate);
	

}
