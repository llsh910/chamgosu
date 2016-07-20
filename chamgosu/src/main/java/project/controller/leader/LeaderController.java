package project.controller.leader;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

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
}
