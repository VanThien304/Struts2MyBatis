package com.tpv.controller.customer;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import org.apache.poi.ss.usermodel.Row;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.commons.io.FileUtils;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import org.apache.struts2.interceptor.ServletRequestAware;


import com.opensymphony.xwork2.ActionSupport;
import com.tpv.model.Customer;

public class CustomerAction extends ActionSupport implements ServletRequestAware {

	private Integer customerId;
	private String customerName;
	private String email;
	private String telNum;
	private String address;
	private Boolean booleanActive;
	private Integer isActive;

	private File file;
	private String contentType;
	private String filename;
	private HttpServletRequest servletRequest;

	private Customer customer;

	private List<Customer> customers = new ArrayList<Customer>();

	private static final long serialVersionUID = 1L;

	public String importExcel() throws IOException, InvalidFormatException {
		String filePath = servletRequest.getServletContext().getRealPath("/webapp/assets/excel/");
		File fileToCreate = new File(filePath, filename);
		FileUtils.copyFile(file, fileToCreate);

		List<String> list= importExcel(file);
		for(int i=0;i<list.size();i++){
			System.out.println(list.get(i));
		}
		return "result";
		
	}



	public List<String> importExcel(File file) throws IOException, InvalidFormatException {
	    List<String> dataList = new ArrayList<>();

	    Workbook workbook = WorkbookFactory.create(file);
	    Sheet sheet = workbook.getSheetAt(0); // Lấy sheet đầu tiên

	    for (Row row : sheet) {
	        for (Cell cell : row) {
	            String cellValue = "";
	            if (cell.getCellType() == CellType.STRING) {
	                cellValue = cell.getStringCellValue();
	            } else if (cell.getCellType() == CellType.NUMERIC) {
	                cellValue = String.valueOf(cell.getNumericCellValue());
	            } else if (cell.getCellType() == CellType.BOOLEAN) {
	                cellValue = String.valueOf(cell.getBooleanCellValue());
	            }
	            dataList.add(cellValue);
	        }
	    }

	    workbook.close();

	    return dataList;
	}

	
	
	public String getCustomerById() throws IOException {
		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sessionFactory.openSession();
		customer = session.selectOne("Customer.getCustomerId", customerId);
		System.out.println("customr id = " + customer.getCustomerId());
		return SUCCESS;
	}

	public String updateCustomerById() throws IOException {
		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sessionFactory.openSession();
		customer = session.selectOne("Customer.getCustomerId", customerId);
		System.out.println("customr id = " + customer.getCustomerId());

		customer.setCustomerName(customerName);
		customer.setEmail(email);
		customer.setTelNum(telNum);
		customer.setAddress(address);

		session.selectOne("Customer.updateCustomerId", customer);
		return SUCCESS;
	}

	public String createCustomer() throws IOException {
		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sessionFactory.openSession();
		try {
			customer = new Customer();

			customer.setCustomerName(customerName);
			customer.setEmail(email);
			customer.setTelNum(telNum);
			customer.setAddress(address);
			if (booleanActive == true) {
				customer.setIsActive(1);
			} else {
				customer.setIsActive(0);
			}

			session.insert("Customer.insertCustomer", customer);
			System.out.println("record inserted successfully");
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {

		}

		return SUCCESS;
	}

	public String getAllCustomer() throws IOException {
		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sqlSessionFactory.openSession();
		try {
			customers = session.selectList("Customer.getAllCustomer");
			for (Customer customer : customers) {
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

	@Override
	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;

	}

	public void setUpload(File file) {
		this.file = file;
	}

	public void setUploadContentType(String contentType) {
		this.contentType = contentType;
	}

	public void setUploadFileName(String filename) {
		this.filename = filename;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	

}
