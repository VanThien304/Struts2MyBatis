package com.tpv.controller.order;

import java.io.IOException;
import java.io.Reader;
import java.math.BigDecimal;
import java.time.Instant;
import java.util.Date;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.logging.log4j.CloseableThreadContext.Instance;

import com.opensymphony.xwork2.ActionSupport;
import com.tpv.model.Order;
import com.tpv.model.OrderItem;
import com.tpv.model.Product;

import javassist.NotFoundException;



public class OrderAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	
	private Integer itemId;
	private Integer orderId;
	private String orderShop;
	private String productId;
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
	
	private Order order;
	
	private OrderItem orderDetail;
	
	private Product product;
	
	
	
	
	public String createOrder() throws IOException, NotFoundException {
		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession sqlSession = sessionFactory.openSession();
		Integer getCustomerId = sqlSession.selectOne("Customer.getCustomerId",customerId);
		String getProductId = sqlSession.selectOne("Product.getProductId",productId);
		
		if(getCustomerId != null) {
			throw new NotFoundException("Id khách hàng không hợp lệ!");
		}
		Order order = new Order();
		order.setCustomerId(getCustomerId);
		order.setTotalPrice(new BigDecimal(0));
		order.setOrderShop(orderShop);
		order.setPaymentMethod(paymentMethod);
		order.setOrderDate(Instant.now());
		order.setOrderStatus(1);
		
		BigDecimal totalPrice = BigDecimal.valueOf(0);
		
		BigDecimal price = product.getProductPrice();
		
		int quantity = orderDetail.getQuantity();
		
		totalPrice = price.multiply(new BigDecimal(quantity));
		
		order.setTotalPrice(totalPrice);
		
		
		
		return SUCCESS;
		
	}

	
	
	public Integer getItemId() {
		return itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
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
	public void setOrderDate(Instant orderDate) {
		this.orderDate = orderDate;
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

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public OrderItem getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(OrderItem orderDetail) {
		this.orderDetail = orderDetail;
	}
	
	
}
