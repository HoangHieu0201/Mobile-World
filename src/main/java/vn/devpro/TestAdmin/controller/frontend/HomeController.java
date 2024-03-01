package vn.devpro.TestAdmin.controller.frontend;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import vn.devpro.TestAdmin.model.Category;
import vn.devpro.TestAdmin.model.Product;
import vn.devpro.TestAdmin.model.ProductImage;
import vn.devpro.TestAdmin.service.CategoryService;
import vn.devpro.TestAdmin.service.ProductImageService;
import vn.devpro.TestAdmin.service.ProductService;
import vn.devpro.TestAdmin.controller.BaseController;
import vn.devpro.TestAdmin.dto.FinalConstant;
import vn.devpro.TestAdmin.dto.SearchModel;
import org.springframework.util.StringUtils;

@Controller
public class HomeController extends BaseController implements FinalConstant{
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductImageService productImageService;
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	//@RequestMapping : ánh xạ 1 action đến 1 action method trong controller
		public String index(final Model model,
				final HttpServletRequest request,
				final HttpServletResponse response) throws IOException {
			return "frontend/index";
		}
	
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	//@RequestMapping : ánh xạ 1 action đến 1 action method trong controller
	public String product(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		// Tìm theo status
				SearchModel productSearch = new SearchModel();
				productSearch.setStatus(1); // Active
				
				//Tim theo category
				productSearch.setCategoryId(0); //ALL
				String categoryId = request.getParameter("categoryId");
				if(!StringUtils.isEmpty(categoryId)) { // Co chon category
					productSearch.setCategoryId(Integer.parseInt(categoryId));
					List<Product> products = productService.findByCategory(productSearch);
		            model.addAttribute("products", products);
		        } else {
		            // Nếu không có cái nào được chọn, hiển thị tất cả sản phẩm
		            List<Product> products = productService.searchProduct(productSearch);
		            model.addAttribute("products", products);
		        }
				
				//Tim theo keyword
				productSearch.setKeyword(null);
				String keyword = request.getParameter("keyword");
				if(!StringUtils.isEmpty(keyword)) {
					productSearch.setKeyword(keyword);
					List<Product> products = productService.findByKeyword(productSearch);
		            model.addAttribute("products", products);
		        } else {
		            // Nếu không có keyword nào được chọn, hiển thị tất cả sản phẩm
		            List<Product> products = productService.searchProduct(productSearch);
		            model.addAttribute("products", products);
		        }
				
				// Ktra tieu chi tim kkiem tu năm den năm
				String beginYear = null;
				String endYear = null;
				if (!StringUtils.isEmpty(request.getParameter("beginYear"))
						&& !StringUtils.isEmpty(request.getParameter("endYear"))) {
					beginYear = request.getParameter("beginYear");
					endYear = request.getParameter("endYear");
					productSearch.setBeginYear(beginYear);
					productSearch.setEndYear(endYear);
					List<Product> products = productService.findByReleaseYear(productSearch);
		            model.addAttribute("products", products);
		        } else {
		            // Nếu không có mức giá nào được chọn, hiển thị tất cả sản phẩm
		            List<Product> products = productService.searchProduct(productSearch);
		            model.addAttribute("products", products);
		        }
				
//				// Ktra tieu chi tim kkiem tu giá den giá
//				String beginPrice = null;
//				String endPrice = null;
//				if (!StringUtils.isEmpty(request.getParameter("beginPrice"))
//						&& !StringUtils.isEmpty(request.getParameter("endPrice"))) {
//					beginPrice = request.getParameter("beginPrice");
//					endPrice = request.getParameter("endPrice");
//					
//					//ĐỊnh dạng tiền
//					String endPriceStr = request.getParameter("endPrice");
//					String beginPriceStr = request.getParameter("beginPrice");
//					// Loại bỏ các ký tự không phải số
//					beginPriceStr = beginPriceStr.replaceAll("[^\\d.]", "");
//					endPriceStr = endPriceStr.replaceAll("[^\\d.]", "");
//
//					// Chuyển đổi chuỗi thành số thực
//					double beginPriceFormat = Double.parseDouble(beginPriceStr);
//					double endPriceFormat = Double.parseDouble(endPriceStr);
//					
//					DecimalFormat currencyFormat = new DecimalFormat("#,###.##");
//					String formattedBeginPrice = currencyFormat.format(beginPriceFormat);
//					model.addAttribute("formattedBeginPrice", formattedBeginPrice);
//					String formattedEndPrice = currencyFormat.format(endPriceFormat);
//					model.addAttribute("formattedEndPrice", formattedEndPrice);
//				}
//				productSearch.setBeginPrice(beginPrice);
//				productSearch.setEndPrice(endPrice);
				
				 // Tìm theo mức giá
				String[] priceRanges = request.getParameterValues("priceRange");
		        if (priceRanges != null && priceRanges.length > 0) {
		            List<Product> products = productService.findByPriceRange(priceRanges);
		            model.addAttribute("products", products);
		        } else {
		            // Nếu không có mức giá nào được chọn, hiển thị tất cả sản phẩm
		            List<Product> products = productService.searchProduct(productSearch);
		            model.addAttribute("products", products);
		        }

//				// Bat dau phan trang
//				if (!StringUtils.isEmpty(request.getParameter("currentPage"))) {
//					productSearch.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
//				} else {
//					productSearch.setCurrentPage(1);
//				}
//
//				List<Product> allProducts = productService.searchProduct(productSearch);
//
//				List<Product> products = new ArrayList<Product>();
//
//				// Tong so trang theo tim kiem
//				int totalPages = allProducts.size() / SIZE_OF_PAGE;
//				if (allProducts.size() % SIZE_OF_PAGE > 0) {
//					totalPages++;
//				}
//
//				// Neu tong so trang < trang hien tai (Lại bấm tìm kiếm)
//				if (totalPages < productSearch.getCurrentPage()) {
//					productSearch.setCurrentPage(1);
//				}
//
//				// Lay sanh sach sp can hien thi trong 1 trang
//				int firstIndex = (productSearch.getCurrentPage() - 1) * SIZE_OF_PAGE; // Vi tri dau 1 trang
//				int index = firstIndex, count = 0;
//				while (index < allProducts.size() && count < SIZE_OF_PAGE) {
//					products.add(allProducts.get(index));
//					index++;
//					count++;
//				}
//
//				// Phan trang
//				productSearch.setSizeOfPage(SIZE_OF_PAGE); // so ban ghi tren mot trang
//				productSearch.setTotalItems(allProducts.size()); // tong so san pham tim kiem
//
				List<Category> categories = categoryService.findAllActive();
				model.addAttribute("categories", categories);

//				List<Product> products = productService.searchProduct(productSearch);
//				model.addAttribute("products", products);
				model.addAttribute("productSearch", productSearch);
		
		return "frontend/product";
	}
	
	
//	//ex ajax
//	@GetMapping("/product-search")
//	public @ResponseBody String searchByKeyword(HttpServletRequest request) {
//		
//		SearchModel productSearch = new SearchModel();
//		productSearch.setStatus(1); // Active
//		
//		//Tim theo keyword
//		productSearch.setKeyword(null);
//		String keyword = request.getParameter("keyword");
//		System.out.println(keyword);
//		System.out.println("---------------------"+keyword);
//		String data = null;
//		if(!StringUtils.isEmpty(keyword)) {
//			productSearch.setKeyword(keyword);
//			List<Product> products = productService.findByKeyword(productSearch);
//			Gson gson = new Gson();
//			data = gson.toJson(products);
//			System.out.println("List after filter : "+data);
//			return "list size "+products.size();
//        } else {
//            // Nếu không có keyword nào được chọn, hiển thị tất cả sản phẩm
//            List<Product> products = productService.searchProduct(productSearch);
//        }
//		return "empty data";
//	}
	

	@RequestMapping(value = "/product-detail/{productId}", method = RequestMethod.GET)
	public String detail(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("productId") int productId) {
		
		Product product = productService.getById(productId);
		model.addAttribute("product", product);
		
		//Lay toan bo anh của sp cần tìm
		List<ProductImage> productImages = productImageService.getProductImagesByProductId(productId);
		model.addAttribute("productImages", productImages);
		
		return "frontend/product-detail";
	}
	
//	@RequestMapping(value = "/product/{categoryId}", method = RequestMethod.GET)
//	public String getProductsByCategory(@PathVariable("categoryId") int categoryId, final Model model)
//	        throws IOException {
//		
//	    SearchModel searchModel = new SearchModel();
//	    searchModel.setCategoryId(categoryId); // Thiết lập categoryId từ tham số URL
//	    
//	    List<Category> categories = categoryService.findAllActive();
//	    model.addAttribute("categories", categories);
//
//	    // Gọi service để lấy danh sách sản phẩm dựa trên category
//	    List<Product> products = productService.findByCategory(searchModel);
//	    
//	    // Thêm danh sách sản phẩm vào model để truyền tới view
//	    model.addAttribute("searchModel", searchModel);
//	    model.addAttribute("products", products);
//
//	    // Trả về tên của view để hiển thị danh sách sản phẩm
//	    return "frontend/product";
//	}
}
