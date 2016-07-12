package project.config.util;

import java.io.*;
import java.sql.*;
import java.text.DecimalFormat;
import java.util.*;

public class RsUtil
{

    public RsUtil()
    {
    }

    public static Object[] toArrayUtil(ResultSet resultset)
        throws SQLException
    {
        ResultSetMetaData resultsetmetadata = resultset.getMetaData();
        int i = resultsetmetadata.getColumnCount();
        Object aobj[] = new Object[i];
        for(int j = 0; j < i; j++)
            aobj[j] = resultset.getObject(j + 1);

        return aobj;
    }

    public static int stmtUpdate(Connection connection, String s)
        throws SQLException
    {
        Statement statement = null;
        int i;
        try
        {
            statement = connection.createStatement();
            i = statement.executeUpdate(s);
        }
        finally
        {
            statement.close();
            if(statement != null)
                try
                {
                    statement.close();
                }
                catch(SQLException sqlexception) { }
        }
        return i;
    }

    public static List<Object> stmtExecute(Connection connection, String s)
        throws SQLException
    {
        Statement statement = null;
        ResultSet resultset = null;
        ArrayList<Object> arraylist = new ArrayList<Object>();
        try
        {
            statement = connection.createStatement();
            for(resultset = statement.executeQuery(s); resultset.next(); arraylist.add(((Object) (toArrayUtil(resultset)))));
            resultset.close();
            statement.close();
        }
        finally
        {
            if(resultset != null)
                try
                {
                    resultset.close();
                }
                catch(SQLException sqlexception) { }
            if(statement != null)
                try
                {
                    statement.close();
                }
                catch(SQLException sqlexception1) { }
        }
        return arraylist;
    }

    public static List stmtExecute(Connection connection, String s, String s1, String s2)
        throws SQLException, IOException
    {
        Object obj = new ArrayList();
        String s3 = "E://web/props/sqlj/" + s1 + ".sqlj";
        FileInputStream fileinputstream = new FileInputStream(new File(s3));
        try
        {
            if(fileinputstream != null)
            {
                Properties properties = new Properties();
                properties.load(fileinputstream);
                HashMap hashmap = new HashMap(properties);
                obj = stmtExecute(connection, (String)hashmap.get(s2));
            }
            fileinputstream.close();
        }
        finally
        {
            fileinputstream.close();
            if(fileinputstream != null)
                try
                {
                    fileinputstream.close();
                }
                catch(Exception exception1) { }
        }
        return ((List) (obj));
    }

    public static List<Object> pstmtExecute(Connection connection, String s)
        throws SQLException
    {
        PreparedStatement preparedstatement = null;
        ResultSet resultset = null;
        ArrayList<Object> arraylist = new ArrayList<Object>();
        try
        {
            preparedstatement = connection.prepareStatement(s);
            for(resultset = preparedstatement.executeQuery(); resultset.next(); arraylist.add(((Object) (toArrayUtil(resultset)))));
            resultset.close();
            preparedstatement.close();
        }
        finally
        {
            if(resultset != null)
                try
                {
                    resultset.close();
                }
                catch(SQLException sqlexception) { }
            if(preparedstatement != null)
                try
                {
                    preparedstatement.close();
                }
                catch(SQLException sqlexception1) { }
        }
        return arraylist;
    }

    public static List pstmtExecute(Connection connection, String s, String s1)
        throws SQLException, IOException
    {
        Object obj = new ArrayList();
        String s2 = "E://web/props/sqlj/" + s + ".sqlj";
        FileInputStream fileinputstream = new FileInputStream(new File(s2));
        try
        {
            if(fileinputstream != null)
            {
                Properties properties = new Properties();
                properties.load(fileinputstream);
                HashMap hashmap = new HashMap(properties);
                obj = pstmtExecute(connection, (String)hashmap.get(s1));
            }
        }
        finally
        {
            fileinputstream.close();
            if(fileinputstream != null)
                try
                {
                    fileinputstream.close();
                }
                catch(Exception exception1) { }
        }
        return ((List) (obj));
    }
    
    public static List<Object> pstmtExecute(Connection connection, String s, int aobj[])
            throws SQLException
        {
            PreparedStatement preparedstatement = null;
            ResultSet resultset = null;
            ArrayList<Object> arraylist = new ArrayList<Object>();
            try
            {
                preparedstatement = connection.prepareStatement(s);
                for(int i = 0; i < aobj.length; i++)
                    preparedstatement.setInt(i + 1, aobj[i]);

                for(resultset = preparedstatement.executeQuery(); resultset.next(); arraylist.add(((Object) (toArrayUtil(resultset)))));
                resultset.close();
                preparedstatement.close();
            }
            finally
            {
                if(resultset != null)
                    try
                    {
                        resultset.close();
                    }
                    catch(SQLException sqlexception) { }
                if(preparedstatement != null)
                    try
                    {
                        preparedstatement.close();
                    }
                    catch(SQLException sqlexception1) { }
            }
            return arraylist;
        }

    public static List<Object> pstmtExecute(Connection connection, String s, Object aobj[])
        throws SQLException
    {
        PreparedStatement preparedstatement = null;
        ResultSet resultset = null;
        ArrayList<Object> arraylist = new ArrayList<Object>();
        try
        {
            preparedstatement = connection.prepareStatement(s);
            for(int i = 0; i < aobj.length; i++)
                preparedstatement.setString(i + 1, (String)aobj[i]);

            for(resultset = preparedstatement.executeQuery(); resultset.next(); arraylist.add(((Object) (toArrayUtil(resultset)))));
            resultset.close();
            preparedstatement.close();
        }
        finally
        {
            if(resultset != null)
                try
                {
                    resultset.close();
                }
                catch(SQLException sqlexception) { }
            if(preparedstatement != null)
                try
                {
                    preparedstatement.close();
                }
                catch(SQLException sqlexception1) { }
        }
        return arraylist;
    }

    public static List pstmtExecute(Connection connection, Object aobj[], String s, String s1)
        throws SQLException, IOException
    {
        Object obj = new ArrayList();
        String s2 = "E://web/props/sqlj/" + s + ".sqlj";
        FileInputStream fileinputstream = new FileInputStream(new File(s2));
        try
        {
            if(fileinputstream != null)
            {
                Properties properties = new Properties();
                properties.load(fileinputstream);
                HashMap hashmap = new HashMap(properties);
                obj = pstmtExecute(connection, (String)hashmap.get(s1), aobj);
            }
        }
        finally
        {
            fileinputstream.close();
            if(fileinputstream != null)
                try
                {
                    fileinputstream.close();
                }
                catch(Exception exception1) { }
        }
        return ((List) (obj));
    }


    public static String checkNull(Object obj)
    {
        if(obj == null)
        {
            return "";
        } else
        {
            String s = obj.toString();
            s = s.trim();
            return s;
        }
    }
    
    /**
	 * NULL 확인 "0"을 반환
	 */
	public  static String checkNullZero(String str)
	{
		if (str == null) return  "0";
		else return str.trim();
	}

    public static String convts(Object obj)
    {
        String s = "";
        if(obj == null)
            s = "";
        else
            s = obj.toString().trim();
        return s;
    }

    public static int convti(Object obj)
    {
        int i = 0;
        String s = checkNull(obj);
        if(s.length() > 0)
            i = Integer.parseInt(s);
        else
            i = 0;
        return i;
    }
    
    public static double convtd(Object obj){
    	double d = 0;
    	String s = checkNull(obj);
    	if(s.length() > 0)
    		d = Double.parseDouble(s);
    	else
    		d = 0;
    	return d;
    }

    public static String convtComma(Object obj)
    {
        String s = "0";
        int i = convti(obj);
        DecimalFormat decimalformat = new DecimalFormat("#,##0");
        s = decimalformat.format(i);
        return s;
    }

    public static String convtFormat(Object obj, String s)
    {
        String s1 = "0";
        int i = convti(obj);
        DecimalFormat decimalformat = new DecimalFormat(s);
        s1 = decimalformat.format(i);
        return s1;
    }
}
