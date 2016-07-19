package project.controller.supply;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.config.common.CommandMap;
import project.config.util.RsUtil;
import project.service.supply.SupplyService;

/**
 * Created By L.S.H 2016-07-13 09:45:00
 * @author J
 *
 */

@Controller
public class SupplyController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="supplyService")
	private SupplyService supplyService;
	
	/**
	 * ID Chk
	 * @param map
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/supplyIdChk.do")
	public void supplyIdChk(CommandMap map, HttpServletResponse response) throws Exception{
		PrintWriter pw = null;

		JSONObject json = new JSONObject();
		String msg = "success";

		Map<String, Object> supplyMap = map.getMap();
		

		try{
			
			
			int idChk = supplyService.supplyIdChk(supplyMap);
			
			if(idChk > 0){
				msg = "idNot";
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
	
	/**
	 * 공급처 저장 메서드
	 * Created By L.S.H 2016-07-13 09:45:00
	 * @param map
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/supplySave.do")
	public void supplySave(CommandMap map, HttpServletResponse response) throws Exception{
		PrintWriter pw = null;

		JSONObject json = new JSONObject();
		String msg = "success";

		Map<String, Object> supplyMap = map.getMap();
		
		
		
		
		

		try{
			
			
			int idChk = supplyService.supplyIdChk(supplyMap);
			
			if(idChk > 0){
				msg = "idNot";
			}else{
				supplyService.supplyMiniSave(supplyMap);
			}
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
	
	/**
	 * 공급처 리스트
	 * @param map
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/supplyList.do")
	public ModelAndView supplyList(CommandMap map, HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView("/supply/supplyList");
		
		
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
		
		
		totalCount = supplyService.supplyListCnt(searchMap);
		Map<String, Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("page_index", page_index);
		pageInfo.put("totalCount", totalCount);
		pageInfo.put("per_page", per_page);
		
		
		try{
			
			List<Map<String, Object>> supplyList = supplyService.supplyList(searchMap);
			
			mav.addObject("supplyList", supplyList);
			mav.addObject("pageInfo", pageInfo);
			
			
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			
		}
		
		return mav;
	}
	
	/**
	 * 수정데이터
	 * @param map
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/supplyModifyView.do")
	public ModelAndView supplyModifyView(CommandMap map, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView("/supply/supplyModify");
		
		Map<String, Object> searchMap = map.getMap();
		
		try{
			
			Map<String, Object> supplyData = supplyService.supplyModifyData(searchMap);
			
			mav.addObject("supplyData", supplyData);
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			
		}
		
		return mav;
	}
	
	
	
	/**
	 * 출판지역 관리 업체 리스트
	 * @param map
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/supplyRegionList.do")
	public ModelAndView supplyRegionList(CommandMap map, HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView("/supply/supplyRegionList");
		
		
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
		
		
		totalCount = supplyService.supplyListCnt(searchMap);
		Map<String, Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("page_index", page_index);
		pageInfo.put("totalCount", totalCount);
		pageInfo.put("per_page", per_page);
		
		
		try{
			
			List<Map<String, Object>> supplyList = supplyService.supplyList(searchMap);
			
			mav.addObject("supplyList", supplyList);
			mav.addObject("pageInfo", pageInfo);
			
			
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			
		}
		
		return mav;
	}
	
	
	/**
	 * 팝업 시 출판 지역 리스트
	 * @param map
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/supplyRegionListPop.do")
	public ModelAndView supplyRegionListPop(CommandMap map, HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView("/supply/supplyRegionListPop");
		
		
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
		
		
		totalCount = supplyService.supplyListCnt(searchMap);
		Map<String, Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("page_index", page_index);
		pageInfo.put("totalCount", totalCount);
		pageInfo.put("per_page", per_page);
		
		
		try{
			
			List<Map<String, Object>> supplyRegionList = supplyService.supplyRegionList(searchMap);
			
			mav.addObject("supplyRegionList", supplyRegionList);
			mav.addObject("pageInfo", pageInfo);
			
			
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			
		}
		
		return mav;
	}
	
	
}
