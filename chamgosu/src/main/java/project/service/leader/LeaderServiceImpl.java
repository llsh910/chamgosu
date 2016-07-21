package project.service.leader;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import project.dao.leader.LeaderDAO;
@Service("leaderService")
public class LeaderServiceImpl implements LeaderService {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="leaderDAO")
	private LeaderDAO leaderDAO;


	@Override
	public int leaderTrustListCnt(Map<String, Object> map) throws Exception {
		return leaderDAO.leaderTrustListCnt(map);
	}

	@Override
	public List<Map<String, Object>> leaderTrustList(Map<String, Object> map) throws Exception {
		return leaderDAO.leaderTrustList(map);
	}

	@Override
	public int leaderTrustListCntAll(Map<String, Object> map) throws Exception {
		return leaderDAO.leaderTrustListCntAll(map);
	}

	@Override
	public int leaderIdChk(Map<String, Object> map) throws Exception {
		return leaderDAO.leaderIdChk(map);
	}

	@Override
	public int leaderModifySave(Map<String, Object> map) throws Exception {
		return leaderDAO.leaderModifySave(map);
	}

	@Override
	public Map<String, Object> leaderModifyData(Map<String, Object> map) throws Exception {
		return leaderDAO.leaderModifyData(map);
	}

	@Override
	public int leaderNoListCntAll(Map<String, Object> map) throws Exception {
		return leaderDAO.leaderNoListCntAll(map);
	}

	@Override
	public int leaderNoListCnt(Map<String, Object> map) throws Exception {
		return leaderDAO.leaderNoListCnt(map);
	}

	@Override
	public List<Map<String, Object>> leaderNoList(Map<String, Object> map) throws Exception {
		return leaderDAO.leaderNoList(map);
	}

	@Override
	public int leaderUserListCntAll(Map<String, Object> map) throws Exception {
		return leaderDAO.leaderUserListCntAll(map);
	}

	@Override
	public int leaderUserListCnt(Map<String, Object> map) throws Exception {
		return leaderDAO.leaderUserListCnt(map);
	}

	@Override
	public List<Map<String, Object>> leaderUserList(Map<String, Object> map) throws Exception {
		return leaderDAO.leaderUserList(map);
	}

	@Override
	public int leaderUserNoListCntAll(Map<String, Object> map) throws Exception {
		return leaderDAO.leaderUserNoListCntAll(map);
	}

	@Override
	public int leaderUserNoListCnt(Map<String, Object> map) throws Exception {
		return leaderDAO.leaderUserNoListCnt(map);
	}

	@Override
	public List<Map<String, Object>> leaderUserNoList(Map<String, Object> map) throws Exception {
		return leaderDAO.leaderUserNoList(map);
	}

	@Override
	public Map<String, Object> leaderUserView(Map<String, Object> map) throws Exception {
		return leaderDAO.leaderUserView(map);
	}

	@Override
	public Map<String, Object> leaderUserNoView(Map<String, Object> map) throws Exception {
		return leaderDAO.leaderUserNoView(map);
	}

	@Override
	public String getLeaderAddr(Map<String, Object> map) throws Exception {
		return leaderDAO.getLeaderAddr(map);
	}
	
	@Override
	public int leaderUserModifyData(Map<String, Object> map) throws Exception {
		return leaderDAO.leaderUserModifyData(map);
	}
	
	
	
	


}
