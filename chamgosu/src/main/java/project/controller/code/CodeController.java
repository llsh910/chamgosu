package project.controller.code;

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

import project.config.common.CommandMap;
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
	@RequestMapping(value="/code/codeView")
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
}
