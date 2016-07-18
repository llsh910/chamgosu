package project.service.admin;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import project.dao.admin.productDAO;
@Service("productService")
public class productServiceImpl implements productService {

	@Resource(name="productDAO")
	private productDAO productDAO;
	
	
	@Override
	public int insertProduct(Map<String, Object> map) throws Exception{
		return productDAO.insertProduct(map);
	}

}
