package project.controller.product;

import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONObject;
import project.config.common.CommandMap;
import project.config.util.MultiUtil;
import project.config.util.RsUtil;
import project.config.util.UrlUtil;
import project.config.util.UtilMultiFileUp;
import project.service.product.ProductService;

/**
 * Created By S.D.W 2016-07-15 11:42:00
 * @author J
 *
 */
@Controller
public class ProductController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="productService")
	private ProductService productService;
	
	/**
	 * 본사 상품 리스트
	*/
	@RequestMapping(value="/adminProductList")
	public ModelAndView adminProductList (CommandMap map, HttpServletRequest request, HttpServletResponse response)throws Exception{
		ModelAndView mav = new ModelAndView("/product/adminProductList");
		
		try{
			
			Map<String, Object> searchMap = new HashMap<String, Object>();

			searchMap = map.getMap();

			String per_page_param = RsUtil.checkNull(map.get("per_page"));

			if(per_page_param.equals("")) per_page_param = "10";


			String page_index = RsUtil.checkNull(map.get("page_index"));
			int cur_page = (page_index.equals("")) ? 1 : Integer.parseInt(page_index); //현재페이지번호
			int per_page=Integer.parseInt(per_page_param);							//한페이지에 출력될 리스트 갯수
			int start = (cur_page - 1) * per_page + 1;		//리스트의 시작번호
			int end = start + per_page -1;				//리스트의 마지막번호
			int totalCount = 0;

			searchMap.put("start", start);
			searchMap.put("end", end);


			totalCount = productService.adminProductCnt(searchMap);
			Map<String, Object> pageInfo = new HashMap<String, Object>();
			pageInfo.put("page_index", page_index);
			pageInfo.put("totalCount", totalCount);
			pageInfo.put("per_page", per_page);
			List<Map<String, Object>> adminProductList = productService.adminProductList(searchMap);
			
			int allCount = productService.adminProductAllCnt();
			pageInfo.put("allCount", allCount);
			
			mav.addObject("pageInfo", pageInfo);
			mav.addObject("adminProductList", adminProductList); 
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			
			return mav;
			
		}


	}
	/**
	 * 상품관리 -> 개인 상품등록 페이지 
	*/
	@RequestMapping(value="/product_update.do")
	public ModelAndView administratorPage(CommandMap map, HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView("/product/product_update");
		
		
		try{
			
			
			Map<String, Object> param = new HashMap<String, Object>();
			
			
			//출판사 코드리스트
			param.put("code_idx", "02");
			List<Map<String, Object>> pbsCodeList = productService.codeList(param);
			param.remove("code_idx");
			
			
			//분야(과목) 코드 리스트		
			param.remove("code_idx");
			param.put("code_idx", "03");
			List<Map<String, Object>> subjCodeList = productService.codeList(param);
			
			
			//대상 코드 리스트
			param.remove("code_idx");
			param.put("code_idx", "04");
			List<Map<String, Object>> objCodeList = productService.codeList(param);
			
			
			//학년 코드 리스트
			param.remove("code_idx");
			param.put("code_idx", "05");
			List<Map<String, Object>> gradeCodeList = productService.codeList(param);
			
			
			mav.addObject("gradeCodeList", gradeCodeList);
			mav.addObject("objCodeList", objCodeList);
			mav.addObject("subjCodeList", subjCodeList);
			mav.addObject("pbsCodeList", pbsCodeList);
			
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			
			return mav;
			
		}
	}
	
	/**
	 * 상품 수정
	*/
	@RequestMapping(value="/updateProduct.do")
	public void updateProduct(CommandMap map, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		
		PrintWriter pw = null;
    	String msg = "success";
    	JSONObject json = new JSONObject();
		
		try{
			
			
			Map<String, Object> param = map.getMap();

			String userId = "king7819";
			param.put("MG_USERID", userId);
			int result = productService.insertProduct(param);
			
			if(result <= 0){
				msg = "error";
			}
			
		}catch(Exception ex){
			
			ex.printStackTrace();
			
		}finally{
			
			response.setContentType("application/x-json; charset=UTF-8");
			json.put("msg", msg);
			pw = response.getWriter();
			pw.print(json);
			pw.flush();
			pw.close();
			
			
		}
	}
	
	/**
	 * 지역 상품 리스트
	*/
	@RequestMapping(value="/regionProductList.do")
	public ModelAndView regionProductList (CommandMap map, HttpServletRequest request, HttpServletResponse response)throws Exception{
		ModelAndView mav = new ModelAndView("/product/regionProductList");
		
		try{
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			
			return mav;
			
		}


	}
	
	/**
	 * 상품이미지 등록 
	*/
	@RequestMapping(value="/goodImgFileUpload.do")
	public void spFileUpload(HttpServletResponse response, HttpServletRequest request)throws Exception{
		PrintWriter pw = null;
    	String msg = "success";
    	JSONObject json = new JSONObject();
    	try {
    		UtilMultiFileUp fileup = new UtilMultiFileUp(request);
    		
    		String imageName = fileup.getFileNameOne("file_1");
    		
        	String addName = Long.toString(new Date().getTime());
        	String fileReName = addName + "_" + imageName;
        	
        	
        	
        	String path = MultiUtil.loadPropertyKey(UrlUtil.URLPROPPATH, "bookimgURL");
        	
        	String filePath = path + fileReName;
        	if(!imageName.equals("")){
    			fileup.saveFile("file_1", filePath);
    			MultiUtil.createThumbImage(path, fileReName, "thumnail_" + fileReName, 80, 80);
    			json.put("imageName", fileReName);
    			json.put("img_thumnail", "thumnail_"+ fileReName);
    		}else{
    			msg = "error";
    		}
		} catch (Exception e) {
			e.printStackTrace();
			msg = "error";
		}finally {
			response.setContentType("application/x-json; charset=UTF-8");
			json.put("msg", msg);
			pw = response.getWriter();
			pw.print(json);
			pw.flush();
			pw.close();
		}
	}	
}
