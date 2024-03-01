package vn.devpro.TestAdmin.controller.frontend;

import java.io.IOException;
import java.math.BigInteger;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.TestAdmin.dto.FinalConstant;
import vn.devpro.TestAdmin.controller.BaseController;
import vn.devpro.TestAdmin.dto.Cart;
import vn.devpro.TestAdmin.dto.ProductCart;
import vn.devpro.TestAdmin.model.Product;
import vn.devpro.TestAdmin.service.ProductService;
import vn.devpro.TestAdmin.service.SaleOrderService;
import vn.devpro.TestAdmin.dto.Customer;
import vn.devpro.TestAdmin.model.SaleOrder;
import vn.devpro.TestAdmin.model.SaleOrderProduct;
import vn.devpro.TestAdmin.model.User;

@Controller
public class CartController extends BaseController implements FinalConstant{

	@Autowired
	private ProductService productService;
	
	@Autowired
	private SaleOrderService saleOrderService;
	
	//Them mot san pham vao gio hang
	@RequestMapping(value = "/add-to-cart", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addToCart(final Model model,
			final HttpServletRequest request,
			@RequestBody ProductCart addProduct) throws IOException{
		
		HttpSession session = request.getSession();
		Cart cart = null;
		
		//Lay gio hang trong sesstion
		// + Kiem tra gio hang da dc tao trong session chua?
		if(session.getAttribute("cart") != null) { //da co gio hang
			cart = (Cart)session.getAttribute("cart"); //Lay gio hang
		}
		else { //Chua tao gio hang
			 cart = new Cart();
			 session.setAttribute("cart", cart);
		}
		
		//Lay san pham trong db
		Product dbProduct= productService.getById(addProduct.getProductId());
		
		//Kiem tra san pham dat mua co trong gio hang chua
		int index = cart.findProductById(dbProduct.getId());
		if(index != -1) //San pham da co trong gio hang ==> tang so luong
		{
			cart.getProductCarts().get(index).setQuantity(
					cart.getProductCarts().get(index).getQuantity().add(addProduct.getQuantity()));
		}
		else //Chua co trong gio hang
		{
			addProduct.setProductName(dbProduct.getName());
			addProduct.setAvatar(dbProduct.getAvatar());
			addProduct.setSalePrice(dbProduct.getSalePrice());
			
			cart.getProductCarts().add(addProduct);  //Them san pham moi vao gio hang
		}
		
		//Thiet lap lai gio hang trong session
		session.setAttribute("cart", cart);
		
		//Tra ve du lieu cho view 
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("totalCartProducts", cart.totalCartProduct());
		jsonResult.put("message", "Đã thêm sản phẩm " + addProduct.getProductName() + " vào giỏ hàng");
		
		return ResponseEntity.ok(jsonResult);
	}
	
	
	//Hien thi gio hnag
	@RequestMapping(value = "/cart-view", method = RequestMethod.GET)
	public String cartView(final Model model,
							final HttpServletRequest request) throws IOException{
		
		HttpSession session = request.getSession();
		if(session.getAttribute("cart") != null) {
			Cart cart = (Cart) session.getAttribute("cart");
			model.addAttribute("totalCartPrice", cart.totalCartPrice());
			
			String message = "Có tổng cộng " + cart.totalCartProduct() + "sản phẩm trong giỏ hàng";
			model.addAttribute("message", message);
		}
		else {
			String errorMessage = "Không có sản phẩm nào trong giỏ hàng";
			model.addAttribute("errorMessage", errorMessage);
		}
		return "frontend/cart-view";
	}
	
	//Them / bớt sản phẩm ttrong giỏ hàng
		@RequestMapping(value = "/update-product-quantity", method = RequestMethod.POST)
		public ResponseEntity<Map<String, Object>> updateQuantity(final HttpServletRequest request,
				@RequestBody ProductCart productCart) throws IOException{
			
			Map<String, Object> jsonResult = new HashMap<String, Object>();
			
			HttpSession session = request.getSession();
			//Lay gio hang trong sesstion
			// + Kiem tra gio hang da dc tao trong session chua?
			if(session.getAttribute("cart") != null) { //da co gio hang
				Cart cart = (Cart)session.getAttribute("cart"); //Lay gio hang
				//Cap nhat so luong
				int index = cart.findProductById(productCart.getProductId());
				BigInteger oldQuantity = cart.getProductCarts().get(index).getQuantity();
				BigInteger newQuantity = oldQuantity.add(productCart.getQuantity()); //+1/-1
				if(newQuantity.intValue() < 1) {
					newQuantity = BigInteger.ONE;
				}
				cart.getProductCarts().get(index).setQuantity(newQuantity);
				jsonResult.put("newQuantity", newQuantity);
			}
			jsonResult.put("productId", productCart.getProductId());
			return ResponseEntity.ok(jsonResult);	
		}
		
		
		//Đặt hàng
				@RequestMapping(value = "/place-order", method = RequestMethod.POST)
				public ResponseEntity<Map<String, Object>> placeOrder(final HttpServletRequest request,
						@RequestBody Customer customer ) throws IOException{
					
					Map<String, Object> jsonResult = new HashMap<String, Object>();
					
					//Kiem tra thong tin customer bắt buộc
					if(StringUtils.isEmpty(customer.getTxtName())) {
						jsonResult.put("message", "Bạn chưa nhập họ tên");
					}
					else if(StringUtils.isEmpty(customer.getTxtMobile())) {
						jsonResult.put("message", "Bạn chưa nhập số điện thoại");
					}
					else {
						HttpSession session = request.getSession();
						if(session.getAttribute("cart") == null) {
							jsonResult.put("message", "Bạn chưa có giỏ hàng");
						}
						else {
							Cart cart = (Cart)session.getAttribute("cart"); //Lay gio hang
							//Luu cac sp trong gio hnag vao tbl_sale_order_product
							SaleOrder saleOrder = new SaleOrder();
							for(ProductCart productCart : cart.getProductCarts()) {
								SaleOrderProduct saleOrderProduct = new SaleOrderProduct();
								//Lay product trong db
								Product dbProduct = productService.getById(productCart.getProductId());
								saleOrderProduct.setProduct(dbProduct);
								saleOrderProduct.setQuantity(productCart.getQuantity().intValue());
								
								saleOrder.addRelationalSaleOrderProduct(saleOrderProduct);
							}
							//Luu don hang vao tbl_sale_order
							Calendar cal = Calendar.getInstance();
							String code = cal.get(Calendar.YEAR) + cal.get(Calendar.MONTH) + cal.get(Calendar.DAY_OF_MONTH)
																	+ customer.getTxtMobile();
							saleOrder.setCode(code);
							User user = new User();
							user.setId(1);
							saleOrder.setUser(user);
							
							saleOrder.setCustomerName(customer.getTxtName());
							saleOrder.setCustomerMobile(customer.getTxtMobile());
							saleOrder.setCustomerEmail(customer.getTxtEmail());
							saleOrder.setCustomerAddress(customer.getTxtAddress());
							saleOrder.setTotal(cart.totalCartPrice());
							saleOrder.setCreateDate(new Date());
							
							saleOrderService.saveOrder(saleOrder);
							
							jsonResult.put("message", "Bạn đã đặt hàng thành công, cảm ơn bạn !");
							
							//Xoa gio hang sau khi da dat hàng
							cart = new Cart();
							session.setAttribute("cart", cart);
						}
						
					}
					
					return ResponseEntity.ok(jsonResult);
					
				}
}
