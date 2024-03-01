package vn.devpro.TestAdmin.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import vn.devpro.TestAdmin.model.SaleOrder;
import vn.devpro.TestAdmin.model.SaleOrderProduct;

@Service
public class SaleOrderProductService extends BaseService<SaleOrderProduct>{

	@Override
	public Class<SaleOrderProduct> clazz(){
		return SaleOrderProduct.class;
	}
	
	@Transactional
	public SaleOrderProduct saveOrderProduct(SaleOrderProduct saleOrderProduct) {
		return super.saveOrUpdate(saleOrderProduct);
	}
	
	public List<SaleOrderProduct> findAllActive() {
		return super.executeNativeSql("SELECT * FROM tbl_sale_order_product WHERE status = 1");
	}

	@Transactional
	public void deleteSaleOrderProductId(int id) {
		super.deleteById(id);
	}

	@Transactional
	public void inactiveSaleOrderProduct(SaleOrderProduct saleOrderProduct) {
		super.saveOrUpdate(saleOrderProduct);
	}
	
	//Lay san pham trong don hang
	public List<SaleOrderProduct> findAllProductInOrder(int saleOrderId) {
		String sql = "SELECT * FROM tbl_sale_order_product WHERE sale_order_id = '" + saleOrderId + "'";
		return super.executeNativeSql(sql);
	}
}
