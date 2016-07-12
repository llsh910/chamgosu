package project.config.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.io.StringWriter;
import java.io.Writer;
import java.net.URL;
import java.net.URLEncoder;

import javax.net.ssl.HttpsURLConnection;

public class PushConnection{

	/*public static String getAuthToken() throws Exception{
		String autuLine = "";

		StringBuffer postDataBuilder = new StringBuffer();

		postDataBuilder.append("accountType=HOSTED_OR_GOOGLE"); // 똑같이 써주셔야 합니다.
		postDataBuilder.append("&Email=llsh910@gmail.com"); // 개발자 구글 id
		postDataBuilder.append("&Passwd=llsodofopp"); // 개발자 구글 비빌번호
		postDataBuilder.append("&service=ac2dm");
		postDataBuilder.append("&source=c2dmdemo");

		try{
			byte[] tokenByte = postDataBuilder.toString().getBytes("UTF8");

			URL tokenUrl = new URL("https://www.google.com/accounts/ClientLogin");


			HttpURLConnection tokenConn = (HttpURLConnection)tokenUrl.openConnection();
			tokenConn.setDoOutput(true);
			tokenConn.setUseCaches(false);
			tokenConn.setRequestMethod("POST");
			tokenConn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			tokenConn.setRequestProperty("Content-Length", Integer.toString(tokenByte.length));


			OutputStream tokenOut = tokenConn.getOutputStream();
			tokenOut.write(tokenByte);
			tokenOut.close();

			BufferedReader tokenBR = new BufferedReader(new InputStreamReader(tokenConn.getInputStream()));
			
			String readLine;
			
			while((readLine = tokenBR.readLine()) != null){
				autuLine += readLine;
			}
			
			tokenBR.close();
			
			int idxOf = autuLine.indexOf("Auth=");
			
			autuLine = autuLine.substring(idxOf+5);
			//autuLine = tokenBR.readLine();

			//authtoken = autuLine.substring(5, autuLine.length());
		}catch(IOException io){
			io.printStackTrace();
		}
		return autuLine;
	}*/
	
	
	/**
	 * get방식으로 요청된걸 
	 * pushSender로 보냄
	 */
	/*public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try{ pushSender(request, response); }catch(Exception e){ e.printStackTrace(); }
	}*/
	
	/**
	 * post방식으로 요청된걸 
	 * pushSender로 보냄
	 */
	/*public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try{ pushSender(request, response); }catch(Exception e){ e.printStackTrace(); }
	}*/
	

	//푸쉬 쏴라
	public static void pushSender(String regId, String msg) throws Exception{
		
		/*InputStream is = request.getInputStream();
		
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		
		byte[] buffer = new byte[1024];
		
		int letti;
		
		String data_param = "";
		
		JSONObject data_j = null;
		
		
		while((letti = is.read(buffer)) > 0){
			baos.write(buffer, 0, letti);
		}
		
		data_param = new String(baos.toByteArray(), "UTF-8");
		
		is.close();
		baos.close();
		
		data_j = (JSONObject)new JSONParser().parse(data_param);*/
		
		
		//단말기 registration key
		//String regId = "APA91bG7HUi0bgrt57wKCSZuhzQ55FdhwAQY3h3Dih3fBYvasM8Fa8ZIhDoVlrFLDTvqUZ4vv3kZM0fecRO9CGF4euhEexibdBuVWmYiYDaHLnalhwbiSzPmLmexB9_tQ9vPTAFBIKEwSbBFBDu-FIDeyeOliF5t7g";
		//String regId = "APA91bHMfpJoWXBOR5S4Oh4R2AbNuyyrAhy-8MEIflshQG86YEtB1bIh-S4em0N_6AwOgVstjHLL7uI_JKeOMfHFCVdxJj75J8JJIRj3t-0wi9R5D5LpEI1MhzYFnvMBlDjWG0iU7sd6";
		
		
		//String regId = RsUtil.checkNull(String.valueOf(data_j.get("regId")));
		//String regId = RsUtil.checkNull(request.getParameter("token"));
		//String msg = RsUtil.checkNull(request.getParameter("msg"));
		
		//String authtoken = getAuthToken();
		
		//System.out.print(authtoken);

		StringBuffer dataPushMsg = new StringBuffer();

		dataPushMsg.append("registration_id=" + regId);
		dataPushMsg.append("&collapse_key=1");
		dataPushMsg.append("&delay_while_idle=1");
		dataPushMsg.append("&data.msg=" + URLEncoder.encode(msg, "UTF-8"));

		try{
			byte[] data_by = dataPushMsg.toString().getBytes("UTF-8");

			//URL url = new URL("https://android.apis.google.com/c2dm/send");
			URL url = new URL("https://android.googleapis.com/gcm/send");	
			

			HttpsURLConnection hucon = (HttpsURLConnection)url.openConnection();

			hucon.setHostnameVerifier(new CustomizedHostnameVerifier());
			hucon.setDoOutput(true);
			hucon.setUseCaches(false);
			hucon.setRequestMethod("POST");
			hucon.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			hucon.setRequestProperty("Content-Length", Integer.toString(data_by.length));
			//hucon.setRequestProperty("Authorization", "GoogleLogin auth=" + authtoken);
			hucon.setRequestProperty("Authorization", "key=AIzaSyAyRaE3kkr1Nkv66118OBJ0sJkf2GawjIw"); //google server application API key 

			OutputStream out = hucon.getOutputStream();
			out.write(data_by);
			out.close();
			
			String result = convertStreamToString(hucon.getInputStream());
			 System.out.println("C2DM Sender Result = " + result + "\n");

		}catch(Exception io){
			io.printStackTrace();
		}

	}


	public static String convertStreamToString(InputStream is) throws IOException {
		/*
		 * To convert the InputStream to String we use the Reader.read(char[]
		 * buffer) method. We iterate until the Reader return -1 which means
		 * there's no more data to read. We use the StringWriter class to
		 * produce the string.
		 */
		if (is != null) {
			Writer writer = new StringWriter();

			char[] buffer = new char[1024];
			try {
				Reader reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
				int n;
				while ((n = reader.read(buffer)) != -1) {
					writer.write(buffer, 0, n);
				}
			} finally {
				is.close();
			}
			return writer.toString();
		} else {
			return "";
		}
	}
}


