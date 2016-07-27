package project.config.util;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelFile {
	
	public ExcelFile(){
		
	}
	
	@SuppressWarnings("resource")
	public static List<Map<String, Object>> mgExcelUpload() throws Exception{
		String path = MultiUtil.loadPropertyKey(UrlUtil.URLPROPPATH, "excelUploadURL");
		
		// 엑셀파일
		File file = new File(path + "/prd_sample(본사).xlsx");
		
		// 엑셀 파일 오픈
		//org.apache.poi.ss.usermodel.Workbook wb = WorkbookFactory.create(file);
		XSSFWorkbook wb = new XSSFWorkbook(new FileInputStream(file));
		Sheet sheet = wb.getSheetAt(0);
		System.out.println(sheet.getFirstRowNum());
		System.out.println(sheet.getLastRowNum());
		
	        
		// HashMap 으로 이루어진 List 객체 생성 
		List<Map<String, Object>> listCashflow = new ArrayList<Map<String,Object>>();
		for (Row row : wb.getSheetAt(0)) {
			// 위의 3줄은 건너뛴다.
			
			if (row.getRowNum() < 1) {
				continue;
			}

			Map<String, Object> hmCashFlow = new HashMap<String, Object>();
			DataFormatter formatter = new DataFormatter(); 
			hmCashFlow.put("MG_ISBN", formatter.formatCellValue(row.getCell(0)));
			hmCashFlow.put("MG_BOOKNM", formatter.formatCellValue(row.getCell(1)));
			hmCashFlow.put("MG_BOOKSUBNM", formatter.formatCellValue(row.getCell(2)));
			hmCashFlow.put("MG_PBS", formatter.formatCellValue(row.getCell(3)));
			hmCashFlow.put("MG_BOOKWRITER", formatter.formatCellValue(row.getCell(4)));
			hmCashFlow.put("MG_SUBJECT", formatter.formatCellValue(row.getCell(5)));
			hmCashFlow.put("MG_OBJECT", formatter.formatCellValue(row.getCell(6)));
			hmCashFlow.put("MG_GRADE", formatter.formatCellValue(row.getCell(7)));
			hmCashFlow.put("MG_STEP",formatter.formatCellValue(row.getCell(8)));
			hmCashFlow.put("MG_BOOKISYEAR", formatter.formatCellValue(row.getCell(9)));
			hmCashFlow.put("MG_PRICE", formatter.formatCellValue(row.getCell(10)));
			hmCashFlow.put("MG_REFMAT", formatter.formatCellValue(row.getCell(11)));
			hmCashFlow.put("MG_MOREINF", formatter.formatCellValue(row.getCell(13)));
			hmCashFlow.put("MG_APPLYCHK", "T");
			listCashflow.add(hmCashFlow);
		}
		return listCashflow;
	}
}
