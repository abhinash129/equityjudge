package com.nivesh.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public abstract class DateHelper {

	public static Date todaysDateTimeInDBFormat(){

		Date todayDate=null;
		String todayDateInString=null;
		todayDate=new Date();
		SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		todayDateInString=sd.format(todayDate);
		try {
			todayDate=sd.parse(todayDateInString);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return todayDate;


	}
	//Method to take previous date based on year
	public static String previousDateYearWise(Date date,int year){
		SimpleDateFormat formatter = null;
		formatter = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.YEAR, -(year));
		String resultantDate = formatter.format(cal.getTime());
		return resultantDate;
	}

	public static String previousDateMonthWise(Date date,int month){
		SimpleDateFormat formatter = null;
		formatter = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MONTH, -(month));
		String resultantDate = formatter.format(cal.getTime());
		return resultantDate;
	}
	public static String previousDateDayWise(Date date,int day){
		SimpleDateFormat formatter = null;
		formatter = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DAY_OF_MONTH, -(day));
		String resultantDate = formatter.format(cal.getTime());
		return resultantDate;
	}


	//Method to convert date into String 
	public static String convertDateToString(Date date){
		SimpleDateFormat formatter = null;
		formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateInString = formatter.format(date);
		return dateInString;
	}

	//Method to convert date into String in Indian format
	public static String convertDateToStringInINR(Date date){
		SimpleDateFormat formatter = null;
		formatter = new SimpleDateFormat("dd-MM-yyyy");
		String dateInString = formatter.format(date);
		return dateInString;
	}




	//Method to convert String into date 
	public static Date convertStringToDate(String date) throws ParseException{
		SimpleDateFormat formatter = null;
		formatter = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(formatter.parse(date));
		Date stringInDate = cal.getTime();
		return stringInDate;
	}


	//Method to convert String into date  in india format
	public static Date convertStringToDateInINR(String date) throws ParseException{
		SimpleDateFormat formatter = null;
		formatter = new SimpleDateFormat("dd-MM-yyyy");
		Calendar cal = Calendar.getInstance();
		cal.setTime(formatter.parse(date));
		Date stringInDate = cal.getTime();
		return stringInDate;
	}





}
 