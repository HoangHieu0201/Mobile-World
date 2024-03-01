package vn.devpro.TestAdmin.controller.backend;

import java.util.ArrayList;
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

import vn.devpro.TestAdmin.controller.BaseController;
import vn.devpro.TestAdmin.dto.FinalConstant;
import vn.devpro.TestAdmin.dto.SearchModel;
import vn.devpro.TestAdmin.model.Contact;
import vn.devpro.TestAdmin.service.ContactService;

@Controller
@RequestMapping("/admin/contact/")
public class AdminContactController extends BaseController implements FinalConstant{

	@Autowired
	private ContactService contactService;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)	
	public String list(final Model model,
			final HttpServletRequest request) {
		
		// Tìm theo status
		SearchModel searchModel = new SearchModel();
		searchModel.setStatus(2); // All
		String status = request.getParameter("status");
		if(!StringUtils.isEmpty(status)) { // Co chon status
			searchModel.setStatus(Integer.parseInt(status));
		}
		
		//Tim theo keyword
		searchModel.setKeyword(null);
		String keyword = request.getParameter("keyword");
		if(!StringUtils.isEmpty(keyword)) {
			searchModel.setKeyword(keyword);
		}
		
		//Ktra tieu chi tim kkiem tu ngay den ngay
		String beginDate = null;
		String endDate = null;
		if(!StringUtils.isEmpty(request.getParameter("beginDate")) && 
				!StringUtils.isEmpty(request.getParameter("endDate"))) {
			beginDate = request.getParameter("beginDate");
			endDate = request.getParameter("endDate");
		}
		searchModel.setBeginDate(beginDate);
		searchModel.setEndDate(endDate);
		
		//Bat dau phan trang
		if(!StringUtils.isEmpty(request.getParameter("currentPage"))) {
			searchModel.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
		}
		else {
			searchModel.setCurrentPage(1);
		}
		
		List<Contact> allContacts = contactService.searchContact(searchModel);
		
		List<Contact> contacts = new ArrayList<Contact>();
		
		//Tong so trang theo tim kiem
		int totalPages = allContacts.size() / SIZE_OF_PAGE;
		if(allContacts.size() % SIZE_OF_PAGE > 0) {
			totalPages ++;
		}
		
		//Neu tong so trang < trang hien tai (Lại bấm tìm kiếm)
		if(totalPages < searchModel.getCurrentPage()) {
			searchModel.setCurrentPage(1);
		}
		
		//Lay sanh sach sp can hien thi trong 1 trang
		int firstIndex = (searchModel.getCurrentPage() - 1) * SIZE_OF_PAGE; //Vi tri dau 1 trang
		int index = firstIndex, count = 0;
		while(index < allContacts.size() && count < SIZE_OF_PAGE) {
			contacts.add(allContacts.get(index));
			index++;
			count++;
		}
		

		model.addAttribute("searchModel", searchModel);
		
		//Phan trang
		searchModel.setSizeOfPage(SIZE_OF_PAGE); //so ban ghi tren mot trang
		searchModel.setTotalItems(allContacts.size()); //tong so san pham tim kiem
			
		model.addAttribute("contacts", contacts);
		
		int totalContacts = allContacts.size();
		model.addAttribute("totalContacts", totalContacts);
		
		return "backend/contact-list";
	}
	
	@RequestMapping(value = "detail/{contactId}", method = RequestMethod.GET)
	public String detail(final Model model,
			@PathVariable("contactId") int contactId) {
		
		Contact contact = contactService.getById(contactId);
		model.addAttribute("contact", contact);
		
		return "backend/contact-detail";
	}
	
	@RequestMapping(value = "edit/{contactId}", method = RequestMethod.GET)
	public String edit(final Model model,
			@PathVariable("contactId") int contactId) {
		
		//Lay contact trong db bang id
		Contact contact = contactService.getById(contactId);	
		model.addAttribute("contact", contact);
		
		return "backend/contact-edit";
	}
	
	
	@RequestMapping(value = "edit-save", method = RequestMethod.POST)
	public String editSave(final Model model,
			@ModelAttribute("contact") Contact contact) {  //Lay du lieu tu form gui sang
		
		contactService.saveOrUpdate(contact); //Luu du lieu
		
		return "redirect:/admin/contact/list";
	}

////	@RequestMapping(value = "delete/{categoryId}", method = RequestMethod.GET)
////	public String delete(final Model model,
////			@PathVariable("categoryId") int categoryId) {
////		
////		categoryService.deleteCategoryId(categoryId); //Xoá du lieu
////		
////		return "redirect:/admin/category/list";
////	}

	@RequestMapping(value = "delete/{contactId}", method = RequestMethod.GET)
	public String delete(final Model model,
			@PathVariable("contactId") int contactId) {
		
		//Lay contact trong db bang id
		Contact contact = contactService.getById(contactId);	
		contact.setStatus(false);
		contactService.inactiveContact(contact);
		return "redirect:/admin/contact/list";
	}
}
