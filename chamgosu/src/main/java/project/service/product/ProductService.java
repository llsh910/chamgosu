package project.service.product;

import java.util.List;
import java.util.Map;

public interface ProductService {
	int insertProduct(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> adminProductList(Map<String, Object> map) throws Exception;
	
	int adminProductCnt(Map<String, Object> map) throws Exception;
	
	int adminProductAllCnt() throws Exception;
	
	List<Map<String, Object>> codeList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> adminProductView(Map<String, Object> map) throws Exception;
	
	int updateAdminProduct(Map<String, Object> map) throws Exception;
	
	int productApplyUpdate(Map<String, Object> map) throws Exception;
	
	int productDelete(Map<String, Object> map)throws Exception;
	
	int selectProductIdt(Map<String, Object> map)throws Exception;
	
	
	
}
