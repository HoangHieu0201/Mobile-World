package vn.devpro.TestAdmin.controller.backend;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.TestAdmin.controller.BaseController;
import vn.devpro.TestAdmin.model.Category;
import vn.devpro.TestAdmin.model.User;
import vn.devpro.TestAdmin.service.CategoryService;
import vn.devpro.TestAdmin.service.UserService;

@Controller
@RequestMapping("/admin/category/")
public class CategoryController extends BaseController{

	@Autowired
	private CategoryService categoryService; 
	
	@Autowired
	private UserService userService; 
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(final Model model) {     //doi tương Model de truyen du lieu tu controller sang view 
		
		List<Category> categories = categoryService.findAll();
		//List<Category> categories = categoryService.findAllActive();
		model.addAttribute("categories", categories);
		
		return "backend/category-list";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(final Model model) {
		
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		
		Category category = new Category();
		category.setCreateDate(new Date());
		
		model.addAttribute("category", category);
		
		return "backend/category-add";
	}
	
	@RequestMapping(value = "add-save", method = RequestMethod.POST)
	public String addSave(final Model model,
			@ModelAttribute("category") Category category) {  //Lay du lieu tu form gui sang
		
		categoryService.saveOrUpdate(category); //Luu du lieu
		
		return "redirect:/admin/category/add";
	}
	
	@RequestMapping(value = "edit/{categoryId}", method = RequestMethod.GET)
	public String edit(final Model model,
			@PathVariable("categoryId") int categoryId) {
		
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		
		//Lay category trong db bang id
		Category category = categoryService.getById(categoryId);
		
		model.addAttribute("category", category);
		
		return "backend/category-edit";
	}
	
	
	@RequestMapping(value = "edit-save", method = RequestMethod.POST)
	public String editSave(final Model model,
			@ModelAttribute("category") Category category) {  //Lay du lieu tu form gui sang
		
		categoryService.saveOrUpdate(category); //Luu du lieu
		
		return "redirect:/admin/category/list";
	}
	
//	@RequestMapping(value = "delete/{categoryId}", method = RequestMethod.GET)
//	public String delete(final Model model,
//			@PathVariable("categoryId") int categoryId) {
//		
//		categoryService.deleteCategoryId(categoryId); //Xoá du lieu
//		
//		return "redirect:/admin/category/list";
//	}
	
	@RequestMapping(value = "delete/{categoryId}", method = RequestMethod.GET)
	public String delete(final Model model,
			@PathVariable("categoryId") int categoryId) {
		
		//Lay category trong db bang id
		Category category = categoryService.getById(categoryId);
		category.setStatus(false);
		categoryService.inactiveCategory(category);
		return "redirect:/admin/category/list";
	}

}
