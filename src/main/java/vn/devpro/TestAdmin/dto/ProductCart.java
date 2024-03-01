package vn.devpro.TestAdmin.dto;

import java.math.BigDecimal;
import java.math.BigInteger;

public class ProductCart {

	private int productId;
	private BigInteger quantity;
	private String productName;
	private String avatar;
	private BigDecimal salePrice;
	
	public BigDecimal totalPrice() {
		if(this.salePrice == null || this.quantity == null) {
			return BigDecimal.ZERO;
		}
		return this.salePrice.multiply(new BigDecimal(this.quantity));
	}

	public ProductCart() {
		super();
	}

	public ProductCart(int productId, BigInteger quantity, String productName, String avatar, BigDecimal salePrice) {
		super();
		this.productId = productId;
		this.quantity = quantity;
		this.productName = productName;
		this.avatar = avatar;
		this.salePrice = salePrice;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public BigInteger getQuantity() {
		return quantity;
	}

	public void setQuantity(BigInteger quantity) {
		this.quantity = quantity;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public BigDecimal getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(BigDecimal salePrice) {
		this.salePrice = salePrice;
	}

	
	
	
}
