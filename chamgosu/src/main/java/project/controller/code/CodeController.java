package project.controller.code;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import project.config.common.CommandMap;
import project.config.util.RsUtil;
import project.service.code.CodeService;

@Controller
public class CodeController
{
	Logger log = Logger.getLogger(getClass());

	@Resource(name="codeService")
	private CodeService codeService;

	@RequestMapping({"codeView.do"})
	public ModelAndView codeView(CommandMap map, HttpServletRequest request, HttpServletResponse response)
			throws Exception
	{
		ModelAndView mav = new ModelAndView("/code/codeView");

		Map searchMap = new HashMap();
		searchMap = map.getMap();

		String code_idx = RsUtil.checkNull(searchMap.get("code_idx"));

		if (code_idx.equals("")) {
			code_idx = "01";
		}
		searchMap.remove("code_idx");

		searchMap.put("code_idx", code_idx);

		String code_first = RsUtil.checkNull(searchMap.get("code_first"));

		if (code_first.equals("")) {
			code_first = "00001";
		}

		searchMap.put("code_first", code_first);
		try
		{
			List indexCodeList = this.codeService.indexCodeList(searchMap);
			List code1List = this.codeService.code1List(searchMap);

			if (code_idx.equals("01")) {
				List code2List = this.codeService.code2List(searchMap);
				mav.addObject("code2List", code2List);
			}

			String code1Name = this.codeService.code1Name(searchMap);

			mav.addObject("code_first", code_first);
			mav.addObject("code_idx", code_idx);
			mav.addObject("code1Name", code1Name);
			mav.addObject("indexCodeList", indexCodeList);
			mav.addObject("code1List", code1List);
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}

		return mav;
	}

	@RequestMapping({"code1View.do"})
	public ModelAndView code1View(CommandMap map, HttpServletResponse response)
			throws Exception
	{
		ModelAndView mav = new ModelAndView("/code/code1View");

		Map searchMap = new HashMap();
		searchMap = map.getMap();

		String code_idx = RsUtil.checkNull(searchMap.get("code_idx"));

		if (code_idx.equals("")) {
			code_idx = "01";
		}
		searchMap.remove("code_idx");

		searchMap.put("code_idx", code_idx);

		String code_first = RsUtil.checkNull(searchMap.get("code_first"));

		if (code_first.equals("")) {
			code_first = "00001";
		}

		searchMap.put("code_first", code_first);
		try
		{
			List indexCodeList = this.codeService.indexCodeList(searchMap);
			List code1List = this.codeService.code1List(searchMap);

			if (code_idx.equals("01")) {
				List code2List = this.codeService.code2List(searchMap);
				mav.addObject("code2List", code2List);
			}

			String code1Name = this.codeService.code1Name(searchMap);
			String indexCdName = this.codeService.indexCdName(searchMap);

			mav.addObject("indexCdName", indexCdName);
			mav.addObject("code_first", code_first);
			mav.addObject("code_idx", code_idx);
			mav.addObject("code1Name", code1Name);
			mav.addObject("indexCodeList", indexCodeList);
			mav.addObject("code1List", code1List);
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}

		return mav;
	}

	@RequestMapping({"code2View.do"})
	public ModelAndView code2View(CommandMap map, HttpServletResponse response)
			throws Exception
	{
		ModelAndView mav = new ModelAndView("/code/code2View");

		Map searchMap = new HashMap();
		searchMap = map.getMap();
		String code_idx = RsUtil.checkNull(searchMap.get("code_idx"));
		String code_first = RsUtil.checkNull(searchMap.get("code_first"));
		try
		{
			List code2View = this.codeService.code2List(searchMap);

			String code1Name = this.codeService.code1Name(searchMap);

			mav.addObject("code_first", code_first);
			mav.addObject("code_idx", code_idx);
			mav.addObject("code1Name", code1Name);

			mav.addObject("code2View", code2View);
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
		}

		return mav;
	}

	@RequestMapping({"code1Save.do"})
	public void code1Save(CommandMap map, HttpServletResponse response)
			throws Exception
	{
		PrintWriter pw = null;

		JSONObject json = new JSONObject();
		String msg = "success";

		Map codeMap = map.getMap();
		try
		{
			this.codeService.code1Save(codeMap);
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
			msg = "error";
		} finally {
			response.setContentType("application/x-json; charset=UTF-8");
			json.put("msg", msg);
			pw = response.getWriter();
			pw.print(json);
			pw.flush();
			pw.close();
		}
	}

	@RequestMapping({"code2Save.do"})
	public void code2Save(CommandMap map, HttpServletResponse response)
			throws Exception
	{
		PrintWriter pw = null;

		JSONObject json = new JSONObject();
		String msg = "success";

		Map codeMap = map.getMap();
		try
		{
			this.codeService.code2Save(codeMap);
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
			msg = "error";
		} finally {
			response.setContentType("application/x-json; charset=UTF-8");
			json.put("msg", msg);
			pw = response.getWriter();
			pw.print(json);
			pw.flush();
			pw.close();
		}
	}

	@RequestMapping({"code1UseSave.do"})
	public void code1UseSave(CommandMap map, HttpServletResponse response) throws Exception
	{
		PrintWriter pw = null;

		JSONObject json = new JSONObject();
		String msg = "success";

		Map codeMap = map.getMap();

		String code_isuse = RsUtil.checkNull(codeMap.get("code_isuse"));

		if (code_isuse.equals("Y")) code_isuse = "N"; else {
			code_isuse = "Y";
		}
		codeMap.remove("code_isuse");

		codeMap.put("code_isuse", code_isuse);
		try
		{
			this.codeService.code1UseSave(codeMap);
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
			msg = "error";
		} finally {
			response.setContentType("application/x-json; charset=UTF-8");
			json.put("msg", msg);
			pw = response.getWriter();
			pw.print(json);
			pw.flush();
			pw.close();
		}
	}

	@RequestMapping({"code2UseSave.do"})
	public void code2UseSave(CommandMap map, HttpServletResponse response) throws Exception {
		PrintWriter pw = null;

		JSONObject json = new JSONObject();
		String msg = "success";

		Map codeMap = map.getMap();

		String code_isuse = RsUtil.checkNull(codeMap.get("code_isuse"));

		if (code_isuse.equals("Y")) code_isuse = "N"; else {
			code_isuse = "Y";
		}
		codeMap.remove("code_isuse");

		codeMap.put("code_isuse", code_isuse);
		try
		{
			this.codeService.code2UseSave(codeMap);
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
			msg = "error";
		} finally {
			response.setContentType("application/x-json; charset=UTF-8");
			json.put("msg", msg);
			pw = response.getWriter();
			pw.print(json);
			pw.flush();
			pw.close();
		}
	}

	@RequestMapping({"code1ModifySave.do"})
	public void code1ModifySave(CommandMap map, HttpServletResponse response) throws Exception
	{
		PrintWriter pw = null;

		JSONObject json = new JSONObject();
		String msg = "success";

		Map codeMap = map.getMap();
		try
		{
			this.codeService.code1ModifySave(codeMap);
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
			msg = "error";
		} finally {
			response.setContentType("application/x-json; charset=UTF-8");
			json.put("msg", msg);
			pw = response.getWriter();
			pw.print(json);
			pw.flush();
			pw.close();
		}
	}

	@RequestMapping({"code2ModifySave.do"})
	public void code2ModifySave(CommandMap map, HttpServletResponse response) throws Exception {
		PrintWriter pw = null;

		JSONObject json = new JSONObject();
		String msg = "success";

		Map codeMap = map.getMap();
		try
		{
			this.codeService.code2ModifySave(codeMap);
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
			msg = "error";
		} finally {
			response.setContentType("application/x-json; charset=UTF-8");
			json.put("msg", msg);
			pw = response.getWriter();
			pw.print(json);
			pw.flush();
			pw.close();
		}
	}
}