package project.controller.admin;

import java.io.PrintWriter;
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
import project.service.admin.ProductService;

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
	
	@RequestMapping(value="/product_update.do")
	public ModelAndView administratorPage(CommandMap map, HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView("/admin/product_update");
		
		
		try{
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			
			return mav;
			
		}
	}
	
	@RequestMapping(value="/updateProduct.do")
	public void updateProduct(CommandMap map, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		
		PrintWriter pw = null;
    	String msg = "success";
    	JSONObject json = new JSONObject();
		
		try{
			
			
			Map<String, Object> param = map.getMap();

			//배열로 넘어온 값 처리
			/*String[] objects = (String[]) param.get("MG_OBJECT");
			String[] grades = (String[]) param.get("MG_GRADE");
			String[] pbss = (String[]) param.get("MG_PBS");
			String[] subjects = (String[]) param.get("MG_SUBJECT");
			
			
			String object = "";
			String grade = "";
			String pbs = "";
			String subject = "";
			
			
			for(int i=0; i < objects.length; i++){
				object += objects[i];
				if(i + 1 < objects.length) object += ",";
			}
			
			for(int i=0; i < grades.length; i++){
				grade += grades[i];
				if(i + 1 < grades.length) grade += ",";
			}
			
			for(int i=0; i < pbss.length; i++){
				pbs += pbss[i];
				if(i + 1 < pbss.length) pbs += ",";
			}
			
			for(int i=0; i < subjects.length; i++){
				subject += subjects[i];
				if(i + 1 < subjects.length) subject += ",";
			}
			
			
			param.put("MG_OBJECT", object);
			param.put("MG_GRADE", grade);
			param.put("MG_PBS", pbs);
			param.put("MG_SUBJECT", subject);
			*/
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
}
