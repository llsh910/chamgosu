package project.service.leader;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import project.dao.leader.LeaderDAO;
@Service("supplyService")
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


}
