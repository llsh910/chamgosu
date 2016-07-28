package project.controller.product;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.fabric.xmlrpc.base.Array;

import net.sf.json.JSONObject;
import project.config.common.CommandMap;
import project.config.util.ExcelFile;
import project.config.util.MultiUtil;
import project.config.util.RsUtil;
import project.config.util.UrlUtil;
import project.config.util.UtilMultiFileUp;
import project.service.code.CodeService;
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
	
	@Resource(name="codeService")
	private CodeService codeService;
	
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
			String mg_seq = RsUtil.checkNull(request.getParameter("mg_seq"));
			param.put("mg_seq", mg_seq);
			
			//insert & update 타입 지정
			String update_type = "";
			
			//이미지 데이터 가공
			Map<String, Object> adminProduct = productService.adminProductView(param);
			if(adminProduct != null){
				
				
				if(RsUtil.checkNull(adminProduct.get("MG_BOOKIMG")).equals("")){
					adminProduct.put("thumnail_image", "/img/book_noimage.jpg");
					adminProduct.put("oriFileName", "");
				}else{
					adminProduct.put("thumnail_image", "/bookimg/thumnail_"+adminProduct.get("MG_BOOKIMG"));
					adminProduct.put("oriFileName", adminProduct.get("MG_BOOKIMG").toString().substring(14));
				}
				
				
				update_type = "update";
				
				
			}else{
				
				
				adminProduct = new HashMap<String, Object>();
				adminProduct.put("thumnail_image", "/img/book_noimage.jpg");
				adminProduct.put("oriFileName", "");
				
				update_type = "insert";
				
			}
			
			
			//출판사 코드리스트
			param.remove("mg_seq");
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
			
			log.debug(gradeCodeList);
			mav.addObject("update_type", update_type);
			mav.addObject("adminProduct", adminProduct);
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
			String update_type= RsUtil.checkNull(param.get("update_type"));
			String userId = "king7819";
			param.put("MG_USERID", userId);
			
			
			if(update_type.equals("insert")){
				int result = productService.insertProduct(param);
				
				if(result <= 0){
					msg = "error";
				}
			}else{
				int result = productService.updateAdminProduct(param);
				
				if(result <= 0){
					msg = "error";
				}
				if(RsUtil.checkNull(param.get("pdtType")).equals("region")){
					double rate = (Integer.parseInt(RsUtil.checkNull(param.get("RG_SPRATE")))* 0.01);
					String price = RsUtil.checkNull(param.get("MG_PRICE"));
					param.put("RG_SPPRICE", Math.round(rate * Integer.parseInt(price)));
					log.debug(rate);
					result = productService.updateRegionProduct(param);
					if(result <= 0){
						msg = "error";
					}
				}
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
		Map searchMap = new HashMap();
		searchMap = map.getMap();

		String code_idx = RsUtil.checkNull(searchMap.get("code_idx"));

		if (code_idx.equals("")) {
			code_idx = "01";
		}
		searchMap.remove("code_idx");

		searchMap.put("code_idx", code_idx);

		String code_first = RsUtil.checkNull(searchMap.get("code_first"));

		if (code_first.equals("")) {
			code_first = "00001";
		}

		searchMap.put("code_first", code_first);
		try{
			
			
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
			List<Map<String, Object>> regionProductList = productService.regionProductList(searchMap);
			
			int allCount = productService.adminProductAllCnt();
			pageInfo.put("allCount", allCount);
			
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
			
			
			
			
			List indexCodeList = this.codeService.indexCodeList(searchMap);
			List code1List = this.codeService.code1List(searchMap);

			if (code_idx.equals("01")) {
				List code2List = this.codeService.code2List(searchMap);
				mav.addObject("code2List", code2List);
			}

			String code1Name = this.codeService.code1Name(searchMap);

			mav.addObject("code_first", code_first);
			mav.addObject("code_idx", code_idx);
			mav.addObject("code1Name", code1Name);
			mav.addObject("indexCodeList", indexCodeList);
			mav.addObject("code1List", code1List);
			
			
			mav.addObject("gradeCodeList", gradeCodeList);
			mav.addObject("objCodeList", objCodeList);
			mav.addObject("subjCodeList", subjCodeList);
			mav.addObject("pbsCodeList", pbsCodeList);
			
			
			
			mav.addObject("pageInfo", pageInfo);
			mav.addObject("regionProductList", regionProductList); 
			
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
	
	/**
	 * 상품 승인 미승인
	 * @param map
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping(value="/productApplyUpdate.do")
	public void supplyRegisonStateSave(CommandMap map, HttpServletResponse response, HttpServletRequest request) throws Exception{
		PrintWriter pw = null;

		JSONObject json = new JSONObject();
		String msg = "success";

		Map<String, Object> param = new HashMap<String, Object>();
		
		
		
		String[] mg_seq = request.getParameterValues("mg_seq[]");
		String[] applychk = request.getParameterValues("applychk[]");
		

		try{
			
			
			if(mg_seq != null && mg_seq.length > 0){
				for(int i=0; i<mg_seq.length; i++){
					
					
					param.put("mg_seq", mg_seq[i]);
					param.put("mg_applychk", applychk[i]);
					
					productService.productApplyUpdate(param);
					
				}
			}
			
			
			

		}catch(Exception ex){
			ex.printStackTrace();
			msg = "error";
		}finally{
			response.setContentType("application/x-json; charset=UTF-8");
			json.put("msg", msg);
			pw = response.getWriter();
			pw.print(json);
			pw.flush();
			pw.close();
		}
	}
	
	@RequestMapping(value="mgExcelUpload.do")
	public void mgExcelUpload(CommandMap map, HttpServletResponse response, HttpServletRequest request)throws Exception{
		PrintWriter pw = null;

		JSONObject json = new JSONObject();
		String msg = "success";
		try{
			
			
			UtilMultiFileUp fileup = new UtilMultiFileUp(request);
    		
    		String imageName = fileup.getFileNameOne("excelFile");
    		
        	String addName = Long.toString(new Date().getTime());
        	String fileReName = addName + "_" + imageName;
        	
        	
        	
        	String path = MultiUtil.loadPropertyKey(UrlUtil.URLPROPPATH, "excelUploadURL");
        	
        	String filePath = path + fileReName;
        	if(!imageName.equals("")){
    			fileup.saveFile("excelFile", filePath);
    		}else{
    			msg = "error";
    		}
        	
        	
			Map<String, Object> param = new HashMap<String, Object>();
			//출판사 코드리스트
			param.remove("mg_seq");
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
			
			
			List<Map<String, Object>>excelData = ExcelFile.mgExcelUpload(filePath);
			

		
			ArrayList<String> errorList = new ArrayList<String>();
			
			
			boolean codeFlag = false;
			int successCnt = 0;
			
			for(int i=0; i<excelData.size(); i++){
				log.debug(productService.selectProductIdt(excelData.get(i)));
				if(productService.selectProductIdt(excelData.get(i)) > 0){
					errorList.add(RsUtil.checkNull(excelData.get(i).get("MG_BOOKNM")) + " : " + "이미 중복된 데이터가 있습니다.(부제목 포함)");
					continue;
				}
				
				//출판사 코드값 찾기
				for(int j=0;  j < pbsCodeList.size(); j++){
					if(codeFlag == true) break;
					if(pbsCodeList.get(j).get("CODE_CODENAME").equals(RsUtil.checkNull(excelData.get(i).get("MG_PBS")))){
						
						excelData.get(i).remove("MG_PBS");
						
						excelData.get(i).put("MG_PBS", pbsCodeList.get(j).get("CODE_FIRST"));
						
						codeFlag = true;
						
					}
				}
				
				if(codeFlag == false){
					errorList.add(RsUtil.checkNull(excelData.get(i).get("MG_BOOKNM")) + " : " + "해당 출판사코드가 없습니다.");
				}
				
				
				codeFlag = false;
				
				//분야(과목) 코드값 찾기
				for(int j=0;  j < subjCodeList.size(); j++){
					if(codeFlag == true) break;
					if(subjCodeList.get(j).get("CODE_CODENAME").equals(RsUtil.checkNull(excelData.get(i).get("MG_SUBJECT")))){

						excelData.get(i).remove("MG_SUBJECT");
						
						excelData.get(i).put("MG_SUBJECT", pbsCodeList.get(j).get("CODE_FIRST"));
						
						codeFlag = true;
						
					}
				}
				
				
				if(codeFlag == false){
					errorList.add(RsUtil.checkNull(excelData.get(i).get("MG_BOOKNM")) + " : " + "해당 분야코드가 없습니다.");
				}
				
				codeFlag = false;
				
				//대상 코드값 찾기
				for(int j=0;  j < objCodeList.size(); j++){
					if(codeFlag == true) break;
					if(objCodeList.get(j).get("CODE_CODENAME").equals(RsUtil.checkNull(excelData.get(i).get("MG_OBJECT")))){
						

						excelData.get(i).remove("MG_OBJECT");
						
						excelData.get(i).put("MG_OBJECT", pbsCodeList.get(j).get("CODE_FIRST"));
						
						codeFlag = true;
					}
				}
				
				if(codeFlag == false){
					errorList.add(RsUtil.checkNull(excelData.get(i).get("MG_BOOKNM")) + " : " + "해당 대상코드가 없습니다.");
				}
				
				codeFlag = false;
				
				//학년별 코드값 찾기
				for(int j=0;  j < gradeCodeList.size(); j++){
					if(codeFlag == true) break;
					if(gradeCodeList.get(j).get("CODE_CODENAME").equals(RsUtil.checkNull(excelData.get(i).get("MG_GRADE")))){

						excelData.get(i).remove("MG_GRADE");
						
						excelData.get(i).put("MG_GRADE", pbsCodeList.get(j).get("CODE_FIRST"));
						
						codeFlag = true;
						
					}
				}
				
				if(codeFlag == false){
					errorList.add(RsUtil.checkNull(excelData.get(i).get("MG_BOOKNM")) + " : " + "해당 학년코드가 없습니다.");
				}
				
				codeFlag = false;
				
				
				
				if(errorList.size() <= 0){
					int result = productService.insertProduct(excelData.get(i));
					if(result <= 0){
						errorList.add(RsUtil.checkNull(excelData.get(i).get("MG_BOOKNM")) + " : " + "시스템 오류");
					}else{
						successCnt++;
					}
				}
				codeFlag = false;
			}
			
			
			if(errorList.size() > 0){
				msg = "codeError";
				json.put("errorList", errorList);
				json.put("errorCnt", errorList.size());
			}
			
			json.put("successCnt", successCnt);
			
		}catch(Exception ex){
			ex.printStackTrace();
			msg = "error";
		}finally{
			response.setContentType("application/x-json; charset=UTF-8");
			json.put("msg", msg);
			pw = response.getWriter();
			pw.print(json);
			pw.flush();
			pw.close();
		}
	}
	
	@RequestMapping(value="productDelete.do")
	public void productDelete(CommandMap map, HttpServletResponse response, HttpServletRequest request)throws Exception{
		PrintWriter pw = null;

		JSONObject json = new JSONObject();
		String msg = "success";
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		
		
		String[] mg_seq = request.getParameterValues("mg_seq[]");
		

		try{
			
			
			if(mg_seq != null && mg_seq.length > 0){
				for(int i=0; i<mg_seq.length; i++){
					
					param.remove("mg_seq");
					param.put("mg_seq", mg_seq[i]);
					
					productService.productDelete(param);
					
				}
			}
			
			
			
		}catch(Exception ex){
			ex.printStackTrace();
			msg = "error";
		}finally{
			response.setContentType("application/x-json; charset=UTF-8");
			json.put("msg", msg);
			pw = response.getWriter();
			pw.print(json);
			pw.flush();
			pw.close();
		}


	}
	
	@RequestMapping(value="mgExcelDownload.do")
	public void mgExcelDownload(CommandMap map, HttpServletResponse response, HttpServletRequest request)throws Exception{
		PrintWriter pw = null;

		JSONObject json = new JSONObject();
		String msg = "success";
		try{
			Map<String, Object>param = new HashMap<String, Object>();
			List<Map<String, Object>> adminProductList = productService.adminProductList(param);
			String fileName = ExcelFile.mgExcelDownload(adminProductList);
			
			json.put("fileName", fileName);
			
		}catch(Exception ex){
			ex.printStackTrace();
			msg = "error";
		}finally{
			response.setContentType("application/x-json; charset=UTF-8");
			json.put("msg", msg);
			pw = response.getWriter();
			pw.print(json);
			pw.flush();
			pw.close();
		}
	}
	
}
