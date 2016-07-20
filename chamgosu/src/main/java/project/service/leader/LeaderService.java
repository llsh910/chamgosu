package project.service.leader;

import java.util.List;
import java.util.Map;

public interface LeaderService {
	int leaderTrustListCntAll(Map<String, Object> map) throws Exception;
	int leaderTrustListCnt(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> leaderTrustList(Map<String, Object> map) throws Exception;
}