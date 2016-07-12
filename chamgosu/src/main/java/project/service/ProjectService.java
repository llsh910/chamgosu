package project.service;

import java.util.List;
import java.util.Map;



public interface ProjectService {
	List<Map<String, Object>> selectList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectAjaxList(String param) throws Exception;
	
}
