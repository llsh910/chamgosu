package project.service.admin;

import java.util.List;
import java.util.Map;

public abstract interface ConfigService
{
  /*public abstract List<Map<String, Object>> indexCodeList(Map<String, Object> paramMap)
    throws Exception;*/
	
	public Map<String, Object> selectCompanyInfo(Map<String, Object> map) throws Exception;

	public int selectCompanyInfoCnt(Map<String, Object> map) throws Exception;
	
	public int insertCompanyInfo(Map<String, Object> map) throws Exception;
	
	public int updateCompanyInfo(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> selectAgreement(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectAgreementList(Map<String, Object> map) throws Exception;
	
	public int updateAgreement(Map<String, Object> map) throws Exception;
	

  
}