package project.config.util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
public class DBUtil {
	private static Context inc = null;
	private static DataSource ds = null;
	//private static DBUtil instance = null;
	public DBUtil(){ }
	static{
		try{
			if(inc == null){
				inc = new InitialContext();
			}
			if(ds == null){
				ds = (DataSource)inc.lookup("java:comp/env/jdbc/lsh");
			}
		}catch(Exception ex){
			//System.err.println("DB연결 ERROR");
			ex.printStackTrace();
		}
	}
	/**
	 * 커넥션 동기화
	 * @return Connection
	 */
	public static Connection getInstance()throws SQLException{
		synchronized(DBUtil.class){
			Connection con = null;
			
			if(con == null){
				con = ds.getConnection();
			}
			return con;
		}
	}
	
	public Connection getConnection()throws SQLException{
		Connection con = null;
		if(con == null){
			con = ds.getConnection();
		}
		return con;
	}
}

