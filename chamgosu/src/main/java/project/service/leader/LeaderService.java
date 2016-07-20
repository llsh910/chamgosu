package project.service.leader;

import java.util.List;
import java.util.Map;

public interface LeaderService {
	int leaderIdChk(Map<String, Object> map) throws Exception;
	int leaderTrustListCntAll(Map<String, Object> map) throws Exception;
	int leaderTrustListCnt(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> leaderTrustList(Map<String, Object> map) throws Exception;
	Map<String, Object> leaderModifyData(Map<String, Object> map) throws Exception;
	int leaderModifySave(Map<String, Object> map) throws Exception;
}
