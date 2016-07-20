package project.service.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import project.dao.admin.Administrator_setDAO;
@Service("administrator_setService")
public class Administrator_setServiceImpl implements Administrator_setService {

	@Resource(name="administrator_setDAO")
	private Administrator_setDAO administrator_setDAO;
	
	@Override
	public int insertAdministrator(Map<String, Object> map) throws Exception {
		return administrator_setDAO.insertAdministrator(map);
	}
	
	@Override
	public int updateAdministrator(Map<String, Object> map) throws Exception {
		return administrator_setDAO.updateAdministrator(map);
	}
	
	
	
	@Override
	public List<Map<String, Object>> selectAdministrator(Map<String, Object> map) throws Exception {
		return administrator_setDAO.selectAdministrator(map);
	}
	
	@Override
	public int selectAdministratorCnt(Map<String, Object> map) throws Exception {
		return administrator_setDAO.selectAdministratorCnt(map);
	}
	
	@Override
	public Map<String, Object> selectAdmin(String seq) throws Exception {
		return administrator_setDAO.selectAdmin(seq);
	}
	
	@Override
	public int deleteAdministrator(String seq) throws Exception {
		return administrator_setDAO.deleteAdministrator(seq);
	}
	
	
	
	
}
