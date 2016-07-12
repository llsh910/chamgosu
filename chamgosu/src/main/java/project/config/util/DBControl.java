package project.config.util;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 형이 만든거다
 * @author JJJ
 *
 */
public class DBControl {
	
	public DBControl(){ }
	
	/**
	 * Connection 생성후 넘겨준다
	 * 2014-05-16
	 * @return Connection
	 * @throws SQLException
	 */
	public static Connection connectionCreate() throws SQLException{
		Connection con = null;
		try{
			con = DBUtil.getInstance();
		}catch(Throwable sqle){
			sqle.printStackTrace();
			/*StackTraceElement[] logs = sqle.getStackTrace(); 
			Debug.log(logs);*/
		}
		return con;
	}
	
	/**
	 * 자주사용db관련 close
	 * 2014-05-16
	 * @param con
	 * @param pstmt
	 * @param rs
	 * @throws SQLException
	 */
	public static void allClose(Connection con, PreparedStatement pstmt, ResultSet rs) throws SQLException{
		try{
			if(con != null) con.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		}catch(SQLException sqle){
			sqle.printStackTrace();
		}
	}
	
	/**
	 * 모든 db관련 close
	 * 2014-05-20
	 * @param con
	 * @param pstmt
	 * @param cstmt
	 * @param rs
	 * @throws SQLException
	 */
	public static void allClose(Connection con, PreparedStatement pstmt, CallableStatement cstmt, ResultSet rs) throws SQLException{
		try{
			if(con != null) con.close();
			if(pstmt != null) pstmt.close();
			if(cstmt != null) cstmt.close();
			if(rs != null) rs.close();
		}catch(SQLException sqle){
			sqle.printStackTrace();
		}
	}
	
	/**
	 * CallableStatement close
	 * @param cstmt
	 * @throws SQLException
	 */
	public static void callClose(CallableStatement cstmt) throws SQLException{
		try{
			if(cstmt != null) cstmt.close();
		}catch(SQLException sqle){
			sqle.printStackTrace();
		}
	}
	
	/**
	 * PreparedStatement, ResultSet close
	 * 2014-05-16
	 * @param pstmt
	 * @param rs
	 * @throws SQLException
	 */
	public static void psRsClose(PreparedStatement pstmt, ResultSet rs) throws SQLException{
		try{
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		}catch(SQLException sqle){
			sqle.printStackTrace();
		}
	}
	
	/**
	 * Connection close
	 * 2014-05-16
	 * @param con
	 * @throws SQLException
	 */
	public static void conClose(Connection con) throws SQLException{
		try{
			if(con != null) con.close();
		}catch(SQLException sqle){
			sqle.printStackTrace();
		}
	}
	
	/**
	 * PreparedStatement close
	 * 2014-05-16
	 * @param pstmt
	 * @throws SQLException
	 */
	public static void pstmtClose(PreparedStatement pstmt) throws SQLException{
		try{
			if(pstmt != null) pstmt.close();
		}catch(SQLException sqle){
			sqle.printStackTrace();
		}
	}
	
	/**
	 * ResultSet close
	 * 2014-05-16
	 * @param rs
	 * @throws SQLException
	 */
	public static void rsClose(ResultSet rs) throws SQLException{
		try{
			if(rs != null) rs.close();
		}catch(SQLException sqle){
			sqle.printStackTrace();
		}
	}
	
	/**
	 * 정렬 asc
	 * @param columnName
	 * @return String
	 * @throws Exception
	 */
	public static String orderByAsc(String columnName) throws Exception{
		return "order by " + columnName + " asc";
	}
	
	/**
	 * 정렬 desc
	 * @param columnName
	 * @return String
	 * @throws Exception
	 */
	public static String orderByDesc(String columnName) throws Exception{
		return "order by " + columnName + " desc";
	}
	
	/**
	 * DB insert 
	 * insert될 테이블명과
	 * Object[]로 된 데이터를 받아 insert한다
	 * 해당 데이터와 컬럼명 배열은 동일배열위치에
	 * 넣어주어야 한다
	 * 시퀀스 자동증가 값이 아닌 pkNumberName이 따로 존재할 경우 사용하는 메서드
	 * 해당 insert마다 약간 씩 변경해줘야함
	 * DB함수를 따로 사용할 경우 
	 * DB함수를 부르는 메서드를 사용함 (예:) 시간함수등등)
	 * 2014-05-16
	 * @param tableName - 테이블명
	 * @param param - 실제 데이타 배열
	 * @param columnName - 컬럼명 배열
	 * @param pkNumberName - pk로 사용되는 컬럼명
	 * @param isFunc - DB함수의 사용여부
	 * @return boolean - false:실패 true:성공
	 * @throws SQLException
	 */
	public static boolean insertTable(String tableName, Object[] param, String[] columnName, String pkNumberName, boolean isFunc) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//db처리가됐는지 안됐는지 체크
		boolean isChk = true;
		String pkNumber = "";
		
		try{
			con = connectionCreate();
			if(con == null) System.err.println("JDBC Connection Error : [" + MultiUtil.currentDateTime("yyyy-MM-dd HH:mm:ss") + "] - Connection Null!!");
			
			con.setAutoCommit(false);
			
			//해당 테이블의 고유값
			pkNumber = WebUtil.pkNumber(tableName, 8, pkNumberName, con);
			
			StringBuffer sql = new StringBuffer();
			sql.append(" insert into " + tableName + "( " + pkNumberName + ", ");
			sql.append( columnNameAppend(columnName) + " ");
			
			//DB함수 사용할 때
			if(isFunc){
				//해당하는 컬럼명을 집어넣는다
			}
			
			sql.append(" ) ");
			sql.append(" values( ");
			for(int i=0; i<param.length; i++){
				if(i == param.length-1){
					sql.append("?");
					break;
				}
				sql.append("?,");
			}
			sql.append(", ?");
			
			//DB함수 사용할 때
			if(isFunc){
				//메서드를 만들어서 호출함
			}
			
			sql.append(" ) ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, pkNumber);
			for(int i=0; i<param.length; i++){
				pstmt.setString(i+2, param[i].toString());
			}
			pstmt.executeUpdate();
			con.commit();
			isChk = true;
		}catch(Throwable sqle){
			con.rollback();
			sqle.printStackTrace();
			isChk = false;
			/*StackTraceElement[] logs = sqle.getStackTrace(); 
			Debug.log(logs);*/
		}finally{
			con.setAutoCommit(true);
			allClose(con, pstmt, rs);
		}
		return isChk;
	}
	
	/**
	 * DB insert 
	 * 자동증가값이 있는 경우
	 * param데이터와 컬럼네임은 일치하게 배열값을 넣어줘야함
	 * db별사용방법
	 *  mysql mssql은 columnName에 sequence name 필요없음
	 *  현재 mssql, mysql기준으로 만듬
	 *  단순히 쿼리에서 처리할 일이 없는경우 사용
	 * 2014-05-16
	 * @param tableName
	 * @param param
	 * @param columnName
	 * @return
	 * @throws SQLException
	 */
	public static boolean insertTable(String tableName, Object[] param, String[] columnName) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//db처리가됐는지 안됐는지 체크
		boolean isChk = true;
		
		try{
			con = connectionCreate();
			if(con == null) System.err.println("JDBC Connection Error : [" + MultiUtil.currentDateTime("yyyy-MM-dd HH:mm:ss") + "] - Connection Null!!");
			
			con.setAutoCommit(false);
			
			
			//해당 테이블의 고유값
			
			StringBuffer sql = new StringBuffer();
			sql.append(" insert into " + tableName + "( ");
			sql.append( columnNameAppend(columnName) + " ");
			sql.append(" ) ");
			sql.append(" values( ");
			for(int i=0; i<param.length; i++){
				if(i == param.length-1){
					sql.append("?");
					break;
				}
				sql.append("?,");
			}
			sql.append(" ) ");
			pstmt = con.prepareStatement(sql.toString());
			for(int i=0; i<param.length; i++){
				pstmt.setString(i+1, param[i].toString());
			}
			pstmt.executeUpdate();
			con.commit();
		}catch(Throwable sqle){
			con.rollback();
			sqle.printStackTrace();
			isChk = false;
			/*StackTraceElement[] logs = sqle.getStackTrace(); 
			Debug.log(logs);*/
		}finally{
			con.setAutoCommit(true);
			allClose(con, pstmt, rs);
		}
		return isChk;
	}
	
	/**
	 * 디비 insert 오라클용
	 * 시퀀스 있을경우 - 오라클 전용
	 * 단순한 쿼리에 적용
	 * @param tableName
	 * @param param
	 * @param columnName
	 * @param seqName
	 * @return boolean - true 성공, false - 실패 
	 * @throws SQLException
	 */
	public static boolean insertTableOracle(String tableName, Object[] param, String[] columnName, String seqName) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//db처리가됐는지 안됐는지 체크
		boolean isChk = true;
		try{
			con = connectionCreate();
			if(con == null) System.err.println("JDBC Connection Error : [" + MultiUtil.currentDateTime("yyyy-MM-dd HH:mm:ss") + "] - Connection Null!!");
			
			con.setAutoCommit(false);
			
			StringBuffer sql = new StringBuffer();
			sql.append(" insert into " + tableName + "( ");
			sql.append( columnNameAppend(columnName) + " ");
			sql.append(" ) ");
			sql.append(" values( ");
			for(int i=0; i<param.length; i++){
				if(i == param.length-1){
					sql.append("?");
					break;
				}
				sql.append("?,");
			}
			sql.append(" ) ");
			pstmt = con.prepareStatement(sql.toString());
			//pstmt.setString(1, seqName+".nextVal");
			for(int i=0; i<param.length; i++){
				pstmt.setString(i+2, param[i].toString());
			}
			pstmt.executeUpdate();
			con.commit();
		}catch(Throwable sqle){
			con.rollback();
			sqle.printStackTrace();
			isChk = false;
			/*StackTraceElement[] logs = sqle.getStackTrace(); 
			Debug.log(logs);*/
		}finally{
			con.setAutoCommit(true);
			allClose(con, pstmt, rs);
		}
		return isChk;
	}
	
	
	
	/**
	 * 문자열을 ,로 이어 붙인다
	 * 2014-05-16
	 * @param columnName
	 * @return String
	 * @throws SQLException
	 * @throws IOException
	 */
	public static String columnNameAppend(String[] columnName) throws SQLException, IOException{
		String appendString = "";
		
		for(int i=0; i<columnName.length; i++){
			if(i == columnName.length-1){
				appendString += columnName[i];
				break;
			}
			appendString += columnName[i] + ", ";
		}		
		return appendString;
	}
}






















