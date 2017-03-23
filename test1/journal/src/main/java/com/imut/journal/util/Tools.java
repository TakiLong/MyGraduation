package com.imut.journal.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;

public class Tools {
	
	public static String replaceNull(Object mesg) {
		if (mesg == null || mesg == "" || mesg.equals("") || ("" + mesg).equals("null") || mesg==null) {
			return "";
		} else {
			return mesg.toString();
		}
	} 
	/**
	 * String转double
	 * @param mesg
	 * @return
	 */
	public static Double StrToNum(String mesg) {
		if (mesg == null || mesg == "" || mesg.equals("") || ("" + mesg).equals("null") || mesg==null) {
			return 0.0;
		} else {
			try {
				return Double.parseDouble(mesg);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	} 
	
	public static String getIp(HttpServletRequest req) {
		String ip_for = req.getHeader(" x-forwarded-for ");
		String ip_client = req.getHeader(" http_client_ip ");
		String un = " unknown ";

		if (ip_for != null && !ip_for.equalsIgnoreCase(un)
				&& ip_for.trim().length() > 0) {
			return ip_for;
		} else if (ip_client != null && !ip_client.equalsIgnoreCase(un)
				&& ip_client.trim().length() > 0) {
			return ip_client;
		} else {
			return req.getRemoteAddr();
		}
	}
	
	public static boolean checkNotNullOrEmpty(String arg){
		if(null != arg && !"".equals(arg.trim()) && arg.trim().length() != 0){
			return true;
		}
		return false;
	}
	
	public static boolean notEmpty(String s){
		return s!=null && !"".equals(s) && !"null".equals(s);
	}
	
	public static boolean isEmpty(String s){
		return s==null || "".equals(s) || "null".equals(s);
	}
	
	public static String formatDate(Date date){
		if(date!=null){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			return	sdf.format(date);
		}else return "";
	}
	
	public static String formatTimeDate(Date date) {
		if(date==null)return "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(date);
	}
	public static String transNullOrZero(Object obj){
		String temp ="";
		if(obj instanceof Integer){
			if(!obj.equals(0)){
				temp = obj.toString();
			}
		}
		if(obj instanceof String){
			if(obj!=null){
				temp = obj.toString();
			}
		}
		return temp;
	}
	public static String formatNull(String str){
		if(str==null||str.equals("")){
			return str="--";
		}else{
			return str;
		}
	}

	public static String getException(Throwable e) {
		String excString = "";
		if (e == null) {
			excString = "空的异常对象";
		} else {
			if (e.getCause() != null) {
				excString = handleSpecialStr(e.getCause().getLocalizedMessage()
						.replaceAll("\n", ""));
			} else {
				excString = handleSpecialStr(e.toString().replaceAll("\n", ""));
			}
		}
		return excString;
	}
	
	public static String getHibernateException(Throwable e) {
		String excString = "";
		if (e == null) {
			excString = "空的异常对象";
		} else {
			if (e.getCause() != null) {
				excString = handleSpecialStr(e.getCause().getCause().getLocalizedMessage()
						.replaceAll("\n", ""));
			} else {
				excString = handleSpecialStr(e.toString().replaceAll("\n", ""));
			}
		}
		return excString;
	}
	
	public static String getException(String errMsg) {
		String excString = "";
		excString = handleSpecialStr(errMsg.replaceAll("\n", ""));
		return excString;
	}
	
	public static String handleSpecialStr(String str) {

		if (null == str || 0 == str.length()) {
			return "";
		}
		String hSymbol = "!\"#$%&'()*+,./:;<=>?@[\\]^_`{|}-~";
		String zSymbol = "！”＃＄％＆’（）＊＋，．／：；＜＝＞？＠［￥］＾＿‘｛｜｝－～";
		String tmp = str;
		for (int i = 0; i < hSymbol.length(); i++) {
			tmp = tmp.replace(hSymbol.charAt(i), zSymbol.charAt(i));
		}
		StringBuffer sb = new StringBuffer(tmp);
		return sb.toString();
	}
	
	
	
	public static String handleGlbm(String glbm,String bmjb){
		if("2".equals(bmjb))return glbm.substring(0,2);
		else if("3".equals(bmjb))return glbm.substring(0,4);
		else if("4".equals(bmjb))return glbm.substring(0,6);
		//else if("4".equals(bmjb))return glbm.substring(0,2);
		return glbm;
	}
	
	public static String transResult(int result){
		if(1==result)return "成功";
		return "失败";
	}
	
	public static String transScript(String script){
		StringBuffer sb=new StringBuffer();
		sb.append("<script>");
		sb.append(script);
		sb.append("</script>");
		return sb.toString();
	}
	 /**
	 * 把16进制字符串转换成字节数组
	 * @param hex
	 * @return
	 */
	public static byte[] hexStringToByte(String hex) {
		int len = (hex.length() / 2);
		byte[] result = new byte[len];
		char[] achar = hex.toCharArray();
		for (int i = 0; i < len; i++) {
			int pos = i * 2;
			result[i] = (byte) (toByte(achar[pos]) << 4 | toByte(achar[pos + 1]));
		}
		return result;
	}

	private static byte toByte(char c) {
		byte b = (byte) "0123456789ABCDEF".indexOf(c);
		return b;
	}

	/** */
	/**
	 * 把字节数组转换成16进制字符串
	 * 
	 * @param bArray
	 * @return
	 */
	public static final String bytesToHexString(byte[] bArray) {
		StringBuffer sb = new StringBuffer(bArray.length);
		String sTemp;
		for (int i = 0; i < bArray.length; i++) {
			sTemp = Integer.toHexString(0xFF & bArray[i]);
			if (sTemp.length() < 2)
				sb.append(0);
			sb.append(sTemp.toUpperCase());
		}
		return sb.toString();
	}
}
