package project.dao.code;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import project.config.dao.TempletDAO;

@Repository("codeDAO")
public class CodeDAO extends TempletDAO
{
  public List<Map<String, Object>> indexCodeList(Map<String, Object> map)
    throws Exception
  {
    return selectList("code.indexCodeView", map);
  }

  public List<Map<String, Object>> code1List(Map<String, Object> map) throws Exception
  {
    return selectList("code.code1View", map);
  }

  public List<Map<String, Object>> code2List(Map<String, Object> map) throws Exception
  {
    return selectList("code.code2View", map);
  }

  public String indexCdName(Map<String, Object> map) throws Exception {
    return (String)selectOne("code.indexCdName", map);
  }

  public String code1Name(Map<String, Object> map) throws Exception {
    return (String)selectOne("code.code1Name", map);
  }

  public Map<String, Object> code1Value(Map<String, Object> map) throws Exception
  {
    return (Map)selectOne("code.code1Value", map);
  }

  public Map<String, Object> code2Value(Map<String, Object> map) throws Exception
  {
    return (Map)selectOne("code.code2Value", map);
  }

  public int code1Save(Map<String, Object> map) throws Exception {
    return ((Integer)insert("code.code1Save", map)).intValue();
  }

  public int code2Save(Map<String, Object> map) throws Exception {
    return ((Integer)insert("code.code2Save", map)).intValue();
  }

  public int code1UseSave(Map<String, Object> map) throws Exception {
    return ((Integer)insert("code.code1UseSave", map)).intValue();
  }

  public int code2UseSave(Map<String, Object> map) throws Exception {
    return ((Integer)insert("code.code2UseSave", map)).intValue();
  }

  public int code1ModifySave(Map<String, Object> map) throws Exception {
    return ((Integer)update("code.code1ModifySave", map)).intValue();
  }

  public int code2ModifySave(Map<String, Object> map) throws Exception {
    return ((Integer)update("code.code2ModifySave", map)).intValue();
  }
}