package com.tpv.model;

public class Customer {
	private Integer customerId;
	private String customerName;
	private String email;
	private String telNum;
	private String address;
	private Integer isActive;
	
	public Customer() {
		super();
	}
	
	public Customer(String customerName, String email, String telNum, String address, Integer isActive) {
		super();
		this.customerName = customerName;
		this.email = email;
		this.telNum = telNum;
		this.address = address;
		this.isActive = isActive;
	}

	public Customer(Integer customerId, String customerName, String email, String telNum, String address,
			Integer isActive) {
		super();
		this.customerId = customerId;
		this.customerName = customerName;
		this.email = email;
		this.telNum = telNum;
		this.address = address;
		this.isActive = isActive;
	}

	public Integer getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelNum() {
		return telNum;
	}
	public void setTelNum(String telNum) {
		this.telNum = telNum;
	}
	public Integer getIsActive() {
		return isActive;
	}
	public void setIsActive(Integer isActive) {
		this.isActive = isActive;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
