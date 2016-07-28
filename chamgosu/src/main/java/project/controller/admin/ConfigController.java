package project.controller.admin;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.config.common.CommandMap;
import project.service.admin.ConfigService;

@Controller
public class ConfigController
{
	Logger log = Logger.getLogger(getClass());

	@Resource(name="configService")
	private ConfigService configService;

	
	
	@RequestMapping("company_info.do")
	public ModelAndView company_info(CommandMap map, HttpServletRequest request, HttpServletResponse response)
			throws Exception
	{
		ModelAndView mav = new ModelAndView("/admin/company_info");
		try
		{
			
			Map<String, Object> param = map.getMap();
			Map<String, Object> companyinfo = configService.selectCompanyInfo(param);
			
			mav.addObject("companyinfo", companyinfo);
			
			
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}

		return mav;
	}
	
	
	
}