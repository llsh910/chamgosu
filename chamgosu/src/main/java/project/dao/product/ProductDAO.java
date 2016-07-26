package project.dao.product;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import project.config.dao.TempletDAO;

@Repository("productDAO")
public class ProductDAO extends TempletDAO {
	
	@SuppressWarnings("unchecked")
	public int insertProduct(Map<String, Object> map) throws Exception{
		return (Integer)insert("product.insertProduct", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminProductList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("product.adminProductList", map);
	}
	
	@SuppressWarnings("unchecked")
	public int adminProductCnt(Map<String, Object> map) throws Exception{
		return (Integer)selectOne("product.adminProductCnt", map);
	}
	
	@SuppressWarnings("unchecked")
	public int adminProductAllCnt() throws Exception{
		return (Integer)selectOne("product.adminProductAllCnt");
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> codeList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("product.codeList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> adminProductView(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("product.adminProductView", map);
	}
	
	@SuppressWarnings("unchecked")
	public int updateAdminProduct(Map<String, Object> map) throws Exception{
		return (Integer)update("product.updateAdminProduct", map);
	}
	
	
	
}
