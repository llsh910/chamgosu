package project.controller.admin;

import java.io.PrintWriter;
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
import project.config.util.RsUtil;
import project.service.admin.administrator_setService;

/**
 * Created By S.D.W 2016-07-12 17:22:00
 * @author J
 *
 */
@Controller
public class administrator_setController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="administrator_setService")
	private administrator_setService administrator_setService;

	@RequestMapping(value="/administrator_set.do")
	public ModelAndView codeView(CommandMap map, HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView("/admin/administrator_set");
		try{
			Map<String, Object>param = map.getMap();
			String page_index = RsUtil.checkNull(map.get("page_index"));
			int cur_page = (page_index.equals("")) ? 1 : Integer.parseInt(page_index); //현재페이지번호
			int per_page=10;							//한페이지에 출력될 리스트 갯수
			int start = (cur_page - 1) * per_page + 1;		//리스트의 시작번호
			int end = start + per_page -1;				//리스트의 마지막번호
			int totalCount = 0;
			
			param.put("start", start);
			param.put("end", end);
			
			
			totalCount = administrator_setService.selectAdministratorCnt(param);
			Map<String, Object> pageInfo = new HashMap<String, Object>();
			pageInfo.put("page_index", page_index);
			pageInfo.put("totalCount", totalCount);
			pageInfo.put("per_page", per_page);
			
			
			List<Map<String, Object>>administorList = administrator_setService.selectAdministrator(param);
			mav.addObject("administorList", administorList);
			mav.addObject("pageInfo", pageInfo);
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			return mav;
		}
	}
	
	@RequestMapping(value="/updateAdministrator.do")
	public void updateAdministrator(CommandMap map, HttpServletRequest request, HttpServletResponse response) throws Exception{
		PrintWriter pw = null;
    	String msg = "success";
    	JSONObject json = new JSONObject();
		try{
			
			Map<String, Object> param = map.getMap();
	    	log.debug(param);
	    	int result = administrator_setService.insertAdministrator(param);
	    	if(result <= 0){
	    		msg = "error";
	    	}
		}catch(Exception ex){
			ex.printStackTrace();
			msg = "error";
			log.debug(ex.toString());
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
