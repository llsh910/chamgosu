package project.service.admin;

import java.util.List;
import java.util.Map;

public interface administrator_setService {
	int insertAdministrator(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectAdministrator(Map<String, Object> map) throws Exception;
	
	int selectAdministratorCnt(Map<String, Object> map) throws Exception;
}
