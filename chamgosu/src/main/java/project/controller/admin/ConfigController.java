package project.controller.admin;

import java.io.PrintWriter;
import java.util.HashMap;
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
			if(companyinfo == null){
				companyinfo = new HashMap<String, Object>();
			}
			mav.addObject("companyinfo", companyinfo);
			
			
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}

		return mav;
	}
	
	@RequestMapping("updateCompanyInfo.do")
	public void updateCompanyInfo(CommandMap map, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		PrintWriter pw = null;
    	String msg = "success";
    	JSONObject json = new JSONObject();
		try{
			
			Map<String, Object> param = map.getMap();
	    	
			int result = configService.updateCompanyInfo(param);
			
			if(result <= 0){
				msg = "fail";
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