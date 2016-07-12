package project.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import project.config.dao.TempletDAO;
@Repository("projectDAO")
public class ProjectDAO extends TempletDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("projectList.List", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAjaxList(String param) throws Exception{
		return (List<Map<String, Object>>)selectList("projectList.AjaxList", param);
	}
	

}
