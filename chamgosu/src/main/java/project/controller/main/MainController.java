package project.controller.main;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.config.common.CommandMap;

@Controller
public class MainController {
	Logger log = Logger.getLogger(this.getClass());
	
	/*@Resource(name="projectService")
	private ProjectService projectService;*/
	
	@RequestMapping(value="/main.do")
	public ModelAndView projectList(CommandMap param) throws Exception{
		ModelAndView mav = new ModelAndView("/main/main");
		

		return mav;
	}
	
}
