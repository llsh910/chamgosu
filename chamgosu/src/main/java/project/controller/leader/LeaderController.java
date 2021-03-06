package project.controller.leader;

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
import project.service.leader.LeaderService;

@Controller
public class LeaderController {
	Logger log = Logger.getLogger(this.getClass());
	//private String asPath = "C:/dev/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/chamgosu/spimg/";
	@Resource(name="leaderService")
	private LeaderService leaderService;


	/**
	 * 위탁영업리더 리스트
	 * @param map
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/leaderTrustList.do")
	public ModelAndView leaderTrustList(CommandMap map, HttpServletResponse response) throws Exception{

		ModelAndView mav = new ModelAndView("/leader/leaderTrustList");


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


		totalCount = leaderService.leaderTrustListCnt(searchMap);
		Map<String, Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("page_index", page_index);
		pageInfo.put("totalCount", totalCount);
		pageInfo.put("per_page", per_page);
		
		int allCount = leaderService.leaderTrustListCntAll(searchMap);
		pageInfo.put("allCount", allCount);
		
		try{

			List<Map<String, Object>> leaderList = leaderService.leaderTrustList(searchMap);

			mav.addObject("leaderList", leaderList);
			mav.addObject("pageInfo", pageInfo);



		}catch(Exception ex){
			ex.printStackTrace();
		}finally{

		}

		return mav;
	}
	
	/**
	 * 수정 데이터 가져오기
	 * 상세페이지 가져오기
	 * @param map
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/leaderModifyData.do")
	public ModelAndView leaderModifyData(CommandMap map, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView("/leader/leaderView");
		
		try{
			Map<String, Object> leaderViewData = leaderService.leaderModifyData(map.getMap());
			
			mav.addObject("leaderViewData", leaderViewData);
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			
		}
		return mav;
	}
	
	/**
	 * 가입회원 상세보기
	 * @param map
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/leaderUserView.do")
	public ModelAndView leaderUserView(CommandMap map, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView("/leader/leaderUserView");
		
		try{
			Map<String, Object> userView = leaderService.leaderUserView(map.getMap());
			
			mav.addObject("userView", userView);
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			
		}
		return mav;
	}
	
	/**
	 * 비회원 상세보기
	 * @param map
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/leaderUserNoView.do")
	public ModelAndView leaderUserNoView(CommandMap map, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView("/leader/leaderUserNoView");
		
		try{
			Map<String, Object> userView = leaderService.leaderUserNoView(map.getMap());
			
			mav.addObject("userView", userView);
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			
		}
		return mav;
	}
	
	
	
	/**
	 * 리더 수정
	 * @param map
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/leaderModifySave.do")
	public void leaderModifySave(CommandMap map, HttpServletResponse response) throws Exception{
		PrintWriter pw = null;

		JSONObject json = new JSONObject();
		String msg = "success";

		

		try{
			
			
			leaderService.leaderModifySave(map.getMap());			

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
	 * 일반리더 리스트
	 * @param map
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/leaderNoList.do")
	public ModelAndView leaderNoList(CommandMap map, HttpServletResponse response) throws Exception{

		ModelAndView mav = new ModelAndView("/leader/leaderNoList");


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


		totalCount = leaderService.leaderNoListCnt(searchMap);
		Map<String, Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("page_index", page_index);
		pageInfo.put("totalCount", totalCount);
		pageInfo.put("per_page", per_page);
		
		int allCount = leaderService.leaderNoListCntAll(searchMap);
		pageInfo.put("allCount", allCount);
		
		try{

			List<Map<String, Object>> leaderList = leaderService.leaderNoList(searchMap);

			mav.addObject("leaderList", leaderList);
			mav.addObject("pageInfo", pageInfo);



		}catch(Exception ex){
			ex.printStackTrace();
		}finally{

		}

		return mav;
	}
	
	
	
	/**
	 * 일반 회원 리스트
	 * @param map
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/leaderUserList.do")
	public ModelAndView leaderUserList(CommandMap map, HttpServletResponse response) throws Exception{

		ModelAndView mav = new ModelAndView("/leader/leaderUserList");


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

		log.debug(searchMap);
		
		totalCount = leaderService.leaderUserListCnt(searchMap);
		Map<String, Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("page_index", page_index);
		pageInfo.put("totalCount", totalCount);
		pageInfo.put("per_page", per_page);
		
		int allCount = leaderService.leaderUserListCntAll(searchMap);
		pageInfo.put("allCount", allCount);
		
		try{

			List<Map<String, Object>> userList = leaderService.leaderUserList(searchMap);

			mav.addObject("userList", userList);
			mav.addObject("pageInfo", pageInfo);



		}catch(Exception ex){
			ex.printStackTrace();
		}finally{

		}

		return mav;
	}
	
	
	/**
	 * 비회원 리스트
	 * @param map
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/leaderUserNoList.do")
	public ModelAndView leaderUserNoList(CommandMap map, HttpServletResponse response) throws Exception{

		ModelAndView mav = new ModelAndView("/leader/leaderUserNoList");


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


		totalCount = leaderService.leaderUserNoListCnt(searchMap);
		Map<String, Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("page_index", page_index);
		pageInfo.put("totalCount", totalCount);
		pageInfo.put("per_page", per_page);
		
		int allCount = leaderService.leaderUserNoListCntAll(searchMap);
		pageInfo.put("allCount", allCount);
		
		try{

			List<Map<String, Object>> userList = leaderService.leaderUserNoList(searchMap);

			mav.addObject("userList", userList);
			mav.addObject("pageInfo", pageInfo);



		}catch(Exception ex){
			ex.printStackTrace();
		}finally{

		}

		return mav;
	}
	
	/**
	 * 리더 지역별 공급업체 리스트
	 * @param map
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/leaderGeoSupplyList")
	public ModelAndView leaderGeoSupplyList(CommandMap map, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView("/leader/leaderGeoSupplyList");
		
		String ld_seq = RsUtil.checkNull(map.get("ld_seq"));
		
		Map<String, Object> leaderMap = new HashMap<String, Object>();
		leaderMap.put("ld_seq", ld_seq);
		
		try{
			
			String ld_address = leaderService.getLeaderAddr(leaderMap);
			
			String[] addr_arr = ld_address.split(" ");
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			
		}
		
		return mav;
	}
	/**
	 * 구매자 수정(SDW)
	 * @param map
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/leaderUserModifyData.do")
	public void leaderUserModifyData(CommandMap map, HttpServletResponse response) throws Exception{
		PrintWriter pw = null;

		JSONObject json = new JSONObject();
		String msg = "success";

		

		try{
			
			
			leaderService.leaderUserModifyData(map.getMap());			

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
