package project.dao.leader;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import project.config.dao.TempletDAO;

@Repository("leaderDAO")
public class LeaderDAO extends TempletDAO {

	public int leaderIdChk(Map<String, Object> map) throws Exception{
		return (Integer)selectOne("leader.leaderIdChk", map);
	}
	
	public int leaderTrustListCntAll(Map<String, Object> map) throws Exception{
		return (Integer)selectOne("leader.leaderTrustListCntAll", map);
	}
	
	public int leaderTrustListCnt(Map<String, Object> map) throws Exception{
		return (Integer)selectOne("leader.leaderTrustListCnt", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> leaderTrustList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("leader.leaderTrustList", map);
	}
	
	
	public int leaderNoListCntAll(Map<String, Object> map) throws Exception{
		return (Integer)selectOne("leader.leaderNoListCntAll", map);
	}
	
	public int leaderNoListCnt(Map<String, Object> map) throws Exception{
		return (Integer)selectOne("leader.leaderNoListCnt", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> leaderNoList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("leader.leaderNoList", map);
	}
	
	
	public int leaderUserListCntAll(Map<String, Object> map) throws Exception{
		return (Integer)selectOne("leader.leaderUserListCntAll", map);
	}
	
	public int leaderUserListCnt(Map<String, Object> map) throws Exception{
		return (Integer)selectOne("leader.leaderUserListCnt", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> leaderUserList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("leader.leaderUserList", map);
	}
	
	
	public int leaderUserNoListCntAll(Map<String, Object> map) throws Exception{
		return (Integer)selectOne("leader.leaderUserNoListCntAll", map);
	}
	
	public int leaderUserNoListCnt(Map<String, Object> map) throws Exception{
		return (Integer)selectOne("leader.leaderUserNoListCnt", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> leaderUserNoList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("leader.leaderUserNoList", map);
	}
	
	
	
	
	public int leaderModifySave(Map<String, Object> map) throws Exception{
		return (Integer)update("leader.leaderModifySave", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> leaderModifyData(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("leader.leaderModifyData", map);
	}
	
	
}
