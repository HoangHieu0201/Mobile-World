package vn.devpro.TestAdmin.controller.frontend;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.TestAdmin.controller.BaseController;

import vn.devpro.TestAdmin.dto.FinalConstant;
import vn.devpro.TestAdmin.model.Contact;
import vn.devpro.TestAdmin.service.ContactService;

@Controller
public class ContactController extends BaseController implements FinalConstant{
	
	@Autowired
	private ContactService contactService;
	
	
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	//@RequestMapping : ánh xạ 1 action đến 1 action method trong controller
	public String contact(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		return "frontend/contact/contact";
	}
	
	@RequestMapping(value = "/contact-send", method = RequestMethod.POST)
	//@RequestMapping : ánh xạ 1 action đến 1 action method trong controller
	public String contactSend(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		String message = null;
		Contact contact = new Contact();
		//Kiem tra thong tin customer bắt buộc
		if(StringUtils.isEmpty(request.getParameter("txtName"))) {
			message = "*Bạn chưa nhập họ tên";
		}
		else if(StringUtils.isEmpty(request.getParameter("txtMobile"))) {
			message = "*Bạn chưa nhập số điện thoại";
		}
		else if(StringUtils.isEmpty(request.getParameter("txtEmail"))) {
			message = "*Bạn chưa nhập email";
		}
		else {
			//Lay dữ liệu từ form
			contact.setName(request.getParameter("txtName")); //Lấy theo name của input
			contact.setMobile(request.getParameter("txtMobile")); //Lấy theo name của input
			contact.setAddress(request.getParameter("txtAddress"));
			contact.setEmail(request.getParameter("txtEmail"));
			contact.setMessage(request.getParameter("txtMessage"));
			contact.setCreateDate(new Date());
			
			contactService.saveOrUpdate(contact);
			
			message =  "*Cảm ơn bạn đã phản hồi! Chúng tôi sẽ liên hệ bạn sớm nhất có thể.";
		}
		model.addAttribute("message", message);
		return "frontend/contact/contact";
	}
	
	
	
	
//=========================================================================================================================
	
//	@RequestMapping(value = "/contact-edit", method = RequestMethod.GET)
//	//@RequestMapping : ánh xạ 1 action đến 1 action method trong controller
//	public String contactEdit(final Model model,
//			final HttpServletRequest request,
//			final HttpServletResponse response) throws IOException {
//		
//		Contact contact = new Contact("Hoang Hieu", "tubean1504@gmail.com", "0987654321", "Ha Noi","No message");
//		model.addAttribute("contact", contact);
//		return "frontend/contact/contact-edit";
//	}
//	
//	@RequestMapping(value = "/contact-edit-save", method = RequestMethod.POST)
//	public ResponseEntity<Map<String, Object>> contactEditSave(final Model model,
//			final HttpServletRequest request,
//			final HttpServletResponse response,
//			@RequestBody Contact contact
//			)	throws IOException {
//		
//		System.out.println(contact.getName());
//		//Sau khi lưu dữ liệu vào db
//		Map<String, Object> jsonResult = new HashMap<String, Object>(); //Gửi lại view
//		jsonResult.put("code", 200);
//		jsonResult.put("message", "Cảm ơn "+ contact.getName() + " đã gửi thông tin phản hồi");
//		return ResponseEntity.ok(jsonResult);
//	}
//	
//	@RequestMapping(value = "/contact-sf", method = RequestMethod.GET)
//	//@RequestMapping : ánh xạ 1 action đến 1 action method trong controller
//	public String contactSf(final Model model,
//			final HttpServletRequest request,
//			final HttpServletResponse response) throws IOException {
//		
//		model.addAttribute("contact", new Contact());
//		return "frontend/contact/contact-sf";
//	}
//	
//	@RequestMapping(value = "/contact-sf-save", method = RequestMethod.POST)
//	public String contactSfSave(final Model model,
//			final HttpServletRequest request,
//			final HttpServletResponse response,
//			@ModelAttribute("contact") Contact contact,  //get data form
//			@RequestParam("contactFile") MultipartFile contactFile
//			)	throws IOException {
//		
//		System.out.println(contact.getName());
//		System.out.println(contact.getMobile());
//		
//		//Lưu file vào thư mục và lưu đường dẫn vào database
//		//Kiểm tra xem người dùng có uploa file hay không
//		if(contactFile != null && !contactFile.getOriginalFilename().isEmpty()) {  //có upload
//			String path = FOLDER_UPLOAD + "Contacts/" + contactFile.getOriginalFilename();
//			File file = new File(path);
//			contactFile.transferTo(file);
//		}
//		
//		return "frontend/contact/contact-sf";
//	}
//	
//	@RequestMapping(value = "/contact-sf-edit", method = RequestMethod.GET)
//	//@RequestMapping : ánh xạ 1 action đến 1 action method trong controller
//	public String contactSfEdit(final Model model,
//			final HttpServletRequest request,
//			final HttpServletResponse response) throws IOException {
//		
//		Contact contact = new Contact("Hoang Hieu", "tubean1504@gmail.com", "0987654321", "Ha Noi","No message");
//		model.addAttribute("contact", contact);
//		return "frontend/contact/contact-sf-edit";
//	}
//	
//	@RequestMapping(value = "/contact-sf-edit-save", method = RequestMethod.POST)
//	public ResponseEntity<Map<String, Object>> contactSfEditSave(final Model model,
//			final HttpServletRequest request,
//			final HttpServletResponse response,
//			@RequestBody Contact contact
//			)	throws IOException {
//		
//		System.out.println(contact.getName());
//		//Sau khi lưu dữ liệu vào db
//		Map<String, Object> jsonResult = new HashMap<String, Object>(); //Gửi lại view
//		jsonResult.put("code", 200);
//		jsonResult.put("message", "Cảm ơn "+ contact.getName() + " đã gửi thông tin phản hồi");
//		return ResponseEntity.ok(jsonResult);
//	}
	
}
