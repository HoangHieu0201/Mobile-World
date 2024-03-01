package vn.devpro.TestAdmin.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.TestAdmin.model.Role;
import vn.devpro.TestAdmin.model.User;
import vn.devpro.TestAdmin.service.RoleService;
import vn.devpro.TestAdmin.service.UserService;

@Controller
public class LoginController extends BaseController{

	@Autowired
	private RoleService roleService;
	
	@Autowired
	private UserService userService;
	
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login() throws IOException{
		return "login";
	}
	
	@RequestMapping(value="/signup", method = RequestMethod.GET)
	public String signAccount() throws IOException{
		return "signup";
	}
	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String register(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		//Ktra xem 2 password nhâp giống nhau chưa chua
		if(request.getParameter("password").equals(request.getParameter("retypepassword"))) {
			User user = new User();
			user.setUsername(request.getParameter("username"));
			user.setName(request.getParameter("name"));
			user.setPassword(new BCryptPasswordEncoder(4).encode(request.getParameter("password")));
			user.setEmail(request.getParameter("email"));
			user.setMobile(request.getParameter("mobile"));
			user.setAddress(request.getParameter("address"));

			//Set role cho user moi, mac dinh role la GUEST
			//+ Lay role co name la "GUEST" trong db
			Role role = roleService.getRoleByName("GUEST");
			user.addRelationalUserRole(role);
			userService.saveOrUpdate(user);
			return "redirect:/login";
		}
		else {
			String errorMessage = "*Password không đồng bộ !";
			String username = request.getParameter("username");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String retypepassword = request.getParameter("retypepassword");
			String mobile = request.getParameter("mobile");
			String address = request.getParameter("address");
			
			// Thêm các biến cần gửi sang trang view vào đối tượng Model
		    model.addAttribute("errorMessage", errorMessage);
		    model.addAttribute("username", username);
		    model.addAttribute("name", name);
		    model.addAttribute("email", email);
		    model.addAttribute("mobile", mobile);
		    model.addAttribute("address", address);
		    
			return "signup";
		}
		
	}
}
