package project.service.code;

import java.util.List;
import java.util.Map;

public abstract interface CodeService
{
  public abstract List<Map<String, Object>> indexCodeList(Map<String, Object> paramMap)
    throws Exception;

  public abstract List<Map<String, Object>> code1List(Map<String, Object> paramMap)
    throws Exception;

  public abstract List<Map<String, Object>> code2List(Map<String, Object> paramMap)
    throws Exception;

  public abstract String indexCdName(Map<String, Object> paramMap)
    throws Exception;

  public abstract String code1Name(Map<String, Object> paramMap)
    throws Exception;

  public abstract Map<String, Object> code1Value(Map<String, Object> paramMap)
    throws Exception;

  public abstract Map<String, Object> code2Value(Map<String, Object> paramMap)
    throws Exception;

  public abstract int code1Save(Map<String, Object> paramMap)
    throws Exception;

  public abstract int code2Save(Map<String, Object> paramMap)
    throws Exception;

  public abstract int code1UseSave(Map<String, Object> paramMap)
    throws Exception;

  public abstract int code2UseSave(Map<String, Object> paramMap)
    throws Exception;

  public abstract int code1ModifySave(Map<String, Object> paramMap)
    throws Exception;

  public abstract int code2ModifySave(Map<String, Object> paramMap)
    throws Exception;
}