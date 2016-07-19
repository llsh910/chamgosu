package project.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger; 
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.config.common.CommandMap;
import project.service.ProjectService;

@Controller
public class ProjectController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="projectService")
	private ProjectService projectService;

	@RequestMapping(value="/projectList.do")
	public ModelAndView projectList(Map<String,Object> paramMap, CommandMap param) throws Exception{
		ModelAndView mav = new ModelAndView("/project/projectList");
		/*System.out.println(param.get("param"));
		log.debug("리스트 호출");*/
		try{
			List<Map<String,Object>> list = projectService.selectList(paramMap);
			mav.addObject("projectList", list);
		}catch(Exception ex){
			log.debug(ex.toString());
		}

		return mav;
	}


	@RequestMapping(value="/projectAjaxList.do",  method=RequestMethod.POST)
	public void projectAjaxList(HttpServletResponse response, CommandMap param){

		PrintWriter pw = null;
		try{
			System.out.println(param.get("param"));
			JSONObject json = new JSONObject();
			List<Map<String, Object>> list = projectService.selectAjaxList((String)param.get("param"));
			json.put("projectList", list);
			response.setContentType("application/x-json; charset=UTF-8");

			pw = response.getWriter();
			pw.print(json);

		}catch(Exception ex){
			log.debug(ex.toString());
		}finally{
			pw.flush();
			pw.close();
		}

	}

}