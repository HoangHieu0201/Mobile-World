package vn.devpro.TestAdmin.controller.backend;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.devpro.TestAdmin.controller.BaseController;
import vn.devpro.TestAdmin.model.Role;
import vn.devpro.TestAdmin.model.User;
import vn.devpro.TestAdmin.service.CategoryService;
import vn.devpro.TestAdmin.service.ProductService;
import vn.devpro.TestAdmin.service.RoleService;
import vn.devpro.TestAdmin.service.UserService;


@Controller
@RequestMapping("/admin/user/")
public class UserController extends BaseController{
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(final Model model) {
		
		//List<User> users = userService.findAll();
		List<User> users = userService.findAllActive();
		model.addAttribute("users", users);
		
		return "backend/user-list";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(final Model model) {
		
		List<Role> roles = roleService.findAll();
		model.addAttribute("roles", roles);
		
		User user = new User();
		user.setCreateDate(new Date());
		model.addAttribute("user", user);
		
		return "backend/user-add";
	}
	
	//Save new product
		@RequestMapping(value = "add-save", method = RequestMethod.POST)
		public String add(final Model model,
				@ModelAttribute("user") User user,
				@RequestParam("avatarFile") MultipartFile avatarFile) throws IOException {
			
			user.setPassword(new BCryptPasswordEncoder(4).encode(user.getPassword()));
			//Lay danhs ach product tu tbl_product trong db
			
			userService.saveAddUser(user, avatarFile);
			//Set role cho user moi, mac dinh role la GUEST
			//+ Lay role co name la "GUEST" trong db
			Role role = roleService.getRoleByName("GUEST");
			user.addRelationalUserRole(role);
			userService.saveOrUpdate(user);
			return "redirect:/admin/user/list";
		}
		
		
		@RequestMapping(value = "edit/{userId}", method = RequestMethod.GET)
		public String edit(final Model model,
				@PathVariable("userId") int userId) {
			
			List<Role> roles = roleService.findAll();
			model.addAttribute("roles", roles);
			
			//Lay user trong db bang id
			User user = userService.getById(userId);
			user.setUpdateDate(new Date());
			
			model.addAttribute("user", user);
			
			List<User> users = userService.findAllActive();
			model.addAttribute("users", users);
			
			return "backend/user-edit";
		}
		
		
		@RequestMapping(value = "edit-save", method = RequestMethod.POST)
		public String editSave(final Model model,
				@ModelAttribute("user") User user,
				@RequestParam("avatarFile") MultipartFile avatarFile) throws IOException  {  
			
			user.setPassword(new BCryptPasswordEncoder(4).encode(user.getPassword()));
			
			userService.saveEditUser(user, avatarFile); //Luu du lieu
			
			return "redirect:/admin/user/list";
		}
		
		@RequestMapping(value = "delete/{userId}", method = RequestMethod.GET)
		public String delete(final Model model,
				@PathVariable("userId") int userId) {
			
			//Lay product trong db bang id
			User user = userService.getById(userId);
			user.setStatus(false);
			userService.inactiveUser(user);
			return "redirect:/admin/user/list";
		}
}

