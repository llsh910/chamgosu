package project.dao.supply;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import project.config.dao.TempletDAO;

@Repository("supplyDAO")
public class SupplyDAO extends TempletDAO {
	public int supplyIdChk(Map<String, Object> map) throws Exception{
		return (Integer)selectOne("supply.supplyIdChk", map);
	}
	
	public int supplyMiniSave(Map<String, Object> map) throws Exception{
		return (Integer)insert("supply.supplyMiniSave", map);
	}
	
	public int supplySave(Map<String, Object> map) throws Exception{
		return (Integer)insert("supply.supplySave", map);
	}
	
	public int supplyListCnt(Map<String, Object> map) throws Exception{
		return (Integer)selectOne("supply.supplyListCnt", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> supplyList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("supply.supplyList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> supplyModifyData(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("supply.supplyModifyData", map);
	}
	
	public int supplyModifySave(Map<String, Object> map) throws Exception{
		return (Integer)update("supply.supplyModifySave", map);
	}
	
	public int supplyTotalCnt(Map<String, Object> map) throws Exception{
		return (Integer)selectOne("supply.supplyTotalCnt", map);
	}
	
	public int supplyRegionListCnt(Map<String, Object> map) throws Exception{
		return (Integer)selectOne("supply.supplyRegionListCnt", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> supplyRegionList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("supply.supplyRegionList", map);
	}
	
	public int supplyRegionStateSave(Map<String, Object> map) throws Exception{
		return (Integer)update("supply.supplyRegionStateSave", map);
	}
	
}
