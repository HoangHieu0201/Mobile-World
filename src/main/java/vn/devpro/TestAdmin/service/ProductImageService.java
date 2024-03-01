package vn.devpro.TestAdmin.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import vn.devpro.TestAdmin.dto.FinalConstant;
import vn.devpro.TestAdmin.model.ProductImage;

@Service
public class ProductImageService extends BaseService<ProductImage> implements FinalConstant {

	@Override
	public Class<ProductImage> clazz(){
		return ProductImage.class;
	}
	
	public List<ProductImage> findAllActive() {
		return super.executeNativeSql("SELECT * FROM tbl_product_image WHERE status = 1");
	}
	
	@Transactional
	public void deleteProductId(int id) {
		super.deleteById(id);
	}
	
	@Transactional
	public void inactiveProduct(ProductImage productImage) {
		super.saveOrUpdate(productImage);
	}
	
	//Lay các anh san pham co id cần tìm
		public List<ProductImage> getProductImagesByProductId(int productId) {
			
			String sql = "SELECT * FROM tbl_product_image WHERE product_id = " + productId;
			
			return super.executeNativeSql(sql);
		}
	
}
