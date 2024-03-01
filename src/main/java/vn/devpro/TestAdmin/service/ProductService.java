package vn.devpro.TestAdmin.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import vn.devpro.TestAdmin.dto.FinalConstant;
import vn.devpro.TestAdmin.model.Product;
import vn.devpro.TestAdmin.model.ProductImage;
import vn.devpro.TestAdmin.dto.SearchModel;
import vn.devpro.TestAdmin.service.ProductImageService;


@Service
public class ProductService extends BaseService<Product> implements FinalConstant{

	@Override
	public Class<Product> clazz(){
		return Product.class;
	}
	
	public List<Product> findAllActive() {
		return super.executeNativeSql("SELECT * FROM tbl_product WHERE status = 1");
	}
	
	@Transactional
	public void deleteProductId(int id) {
		super.deleteById(id);
	}
	
	@Transactional
	public void inactiveProduct(Product product) {
		super.saveOrUpdate(product);
	}
	
	
	//Ham kiem tra  (1) file co duoc upload ko?
	public boolean isUploadFile(MultipartFile file) {
		if(file == null || file.getOriginalFilename().isEmpty()) {
			return false; //ko upload
		}
		return true; //co upload
	}
	
	//phuong thcu kiem tra danh sach file co upload ko?
	public boolean isUploadFiles(MultipartFile[] files) {
		if(files == null || files.length == 0) {
			return false; //ko upload
		}
		return true; //co upload
	}
	
//	---------------Save new product to database--------------------
	@Transactional 
	public Product saveAddProduct(Product product, MultipartFile avatarFile,
			MultipartFile[] imageFiles) throws IOException {
		
		//Luu avatar file
		if(isUploadFile(avatarFile)) {  //co upload file avtaar
			String path = FOLDER_UPLOAD + "Product/Avatar/" + avatarFile.getOriginalFilename();
			File file = new File(path);
			avatarFile.transferTo(file);
			//Luu duong dan vao bang product
			product.setAvatar("Product/Avatar/" + avatarFile.getOriginalFilename());
		}
		
		//Luu file images
		if(isUploadFiles(imageFiles)) { //co upload
			//Duyet danh sach anh images
			for(MultipartFile imageFile : imageFiles) {
				if(isUploadFile(imageFile)) { //co upload
					
					//Luu file vao thu muc Product/Image/
					String path = FOLDER_UPLOAD + "Product/Image/" + imageFile.getOriginalFilename();
					File file = new File(path);
					imageFile.transferTo(file);
					
					//Luu duong dan vao bang product_image
					ProductImage productImage = new ProductImage();
					productImage.setTitle(imageFile.getOriginalFilename());
					productImage.setPath("Product/Image/" + imageFile.getOriginalFilename());
					productImage.setStatus(Boolean.TRUE);
					productImage.setCreateDate(new Date());
					
					//Luudyuong dan anh sang bang product_image
					product.addRelationalProductImage(productImage);
				}
			}
		}
		return super.saveOrUpdate(product);
	}	

//	------------------------------Save edit product------------------------------------
	@Transactional 
	public Product saveEditProduct(Product product, MultipartFile avatarFile,
			MultipartFile[] imageFiles) throws IOException{
		
		//Lay product trong db
		Product dbProduct = super.getById(product.getId());
		
		//Luu avatar file mowis neu nguoi dung co upload avatar
		if(isUploadFile(avatarFile)) {  //co upload file avtaar
			
			//Xoa avatar cu
			String path = FOLDER_UPLOAD + dbProduct.getAvatar();
			File file = new File(path);
			file.delete();
			
			//Luu file avata moi vao thu muc Product/Avtar
			path = FOLDER_UPLOAD + "Product/Avatar/" + avatarFile.getOriginalFilename();
			file = new File(path);
			avatarFile.transferTo(file);
			//Luu duong dan vao bang product
			product.setAvatar("Product/Avatar/" + avatarFile.getOriginalFilename());
		}
		else { //Nguoi dung ko upload avatar file
			//Giu nguyen avatar cu
			product.setAvatar(dbProduct.getAvatar());
		}
		
		//Luu file images
		if(isUploadFiles(imageFiles)) { //co upload
			//Duyet danh sach anh images
			for(MultipartFile imageFile : imageFiles) {
				if(isUploadFile(imageFile)) { //co upload
					
					//Luu file vao thu muc Product/Image/
					String path = FOLDER_UPLOAD + "Product/Image/" + imageFile.getOriginalFilename();
					File file = new File(path);
					imageFile.transferTo(file);
					
					//Luu duong dan vao bang product_image
					ProductImage productImage = new ProductImage();
					productImage.setTitle(imageFile.getOriginalFilename());
					productImage.setPath("Product/Image/" + imageFile.getOriginalFilename());
					productImage.setStatus(Boolean.TRUE);
					productImage.setCreateDate(new Date());
					
					//Luudyuong dan anh sang bang product_image
					product.addRelationalProductImage(productImage);
				}
			}
		}
		return super.saveOrUpdate(product);
	}
	
//	--------------------Delete product -----------------------------------
	
	@Autowired
	private ProductImageService productImageService;
	
	
	@Transactional
	public void deleteProduct(Product product) {
		//Lay danh sach anh cua product trong tbl_product_image
		String sql = "SELECT * FROM tbl_product_image WHERE product_id = " + product.getId();
		List<ProductImage> productImages = productImageService.executeNativeSql(sql);
		
		//Xoa lan luot cac anh cua product trong Product_Image vaf xoa lan luot cac duong dan anh trong tbl_product_image
		for(ProductImage productImage : productImages) {
			
			//Xoa file trong thu muc product image(truoc)
			String path = FOLDER_UPLOAD + productImage.getPath();
			File file = new File(path);
			file.delete();
			
			//Xoa ban ghi thong tin anh trong tbl_product_image
			//product.removeRelationalProductImage(productImage);
		}
		
		//Xoa file avatar trong thu muc Product/Avatar
		String path = FOLDER_UPLOAD + product.getAvatar();
		File file = new File(path);
		file.delete();
		
		//Xoa product trong db
		super.delete(product);
	}
//------------------------------------Search product---------------------------------------------	
	
	public List<Product> searchProduct(SearchModel productSearch) {
		//Tao cau lenhj sql
		String sql = "SELECT * FROM tbl_product p WHERE 1 = 1";
		
		//Tim kiem tvoi tieu chi status
		if(productSearch.getStatus() != 2) {  //co chon active/inavtive
			sql += " AND p.status=" + productSearch.getStatus();
		}
		
		//Tim kiem voi tieu chi category
		if(productSearch.getCategoryId() != 0) {  
			sql += " AND p.category_id=" + productSearch.getCategoryId();
		}
		
		//Tim kiem voi tieu chi keyword
		if(!StringUtils.isEmpty(productSearch.getKeyword())) {
			
			String keyword = productSearch.getKeyword().toLowerCase();
			
			sql += " AND (LOWER(p.name) like '%" + keyword + "%'" +
					" OR LOWER(p.short_description) like '%" + keyword + "%'" +
					" OR LOWER(p.seo) like '%" + keyword + "%')";
		}
		
		//tim kiem voi ngay thang
		if(!StringUtils.isEmpty(productSearch.getBeginDate()) && 
				!StringUtils.isEmpty(productSearch.getEndDate()) ){
			String beginDate = productSearch.getBeginDate();
			String endDate = productSearch.getEndDate();
			
			sql += " AND p.create_date BETWEEN '" + beginDate + "' AND '" + endDate + "'";
		}
		
		// tim kiem voi khoảng năm
		if (!StringUtils.isEmpty(productSearch.getBeginYear()) && !StringUtils.isEmpty(productSearch.getEndYear())) {
			String beginYear = productSearch.getBeginYear();
			String endYear = productSearch.getEndYear();

			sql += " AND year(p.create_date) BETWEEN '" + beginYear + "' AND '" + endYear + "'";
		}
			
		// tim kiem voi khoảng giá
		if (!StringUtils.isEmpty(productSearch.getBeginPrice()) && !StringUtils.isEmpty(productSearch.getEndPrice())) {
			String beginPrice = productSearch.getBeginPrice();
			String endPrice = productSearch.getEndPrice();

			sql += " AND p.sale_price BETWEEN '" + beginPrice + "' AND '" + endPrice + "'";
		}
		
		return super.executeNativeSql(sql);
	}
	
	//------------------------------------Search product in home---------------------------------------------	
	
		public List<Product> searchProductInHome(SearchModel productSearch) {
			//Tao cau lenhj sql
			String sql = "SELECT * FROM tbl_product p WHERE 1 = 1";
			
			//Tim kiem tvoi tieu chi status
			if(productSearch.getStatus() != 2) {  //co chon active/inavtive
				sql += " AND p.status=" + productSearch.getStatus();
			}
			
			//Tim kiem voi tieu chi category
			if(productSearch.getCategoryId() != 0) {  
				sql += " AND p.category_id=" + productSearch.getCategoryId();
			}
			
			//Tim kiem voi tieu chi keyword
			if(!StringUtils.isEmpty(productSearch.getKeyword())) {
				
				String keyword = productSearch.getKeyword().toLowerCase();
				
				sql += " AND (LOWER(p.name) like '%" + keyword + "%'" +
						" OR LOWER(p.short_description) like '%" + keyword + "%'" +
						" OR LOWER(p.seo) like '%" + keyword + "%')";
			}
			
			//tim kiem voi ngay thang
			if(!StringUtils.isEmpty(productSearch.getBeginDate()) && 
					!StringUtils.isEmpty(productSearch.getEndDate()) ){
				String beginDate = productSearch.getBeginDate();
				String endDate = productSearch.getEndDate();
				
				sql += " AND p.create_date BETWEEN '" + beginDate + "' AND '" + endDate + "'";
			}
			
			// tim kiem voi khoảng năm
			if (!StringUtils.isEmpty(productSearch.getBeginYear()) && !StringUtils.isEmpty(productSearch.getEndYear())) {
				String beginYear = productSearch.getBeginYear();
				String endYear = productSearch.getEndYear();

				sql += " AND year(p.create_date) BETWEEN '" + beginYear + "' AND '" + endYear + "'";
			}
			
			
			return super.executeNativeSql(sql);
		}
	
	//Tìm bằng tên hãng
	public List<Product> findByCategory(SearchModel searchModel) {
		// Tạo câu lệnh SQL
		String sql = "SELECT * FROM tbl_product p WHERE 1=1 AND p.status=1";

		if (searchModel.getCategoryId() != 0) {
			sql += " AND p.category_id = " + searchModel.getCategoryId();
		}

		// Thực hiện truy vấn và trả về danh sách sản phẩm tương ứng
		return super.executeNativeSql(sql);
	}
	
	
	//Tìm bằng keyword
		public List<Product> findByKeyword(SearchModel searchModel) {
			// Tạo câu lệnh SQL
			String sql = "SELECT * FROM tbl_product p WHERE 1=1 AND p.status=1";

			if (searchModel.getCategoryId() != 0) {
				sql += " AND p.keyword = " + searchModel.getKeyword();
			}

			// Thực hiện truy vấn và trả về danh sách sản phẩm tương ứng
			return super.executeNativeSql(sql);
		}
		
	//Timg bằng giá
	public List<Product> findByPriceRange(String[] priceRanges) {
		// Tạo câu lệnh SQL
		StringBuilder sql = new StringBuilder("SELECT * FROM tbl_product p WHERE 1=1 AND p.status=1");

		// Tạo danh sách các giá trị mức giá được chọn
		List<String> selectedPriceRanges = new ArrayList<>();
		for (String priceRange : priceRanges) {
			selectedPriceRanges.add(priceRange);
		}

		// Thêm các điều kiện vào câu lệnh SQL dựa trên các mức giá được chọn
		for (String selectedPriceRange : selectedPriceRanges) {
			String[] priceRangeValues = selectedPriceRange.split("-");
			if (priceRangeValues.length == 2) {
				// Nếu mức giá là khoảng, thêm điều kiện BETWEEN vào câu lệnh SQL
				sql.append(" AND p.sale_price BETWEEN ").append(priceRangeValues[0]).append(" AND ")
						.append(priceRangeValues[1]);
			} else if (priceRangeValues.length == 1) {
				// Nếu mức giá là một giá trị cụ thể, thêm điều kiện = vào câu lệnh SQL
				sql.append(" AND p.sale_price >= ").append(priceRangeValues[0]);
			}
		}

		// Thực hiện truy vấn và trả về danh sách sản phẩm tương ứng
		return super.executeNativeSql(sql.toString());
	}
	
	//Tìm bằng tên năm ra mắt
		public List<Product> findByReleaseYear(SearchModel productSearch) {
			// Tạo câu lệnh SQL
			String sql = "SELECT * FROM tbl_product p WHERE 1=1 AND p.status=1";

			if (!StringUtils.isEmpty(productSearch.getBeginDate()) && 
					!StringUtils.isEmpty(productSearch.getEndDate()) ) {
				String beginDate = productSearch.getBeginDate();
				String endDate = productSearch.getEndDate();
				
				sql += " AND p.create_date BETWEEN '" + beginDate + "' AND '" + endDate + "'";
			}

			// Thực hiện truy vấn và trả về danh sách sản phẩm tương ứng
			return super.executeNativeSql(sql);
		}
		
}
