package project.service.supply;

import java.util.List;
import java.util.Map;

public interface SupplyService {
	int supplyIdChk(Map<String, Object> map) throws Exception;
	int supplyMiniSave(Map<String, Object> map) throws Exception;
	int supplySave(Map<String, Object> map) throws Exception;
	int supplyListCnt(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> supplyList(Map<String, Object> map) throws Exception;
	Map<String, Object> supplyModifyData(Map<String, Object> map) throws Exception;
	int supplyModifySave(Map<String, Object> map) throws Exception;
	int supplyTotalCnt(Map<String, Object> map) throws Exception;
	int supplyRegionListCnt(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> supplyRegionList(Map<String, Object> map) throws Exception;
	int supplyRegionStateSave(Map<String, Object> map) throws Exception;
}
