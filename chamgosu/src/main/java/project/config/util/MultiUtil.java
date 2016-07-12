package project.config.util;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;

import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.http.HttpServletRequest;

public class MultiUtil {

	public MultiUtil(){ }

	//replace 뒤에서
	public static String replaceLast(String string, String toReplace, String replacement) {
		int pos = string.lastIndexOf(toReplace);
		if (pos > -1) {
			return string.substring(0, pos)
					+ replacement
					+ string.substring(pos + toReplace.length(), string.length());
		} else {
			return string;
		}
	}


	/**
	 * Calendar 인스턴스 가져오기
	 * @return
	 * @throws Exception
	 */
	public static Calendar getCal() throws Exception{
		Calendar v_cal = Calendar.getInstance();
		return v_cal;
	}

	/**
	 * yyyy-MM-dd 현재 날짜 가져오기
	 * @return
	 * @throws Exception
	 */
	public static String getYMD() throws Exception{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(getCal().getTime());
	}

	/**
	 * 현재 일 가져오기
	 * @return
	 * @throws Exception
	 */
	public static int getDay() throws Exception{
		return getCal().get(Calendar.DATE);
	}

	/**
	 * 현재 월 가져오기
	 * @return
	 * @throws Exception
	 */
	public static int getMonth() throws Exception{
		return getCal().get(Calendar.MONTH) + 1;
	}

	/**
	 * 현재 년도 가져오기
	 * @return
	 * @throws Exception
	 */
	public static int getYear() throws Exception{
		return getCal().get(Calendar.YEAR);
	}

	/**
	 * 콤마찍기
	 * @param s
	 * @return
	 * @throws Exception
	 */
	public static String comma(String s) throws Exception{
		DecimalFormat df = new DecimalFormat("#,##0");
		if(s.equals("")) return "0";
		int i = Integer.parseInt(s);
		String k = df.format(i);
		return k;
	}

	/**
	 * 문자열에 모든 공백 제거
	 * @param s
	 * @return
	 * @throws Exception
	 */
	public static String getAllTrim(String s) throws Exception{
		String s1 = "";
		s1 = s.trim().replaceAll("\\p{Z}", "");
		return s1;
	}

	/**
	 * 해당 서버 접속자 IP 얻기
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public static String getLocalIP(HttpServletRequest request) throws Exception{
		return request.getRemoteAddr();
	}

	/**
	 * 서버 아이피 가져오기
	 * @return
	 * @throws Exception
	 */
	public static String getServerIP() throws Exception{
		return InetAddress.getLocalHost().getHostAddress();
	}

	/**
	 * JVM Memory 찍어보기
	 * 2014-05-16
	 * @throws Exception
	 */
	public static void memoryStdOut() throws Exception{
		System.out.println("Total Memory : " + Runtime.getRuntime().totalMemory()); //총메모리
		System.out.println("Free Memory : " + Runtime.getRuntime().freeMemory()); //남는메모리
		System.out.println("Used Memory : " + (Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory())); //사용메모리
	}

	/**
	 * format 형식을 받아서해당 포맷으로
	 * 시간을 String으로 return 
	 * yyyy-MM-dd
	 * yyyy-MM-dd HH:mm:ss
	 * 2014-05-16
	 * @return String
	 * @throws Exception
	 */
	public static String currentDateTime(String format) throws Exception{
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		String curDate = sdf.format(d);
		return curDate;
	}

	/**
	 * 날짜형식의고유번호
	 * 2014-05-16
	 * @return String
	 * @throws Exception
	 */
	public static String distinctDateNumber() throws Exception{
		String number = "";
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat( "yyyyMMddHHmmssS");
		number = sdf.format(calendar.getTime());
		return number;
	}

	/**
	 * 프로퍼티 파일 로드
	 * @param fileUrl - 해당 프로퍼티파일 url
	 * @param key - 가져올 키값
	 * @return String
	 * @throws Exception
	 */
	public static String loadPropertyKey(String fileUrl, String key) throws Exception{
		String ment = "";
		Properties prop = new Properties();
		InputStream fis = null;
		try{
			fis = new FileInputStream(fileUrl);
			prop.load(fis);
			ment = prop.getProperty(key);
		}catch(IOException ioe){
			ioe.printStackTrace();
		}finally{
			if(fis != null){ try{ fis.close(); }catch(IOException ioe){ } }
		}
		return ment;
	}

	/**
	 * 경로, 파일명, 내용을
	 * 받아서 파일 생성
	 * @param path
	 * @param fileName
	 * @param content
	 * @throws IOException
	 */
	public static void writeFile(String path, String fileName, String content) throws IOException{
		BufferedWriter bw = null;
		try{
			bw = new BufferedWriter(new FileWriter(path + fileName));
			bw.write(content);
		}catch(IOException ioe){
			ioe.printStackTrace();
		}finally{
			if(bw != null) bw.close();
		}
	}

	/**
	 * 파일 삭제 메서드
	 * 해당 path아 fileName을 넘겨받아 파일을 삭제한다
	 * @param path
	 * @param fileName
	 * @throws Exception 
	 */
	public static void deleteFile(String path, String fileName) throws Exception{
		//System.out.println(path);
		//System.out.println(fileName);
		//String propUrl = "/home/ducksung/tomcat/webapps/ROOT/WEB-INF/classes/winex/url.properties";
		String propUrl = "E:/eclipseLuna/project/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/ECI/WEB-INF/classes/lsh/url.properties";

		String fileUrl = loadPropertyKey(propUrl, path);
		System.out.println(fileUrl);

		File f = new File(fileUrl + fileName);
		f.delete();
		/*File f1 = new File("e:/log/100.jpg");
		f1.delete();*/
	}

	/**
	 * 이미지 비율대로 축소
	 * @param loadFile
	 * @param saveFile
	 * @param zoom
	 * @throws IOException
	 */
	public static void createThumbImage(String path, String loadFileName, String saveFileName, int zoom) throws Exception{
		BufferedImage bi = null;
		BufferedImage bufferIm = null;
		RenderedOp render = null;
		try{
			//기존이미지 가져오기
			render = JAI.create("fileload", path + loadFileName);
			bi = render.getAsBufferedImage();

			//축소 비율이 0일경우 1로 해준다
			if(zoom <= 0) zoom = 1;

			//가로 세로 재정의
			//이미지 사이즈 따로 넣어줘도 됨
			int width = bi.getWidth();
			int height = bi.getHeight();
			
			if(width > 1500){
				width = bi.getWidth()  / zoom;
				height = bi.getHeight() / zoom;
			}
			
			
			

			bufferIm = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

			//이미지 가로샐 크기로 그려줌
			Graphics2D  g2 = bufferIm.createGraphics();
			g2.drawImage(bi, 0, 0, width, height, null);

			//새로 저장될 파일객체
			File  thum = new File(path + saveFileName);
			//새로 저장될 파일객체에 이미지 쏴줌
			ImageIO.write(bufferIm, "jpg", thum);
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			bufferIm.flush();
			bi.flush();
			render.removeSinks();
			//deleteFile(path, loadFileName);
		}
	}
	
	
	
	/**
	 * 이미지 비율대로 축소
	 * @param loadFile
	 * @param saveFile
	 * @param zoom
	 * @throws IOException
	 */
	public static void createThumbImage(String path, String loadFileName, String saveFileName, int width, int height) throws Exception{
		BufferedImage bi = null;
		BufferedImage bufferIm = null;
		RenderedOp render = null;
		try{
			//기존이미지 가져오기
			render = JAI.create("fileload", path + loadFileName);
			bi = render.getAsBufferedImage();

			//축소 비율이 0일경우 1로 해준다
			//if(zoom <= 0) zoom = 1;
			//가로 세로 재정의
			//이미지 사이즈 따로 넣어줘도 됨
			//int width = bi.getWidth()  / zoom;
			//int height = bi.getHeight() / zoom;

			bufferIm = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

			//이미지 가로샐 크기로 그려줌
			Graphics2D  g2 = bufferIm.createGraphics();
			g2.drawImage(bi, 0, 0, width, height, null);

			//새로 저장될 파일객체
			File  thum = new File(path + saveFileName);
			//새로 저장될 파일객체에 이미지 쏴줌
			ImageIO.write(bufferIm, "jpg", thum);
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			bufferIm.flush();
			bi.flush();
			render.removeSinks();
			//deleteFile(path, loadFileName);
		}
	}
	
	
	


	/**
	 * 카투데이 이미지 섬네일
	 * 가로640기준으로 맞춤
	 * 이미지 비율대로 축소
	 * @param path - properties KEY
	 * @param loadFile
	 * @param saveFile
	 * @param width
	 * @param height
	 * @throws Exception 
	 */
	/*public static void createThumbImage(String path, String loadFileName, String saveFileName, int width, int height) throws Exception{
		BufferedImage bi = null;
		BufferedImage bufferIm = null;
		RenderedOp render = null;
		File thum = null;
		Graphics2D g2 = null;
		String fileName = "";

		ByteArrayOutputStream baos = null;
		BufferedOutputStream bos = null;

		//String propUrl = "/home/myappon/tomcat/webapps/ROOT/WEB-INF/classes/winex/url.properties";
		//String propUrl = "E:/eclipseLuna/project/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/car2day/WEB-INF/classes/winex/url.properties";

		//String fileUrl = loadPropertyKey(propUrl, path);

		try{
			//기존이미지 가져오기
			render = JAI.create("fileload", path + loadFileName);
			bi = render.getAsBufferedImage();

			int n_height = 0;

			n_height = (bi.getHeight() * width) / bi.getWidth();
			height = n_height;
			//System.out.println(bi.getWidth() + " : width");
			//System.out.println(bi.getHeight() + " : height");


			//축소 비율이 0일경우 1로 해준다
			//if(zoom <= 0) zoom = 1;

			//가로 세로 재정의
			//이미지 사이즈 따로 넣어줘도 됨
			//int width = bi.getWidth()  / zoom;
			//int height = bi.getHeight() / zoom;

			//if(bi.getWidth() > 640){
				bufferIm = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

				Image atemp = bi.getScaledInstance(width, height, Image.SCALE_AREA_AVERAGING);

				//이미지 가로샐 크기로 그려줌
				g2 = bufferIm.createGraphics();
				g2.drawImage(atemp, 0, 0, width, height, null);

				baos = new ByteArrayOutputStream();
				bos = new BufferedOutputStream(baos);

				//새로 저장될 파일객체
				thum = new File(path + saveFileName);
				//새로 저장될 파일객체에 이미지 쏴줌
				ImageIO.write(bufferIm, "jpg", thum);

				//fileName = saveFileName;
			//}else{
				//fileName = loadFileName;
			//}



		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			bos.close();
			baos.close();
			if(bufferIm != null){ bufferIm = null; }
			if(bi != null) bi = null;
			if(render != null) render = null;
			if(thum != null) thum = null;
			//deleteFile(path, loadFileName);
		}

		//return fileName;
	}*/
}
