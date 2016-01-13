package com.turing.test;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Iterator;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

import com.turing.dao.DaoImpl;
import com.turing.dao.IDao;

public class TestPOI {
	
	public static void main(String[] args) throws Exception {
		
		InputStream myxls = new FileInputStream("C:\\Users\\Administrator.PC-20130913FXZW\\Desktop\\北京计算中心资料\\安贞医院基因型数据.xls");
		HSSFWorkbook wb = new HSSFWorkbook(myxls);
		
		HSSFSheet sheet = wb.getSheetAt(1);       // 第二个工作表
		
		Iterator<Row> rows = sheet.rowIterator();
		IDao dao = new DaoImpl();
		while (rows.hasNext()) {
			String insertStr = "insert into code_gene values('";
			Row row = rows.next();
			Iterator<Cell> cells = row.cellIterator();
			while (cells.hasNext()) {
				Cell cell = cells.next();
				insertStr+=cell.getStringCellValue()+"','";
				System.out.print(cell.getStringCellValue()+"\t");
			}
			insertStr = insertStr.substring(0, insertStr.length()-2)+")";
			System.out.println(insertStr);
			dao.executeUpdate(insertStr);
		}
		//HSSFRow row     = sheet.getRow(2);        // 第三行
		//HSSFCell cell   = row.getCell((short)3);  // 第四个单元格
		
	}

}
