<%-- 
    Document   : try
    Created on : 1 Sep, 2020, 4:52:18 PM
    Author     : DELL
--%>


<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.poi.ss.usermodel.*"%>
<%@page import="org.apache.poi.ss.usermodel.Cell"%>;
<%@page import="org.apache.poi.ss.usermodel.CellType"%>
<%@page import="org.apache.poi.ss.usermodel.DataFormatter"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="org.apache.poi.ss.usermodel.Sheet"%>
<%@page import="org.apache.poi.ss.usermodel.Workbook"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>
<%@page import="java.io.FileInputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
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
        %>
    </body>
</html>
