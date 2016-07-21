package project.config.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class WebUtil {
	/**
	 * Default 생성자
	 */
	public WebUtil(){ }




	/**
	 * 고유번호 따기
	 * 2~8자리까지 가능
	 * 2014-05-16
	 * @param tableName - 테이블명
	 * @param numberSize - 자리수
	 * @param columnName - max할 컬럼명
	 * @param con - 연결된 커넥션
	 * @return String
	 * @throws Exception
	 */
	public static String pkNumber(String tableName, int numberSize, String columnName, Connection con) throws Exception{
		//Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String pkNumber = "";
		int maxNumber = 0;
		try{
			//con = DBControl.connectionCreate();
			if(con == null){
				System.err.println("JDBC Connection Error : [" + MultiUtil.currentDateTime("yyyy-MM-dd HH:mm:ss") + "] - Connection Null!!");
			}
			String sql = "";
			//sql += "select nvl(max(" + columnName + "), 0) from " + tableName; //oracle
			//sql += "select isnull(max(" + columnName + "), 0) from " + tableName; //mssql
			sql += "select ifnull(max(" + columnName + "), 0) from " + tableName; //mysql

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				maxNumber = rs.getInt(1);
			}

			if(maxNumber == 0){
				//값이 존재하지 않을때 
				//1부터 시작 numberSize가 8 이라면
				//00000001 < 고유번호 생성
				for(int i=0; i<numberSize; i++){
					if(i == numberSize-1){
						pkNumber += "1";
						break;
					}
					pkNumber += "0";
				}
			}else{
				//값이 존재할때
				maxNumber = maxNumber + 1; //maxNumber 1증가
				switch(numberSize){
				case 8 :
					if(maxNumber < 10) pkNumber = "0000000" + (maxNumber);
					else if(maxNumber < 100 && maxNumber >= 10) pkNumber = "000000" + (maxNumber);
					else if(maxNumber < 1000 && maxNumber >= 100) pkNumber = "00000" + (maxNumber);
					else if(maxNumber < 10000 && maxNumber >= 1000) pkNumber = "0000" + (maxNumber);
					else if(maxNumber < 100000 && maxNumber >= 10000) pkNumber = "000" + (maxNumber);
					else if(maxNumber < 1000000 && maxNumber >= 100000) pkNumber = "00" + (maxNumber);
					else if(maxNumber < 10000000 && maxNumber >= 1000000) pkNumber = "0" + (maxNumber);
					break;
				case 7:
					if(maxNumber < 10) pkNumber = "000000" + (maxNumber);
					else if(maxNumber < 100 && maxNumber >= 10) pkNumber = "00000" + (maxNumber);
					else if(maxNumber < 1000 && maxNumber >= 100) pkNumber = "0000" + (maxNumber);
					else if(maxNumber < 10000 && maxNumber >= 1000) pkNumber = "000" + (maxNumber);
					else if(maxNumber < 100000 && maxNumber >= 10000) pkNumber = "00" + (maxNumber);
					else if(maxNumber < 1000000 && maxNumber >= 100000) pkNumber = "0" + (maxNumber);
					break;
				case 6:
					if(maxNumber < 10) pkNumber = "00000" + (maxNumber);
					else if(maxNumber < 100 && maxNumber >= 10) pkNumber = "0000" + (maxNumber);
					else if(maxNumber < 1000 && maxNumber >= 100) pkNumber = "000" + (maxNumber);
					else if(maxNumber < 10000 && maxNumber >= 1000) pkNumber = "00" + (maxNumber);
					else if(maxNumber < 100000 && maxNumber >= 10000) pkNumber = "0" + (maxNumber);
					break;
				case 5:
					if(maxNumber < 10) pkNumber = "0000" + (maxNumber);
					else if(maxNumber < 100 && maxNumber >= 10) pkNumber = "000" + (maxNumber);
					else if(maxNumber < 1000 && maxNumber >= 100) pkNumber = "00" + (maxNumber);
					else if(maxNumber < 10000 && maxNumber >= 1000) pkNumber = "0" + (maxNumber);
					break;
				case 4:
					if(maxNumber < 10) pkNumber = "000" + (maxNumber);
					else if(maxNumber < 100 && maxNumber >= 10) pkNumber = "00" + (maxNumber);
					else if(maxNumber < 1000 && maxNumber >= 100) pkNumber = "0" + (maxNumber);
					break;
				case 3:
					if(maxNumber < 10) pkNumber = "00" + (maxNumber);
					else if(maxNumber < 100 && maxNumber >= 10) pkNumber = "0" + (maxNumber);
					break;
				case 2:
					if(maxNumber < 10) pkNumber = "0" + (maxNumber);
					else if(maxNumber < 100 && maxNumber >= 10) pkNumber = String.valueOf(maxNumber++);
					break;
				default :
					break;
				}
			}
		}catch(Throwable e){
			e.printStackTrace();
			/*StackTraceElement[] logs = e.getStackTrace(); 
			Debug.log(logs);*/
		}finally{
			DBControl.psRsClose(pstmt, rs);
		}
		return pkNumber;
	}

	/**
	 * paging 처리 메서드
	 * table의 tr 로 들어간다
	 * @param s
	 * @param i
	 * @param j
	 * @param k
	 * @param l
	 * @return String
	 * @throws IOException
	 */
	public static  String printPageIndex(String s, int i, int j, int k, int l) throws IOException {
		if(j <= k)
			return "";
		byte byte0 = 10;

		StringBuffer stringbuffer = new StringBuffer(1000);
		int i1 = (i - 1) / byte0;
		int j1 = (i - 1) % byte0;
		int k1 = j / k;

		if(j % k != 0)
			k1++;

		if(s.indexOf(63) == -1)
			s = s + "?page_index=";
		else
			s = s + "&page_index=";
		//stringbuffer.append("\t<tr>\n");
		stringbuffer.append("\t\t<td class='pagecss' colspan=" + l + " align=center>\n ");
		if(i1 != 0)	{
			stringbuffer.append("\t\t\t<a href=\"" + s + 1 + "\">1</a>\n ");
			stringbuffer.append("\t\t\t<a href=\"" + s + ((i1 * 10 - 10) + 1) + "\" class='direction prev' ><span></span><span></span>이전페이지</a>\n ");
		}
		for(int i2 = 0; i2 < byte0; i2++){
			int l1 = i1 * byte0 + i2 + 1;
			if(l1 > k1)
				break;
			if(l1 == i)
				stringbuffer.append("<strong>" + l1 + "</strong>\n ");
			else
				stringbuffer.append("<a href=\"" + s + l1 + "\">" + l1 + "</a>\n ");
		}

		stringbuffer.append("\n ");
		if(i1 != (k1 - 1) / byte0)	{
			stringbuffer.append("\t\t\t<a href=\"" + s + (i1 * 10 + 10 + 1) + "\" class='direction next' >다음페이지<span></span><span></span></a>\n ");
			stringbuffer.append("\t\t\t<a href=\"" + s + k1 + "\">" + k1 + "</a>\n ");
		}
		stringbuffer.append("\t\t</td>\n ");
		return stringbuffer.toString();
	}

	/**
	 * paging 처리 메서드
	 * table의 tr 로 들어간다
	 * 부트스트랩 페이징
	 * @param s
	 * @param i
	 * @param j
	 * @param k
	 * @param l
	 * @return String
	 * @throws IOException
	 */
	public static  String printPageIndex1(String s, int i, int j, int k, int l, String aa) throws IOException {
		if(j <= k)
			return "";
		byte byte0 = 10;

		StringBuffer stringbuffer = new StringBuffer(1000);
		int i1 = (i - 1) / byte0;
		int j1 = (i - 1) % byte0;
		int k1 = j / k;

		if(j % k != 0)
			k1++;

		if(s.indexOf(63) == -1)
			s = s + "?page_index=";
		else
			s = s + "&page_index=";
		//stringbuffer.append("\t<tr>\n");
		stringbuffer.append("<ul class=\"pagination pagination-centered\" style='margin-top:5px; margin-bottom:5px;'>\n");
		if(i1 != 0)	{
			stringbuffer.append("<li><a href=\"javascript:" + aa + "(1);\">1</a></li>\n ");
			stringbuffer.append("<li><a href=\"javascript:"+aa+"("+((i1 * 10 - 10) + 1)+");\" class='direction prev' >&laquo;</a></li>\n ");
		}
		for(int i2 = 0; i2 < byte0; i2++){
			int l1 = i1 * byte0 + i2 + 1;
			if(l1 > k1)
				break;
			if(l1 == i)
				stringbuffer.append("<li class=\"active\"><a href=\"#\">" + l1 + "</a></li>\n ");
			else
				stringbuffer.append("<li><a href=\"javascript:"+aa+"("+l1+");\">" + l1 + "</a></li>\n ");
		}

		stringbuffer.append("\n ");
		if(i1 != (k1 - 1) / byte0)	{
			stringbuffer.append("<li><a href=\"javascript:"+aa+"("+ (i1 * 10 + 10 + 1) + ");\" class='direction next' >&raquo;</a></li>\n ");
			stringbuffer.append("<li><a href=\"javascript:"+aa+"("+k1+");\">" + k1 + "</a></li>\n ");
		}
		stringbuffer.append("</ul>");
		return stringbuffer.toString();
	}



	public static  String printPageIndex3(String s, int i, int j, int k, int l, String aa) throws IOException{
		if(j <= k)
			return "";
		byte byte0 = 10;

		StringBuffer stringbuffer = new StringBuffer(1000);
		int i1 = (i - 1) / byte0;
		int j1 = (i - 1) % byte0;
		int k1 = j / k;

		if(j % k != 0)
			k1++;

		if(s.indexOf(63) == -1)
			s = s + "?page_index=";
		else
			s = s + "&page_index=";
		//stringbuffer.append("\t<tr>\n");
		stringbuffer.append("\t\t<td class='pagecss' colspan=" + l + " align=center>\n ");
		if(i1 != 0)
		{
			stringbuffer.append("\t\t\t<a href=\"javascript:"+aa+"(1);\">1</a>\n ");
			stringbuffer.append("\t\t\t<a href=\"javascript:"+aa+"("+((i1 * 10 - 10) + 1)+");\" class='direction prev' ><span></span><span></span>이전페이지</a>\n ");
		}
		for(int i2 = 0; i2 < byte0; i2++)
		{
			int l1 = i1 * byte0 + i2 + 1;
			if(l1 > k1)
				break;
			if(l1 == i)
				stringbuffer.append("<strong>" + l1 + "</strong>\n ");
			else
				stringbuffer.append("<a href=\"javascript:"+aa+"("+l1+");\">" + l1 + "</a>\n ");
		}

		stringbuffer.append("\n ");
		if(i1 != (k1 - 1) / byte0)
		{
			stringbuffer.append("\t\t\t<a href=\"javascript:"+aa+"("+ (i1 * 10 + 10 + 1) + ");\" class='direction next' >다음페이지<span></span><span></span></a>\n ");
			stringbuffer.append("\t\t\t<a href=\"javascript:"+aa+"("+k1+");\">" + k1 + "</a>\n ");
		}
		stringbuffer.append("\t\t</td>\n ");
		return stringbuffer.toString();
	}
	
	public static  String printPageIndex4(String s, int i, int j, int k, int l, String aa, String realPath) throws IOException{
		if(j <= k)
			return "";
		byte byte0 = 10;
		System.out.println(realPath);
		StringBuffer stringbuffer = new StringBuffer(1000);
		int i1 = (i - 1) / byte0;
		int j1 = (i - 1) % byte0;
		int k1 = j / k;

		if(j % k != 0)
			k1++;

		if(s.indexOf(63) == -1)
			s = s + "?page=";
		else
			s = s + "&page=";
		//stringbuffer.append("\t<tr>\n");
		stringbuffer.append("\t\t<ul class='pager_wrap' colspan=" + l + " align=center>\n ");
		/*if(i1 != 0) {
			stringbuffer.append("\t\t\t<a href=\"javascript:"+aa+"(1);\"><<</a>\n ");
			stringbuffer.append("\t\t\t<a href=\"javascript:"+aa+"("+((i1 * 10 - 10) + 1)+");\" class='direction prev' ><span></span><span></span><</a>\n ");
		}*/
		if(i1 != 0) {
			stringbuffer.append("\t\t\t<a class='btn' href=\"javascript:"+aa+"(1);\"><img src='"+realPath+"/css/images/btn_page_prev02.gif' alt='처음 페이지로 가기' /></a>\n ");
			stringbuffer.append("\t\t\t<a class='btn' href=\"javascript:"+aa+"("+((i1 * 10 - 10) + 1)+");\"><img src='"+realPath+"/css/images/btn_page_prev.gif' alt='이전 페이지로 가기' /></a>\n ");
		} else {
			stringbuffer.append("\t\t\t<a class='btn' href=\"javascript:"+aa+"(1);\"><img src='"+realPath+"/css/images/btn_page_prev02.gif' alt='처음 페이지로 가기' /></a>\n ");
			stringbuffer.append("\t\t\t<a class='btn' href=''><img src='"+realPath+"/css/images/btn_page_prev.gif' alt='처음 페이지로 가기' /></a>\n ");
		}

		for(int i2 = 0; i2 < byte0; i2++) {
			int l1 = i1 * byte0 + i2 + 1;
			if(l1 > k1)
				break;
			if(l1 == i)
				stringbuffer.append("<a href='#'><strong>" + l1 + "</strong></a>\n ");
			else
				stringbuffer.append("<a href=\"javascript:"+aa+"("+l1+");\">" + l1 + "</a>\n ");
		}

		stringbuffer.append("\n ");
		if(i1 != (k1 - 1) / byte0) {
			stringbuffer.append("\t\t\t<a class='btn' href=\"javascript:"+aa+"("+ (i1 * 10 + 10 + 1) + ");\" class='direction next' ><img src='"+realPath+"/css/images/btn_page_next.gif' alt='다음 페이지로 가기' /></a>\n ");
			stringbuffer.append("\t\t\t<a class='btn' href=\"javascript:"+aa+"("+k1+");\"><img src='"+realPath+"/css/images/btn_page_next02.gif' alt='마지막 페이지로 가기' /></a></a>\n ");
		}
		stringbuffer.append("\t\t</ul>\n ");
		return stringbuffer.toString();
	}




	/**
	 * ResultSet 받아서 Object[]로 반환시킨다
	 * @param rs
	 * @return Object[]
	 * @throws Exception
	 */
	public static Object[] executeArrayObject(ResultSet rs) throws Exception{
		ResultSetMetaData rsmd = rs.getMetaData();
		Object[] inData = new Object[rsmd.getColumnCount()];
		for(int i=0; i<inData.length; i++){
			inData[i] = rs.getObject(i+1);
		}
		return inData;
	}

	/**
	 * executeQuery 구현 메서드 조건없는 쿼리
	 * Object[] 로 된
	 * List로 반환한다
	 * 2014-04-27
	 * ResultSetMetaData rsmd = rs.getMetaData(); 사용해서 해당 rs에 대한 메타 정보 가져옴
	 * 가져와서 rsmd.getColumnCount(); 하면 int 형으로 해당 row에 대한 count값을 가져온다.
	 * Object[] a = new Object[rsmd.getColumnCount()];
	 * for을 사용해 a[i] 곳에 rs.getObject[i+1];을 넣는다
	 * 넣은 Object를 List에 add시킨다
	 * @param con
	 * @param sql
	 * @return List
	 * @throws SQLException
	 */
	public static List<Object> executeQuery(Connection con, String sql) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Object> inList = new ArrayList<Object>();
		try{
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				inList.add(executeArrayObject(rs));
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			DBControl.psRsClose(pstmt, rs);
		}
		return inList;
	}

	/**
	 * executeQuery 구현 메서드 조건있는 쿼리
	 * @param con
	 * @param sql
	 * @param param
	 * @return List
	 * @throws SQLException
	 */
	public static List<Object> executeQuery(Connection con, String sql, Object[] param) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Object> inList = new ArrayList<Object>();
		try{
			pstmt = con.prepareStatement(sql);
			for(int i=0; i<param.length; i++){
				pstmt.setString(i+1, param[i].toString());
			}
			rs = pstmt.executeQuery();
			while(rs.next()){
				inList.add(executeArrayObject(rs));
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			DBControl.psRsClose(pstmt, rs);
		}
		return inList;
	}


	/*
	 *Desc : 문자열이외의 문자를 삭제한다
	 */
	public synchronized static final String MaskClearString(String xxx){
		boolean bbb = false;
		StringBuffer yyy = new StringBuffer("");
		String xyx = new String("");
		if(xxx == null) return new String("");

		for(int b = 0 ; b < xxx.length() ; b++){
			char c = xxx.charAt(b);
			if(Character.isDigit(c)==true){
				yyy.append(c);
			}
		}
		xyx = yyy.toString();
		return xyx;
	}

	/*
	 *Desc : 전화번호의 출력을 조정한다
	 */
	public static String tel(String paramString){
		//File localFile = new File("E:/web/jsp/phonebook.txt");
		//wisesystems
		File localFile = new File("C:/dev/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/chamgosu/WEB-INF/classes/project/config/properties/tel_properties.txt");
		//SDW 노트북
		//File localFile = new File("C:/Web/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/chamgosu/WEB-INF/classes/project/config/properties/tel_properties.txt");
		//File localFile = new File("/home/hosting_users/llsh910card/tomcat/webapps/ROOT/WEB-INF/classes/lsh/tel_properties.txt");

		FileInputStream localFileInputStream = null;
		FileInputStream localFileInputStream2 = null;
		String str1 = "";
		String str2 = "";
		int i = 0;
		int j = 0;
		int linecnt = 0;
		if(localFile.exists());
		try{
			localFileInputStream2 = new FileInputStream(localFile);
			BufferedReader localBufferedReader2 = new BufferedReader(new InputStreamReader(localFileInputStream2));
			String str3s = "";
			while((str3s = localBufferedReader2.readLine()) != null){
				++linecnt;
			}
			localBufferedReader2.close();
			localFileInputStream2.close();

			localFileInputStream = new FileInputStream(localFile);
			BufferedReader localBufferedReader = new BufferedReader(new InputStreamReader(localFileInputStream));
			String str3 = "";
			String[] arrayOfString = new String[linecnt];
			while((str3 = localBufferedReader.readLine()) != null){
				str1 = str3.toString();
				//System.out.println(str1);
				arrayOfString[j] = new String(str1);
				++j;
			}
			localBufferedReader.close();
			localFileInputStream.close();
			int k = paramString.length();
			//System.out.println(paramString);
			if(k >= 8){
				String str4 = paramString.substring(0, 2);
				String str5 = paramString.substring(0, 3);
				String str6 = paramString.substring(0, 4);
				//System.out.println(str4);
				if(str4.equals("02")){
					i = 2;
				}else{
					for(int l = 0; l < arrayOfString.length; ++l){
						if(str5.equals(arrayOfString[l])){
							i = 3;
							break;
						}
						if(!str6.equals(arrayOfString[l])){
							continue;
						}
						i = 4;
						break;
					}
				}
				//System.out.println(i);

				if (i == 2){
					if (k == 9){
						str2 = paramString.substring(0, 2) + "-" + paramString.substring(2, 5) + "-" + paramString.substring(5);
					}else if(k == 10){
						str2 = paramString.substring(0, 2) + "-" + paramString.substring(2, 6) + "-" + paramString.substring(6);
					}else{
						str2 = "";
					}
				}else if(i == 3){
					if(k == 10){
						str2 = paramString.substring(0, 3) + "-" + paramString.substring(3, 6) + "-" + paramString.substring(6);
					}else if(k == 11){
						str2 = paramString.substring(0, 3) + "-" + paramString.substring(3, 7) + "-" + paramString.substring(7);
					}else{
						str2 = "";
					}
				}
				else if(i == 4){
					if (paramString.substring(0, 4).equals("1544")){
						str2 = paramString.substring(0, 4) + "-" + paramString.substring(4, 8);
					}else if(paramString.substring(0, 4).equals("1588")){
						str2 = paramString.substring(0, 4) + "-" + paramString.substring(4, 8);
					}else if(paramString.substring(0, 4).equals("1899")){
						str2 = paramString.substring(0, 4) + "-" + paramString.substring(4, 8);
					}else if(k == 11){
						str2 = paramString.substring(0, 4) + "-" + paramString.substring(4, 7) + "-" + paramString.substring(7);
					}else if(k == 12){
						str2 = paramString.substring(0, 4) + "-" + paramString.substring(4, 8) + "-" + paramString.substring(8);
					}else{
						str2 = "";
					}

				}else{
					str2 = "";
				}
			}else{
				str2 = "";
			}

		}catch (Exception localException1){
			//System.err.println(AladdinCommon.getCurrentDate() + "[ TEL METHOD 5 ERROR :  " + localException1.toString());
		}finally{
			if (localFileInputStream != null)
				try { localFileInputStream.close(); }
			catch (Exception localException2) { }

			if (localFileInputStream2 != null)
				try { localFileInputStream2.close(); }
			catch (Exception localException2) { }
		}
		return str2;
	}

	//selected
	public static String isSelected(String value1, String testValue){
		return (value1.equals(testValue)) ? "selected" : "";
	}

	//checked
	public static String isChecked(String value1, String testValue){
		return (value1.equals(testValue)) ? "checked" : "";
	}

	/**
	 * request.getContextPath() return 메서드
	 * @return
	 * @throws Exception
	 */
	public static String getContextPath(HttpServletRequest request) throws Exception{
		return request.getContextPath();
	}
}
