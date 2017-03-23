package com.imut.journal.util;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.TimeZone;

public class DateUtil
{

	public DateUtil()
	{
	}

	public static String getSysDate()
	{
		Calendar ca = Calendar.getInstance();
		int year = ca.get(1);
		int month = ca.get(2);
		int day = ca.get(5);
		String str1 = (new StringBuilder(String.valueOf(year))).append("-").toString();
		if (month >= 10)
			str1 = (new StringBuilder(String.valueOf(str1))).append(month).append("-").toString();
		else
			str1 = (new StringBuilder(String.valueOf(str1))).append("0").append(month).append("-").toString();
		if (day >= 10)
			str1 = (new StringBuilder(String.valueOf(str1))).append(day).toString();
		else
			str1 = (new StringBuilder(String.valueOf(str1))).append("0").append(day).toString();
		return str1;
	}

	public static int getAge(String sysdate, String csrq)
		throws Exception
	{
		java.util.Date birthDay = praseDate(csrq);
		java.util.Date now = praseDate(sysdate);
		Calendar cal = Calendar.getInstance();
		cal.setTime(now);
		if (cal.before(birthDay))
			throw new IllegalArgumentException("出生日期异常!");
		int yearNow = cal.get(1);
		int monthNow = cal.get(2);
		int dayOfMonthNow = cal.get(5);
		cal.setTime(birthDay);
		int yearBirth = cal.get(1);
		int monthBirth = cal.get(2);
		int dayOfMonthBirth = cal.get(5);
		int age = yearNow - yearBirth;
		if (monthNow <= monthBirth)
			if (monthNow == monthBirth)
			{
				if (dayOfMonthNow < dayOfMonthBirth)
					age--;
			} else
			{
				age--;
			}
		return age;
	}

	public static Date praseDate(String dateString)
	{
		return praseDate(dateString, "yyyy-MM-dd");
	}

	public static Date praseDate(String dateString, String format)
	{
		SimpleDateFormat formatter = new SimpleDateFormat(format);
		java.util.Date d = null;
		if (dateString == null || dateString.equals("") || dateString.toLowerCase().equals("null"))
			return null;
		try
		{
			d = formatter.parse(dateString);
		}
		catch (ParseException e)
		{
			e.printStackTrace();
		}
		return new Date(d.getTime());
	}

	public static String formatDate(String strDateTime)
	{
		if ("--".equals(strDateTime))
			return strDateTime;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		if (strDateTime != null && !strDateTime.equals(""))
			try
			{
				strDateTime = format.format(format.parse(strDateTime));
			}
			catch (Exception ex)
			{
				ex.printStackTrace();
			}
		else
			strDateTime = "";
		return strDateTime;
	}
	public static String formatDate2(Date date) {
		if(date==null)return "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}
	public static String formatDateMinute(String strDateTime)
	{
		if ("--".equals(strDateTime))
			return strDateTime;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		if (strDateTime != null && !strDateTime.equals(""))
			try
			{
				strDateTime = format.format(format.parse(strDateTime));
			}
			catch (Exception ex)
			{
				ex.printStackTrace();
			}
		else
			strDateTime = "";
		return strDateTime;
	}

	public String addYears(String strDateTiem, int i)
	{
		String result = "";
		String temp = "";
		try
		{
			strDateTiem = formatDate(strDateTiem);
			temp = strDateTiem.substring(0, 4);
			temp = (new StringBuilder(String.valueOf(Integer.parseInt(temp) + i))).toString();
			result = (new StringBuilder(String.valueOf(temp))).append(strDateTiem.substring(4)).toString();
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
		}
		return result;
	}

	public static Timestamp praseTimestamp(String dateString)
	{
		String format = "yyyy-MM-dd HH:mm:ss";
		if (dateString.trim().length() >= 17)
			format = "yyyy-MM-dd HH:mm:ss";
		else
		if (dateString.trim().length() >= 14)
			format = "yyyy-MM-dd HH:mm";
		else
		if (dateString.trim().length() >= 10)
			format = "yyyy-MM-dd";
		else
			return null;
		SimpleDateFormat formatter = new SimpleDateFormat(format);
		java.util.Date d = null;
		try
		{
			d = formatter.parse(dateString);
		}
		catch (ParseException e)
		{
			e.printStackTrace();
		}
		return new Timestamp(d.getTime());
	}

	public static String formatDate(java.util.Date curTime)
	{
		if (curTime == null || curTime.equals(""))
		{
			return " ";
		} else
		{
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return formatter.format(curTime);
		}
	}
	public static String formatDate3(java.util.Date curTime)
	{
		if (curTime == null || curTime.equals(""))
		{
			return " ";
		} else
		{
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			return formatter.format(curTime);
		}
	}

	public static String formatDate(java.util.Date curTime, String format)
	{
		if (curTime == null)
		{
			return " ";
		} else
		{
			SimpleDateFormat formatter = new SimpleDateFormat(format);
			return formatter.format(curTime);
		}
	}

	public static String formatDate(String curTimeStr, String format)
	{
		if ("--".equals(curTimeStr))
			return curTimeStr;
		if (curTimeStr == null)
			return " ";
		if (curTimeStr.equals(""))
		{
			return " ";
		} else
		{
			java.util.Date curTime = praseDate(curTimeStr, "yyyy-MM-dd");
			SimpleDateFormat formatter = new SimpleDateFormat(format);
			return formatter.format(curTime);
		}
	}

	public static String formatDate(String curTimeStr, String praseFormat, String format)
	{
		if ("--".equals(curTimeStr))
			return curTimeStr;
		if (curTimeStr == null)
		{
			return " ";
		} else
		{
			java.util.Date curTime = praseDate(curTimeStr, praseFormat);
			SimpleDateFormat formatter = new SimpleDateFormat(format);
			return formatter.format(curTime);
		}
	}

	public static String formatDateTime(String curTimeStr)
	{
		if ("--".equals(curTimeStr))
			return curTimeStr;
		String strTmp = curTimeStr;
		try
		{
			if (curTimeStr != null && !curTimeStr.equals("") && !curTimeStr.equals(" "))
			{
				if (curTimeStr.length() == 10)
					strTmp = formatDate(curTimeStr, "yyyy-MM-dd", "yyyy-MM-dd");
				else
				if (curTimeStr.length() == 16)
					strTmp = formatDate(curTimeStr, "yyyy-MM-dd HH:mm", "yyyy-MM-dd HH:mm");
				else
					strTmp = formatDate(curTimeStr, "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm:ss");
				if (strTmp != null && strTmp.length() == 19 && strTmp.endsWith("00:00:00"))
					strTmp = strTmp.substring(0, 10);
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return strTmp;
	}

	public static String formatDateZh(String timestr)
	{
		return null;
	}

	public static String formatDateZh_print(String timestr)
	{
		String format_mm = "yyyy'年'M'月'd'日'H'时'm'分'";
		String format_dd = "yyyy'年'M'月'd'日'";
		String result = timestr;
		try
		{
			java.util.Date curTime = null;
			String format = format_dd;
			if (timestr.length() > 10)
			{
				curTime = praseTimestamp(timestr);
				format = format_mm;
			} else
			{
				curTime = praseDate(timestr);
			}
			SimpleDateFormat formatter = new SimpleDateFormat(format);
			result = formatter.format(curTime);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return result;
	}

	public static String formatDateZh1_print(String timestr)
	{
		String format_dd = "yyyy'年'M'月'd'日'";
		String result = timestr;
		try
		{
			java.util.Date curTime = null;
			String format = format_dd;
			curTime = praseDate(timestr);
			SimpleDateFormat formatter = new SimpleDateFormat(format);
			result = formatter.format(curTime);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return result;
	}

	public static String formatDateTimeStr(Calendar calendar)
	{
		String result = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(calendar.getTime());
		return result;
	}

	public static void main(String a[])
	{
		String sfzmhm = "身份证号码";
		System.out.println(sfzmhm.indexOf("身份证号码"));
		System.out.println(getSysDate());
	}

	public static long compareDate(String s1, String s2)
	{
		long DAY = 0x5265c00L;
		java.util.Date d1 = praseDate(s1);
		java.util.Date d2 = praseDate(s2);
		return (d2.getTime() - d1.getTime()) / DAY;
	}

	public static String addDay(String nDate, int nNumberOfDay)
	{
		if (nDate.length() > 10)
			nDate = nDate.substring(0, 10);
		String a[] = nDate.split("-");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		GregorianCalendar gc = new GregorianCalendar(Integer.parseInt(a[0]), Integer.parseInt(a[1]) - 1, Integer.parseInt(a[2]));
		gc.add(5, nNumberOfDay);
		return formatter.format(gc.getTime());
	}

	public static String getSystime()
	{
		java.util.Date dt = new java.util.Date();
		DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String nowTime = "";
		nowTime = df.format(dt);
		return nowTime;
	}

	public static String getSystimestamp()
	{
		java.util.Date dt = new java.util.Date(System.currentTimeMillis());
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss SSS");
		df.setTimeZone(TimeZone.getTimeZone("GMT+8"));
		String nowTime = df.format(dt);
		return nowTime;
	}

	public static String numtochinese(String str)
		throws Exception
	{
		String chinese[] = {
			"0", "一", "二", "三", "四", "五", "六", "七", "八", "九"
		};
		String strResult = "";
		int slen = str.length();
		strResult = "";
		for (int i = 0; i < slen; i++)
			strResult = (new StringBuilder(String.valueOf(strResult))).append(chinese[Integer.parseInt((new StringBuilder(String.valueOf(str.charAt(i)))).toString())]).toString();

		return strResult;
	}

	public static String numToCharacter(String str)
		throws Exception
	{
		String date = "";
		String mmChar = "";
		String ddChar = "";
		if (str == null || str.length() < 10)
			return date;
		String mm = str.substring(5, 7);
		String dd = str.substring(8, 10);
		if (mm.substring(0, 1).equals("0"))
			mm = mm.substring(1, 2);
		if (mm.length() == 2)
		{
			if (mm.substring(0, 1).equals("1"))
			{
				if (mm.substring(1, 2).equals("0"))
					mmChar = "十";
				else
					mmChar = (new StringBuilder("十")).append(numtochinese(mm.substring(1, 2))).toString();
			} else
			if (mm.substring(1, 2).equals("0"))
				mmChar = (new StringBuilder(String.valueOf(numtochinese(mm.substring(0, 1))))).append("十").toString();
			else
				mmChar = (new StringBuilder(String.valueOf(numtochinese(mm.substring(0, 1))))).append("十").append(numtochinese(mm.substring(1, 2))).toString();
		} else
		{
			mmChar = numtochinese(mm.substring(0, 1));
		}
		if (dd.substring(0, 1).equals("0"))
			dd = dd.substring(1, 2);
		if (dd.length() == 2)
		{
			if (dd.substring(0, 1).equals("1"))
			{
				if (dd.substring(1, 2).equals("0"))
					ddChar = "十";
				else
					ddChar = (new StringBuilder("十")).append(numtochinese(dd.substring(1, 2))).toString();
			} else
			if (dd.substring(1, 2).equals("0"))
				ddChar = (new StringBuilder(String.valueOf(numtochinese(dd.substring(0, 1))))).append("十").toString();
			else
				ddChar = (new StringBuilder(String.valueOf(numtochinese(dd.substring(0, 1))))).append("十").append(numtochinese(dd.substring(1, 2))).toString();
		} else
		{
			ddChar = numtochinese(dd.substring(0, 1));
		}
		return (new StringBuilder(String.valueOf(numtochinese(str.substring(0, 4))))).append("年").append(mmChar).append("月").append(ddChar).append("日").toString();
	}

	public static String numToCharacterPar(String str)
		throws Exception
	{
		String mmChar = "";
		if (str.length() == 4)
			return numtochinese(str);
		if (str.length() == 2)
		{
			if (str.substring(0, 1).equals("0"))
				str = str.substring(1, 2);
			if (str.length() == 2)
			{
				if (str.substring(0, 1).equals("1"))
				{
					if (str.substring(1, 2).equals("0"))
						mmChar = "十";
					else
						mmChar = (new StringBuilder("十")).append(numtochinese(str.substring(1, 2))).toString();
				} else
				if (str.substring(1, 2).equals("0"))
					mmChar = (new StringBuilder(String.valueOf(numtochinese(str.substring(0, 1))))).append("十").toString();
				else
					mmChar = (new StringBuilder(String.valueOf(numtochinese(str.substring(0, 1))))).append("十").append(numtochinese(str.substring(1, 2))).toString();
			} else
			{
				mmChar = numtochinese(str.substring(0, 1));
			}
			return mmChar;
		}
		if (str.length() == 10)
			return numToCharacter(str);
		else
			return "";
	}

	public static String getNyr(String date)
		throws Exception
	{
		if (date.length() == 10)
			return (new StringBuilder(String.valueOf(date.substring(0, 4)))).append("年").append(date.substring(5, 7)).append("月").append(date.substring(8, 10)).append("日").toString();
		if (date.length() == 16)
			return (new StringBuilder(String.valueOf(date.substring(0, 4)))).append("年").append(date.substring(5, 7)).append("月").append(date.substring(8, 10)).append("日").append(date.substring(11, 13)).append("时").append(date.substring(14, 16)).append("分").toString();
		if (date.length() == 18)
			return (new StringBuilder(String.valueOf(date.substring(6, 10)))).append("年").append(date.substring(10, 12)).append("月").append(date.substring(12, 14)).append("日").toString();
		if (date.length() == 15)
			return (new StringBuilder("19")).append(date.substring(6, 8)).append("年").append(date.substring(8, 10)).append("月").append(date.substring(10, 12)).append("日").toString();
		else
			return "";
	}

	public static String tranDateStr(String date, String type)
	{
		if (date == null)
			date = "";
		if (type.equals("1"))
			if (date.length() > 10)
				return date.substring(0, 10);
			else
				return date;
		if (type.equals("2"))
		{
			if (date.length() > 19)
				return date.substring(0, 19);
			else
				return date;
		} else
		{
			return "";
		}
	}

	public static String formatDTAtmV(String indate)
	{
		if (indate.length() >= 16)
			return indate.substring(0, 16);
		else
			return indate;
	}
	/**
	 * 按整5分钟划分取整
	 * 9:02 取整为 9:00   9:07取整为9:05
	 * 王万斌
	 * @param date
	 * @return
	 * 2015-9-11
	 */
	public static Date getTimeBy5Minutes(Date date){
		String dateStr = formatDate(date);
		String beforStr = dateStr.substring(0, 15);
		String afterStr = "";
		if(Integer.parseInt(dateStr.substring(15, 16)) >= 5){
			afterStr = "5:00";
		}else{
			afterStr = "0:00";
		}
		return praseDate(beforStr+afterStr, "yyyy-MM-dd HH:mm:ss");
	}
	
	/**
	 * 时间增加天数
	 * 王万斌
	 * @param date
	 * @param nNumberOfMinutes
	 * @return
	 * 2015-9-11
	 */
	public static Date addDays(Date date, long nNumberOfDays)
	{
		long time = 1000 * 60 * 60 * 24 * nNumberOfDays;
		long nextDate = date.getTime() + time;
		return new Date(nextDate);
	}
	/**
	 * 时间增加分钟
	 * 王万斌
	 * @param date
	 * @param nNumberOfMinutes
	 * @return
	 * 2015-9-11
	 */
	public static Date addMinutes(Date date, int nNumberOfMinutes)
	{
		long nextDate = date.getTime() + 60 * 1000 * nNumberOfMinutes;
		return new Date(nextDate);
	}
	/**
	 * 将持续时间转为标准时间格式
	 * 万文杰
	 * @param time
	 * @return
	 * 2015-9-17
	 */
	 public static String secToTime(int time) {  
	        String timeStr = null;  
	        int hour = 0;  
	        int minute = 0;  
	        int second = 0;  
	        int day=0;
	        if (time <= 0)  
	            return "00:00";  
	        else {  
	            minute = time / 60;  
	            if (minute < 60) {  
	               second = time % 60;  
	               timeStr = unitFormat(minute) + ":" + unitFormat(second);  
	            } else {  
	                hour = minute / 60; 
	               if (hour <24) {
	                minute = minute % 60;  
	 	            second = time - hour * 3600 - minute * 60;  
	 	            timeStr = unitFormat(hour) + ":" + unitFormat(minute) + ":" + unitFormat(second); 
					} else {
						day=hour/24;
						hour=hour%24;
						minute=(time-hour*60*60-day*24*60*60)/60;
						second=time-hour*60*60-day*24*60*60-minute*60;
						timeStr = unitFormat(day)+"d" + ":" + unitFormat(hour) + ":" + unitFormat(minute) + ":" + unitFormat(second);
	
					}
	            }
	        }  
	        return timeStr;  
	    }  
	  
	    public static String unitFormat(int i) {  
	        String retStr = null;  
	        if (i >= 0 && i < 10)  
	            retStr = "0" + Integer.toString(i);  
	        else  
	            retStr = "" + i;  
	        return retStr;  
	    }  
	    /**
	     * 某一个月第一天和最后一天
	     * @param date
	     * @return
	     */
	    public static Date[] getFirstday_Lastday_Month(Date date) {
	        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	        Calendar calendar = Calendar.getInstance();
	        calendar.setTime(date);
	        calendar.add(Calendar.MONTH, -1);
	        Date theDate = calendar.getTime();
	        
	        //上个月第一天
	        GregorianCalendar gcLast = (GregorianCalendar) Calendar.getInstance();
	        gcLast.setTime(theDate);
	        gcLast.set(Calendar.DAY_OF_MONTH, 1);
	        String day_first = df.format(gcLast.getTime());
	        StringBuffer str = new StringBuffer().append(day_first).append(" 00:00:00");
	        day_first = str.toString();

	        //上个月最后一天
	        calendar.add(Calendar.MONTH, 1);    //加一个月
	        calendar.set(Calendar.DATE, 1);        //设置为该月第一天
	        calendar.add(Calendar.DATE, -1);    //再减一天即为上个月最后一天
	        String day_last = df.format(calendar.getTime());
	        StringBuffer endStr = new StringBuffer().append(day_last).append(" 23:59:59");
	        day_last = endStr.toString();

	        Date[] dates=new Date[2];
	        dates[0] =DateUtil.praseDate(day_first,"yyyy-MM-dd");
	        dates[1]=DateUtil.praseDate(day_last,"yyyy-MM-dd");
	        return dates;
	    }

	    /**
	     * 当月第一天
	     * @return
	     */
	    public static String getFirstDay() {
	        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	        Calendar calendar = Calendar.getInstance();
	        Date theDate = calendar.getTime();
	        
	        GregorianCalendar gcLast = (GregorianCalendar) Calendar.getInstance();
	        gcLast.setTime(theDate);
	        gcLast.set(Calendar.DAY_OF_MONTH, 1);
	        String day_first = df.format(gcLast.getTime());
	        StringBuffer str = new StringBuffer().append(day_first).append(" 00:00:00");
	        return str.toString();

	    }
	    
	    /**
	     * 当月最后一天
	     * @return
	     */
	    public static String getLastDay() {
	        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	        Calendar calendar = Calendar.getInstance();
	        Date theDate = calendar.getTime();
	        String s = df.format(theDate);
	        StringBuffer str = new StringBuffer().append(s).append(" 23:59:59");
	        return str.toString();

	    }
	    public static int getLastDayOfMonth(int year, int month) {   
	    	        Calendar cal = Calendar.getInstance();   
	    	        cal.set(Calendar.YEAR, year);   
	    	         cal.set(Calendar.MONTH, month);   
	    	        // 某年某月的最后一天   
	    	        return cal.getActualMaximum(Calendar.DATE);   
	    } 
	    /**
		 * 用月和年获取当月的第一天和最后一天
		 * k
		 * @param time
		 * @return
		 * 2015-9-17
		 */
	    public static Date[] getFirstAndLastDate(Date date){
	    	Calendar c = Calendar.getInstance();
	    	c.setTime(date);
	    	int year=c.get(Calendar.YEAR);
			int month=c.get(Calendar.MONTH)+1;
			c.set(Calendar.YEAR,year);
			c.set(Calendar.MONTH, month);
			c.set(Calendar.DAY_OF_MONTH, 1);
			c.add(Calendar.DAY_OF_MONTH, -1);
			Date lastDate = c.getTime();  
			c.set(Calendar.DAY_OF_MONTH, 1);
			Date firstDate = c.getTime();
			Date[] dates=new Date[2];
			dates[0]=firstDate;
			dates[1]=lastDate;
			return dates;
	    }
	    /**
		 * 获取系统时间的前n天时间
		 * k
		 * @param time
		 * @return
		 * 2015-9-17
		 */
	    @SuppressWarnings("static-access")
		public static Date[] getAgoTime(Date date ,int numDay){
	    	Date dates[] =new Date[2];
	    	
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    	try {
	    		Calendar calendar = new GregorianCalendar();
	    		calendar.setTime(date);
	    	    calendar.add(calendar.DATE,-numDay);//把日期往后增加一天.整数往后推,负数往前移动
	    	    Date date2=calendar.getTime(); //这个时间就是日期往后推一天的结果
	    	    String str=sdf.format(date2);
	    	    String str1=sdf.format(date);
	    	    dates[0]=DateUtil.praseDate(str,"yyyy-MM-dd");
	    	    dates[1]=DateUtil.praseDate(str1,"yyyy-MM-dd");
	    		} catch (Exception e) {
	    			e.printStackTrace();
	    	}
	    	return dates;
	    }
}
