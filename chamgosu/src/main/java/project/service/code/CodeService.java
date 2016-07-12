package project.service.code;

import java.util.List;
import java.util.Map;

public interface CodeService {
	List<Map<String, Object>> indexCodeList(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> code1List(Map<String, Object> map) throws Exception;
	String indexCdName(Map<String, Object> map) throws Exception;
	Map<String, Object> code1Value(Map<String, Object> map) throws Exception;
	
}
