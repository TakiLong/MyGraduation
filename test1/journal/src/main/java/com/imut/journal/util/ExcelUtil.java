package com.imut.journal.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.List;
import java.util.Random;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;

public class ExcelUtil {
	/**
	 * 在指定位置生成Excel
	 * @author 韩禹萌
	 * @param list
	 * @param c
	 * @param title
	 * @param fileName
	 * @param rootPath
	 * void
	 * 2016-5-5
	 */
	public static String excel(List<?> list,Class<?> c,String[] title,String fileName,String sheetName,String rootPath){
		File resultFile = null;
		/*----------------------------------生成文件日期-------------------------------------------*/
		java.util.Date current=new java.util.Date();
        java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyyMMddHHmmss"); 
        String st=sdf.format(current);
        Random ran = new Random();
        int s = ran.nextInt(99);
        st += s;
        /*----------------------------------生成文件日期-------------------------------------------*/
        resultFile = new File(rootPath+"/"+fileName+"_"+st+".xls");   
        FileOutputStream fos = null; 
		//InputStream downloadStream ;  
		// 第一步，创建一个 webbook，对应一个Excel文件  
        HSSFWorkbook wb = new HSSFWorkbook();  
         // 第二步，在 webbook中添加一个sheet,对应Excel文件中的sheet 
        HSSFSheet sheet = null; 
        // 第三步，在sheet中添加表头第0行,注意老版本 poi对Excel的行数列数有限制short  
        HSSFRow row = null;
        // 第四步，创建单元格，并设置值表头 设置表头居中  
        HSSFFont font = wb.createFont();
        font.setColor(HSSFColor.TURQUOISE.index);
        short border = 1;
        HSSFCellStyle style = wb.createCellStyle();  
        style.setAlignment(HSSFCellStyle. ALIGN_CENTER ); // 创建一个居中格式  
        style.setFillPattern(CellStyle.SOLID_FOREGROUND);
        style.setBorderLeft(border);
        style.setBorderTop(border);
        style.setBorderRight(border);
        style.setBorderBottom(border);
        style.setFillForegroundColor(HSSFColor.WHITE.index);
        HSSFCell cell = null;
        sheet=wb.createSheet(sheetName);        
		Field[] fields = c.getDeclaredFields(); 
		row = sheet.createRow(0);
		int i=0;
		/*----------------------------------表格第一行为列标题-------------------------------------------*/
		for (String  t : title) {
			cell = row.createCell(i);
    		cell.setCellValue(t);
    		cell.setCellStyle(style);
			i++;
		}
		/*----------------------------------表格第一行为列标题-------------------------------------------*/
		i=1;
		int j=0;
		/*----------------------------------表格列标题个数读取list属性-------------------------------------------*/
		for (Object o : list) {	
			row = sheet.createRow(i);
			j=-1;					//可以控制从第几列开始,负数代表前n列不要
			for (Field field : fields) {
				if(j<title.length && j>=0){
					field.setAccessible(true);
					try {
						cell=row.createCell(j);
						cell.setCellValue(field.get(o)+"");
						cell.setCellStyle(style);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				j++;
			}	
			i++;
		}	
		/*----------------------------------表格列标题个数读取list属性-------------------------------------------*/
		try {
			fos = new FileOutputStream(resultFile);
			wb.write(fos);
		      
	        fos.flush();  
	        fos.close();
	        /*return resultFile.getPath();*/ //返回地址
	        return resultFile.getName();//返回名字
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public static String formatterTime(Integer value){
		String time = "";
		if(value >= 86400){
			time += (value/86400) + "d ";
			value = value%86400;
		}
		if(value >= 3600){
			time += ((value/3600)>=10?(value/3600):"0"+(value/3600)) + ":";
			value = value%3600;
		}else{
			time += "00:";
		}
		if(value >= 60){
			time += ((value/60)>=10?(value/60):"0"+(value/60)) + ":";
			value = value%60;
		}else{
			time += "00:";
		}
		time += value>=10?value:"0"+value;
		return time;
	}

}
