package project.dao.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import project.config.dao.TempletDAO;

@Repository("administrator_setDAO")
public class administrator_setDAO extends TempletDAO {
	
	@SuppressWarnings("unchecked")
	public int insertAdministrator(Map<String, Object> map) throws Exception{
		return (Integer)insert("admin.insertAdministrator", map);
	}
	
	@SuppressWarnings("unchecked")
	public int updateAdministrator(Map<String, Object> map) throws Exception{
		return (Integer)insert("admin.updateAdministrator", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAdministrator(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.selectAdministrator", map);
	}
	
	@SuppressWarnings("unchecked")
	public int selectAdministratorCnt(Map<String, Object> map) throws Exception{
		return (Integer)selectOne("admin.selectAdministratorCnt", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectAdmin(String seq) throws Exception{
		return (Map<String, Object>)selectOne("admin.selectAdmin", seq);
	}
	
	@SuppressWarnings("unchecked")
	public int deleteAdministrator(String seq) throws Exception{
		return (Integer)delete("admin.deleteAdministrator", seq);
	}
	
	
	
}
