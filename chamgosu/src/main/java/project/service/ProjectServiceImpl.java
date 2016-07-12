package project.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import project.dao.ProjectDAO;


@Service("projectService")
public class ProjectServiceImpl implements ProjectService {
	Logger log = Logger.getLogger(this.getClass());
    
    @Resource(name="projectDAO")
    private ProjectDAO projectDAO;
     
    @Override
    public List<Map<String, Object>> selectList(Map<String, Object> map) throws Exception {
        return projectDAO.selectList(map);
    }
    
    @Override
    public List<Map<String, Object>> selectAjaxList(String param) throws Exception {
        return projectDAO.selectAjaxList(param);
    }

}

