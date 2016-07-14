package project.service.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import project.dao.admin.administrator_setDAO;
@Service("administrator_setService")
public class administrator_setServiceImpl implements administrator_setService {

	@Resource(name="administrator_setDAO")
	private administrator_setDAO administrator_setDAO;
	
	@Override
	public int insertAdministrator(Map<String, Object> map) throws Exception {
		return administrator_setDAO.insertAdministrator(map);
	}
	
	@Override
	public List<Map<String, Object>> selectAdministrator(Map<String, Object> map) throws Exception {
		return administrator_setDAO.selectAdministrator(map);
	}
	
	@Override
	public int selectAdministratorCnt(Map<String, Object> map) throws Exception {
		return administrator_setDAO.selectAdministratorCnt(map);
	}
	
	
	
	
}
