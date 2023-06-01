package com.tpv.model;

import java.math.BigDecimal;

public class Product {
	private String productId;
	private String productName;
	private String productImage;
	private BigDecimal productPrice;
	private Integer isSales;
	private String description;

	public Product(String productName, String productImage, BigDecimal productPrice, Integer isSales,
			String description) {
		super();
		this.productName = productName;
		this.productImage = productImage;
		this.productPrice = productPrice;
		this.isSales = isSales;
		this.description = description;
	}

	public Product(String productId, String productName, String productImage, BigDecimal productPrice, Integer isSales,
			String description) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productImage = productImage;
		this.productPrice = productPrice;
		this.isSales = isSales;
		this.description = description;
	}

	public Product() {
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public BigDecimal getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(BigDecimal productPrice) {
		this.productPrice = productPrice;
	}

	public Integer getIsSales() {
		return isSales;
	}

	public void setIsSales(Integer isSales) {
		this.isSales = isSales;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
