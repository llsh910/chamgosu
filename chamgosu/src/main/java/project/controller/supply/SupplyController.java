package project.controller.supply;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import project.config.common.CommandMap;

/**
 * Created By L.S.H 2016-07-13 09:45:00
 * @author J
 *
 */

@Controller
public class SupplyController {
	Logger log = Logger.getLogger(this.getClass());

	/*@Resource(name="codeService")
	private CodeService codeService;*/
	
	/**
	 * 공급처 저장 메서드
	 * Created By L.S.H 2016-07-13 09:45:00
	 * @param map
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="supplySave.do")
	public void supplySave(CommandMap map, HttpServletResponse response) throws Exception{
		PrintWriter pw = null;

		JSONObject json = new JSONObject();
		String msg = "success";

		Map<String, Object> supplyMap = map.getMap();
		

		try{
			
			//codeService.code2Save(codeMap);
			

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
