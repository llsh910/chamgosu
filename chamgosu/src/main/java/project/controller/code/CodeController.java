package project.controller.code;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.config.common.CommandMap;
import project.config.util.MultiUtil;
import project.config.util.RsUtil;
import project.config.util.UrlUtil;
import project.service.code.CodeService;

/**
 * Created By L.S.H 2016-07-12 17:22:00
 * @author J
 *
 */
@Controller
public class CodeController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="codeService")
	private CodeService codeService;
	
	/**
	 * 코드 첫 페이지
	 * Created By L.S.H 2016-07-12 17:22:00
	 * @param map
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="codeView.do")
	public ModelAndView codeView(CommandMap map, HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView("/code/codeView");
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap = map.getMap();
		try{
			List<Map<String, Object>> indexCodeList = codeService.indexCodeList(searchMap);
			List<Map<String, Object>> code1List = codeService.code1List(searchMap);
			
			mav.addObject("indexCodeList", indexCodeList);
			mav.addObject("code1List", code1List);
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return mav;
	}
	
	
	/**
	 * 1depth 코드 보기
	 * Created By L.S.H 2016-07-12 17:22:00
	 * @param map
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="code1View.do")
	public ModelAndView code1View(CommandMap map, HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView("/code/code1View");
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap = map.getMap();
		try{
			List<Map<String, Object>> code1View = (List<Map<String, Object>>) codeService.code1Value(searchMap);

			
			mav.addObject("code1View", code1View);
			
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return mav;
		
	}
	
	
	/**
	 * 2depth 코드 보기
	 * Created By L.S.H 2016-07-12 17:22:00
	 * @param map
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="code2View.do")
	public ModelAndView code2View(CommandMap map, HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView("/code/code2View");
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap = map.getMap();
		try{
			List<Map<String, Object>> code2View = (List<Map<String, Object>>) codeService.code1Value(searchMap);

			
			mav.addObject("code2View", code2View);
			
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return mav;
		
	}
	
	
	
	/**
	 * code1 저장 (1depth)
	 * Created By L.S.H 2016-07-12 18:17:00
	 * @param map
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="code1Save.do")
	public void code1Save(CommandMap map, HttpServletResponse response) throws Exception{
		PrintWriter pw = null;

		JSONObject json = new JSONObject();
		String msg = "success";

		Map<String, Object> codeMap = map.getMap();
		

		try{
			
			codeService.code1Save(codeMap);
			

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
	
	/**
	 * code2 저장 (2depth)
	 * Created By L.S.H 2016-07-12 18:20:00
	 * @param map
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="code2Save.do")
	public void code2Save(CommandMap map, HttpServletResponse response) throws Exception{
		PrintWriter pw = null;

		JSONObject json = new JSONObject();
		String msg = "success";

		Map<String, Object> codeMap = map.getMap();
		

		try{
			
			codeService.code2Save(codeMap);
			

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
	
	
	@RequestMapping(value="code1ModifySave.do")
	public void code1ModifySave(CommandMap map, HttpServletResponse response) throws Exception{
		PrintWriter pw = null;

		JSONObject json = new JSONObject();
		String msg = "success";

		Map<String, Object> codeMap = map.getMap();
		

		try{
			
			codeService.code1ModifySave(codeMap);
			

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
	
	
	@RequestMapping(value="code2ModifySave.do")
	public void code2ModifySave(CommandMap map, HttpServletResponse response) throws Exception{
		PrintWriter pw = null;

		JSONObject json = new JSONObject();
		String msg = "success";

		Map<String, Object> codeMap = map.getMap();
		

		try{
			
			codeService.code2ModifySave(codeMap);
			

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
