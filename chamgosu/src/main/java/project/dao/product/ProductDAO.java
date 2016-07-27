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
	
	@SuppressWarnings("unchecked")
	public int productApplyUpdate(Map<String, Object> map) throws Exception{
		return (Integer)update("product.productApplyUpdate", map);
	}
	
	@SuppressWarnings("unchecked")
	public int productDelete(Map<String, Object> map) throws Exception{
		return (Integer)delete("product.productDelete", map);
	}
	
	@SuppressWarnings("unchecked")
	public int selectProductIdt(Map<String, Object> map) throws Exception{
		return (Integer)selectOne("product.selectProductIdt", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> regionProductList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("product.regionProductList", map);
	}
	
	
	
	
	
}
