package project.service.code;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import project.dao.code.CodeDAO;

@Service("codeService")
public class CodeServiceImpl
  implements CodeService
{

  @Resource(name="codeDAO")
  private CodeDAO codeDAO;

  public List<Map<String, Object>> indexCodeList(Map<String, Object> map)
    throws Exception
  {
    return this.codeDAO.indexCodeList(map);
  }

  public List<Map<String, Object>> code1List(Map<String, Object> map) throws Exception
  {
    return this.codeDAO.code1List(map);
  }

  public List<Map<String, Object>> code2List(Map<String, Object> map) throws Exception
  {
    return this.codeDAO.code2List(map);
  }

  public String indexCdName(Map<String, Object> map) throws Exception
  {
    return this.codeDAO.indexCdName(map);
  }

  public String code1Name(Map<String, Object> map) throws Exception
  {
    return this.codeDAO.code1Name(map);
  }

  public Map<String, Object> code1Value(Map<String, Object> map) throws Exception
  {
    return this.codeDAO.code1Value(map);
  }

  public int code1Save(Map<String, Object> map) throws Exception
  {
    return this.codeDAO.code1Save(map);
  }

  public int code2Save(Map<String, Object> map) throws Exception
  {
    return this.codeDAO.code2Save(map);
  }

  public int code1ModifySave(Map<String, Object> map) throws Exception
  {
    return this.codeDAO.code1ModifySave(map);
  }

  public int code2ModifySave(Map<String, Object> map) throws Exception
  {
    return this.codeDAO.code2ModifySave(map);
  }

  public Map<String, Object> code2Value(Map<String, Object> map) throws Exception
  {
    return this.codeDAO.code2Value(map);
  }

  public int code1UseSave(Map<String, Object> map) throws Exception
  {
    return this.codeDAO.code1UseSave(map);
  }

  public int code2UseSave(Map<String, Object> map) throws Exception
  {
    return this.codeDAO.code2UseSave(map);
  }
}