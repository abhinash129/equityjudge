package com.nivesh.service.algoefficacy;

import java.util.Comparator;

import com.nivesh.bo.AlgoEfficacyBO;

public class PercantageCompartor implements Comparator< AlgoEfficacyBO> {

	@Override
	public int compare(AlgoEfficacyBO o1, AlgoEfficacyBO o2) {
		
		float a=o1.getAcPer();
		float b=o2.getAcPer();
		if(a>b){return -1;}
		if(a<b){return 1;}
		return 0;
	}

}
