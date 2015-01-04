/**
 * Excel文件导入导出
 */
package cn.nwsuaf.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

public class ExcelTool {
	/**
	 * 读取Excel文件
	 * @param xls 文件对象
	 * @return 行列表
	 * @throws Exception
	 */
	public ArrayList<String[]> readExcel(File xls) throws Exception{
		ArrayList<String[]> dataList = new ArrayList<String[]>();
		try {
			Workbook book = Workbook.getWorkbook(xls);
			Sheet sheet = book.getSheet(0);
	        
	        int rows = sheet.getRows();
	        int cols = sheet.getColumns();
	        
	        for(int i=1;i<rows;i++){
	            String[] a = new String[cols];
	            for(int j=0;j<cols;j++){
	                Cell cell = sheet.getCell(j, i);
	                a[j] = cell.getContents();
	            }
	            dataList.add(a);
	        }
	        book.close();
		} catch (BiffException e) {
			e.printStackTrace();
			throw(new Exception("文件类型不正确，请确认为Excel2003及以前的版本..."));
		} catch (IOException e) {
			e.printStackTrace();
			throw(new Exception("文件打开失败，请重新上传..."));
		}
		return dataList;
	}
	
	/**
	 * 创建Excel文件
	 * @param rows 数据
	 * @param ArrayList<HashMap<String,String>> headerInfo 表头；内容来自于对表定义的查询
	 * @param sheetName 表名
	 * @return 文件流
	 * @throws IOException
	 * @throws RowsExceededException
	 * @throws WriteException
	 */
	public InputStream createXLS(ArrayList<HashMap<String,Object>> rows,ArrayList<HashMap<String,String>> headerInfo, String sheetName) throws IOException, RowsExceededException, WriteException{
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		WritableWorkbook book = Workbook.createWorkbook(os);
		WritableSheet sheet = book.createSheet(sheetName, 0);
		int col = 0;
		int row = 0;
		int fn = 0;
		String[] field = new String[headerInfo.size()];
		for(HashMap<String,String> h:headerInfo){
			Label cell = new Label(col++, row, h.get("COLUMN_COMMENT"));
			sheet.addCell(cell);
			field[fn++] = h.get("COLUMN_NAME");
		}
		for(HashMap<String,Object> r:rows){
			row++;
			for(int i= 0;i< field.length;i++){
				Label cell = new Label(i, row,r.get(field[i]).toString());
				sheet.addCell(cell);
			}
		}
		book.write();
		book.close();
	
		return new ByteArrayInputStream(os.toByteArray());
	}
	
	/**
	 * 创建Excel文件
	 * @param ArrayList<HashMap<String,Object>> rows 数据
	 * @param HashMap<String,String> headerInfo 表头  key:字段名，value：字段中文说明
	 * @param String sheetName 表名
	 * @return 文件流
	 * @throws IOException
	 * @throws RowsExceededException
	 * @throws WriteException
	 */
	public InputStream createXLS(ArrayList<HashMap<String,Object>> rows,HashMap<String,String> headerInfo, String sheetName) throws RowsExceededException, WriteException, IOException{
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		WritableWorkbook book = Workbook.createWorkbook(os);
		WritableSheet sheet = book.createSheet(sheetName, 0);
		int col = 0;
		int row = 0;
		int fn = 0;
		String[] field = new String[headerInfo.size()];
		for(Entry<String, String> header:headerInfo.entrySet()){
			Label cell = new Label(col++, row, header.getValue());
			sheet.addCell(cell);
			field[fn++] = header.getKey();
		}
		for(HashMap<String,Object> r:rows){
			row++;
			for(int i= 0;i< field.length;i++){
				Label cell = new Label(i, row,r.get(field[i]).toString());
				sheet.addCell(cell);
			}
		}
		book.write();
		book.close();
	
		return new ByteArrayInputStream(os.toByteArray());
	}
}
