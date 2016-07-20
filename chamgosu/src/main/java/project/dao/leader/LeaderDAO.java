package project.dao.leader;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import project.config.dao.TempletDAO;

@Repository("leaderDAO")
public class LeaderDAO extends TempletDAO {

	
	
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
	
	
}
