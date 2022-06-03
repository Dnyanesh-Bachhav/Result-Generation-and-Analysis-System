package Controller;


import java.io.File;
import java.io.FileInputStream;
import java.util.Iterator;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ReadInvoices {
	public static void main(String[] args) {
		try {
			String name = "C:/Users/DELL/Desktop/Book1.xlsx";
			FileInputStream file = new FileInputStream(new File(name));
			Workbook workbook = new XSSFWorkbook(file);
			DataFormatter dataFormatter = new DataFormatter();
			Iterator<Sheet> sheets = workbook.sheetIterator();
			while(sheets.hasNext()) {
				Sheet sh = sheets.next();
				System.out.println("Sheet name is "+sh.getSheetName());
				System.out.println("---------");
				Iterator<Row> iterator = sh.iterator();
				while(iterator.hasNext()) {
					Row row = iterator.next();
					Iterator<Cell> cellIterator = row.iterator();
					while (cellIterator.hasNext()) {
						Cell cell = cellIterator.next();
						String cellValue = dataFormatter.formatCellValue(cell);
						//if(cell.getCellType() == CellType.STRING) {
						//	
						//}
						System.out.print(cellValue+"\t");
					}
					System.out.println();
				}
			}
			workbook.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}

	}

}
