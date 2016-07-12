package project.dao.code;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import project.config.dao.TempletDAO;

@Repository("codeDAO")
public class CodeDAO extends TempletDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> indexCodeList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("code.indexCodeView", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> code1List(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("code.code1View", map);
	}
	
	public String indexCdName(Map<String, Object> map) throws Exception{
		return (String)selectOne("code.indexCdName", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> code1Value(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("code.code1Value", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> code2Value(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("code.code2Value", map);
	}
	
	public int code1Save(Map<String, Object> map) throws Exception{
		return (Integer)insert("code.code1Save", map);
	}
	
	public int code2Save(Map<String, Object> map) throws Exception{
		return (Integer)insert("code.code2Save", map);
	}
	
	public int code1ModifySave(Map<String, Object> map) throws Exception{
		return (Integer)update("code.code1ModifySave", map);
	}
	
	public int code2ModifySave(Map<String, Object> map) throws Exception{
		return (Integer)update("code.code2ModifySave", map);
	}
	
}
