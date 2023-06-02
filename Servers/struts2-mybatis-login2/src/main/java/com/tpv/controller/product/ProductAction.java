package com.tpv.controller.product;

import java.io.IOException;
import java.io.Reader;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.opensymphony.xwork2.ActionSupport;
import com.tpv.model.Product;

public class ProductAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private String productId;
	private String productName;
	private String productImage;
	private BigDecimal productPrice;
	private String priceFrom;
	private String priceTo;
	private Integer isSales;
	private String description;
	private Integer isDelete;

	private Product product;

	private List<Product> products = new ArrayList<Product>();

	public String getAllProduct() throws IOException {
		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession sqlSession = sqlSessionFactory.openSession();

		products = sqlSession.selectList("Product.getAllProduct");
		System.out.println("Records Read Successfully ");
		sqlSession.commit();
		sqlSession.close();
		return SUCCESS;
	}

	public String getProductBySale() throws IOException {
		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession sqlSession = sqlSessionFactory.openSession();

		products = sqlSession.selectList("Product.getProductBySale", isSales);
		System.out.println("Records Read Successfully ");
		sqlSession.commit();
		sqlSession.close();
		return SUCCESS;
	}

	public String setIsDeleteProductById() throws IOException {
		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession sqlSession = sqlSessionFactory.openSession();

		sqlSession.delete("Product.isDeleteById", productId);

		sqlSession.commit();
		sqlSession.close();

		return SUCCESS;
	}

	public String getProductByPrice() throws IOException {
		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession sqlSession = sqlSessionFactory.openSession();

		Map<String, Object> parameters = new HashMap<>();
		parameters.put("priceFrom", priceFrom);
		parameters.put("priceTo", priceTo);
		products = getProductByPrice(sqlSession, parameters);

		for (Product product : products) {
			System.out.println("products = " + product);
			System.out.println("product id = " + product.getProductId());
		}
		System.out.println("success price");
		sqlSession.commit();
		sqlSession.close();
		return SUCCESS;
	}

	private List<Product> getProductByPrice(SqlSession sqlSession, Map<String, Object> parameters) throws IOException {
		return sqlSession.selectList("Product.getProductByPrice", parameters);

	}

	public String createProduct() throws IOException {
		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession sqlSession = sqlSessionFactory.openSession();

		Product product = new Product();

		
		product.setProductName(productName);
		product.setDescription(description);
		product.setProductPrice(productPrice);
		product.setIsSales(isSales);
		product.setIsDelete(0);
		System.out.println("sale = " + product.getIsSales());
		System.out.println("product = " + product);

		sqlSession.insert("Product.createProduct", product);

		sqlSession.commit();
		sqlSession.close();
		return SUCCESS;
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

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public String getPriceFrom() {
		return priceFrom;
	}

	public void setPriceFrom(String priceFrom) {
		this.priceFrom = priceFrom;
	}

	public String getPriceTo() {
		return priceTo;
	}

	public void setPriceTo(String priceTo) {
		this.priceTo = priceTo;
	}

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

}
