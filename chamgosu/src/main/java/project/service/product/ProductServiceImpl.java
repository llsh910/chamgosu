package project.service.product;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import project.dao.product.ProductDAO;
@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Resource(name="productDAO")
	private ProductDAO productDAO;
	
	
	@Override
	public int insertProduct(Map<String, Object> map) throws Exception{
		return productDAO.insertProduct(map);
	}
	
	@Override
	public List<Map<String, Object>> adminProductList(Map<String, Object> map) throws Exception{
		return productDAO.adminProductList(map);
	}
	
	@Override
	public int adminProductCnt(Map<String, Object> map) throws Exception{
		return productDAO.adminProductCnt(map);
	}
	
	@Override
	public int adminProductAllCnt() throws Exception{
		return productDAO.adminProductAllCnt();
	}
	
	@Override
	public List<Map<String, Object>> codeList(Map<String, Object> map) throws Exception{
		return productDAO.codeList(map);
	}
	
	@Override
	public Map<String, Object> adminProductView(Map<String, Object> map) throws Exception{
		return productDAO.adminProductView(map);
	}
	
	@Override
	public int updateAdminProduct(Map<String, Object> map) throws Exception{
		return productDAO.updateAdminProduct(map);
	}

}
