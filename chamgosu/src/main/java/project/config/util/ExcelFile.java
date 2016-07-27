package project.config.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Date;
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
	
	public static List<Map<String, Object>> mgExcelUpload(String fileName) throws Exception{
		String path = MultiUtil.loadPropertyKey(UrlUtil.URLPROPPATH, "excelUploadURL");
		
		// 엑셀파일
		File file = new File(fileName);
		
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
	
	public static String mgExcelDownload(List<Map<String, Object>> adminProductList) throws Exception{
		String path = MultiUtil.loadPropertyKey(UrlUtil.URLPROPPATH, "excelUploadURL");
		
		// 엑셀파일
		
		
		// 엑셀 파일 오픈
		//org.apache.poi.ss.usermodel.Workbook wb = WorkbookFactory.create(file);
		
		XSSFWorkbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("mySheet");
		Row row;
		
		
		//출력 row 생성
		row = sheet.createRow(0);
		
		
		//출력 cell 생성
		row.createCell(0).setCellValue("ISBN코드");
		row.createCell(1).setCellValue("교재명");
		row.createCell(2).setCellValue("부제목");
		row.createCell(3).setCellValue("출판사");
		row.createCell(4).setCellValue("저자");
		row.createCell(5).setCellValue("분야");
		row.createCell(6).setCellValue("대상");
		row.createCell(7).setCellValue("학년");
		row.createCell(8).setCellValue("단계");
		row.createCell(9).setCellValue("발행년");
		row.createCell(10).setCellValue("정가");
		row.createCell(11).setCellValue("참고자료");
		row.createCell(12).setCellValue("상품대표사진");
		row.createCell(13).setCellValue("상세설명");
		
		
		for(int i=0; i<adminProductList.size(); i++){
			
			row = sheet.createRow(i+1);
			//출력 cell 생성
			
			row.createCell(0).setCellValue(RsUtil.checkNull(adminProductList.get(i).get("MG_ISBN")));
			row.createCell(1).setCellValue(RsUtil.checkNull(adminProductList.get(i).get("MG_BOOKNM")));
			row.createCell(2).setCellValue(RsUtil.checkNull(adminProductList.get(i).get("MG_BOOKSUBNM")));
			row.createCell(3).setCellValue(RsUtil.checkNull(adminProductList.get(i).get("MG_PBS")));
			row.createCell(4).setCellValue(RsUtil.checkNull(adminProductList.get(i).get("MG_BOOKWRITER")));
			row.createCell(5).setCellValue(RsUtil.checkNull(adminProductList.get(i).get("MG_SUBJECT")));
			row.createCell(6).setCellValue(RsUtil.checkNull(adminProductList.get(i).get("MG_OBJECT")));
			row.createCell(7).setCellValue(RsUtil.checkNull(adminProductList.get(i).get("MG_GRADE")));
			row.createCell(8).setCellValue(RsUtil.checkNull(adminProductList.get(i).get("MG_STEP")));
			row.createCell(9).setCellValue(RsUtil.checkNull(adminProductList.get(i).get("MG_BOOKISYEAR")));
			row.createCell(10).setCellValue(RsUtil.checkNull(adminProductList.get(i).get("MG_PRICE")));
			row.createCell(11).setCellValue(RsUtil.checkNull(adminProductList.get(i).get("MG_REFMAT")));
			row.createCell(12).setCellValue(RsUtil.checkNull(adminProductList.get(i).get("MG_BOOKIMG")));
			row.createCell(13).setCellValue(RsUtil.checkNull(adminProductList.get(i).get("MG_MOREINF")));
			
			
		}
		
		
		// 출력 파일 위치및 파일명 설정
		FileOutputStream outFile;
		String addName = Long.toString(new Date().getTime());
		String fileName = "";
		
		try {
			
			
			outFile = new FileOutputStream(path + addName +"_masterGoods.xlsx");
			wb.write(outFile);
			outFile.close();
			fileName = addName + "_masterGoods.xlsx";
			System.out.println("파일생성 완료");
		
		
		} catch (Exception e) {
		
			e.printStackTrace();
		
		
		}
		
		return fileName;
		
		
		
	        
		
	}

}
