package vn.devpro.TestAdmin.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_contact")
public class Contact extends BaseModel{

	@Column(name = "name", length = 120, nullable = false)
	private String name;
	
	@Column(name = "mobile", length = 60, nullable = true)
	private String mobile;
	
	@Column(name = "email", length = 200, nullable = true)
	private String email;
	
	@Column(name = "address", length = 300, nullable = true)
	private String address;
	
	@Column(name = "message", length = 1200, nullable = true)
	private String message;

	public Contact() {
		super();
	}

	public Contact(Integer id, Date createDate, Date updateDate, Boolean status, String name, String mobile,
			String email, String address, String message) {
		super(id, createDate, updateDate, status);
		this.name = name;
		this.mobile = mobile;
		this.email = email;
		this.address = address;
		this.message = message;
	}
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
}