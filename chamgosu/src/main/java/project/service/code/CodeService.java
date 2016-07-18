package project.service.code;

import java.util.List;
import java.util.Map;

public interface CodeService {
	List<Map<String, Object>> indexCodeList(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> code1List(Map<String, Object> map) throws Exception;
	String indexCdName(Map<String, Object> map) throws Exception;
	Map<String, Object> code1Value(Map<String, Object> map) throws Exception;
	
	Map<String, Object> code2Value(Map<String, Object> map) throws Exception;
	
	
	int code1Save(Map<String, Object> map) throws Exception;
	int code2Save(Map<String, Object> map) throws Exception;
	
	int code1ModifySave(Map<String, Object> map) throws Exception;
	int code2ModifySave(Map<String, Object> map) throws Exception;
	
}
