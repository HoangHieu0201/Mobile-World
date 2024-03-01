package vn.devpro.TestAdmin.controller.backend;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.TestAdmin.controller.BaseController;
import vn.devpro.TestAdmin.model.SaleOrder;
import vn.devpro.TestAdmin.model.SaleOrderProduct;
import vn.devpro.TestAdmin.model.User;
import vn.devpro.TestAdmin.service.SaleOrderProductService;
import vn.devpro.TestAdmin.service.SaleOrderService;
import vn.devpro.TestAdmin.service.UserService;

@Controller
@RequestMapping("/admin/")
public class HomeAdminController extends BaseController {

	@Autowired
	private SaleOrderService saleOrderService;

	@Autowired
	private SaleOrderProductService saleOrderProductService;
	
	@Autowired
	private UserService userService;

	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String home(final Model model) {
		// Tổng doanh thu
			List<SaleOrder> saleOrders = saleOrderService.findAll();
	
			// Tính tổng doanh số bán hàng
			BigDecimal totalSales = BigDecimal.ZERO;
	
			// Duyệt qua danh sách đơn hàng và cộng dồn giá trị total của mỗi đơn
			for (SaleOrder saleOrder : saleOrders) {
				BigDecimal orderTotal;
	
				if (saleOrder.getTotal() == null) {
					orderTotal = BigDecimal.ZERO;
				} else {
					orderTotal = saleOrder.getTotal();
				}
	
				totalSales = totalSales.add(orderTotal);
			}
			model.addAttribute("totalSales", totalSales);

		//Tổng sôs đơn hàng
			int totalOrders = saleOrders.size();
			model.addAttribute("totalOrders", totalOrders);
			
		// Tổng sản phẩm đã bán
			int totalSoldProducts = 0;
	
			for (int i = 0; i < saleOrders.size(); i++) {
				// Lấy các sp trong từng đơn hàng
				List<SaleOrderProduct> saleOrderProducts = saleOrderProductService
						.findAllProductInOrder(saleOrders.get(i).getId());
				// Tổng tất cả các sp
				for (int j = 0; j < saleOrderProducts.size(); j++) {
					totalSoldProducts += saleOrderProducts.get(j).getQuantity();
				}
			}
			model.addAttribute("totalSoldProducts", totalSoldProducts);

		//	Tổng số user
			List<User> users = userService.findAllActive();
			int totalUsers = users.size();
			model.addAttribute("totalUsers", totalUsers);
			
		return "backend/home";
	}

}
