package project.config.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * download util 클래스
 * web.xml에 서블릿 매핑시켜 사용
 * 파라미터에 filename과 fileUrl을 넣어주면 된다
 * fileDown?filename=name&fileProUrl=url
 * @author JJJ
 */
public class DownLoadUtil extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/** 다운로드 버퍼 크기 */
	private static final int BUFFER_SIZE = 8192; // 8kb

	/** 문자 인코딩 */
	private static final String CHARSET = "iso-8859-1";

	public DownLoadUtil(){ }
	
	/**
	 * get방식으로 요청된걸 
	 * downloadFile로 보냄
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try{ downloadFile(request, response); }catch(Exception e){ e.printStackTrace(); }
	}
	
	/**
	 * post방식으로 요청된걸 
	 * downloadFile로 보냄
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try{ downloadFile(request, response); }catch(Exception e){ e.printStackTrace(); }
	}

	/**
	 * 지정된 파일을 다운로드 한다.
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public static void downloadFile(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//url 형식 window - e:/경로/경로/
		//linux - /home/경로/경로/
		//parameter로 넘어온 경우
		//String fileUrl = request.getParameter("fileUrl");
		//property 파일로 파일경로 적어둔경우
		//String propUrl = "/home/ducksung/tomcat/webapps/ROOT/WEB-INF/classes/winex/url.properties";
		//String propUrl = "E:/eclipseLuna/project/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/MCARD/WEB-INF/classes/lsh/url.properties";
		String propUrl = "/home/hosting_users/llsh910card/tomcat/webapps/ROOT/WEB-INF/classes/lsh/url.properties";
		//properties 파일 에서 가져올 url
		String fileProUrl = RsUtil.checkNull(request.getParameter("fileProUrl"));
		
		//String propUrl = "E:/eclipseLuna/project/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/car2day/WEB-INF/classes/winex/url.properties";
		String fileUrl = MultiUtil.loadPropertyKey(propUrl, fileProUrl);
		String filename = request.getParameter("filename");
		
		if(fileUrl == null || fileUrl.equals("")){
			System.err.println("fileUrl Not Found : [" + MultiUtil.currentDateTime("yyyy-MM-dd HH:mm:ss") + "]");
			throw new Exception("fileUrl is Null");
		}
		if(filename == null || filename.equals("")){
			System.err.println("filename Not Found : [" + MultiUtil.currentDateTime("yyyy-MM-dd HH:mm:ss") + "]");
			throw new Exception("filename is Null");
		}
		
		File f = new File(fileUrl + filename);
		String mimetype = request.getSession().getServletContext().getMimeType(filename);
		InputStream is = null;
		try{
			is = new FileInputStream(f);
			downloadFile(request, response, is, f.getName(), f.length(), mimetype);
		}finally{
			try{ is.close(); }catch(Exception ex){ }
		}
	}

	/**
	 * 해당 입력 스트림으로부터 오는 데이터를 다운로드 한다.
	 * @param request
	 * @param response
	 * @param is
	 * @param filename
	 * @param filesize
	 * @param mimetype
	 * @throws ServletException
	 * @throws IOException
	 */
	public static void downloadFile(HttpServletRequest request, HttpServletResponse response, InputStream is, String filename, long filesize, String mimetype) throws Exception{
		String mime = mimetype;

		if(mimetype == null || mimetype.length() == 0){
			mime = "application/octet-stream;";
		}


		byte[] buffer = new byte[BUFFER_SIZE];

		response.setContentType(mime + "; charset=" + CHARSET);

		// 아래 부분에서 euc-kr 을 utf-8 로 바꾸거나 URLEncoding을 안하거나 등의 테스트를
		// 해서 한글이 정상적으로 다운로드 되는 것으로 지정한다.
		String userAgent = request.getHeader("User-Agent");

		// attachment; 가 붙으면 IE의 경우 무조건 다운로드창이 뜬다. 상황에 따라 써야한다.
		if(userAgent != null && userAgent.indexOf("MSIE 5.5") > -1){ // MS IE 5.5 이하
			response.setHeader("Content-Disposition", "filename=" + URLEncoder.encode(filename, "UTF-8") + ";");
			//System.out.println("1111");
		}else if(userAgent != null && userAgent.indexOf("MSIE") > -1){ // MS IE (보통은 6.x 이상 가정)
			response.setHeader("Content-Disposition", "attachment; filename=" + filename + ";"); //new String(URLEncoder.encode(filename, "iso-8859-1").getBytes("iso-8859-1"), "euc-kr")
			//System.out.println("2222");
		}else{ // 모질라나 오페라
			response.setHeader("Content-Disposition", "attachment; filename=" + new String(filename.getBytes(CHARSET), "latin1") + ";");
			//System.out.println("3333");
		}

		// 파일 사이즈가 정확하지 않을때는 아예 지정하지 않는다.
		if(filesize > 0){
			response.setHeader("Content-Length", "" + filesize);
		}

		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;

		try{
			bis = new BufferedInputStream(is);
			bos = new BufferedOutputStream(response.getOutputStream());
			int read = 0;

			while((read = bis.read(buffer)) != -1){
				bos.write(buffer, 0, read);
			}
		}catch(IOException ex){
			// Tomcat ClientAbortException을 잡아서 무시하도록 처리해주는게 좋다.
			if(!ex.getClass().getName().equals("org.apache.catalina.connector.ClientAbortException")){
				ex.printStackTrace();
			}
		}finally{
			try{ bos.close(); } catch(Exception ex1){ }
			try{ 	bis.close(); }catch(Exception ex2){ }
		} // end of try/catch
	}
}