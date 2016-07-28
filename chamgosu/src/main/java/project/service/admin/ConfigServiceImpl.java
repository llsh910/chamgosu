package project.service.admin;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import project.dao.admin.ConfigDAO;

@Service("configService")
public class ConfigServiceImpl
  implements ConfigService
{

  @Resource(name="configDAO")
  private ConfigDAO configDAO;

	public Map<String, Object> selectCompanyInfo(Map<String, Object> map) throws Exception{
		return this.configDAO.selectCompanyInfo(map);  
	};

	public int selectCompanyInfoCnt(Map<String, Object> map) throws Exception{
		return this.configDAO.selectCompanyInfoCnt(map);
	};
	
	public int insertCompanyInfo(Map<String, Object> map) throws Exception{
		return this.configDAO.insertCompanyInfo(map);
	};
	
	public int updateCompanyInfo(Map<String, Object> map) throws Exception{
		return this.configDAO.updateCompanyInfo(map);
	};
}