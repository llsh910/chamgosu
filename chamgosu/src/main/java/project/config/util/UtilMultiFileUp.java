package project.config.util;


import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

//파일업로드

public class UtilMultiFileUp {


	List<FileItem> items;
	private boolean multiPart; // 폼의 enctype이 multipart/form-data 인지 확인을 위한 변수
	private HashMap<String, String[]> paramMap; //폼필드의 값을 저장하기 위한 Map


	public UtilMultiFileUp(HttpServletRequest request) throws Exception{


		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		items = upload.parseRequest(request); // 넘어온 데이터를 각각 나눠서 저장.

		paramMap = new HashMap<String, String[]>();


		if(ServletFileUpload.isMultipartContent(request)){
			multiPart = true; //폼태그의 enc타입이 multipart/form-data 이면 true
		}

		for(FileItem fileItem : items){
			String name = fileItem.getFieldName(); //폼의 각 항목의 이름을 저장
			if(fileItem.isFormField()){ //폼 필드인지 검사
				String value = "";
				value = new String(fileItem.getString().getBytes("UTF-8")); //해당 item의 value값을 가져온다.
				String[] values = paramMap.get(name); //HashMap에 해당 name(key)에 해당하는 값이 있나확인.
				if(values == null){//key값에 해당하는 배열이 없으면 value값을 배열에 저장.
					values = new String[]{value};
				}else{  //해당 배열이 존재한다면, 현재 fileItem의 값인 value로 값 수정.
					String[] tempValues = new String[values.length+1];
					System.arraycopy(values, 0, tempValues, 0, values.length); //
					tempValues[tempValues.length-1] = value;
					values = tempValues;
				}
				paramMap.put(name,values); //parameter 저장.
			}//if(ifFormField) 끝
		}//반복문의 끝
	}//생성자의 끝

	//파라미터값
	public String getParameter(String fieldName) throws UnsupportedEncodingException{
		for(int cnt=0; cnt<items.size(); cnt++){
			FileItem item = (FileItem)items.get(cnt);
			if(item.getFieldName().equals(fieldName)){
				return item.getString("UTF-8");
			}
		}
		return null;
	}

	//getParameterValues
	public List<String> getParameterValues(String fieldName)throws Exception{
		List<String> fileNames = new ArrayList<String>();
		for(int cnt=0; cnt<items.size(); cnt++){
			FileItem item = (FileItem)items.get(cnt);
			if(item.getFieldName().equals(fieldName)){
				fileNames.add(item.getString("UTF-8"));
			}
		}
		return fileNames;
	}

	//파일 이름 한개	
	public String getFileNameOne(String fieldName){
		for(int cnt=0; cnt<items.size(); cnt++){
			FileItem item = (FileItem)items.get(cnt);
			if(item.getFieldName().equals(fieldName)){
				//System.out.println(item.getName()); //파일이름출력 확인.
				if(item.getName() != null && !item.getName().equals("")){
					return new File(item.getName()).getName().replaceAll(" ", "_");
				}else{
					return "";
				}
			}
		}
		return "";
	}

	//파일 이름 여러개
	public List<String> getFileName(String fieldName){
		List<String> fileName = new ArrayList<String>();
		for(int cnt=0; cnt<items.size(); cnt++){
			FileItem item = (FileItem)items.get(cnt);
			if(item.getFieldName().equals(fieldName)){
				//System.out.println(item.getName()); //파일이름출력 확인.
				if(item.getName() != null && !item.getName().equals("")){
					fileName.add(new File(item.getName()).getName().replaceAll(" ", "_"));
				}
			}
		}
		return fileName;
	}

	//파일 사이즈
	public long getFileSize(String fieldName){
		for(int cnt=0; cnt<items.size(); cnt++){
			FileItem item = (FileItem)items.get(cnt);
			if(item.getFieldName().equals(fieldName)){
				if(!item.getName().equals("")){
					return item.getSize();
				}else{
					return 0;
				}
			}
		}
		return 0;
	}

	//파일 저장 단일
	public void saveFile(String fieldName, String path) throws Exception{
		try{
			for(int cnt=0; cnt<items.size(); cnt++){
				FileItem item = (FileItem)items.get(cnt);
				if(item.getFieldName().equals(fieldName)){
					if(!item.isFormField()){
						File filePath = new File(path);
						File fileDir = filePath.getParentFile();
						fileDir.mkdir();
						item.write(new File(path));
						return;
					}
				}
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}

	//파일 저장 여러개
	public void saveFile(String fieldName, List<String> path) throws Exception{
		int j = 0;
		for(int i=0; i<items.size(); i++){
			FileItem item = (FileItem)items.get(i);
			if(item.getFieldName().equals(fieldName)){
				if(!item.isFormField()){
					File filePath = new File(path.get(j));
					File fileDir = filePath.getParentFile();
					fileDir.mkdir();
					item.write(new File(path.get(j)));
					j++;
				}
			}
		}
	}
}

