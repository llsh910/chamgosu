package project.service.code;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import project.dao.code.CodeDAO;
@Service("codeService")
public class CodeServiceImpl implements CodeService {

	@Resource(name="codeDAO")
	private CodeDAO codeDAO;
	
	@Override
	public List<Map<String, Object>> indexCodeList(Map<String, Object> map) throws Exception {
		return codeDAO.indexCodeList(map);
	}

	@Override
	public List<Map<String, Object>> code1List(Map<String, Object> map) throws Exception {
		return codeDAO.code1List(map);
	}

	@Override
	public String indexCdName(Map<String, Object> map) throws Exception {
		return codeDAO.indexCdName(map);
	}

	@Override
	public Map<String, Object> code1Value(Map<String, Object> map) throws Exception {
		return codeDAO.code1Value(map);
	}

}
