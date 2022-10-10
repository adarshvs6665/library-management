package com.library.date;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class GetDate {

	public static String getDate() {
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/YYYY");
		Calendar cal = Calendar.getInstance();
		String date = dateFormat.format(cal.getTime()).toString();
		return date;
	}
	public static String incrementDate(String date, int increment) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		Calendar c = Calendar.getInstance();
		c.setTime(sdf.parse(date));
		c.add(Calendar.DATE, increment); 
		date = sdf.format(c.getTime()); 	
		return date;

	}
}
