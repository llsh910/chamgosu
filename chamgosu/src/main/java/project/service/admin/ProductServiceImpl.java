package project.service.admin;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import project.dao.admin.ProductDAO;
@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Resource(name="productDAO")
	private ProductDAO productDAO;
	
	
	@Override
	public int insertProduct(Map<String, Object> map) throws Exception{
		return productDAO.insertProduct(map);
	}

}