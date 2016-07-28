package project.dao.admin;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import project.config.dao.TempletDAO;

@Repository("configDAO")
public class ConfigDAO extends TempletDAO
{
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectCompanyInfo(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("config.selectCompanyInfo", map);
	}
	
	public int selectCompanyInfoCnt(Map<String, Object> map) throws Exception{
		return (Integer) selectOne("config.selectCompanyInfoCnt", map);
	}
	
	
	public int insertCompanyInfo(Map<String, Object> map) throws Exception{
		return (Integer) insert("config.insertCompanyInfo", map);
	}
	
	public int updateCompanyInfo(Map<String, Object> map) throws Exception{
		return (Integer) insert("config.updateCompanyInfo", map);
	}
 
}