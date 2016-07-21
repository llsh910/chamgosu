package project.service.leader;

import java.util.List;
import java.util.Map;

public interface LeaderService {
	int leaderIdChk(Map<String, Object> map) throws Exception;
	int leaderTrustListCntAll(Map<String, Object> map) throws Exception;
	int leaderTrustListCnt(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> leaderTrustList(Map<String, Object> map) throws Exception;
	
	int leaderNoListCntAll(Map<String, Object> map) throws Exception;
	int leaderNoListCnt(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> leaderNoList(Map<String, Object> map) throws Exception;
	
	int leaderUserListCntAll(Map<String, Object> map) throws Exception;
	int leaderUserListCnt(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> leaderUserList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> leaderUserView(Map<String, Object> map) throws Exception;
	
	int leaderUserNoListCntAll(Map<String, Object> map) throws Exception;
	int leaderUserNoListCnt(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> leaderUserNoList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> leaderUserNoView(Map<String, Object> map) throws Exception;
	
	Map<String, Object> leaderModifyData(Map<String, Object> map) throws Exception;
	int leaderModifySave(Map<String, Object> map) throws Exception;
	
	String getLeaderAddr(Map<String, Object> map) throws Exception;
	int leaderUserModifyData(Map<String, Object> map) throws Exception;
	
	
}
