package com.tpv.model;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.Date;



public class Order {

	
	private Integer orderId;
	private String orderShop;
	private Integer customerId;
	private BigDecimal totalPrice;
	private Integer paymentMethod;
	private Integer shipCharge;
	private Integer tax;
	private Instant orderDate; 
	private Date shipmentDate; 
	private Date cancelDate; 
	private Integer orderStatus;
	private String noteCustomer;
	private String errorCodeApi;
	private Date createdAt;
	private Date updatedAt;
	
	
	
	public Order() {
		super();
	}
	
	
	public Order(Integer orderId, String orderShop, Integer customerId, BigDecimal totalPrice, Integer paymentMethod,
			Instant orderDate, Integer orderStatus) {
		super();
		this.orderId = orderId;
		this.orderShop = orderShop;
		this.customerId = customerId;
		this.totalPrice = totalPrice;
		this.paymentMethod = paymentMethod;
		this.orderDate = orderDate;
		this.orderStatus = orderStatus;
	}


	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public String getOrderShop() {
		return orderShop;
	}
	public void setOrderShop(String orderShop) {
		this.orderShop = orderShop;
	}
	public Integer getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}
	public BigDecimal getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(BigDecimal totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Integer getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(Integer paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public Integer getShipCharge() {
		return shipCharge;
	}
	public void setShipCharge(Integer shipCharge) {
		this.shipCharge = shipCharge;
	}
	public Integer getTax() {
		return tax;
	}
	public void setTax(Integer tax) {
		this.tax = tax;
	}
	public Instant getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Instant instant) {
		this.orderDate = instant;
	}
	public Date getShipmentDate() {
		return shipmentDate;
	}
	public void setShipmentDate(Date shipmentDate) {
		this.shipmentDate = shipmentDate;
	}
	public Date getCancelDate() {
		return cancelDate;
	}
	public void setCancelDate(Date cancelDate) {
		this.cancelDate = cancelDate;
	}
	public Integer getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getNoteCustomer() {
		return noteCustomer;
	}
	public void setNoteCustomer(String noteCustomer) {
		this.noteCustomer = noteCustomer;
	}
	public String getErrorCodeApi() {
		return errorCodeApi;
	}
	public void setErrorCodeApi(String errorCodeApi) {
		this.errorCodeApi = errorCodeApi;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	
}
