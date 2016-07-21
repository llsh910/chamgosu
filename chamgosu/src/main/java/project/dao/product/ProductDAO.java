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
	
	
	
}
