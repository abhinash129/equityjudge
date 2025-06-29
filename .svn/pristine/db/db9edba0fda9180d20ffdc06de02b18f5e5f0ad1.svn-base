package com.nivesh.service.masterdatasetup;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nivesh.bo.CustomPriceBO;
import com.nivesh.dao.masterdatasetup.ISubscriptionPriceDao;

@Service
@Transactional
public class SubscriptionPriceServices implements ISubscriptionPriceService{

	@Resource
	ISubscriptionPriceDao iSubscriptionPriceDao;
	public void setiSubscriptionPriceDao(ISubscriptionPriceDao iSubscriptionPriceDao) {
		this.iSubscriptionPriceDao = iSubscriptionPriceDao;
	}
	@Override
	public List<CustomPriceBO> getallprice() {
		return iSubscriptionPriceDao.find();
	}
	
}
