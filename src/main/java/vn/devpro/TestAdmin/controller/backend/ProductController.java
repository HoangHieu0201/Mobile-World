package vn.devpro.TestAdmin.controller.backend;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.devpro.TestAdmin.controller.BaseController;
import vn.devpro.TestAdmin.model.Category;
import vn.devpro.TestAdmin.model.Product;
import vn.devpro.TestAdmin.model.User;
import vn.devpro.TestAdmin.service.CategoryService;
import vn.devpro.TestAdmin.service.ProductService;
import vn.devpro.TestAdmin.service.UserService;
import vn.devpro.TestAdmin.dto.FinalConstant;
import vn.devpro.TestAdmin.dto.SearchModel;

@Controller
@RequestMapping("/admin/product/")
public class ProductController extends BaseController implements FinalConstant{

	@Autowired
	private ProductService productService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CategoryService categoryService;
	
	
//	@RequestMapping(value = "list", method = RequestMethod.GET)
//	public String list(final Model model) {
//		
//		List<Product> products = productService.findAll();
//		//List<Product> products = productService.findAllActive();
//		model.addAttribute("products", products);
//		
//		return "backend/product-list";
//	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)	
	public String list(final Model model,
			final HttpServletRequest request) {
		
		// Tìm theo status
		SearchModel productSearch = new SearchModel();
		productSearch.setStatus(2); // All
		String status = request.getParameter("status");
		if(!StringUtils.isEmpty(status)) { // Co chon status
			productSearch.setStatus(Integer.parseInt(status));
		}
		
		//Tim theo category
		productSearch.setCategoryId(0); //ALL
		String categoryId = request.getParameter("categoryId");
		if(!StringUtils.isEmpty(categoryId)) { // Co chon category
			productSearch.setCategoryId(Integer.parseInt(categoryId));
		}
		
		//Tim theo keyword
		productSearch.setKeyword(null);
		String keyword = request.getParameter("keyword");
		if(!StringUtils.isEmpty(keyword)) {
			productSearch.setKeyword(keyword);
		}
		
		// Ktra tieu chi tim kkiem tu ngay den ngay
		String beginDate = null;
		String endDate = null;
		if (!StringUtils.isEmpty(request.getParameter("beginDate"))
				&& !StringUtils.isEmpty(request.getParameter("endDate"))) {
			beginDate = request.getParameter("beginDate");
			endDate = request.getParameter("endDate");
		}
		productSearch.setBeginDate(beginDate);
		productSearch.setEndDate(endDate);

		// Bat dau phan trang
		if (!StringUtils.isEmpty(request.getParameter("currentPage"))) {
			productSearch.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
		} else {
			productSearch.setCurrentPage(1);
		}

		List<Product> allProducts = productService.searchProduct(productSearch);

		List<Product> products = new ArrayList<Product>();

		// Tong so trang theo tim kiem
		int totalPages = allProducts.size() / SIZE_OF_PAGE;
		if (allProducts.size() % SIZE_OF_PAGE > 0) {
			totalPages++;
		}

		// Neu tong so trang < trang hien tai (Lại bấm tìm kiếm)
		if (totalPages < productSearch.getCurrentPage()) {
			productSearch.setCurrentPage(1);
		}

		// Lay sanh sach sp can hien thi trong 1 trang
		int firstIndex = (productSearch.getCurrentPage() - 1) * SIZE_OF_PAGE; // Vi tri dau 1 trang
		int index = firstIndex, count = 0;
		while (index < allProducts.size() && count < SIZE_OF_PAGE) {
			products.add(allProducts.get(index));
			index++;
			count++;
		}

		// Phan trang
		productSearch.setSizeOfPage(SIZE_OF_PAGE); // so ban ghi tren mot trang
		productSearch.setTotalItems(allProducts.size()); // tong so san pham tim kiem

		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);

//				List<Product> products = productService.searchProduct(productSearch);
		model.addAttribute("products", products);
		model.addAttribute("productSearch", productSearch);

		return "backend/product-list";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(final Model model) {
		
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		
		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		
		Product product = new Product();
		product.setCreateDate(new Date());
		
		model.addAttribute("product", product);
		
		return "backend/product-add";
	}
	
	//Save new product
	@RequestMapping(value = "add-save", method = RequestMethod.POST)
	public String add(final Model model,
			@ModelAttribute("product") Product product,
			@RequestParam("avatarFile") MultipartFile avatarFile,
			@RequestParam("imageFiles") MultipartFile[] imageFiles
			) throws IOException {
		
		//Lay danhs sach product tu tbl_product trong db
		
		productService.saveAddProduct(product, avatarFile, imageFiles);
		
		return "redirect:/admin/product/list";
	}
	
	
	@RequestMapping(value = "edit/{productId}", method = RequestMethod.GET)
	public String edit(final Model model,
			@PathVariable("productId") int productId) {
		
		List<User> users = userService.findAllActive();
		model.addAttribute("users", users);
		
		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		
		//Lay product trong db bang id
		Product product = productService.getById(productId);
		product.setUpdateDate(new Date());
		
		model.addAttribute("product", product);
		
		return "backend/product-edit";
	}
	
	
	@RequestMapping(value = "edit-save", method = RequestMethod.POST)
	public String editSave(final Model model,
			@ModelAttribute("product") Product product, //Lay du lieu tu form gui sang
			@RequestParam("avatarFile") MultipartFile avatarFile,
			@RequestParam("imageFiles") MultipartFile[] imageFiles) throws IOException  {  
		
		productService.saveEditProduct(product, avatarFile, imageFiles); //Luu du lieu
		
		return "redirect:/admin/product/list";
	}
	
//	@RequestMapping(value = "delete/{productId}", method = RequestMethod.GET)
//	public String delete(final Model model,
//			@PathVariable("productId") int productId) {
//		
//		//Lay product trong db bang id
//		Product product = productService.getById(productId);
//		productService.deleteProduct(product);
//		return "redirect:/admin/product/list";
//	}
	
	@RequestMapping(value = "delete/{productId}", method = RequestMethod.GET)
	public String delete(final Model model,
			@PathVariable("productId") int productId) {
		
		//Lay product trong db bang id
		Product product = productService.getById(productId);
		product.setStatus(false);
		productService.inactiveProduct(product);
		return "redirect:/admin/product/list";
	}
}
