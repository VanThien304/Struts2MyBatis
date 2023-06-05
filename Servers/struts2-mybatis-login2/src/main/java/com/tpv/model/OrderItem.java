package com.tpv.model;

import java.util.Date;



public class OrderItem {

	
	private Integer orderId;
	private Integer detailLine;
	private String productId;
	private Integer priceBuy;
	private Integer quantity;
	private String shopId;
	private Integer receiverId;
	private Date createdAt;
	private Date updatedAt;
	
	
	public OrderItem() {
		super();
	}

	public OrderItem(Integer orderId, Integer detailLine, String productId, Integer priceBuy, Integer quantity,
			String shopId, Integer receiverId, Date createdAt, Date updatedAt) {
		super();
		this.orderId = orderId;
		this.detailLine = detailLine;
		this.productId = productId;
		this.priceBuy = priceBuy;
		this.quantity = quantity;
		this.shopId = shopId;
		this.receiverId = receiverId;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}
	
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Integer getDetailLine() {
		return detailLine;
	}
	public void setDetailLine(Integer detailLine) {
		this.detailLine = detailLine;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public Integer getPriceBuy() {
		return priceBuy;
	}
	public void setPriceBuy(Integer priceBuy) {
		this.priceBuy = priceBuy;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public String getShopId() {
		return shopId;
	}
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	public Integer getReceiverId() {
		return receiverId;
	}
	public void setReceiverId(Integer receiverId) {
		this.receiverId = receiverId;
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
