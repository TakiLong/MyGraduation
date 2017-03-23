package com.imut.journal.util;

import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.util.List;
import java.util.Random;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
/**
 * 
 * @author 韩禹萌
 *
 */
public class PDFUtil {
	public static String exportPdf(List<?> list,Class<?> clazz,String[] title,String fileName,String rootPath){
		java.util.Date current=new java.util.Date();
        java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyyMMddHHmmss"); 
        String c=sdf.format(current);
        Random ran = new Random(); 
        int s = ran.nextInt(99);
        c += s;
     // 1.建立com.lowagie.text.Document对象的实例。
     		Document document = new Document(); 
     		try {
     			 //add Chinese font
     			BaseFont bfChinese=BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
     			Font keyfont=new Font(bfChinese,8,Font.BOLD);
     			Font textfont=new Font(bfChinese,8,Font.NORMAL);
     			// 2.建立一个书写器(Writer)与document对象关联，通过书写器(Writer)可以将文档写入到磁盘中。
     			PdfWriter.getInstance(document, new FileOutputStream(rootPath+"/"+fileName+c+".pdf"));
     			// 3.打开文档。
     			document.open(); 
     			// 4.向文档中添加内容。
     			PdfPTable table = new PdfPTable(title.length);
     			table.addCell(createCell(fileName+":", keyfont,Element.ALIGN_LEFT,title.length,false)); 
     			for (String  t : title) {
     				table.addCell(createCell(t, keyfont, Element.ALIGN_CENTER)); 
     			} 
     			Field[] fields = clazz.getDeclaredFields(); 
     			int j=0;
     			for (Object o : list) { 
     				j=-1;//可以控制从第几列开始,负数代表前n列不要
     				for (Field field : fields) {
     					if(j<title.length && j>=0){
     						field.setAccessible(true);
     						try {
     							table.addCell(createCell(field.get(o)+"", textfont));
     						} catch (Exception e) {
     							e.printStackTrace();
     						}
     					}
     					j++;
     				}     	            
     			}     	        
     	        document.add(table); 
     			// 5.关闭文档。
     			document.close(); 
     		} catch (Exception e) {
     			e.printStackTrace();
     		}
		/*return rootPath+"/"+fileName+c+".pdf";*/
     	return fileName+c+".pdf";
	}
	public static PdfPCell createCell(String value,Font font,int align,int colspan,boolean boderFlag){ 
        PdfPCell cell = new PdfPCell(); 
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE); 
        cell.setHorizontalAlignment(align);     
        cell.setColspan(colspan); 
        cell.setPhrase(new Phrase(value,font)); 
        cell.setPadding(3.0f); 
        if(!boderFlag){ 
            cell.setBorder(0); 
            cell.setPaddingTop(15.0f); 
            cell.setPaddingBottom(8.0f); 
        } 
       return cell; 
	 } 
	public static PdfPCell createCell(String value,Font font,int align){ 
        PdfPCell cell = new PdfPCell(); 
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);         
        cell.setHorizontalAlignment(align);     
        cell.setPhrase(new Phrase(value,font)); 
       return cell; 
   }  
	public static PdfPCell createCell(String value,Font font){ 
        PdfPCell cell = new PdfPCell(); 
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE); 
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);  
        cell.setPhrase(new Phrase(value,font)); 
       return cell; 
   } 
}
