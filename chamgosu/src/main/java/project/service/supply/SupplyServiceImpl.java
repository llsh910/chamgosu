package project.service.supply;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import project.dao.supply.SupplyDAO;
@Service("supplyService")
public class SupplyServiceImpl implements SupplyService {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="supplyDAO")
	private SupplyDAO supplyDAO;

	@Override
	public int supplyIdChk(Map<String, Object> map) throws Exception {
		return supplyDAO.supplyIdChk(map);
	}

	@Override
	public int supplyMiniSave(Map<String, Object> map) throws Exception {
		return supplyDAO.supplyMiniSave(map);
	}

	@Override
	public int supplySave(Map<String, Object> map) throws Exception {
		return supplyDAO.supplySave(map);
	}

	@Override
	public int supplyListCnt(Map<String, Object> map) throws Exception {
		return supplyDAO.supplyListCnt(map);
	}

	@Override
	public List<Map<String, Object>> supplyList(Map<String, Object> map) throws Exception {
		return supplyDAO.supplyList(map);
	}

	@Override
	public Map<String, Object> supplyModifyData(Map<String, Object> map) throws Exception {
		return supplyDAO.supplyModifyData(map);
	}

	@Override
	public int supplyModifySave(Map<String, Object> map) throws Exception {
		return supplyDAO.supplyModifySave(map);
	}

	@Override
	public int supplyTotalCnt(Map<String, Object> map) throws Exception {
		return supplyDAO.supplyTotalCnt(map);
	}

	@Override
	public int supplyRegionListCnt(Map<String, Object> map) throws Exception {
		return supplyDAO.supplyRegionListCnt(map);
	}

	@Override
	public List<Map<String, Object>> supplyRegionList(Map<String, Object> map) throws Exception {
		return supplyDAO.supplyRegionList(map);
	}

}
