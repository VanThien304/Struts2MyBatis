package com.tpv.controller.customer;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.opensymphony.xwork2.ActionSupport;
import com.tpv.model.Customer;


public class CustomerAction extends ActionSupport {

	private Integer customerId;
	private String customerName;
	private String email;
	private String telNum;
	private String address;
	private Boolean booleanActive;
	private Integer isActive;
	
	private Customer customer;
	
	private List<Customer> customers = new ArrayList<Customer>();
	
	private static final long serialVersionUID = 1L;
	
	
	public String createCustomer() throws IOException {
		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		SqlSessionFactory sessionFactory =  new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sessionFactory.openSession();
		try {
			customer = new Customer();
			
			customer.setCustomerName(customerName);
			customer.setEmail(email);
			customer.setTelNum(telNum);
			customer.setAddress(address);
			if(booleanActive == true) {				
				customer.setIsActive(1);
			}else {
				customer.setIsActive(0);
			}
			
			session.insert("Customer.insertCustomer", customer);
			System.out.println("record inserted successfully");
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			
		}
		
		return SUCCESS;
	}
	
	 public String getAllCustomer() throws IOException {
		 Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			SqlSession session = sqlSessionFactory.openSession();
			try {
			customers = session.selectList("Customer.getAllCustomer");
				for(Customer customer : customers) {
					System.out.println("customr id = " + customer.getCustomerId());
				}
				System.out.println("Records Read Successfully ");

				return SUCCESS;
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				session.close();
			}
			return SUCCESS;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public List<Customer> getCustomers() {
		return customers;
	}

	public void setCustomers(List<Customer> customers) {
		this.customers = customers;
	}

	public Boolean getBooleanActive() {
		return booleanActive;
	}

	public void setBooleanActive(Boolean booleanActive) {
		this.booleanActive = booleanActive;
	}

	 
	 
	 
}
