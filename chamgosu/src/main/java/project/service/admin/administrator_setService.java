package project.service.admin;

import java.util.List;
import java.util.Map;

public interface administrator_setService {
	int insertAdministrator(Map<String, Object> map) throws Exception;
	
	int updateAdministrator(Map<String, Object> map) throws Exception; 
	
	List<Map<String, Object>> selectAdministrator(Map<String, Object> map) throws Exception;
	
	int selectAdministratorCnt(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectAdmin(String seq) throws Exception;
	
	int deleteAdministrator(String seq) throws Exception;
}
