package com.tpv.controller.customer;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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

	private InputStream excelStream;
	private String fileName;

	// Getter and setter for excelStream and fileName

	/*
	 * public String exportExcel() throws IOException { Workbook workbook = new
	 * HSSFWorkbook(); try { // Create workbook and populate data using Apache POI
	 * Sheet sheet = workbook.createSheet("Sheet 1");
	 * 
	 * // Create some sample data Row headerRow = sheet.createRow(0); Cell
	 * headerCell = headerRow.createCell(0); headerCell.setCellValue("Name");
	 * 
	 * Row dataRow = sheet.createRow(1); Cell dataCell = dataRow.createCell(0);
	 * dataCell.setCellValue("John Doe");
	 * 
	 * ByteArrayOutputStream bos = new ByteArrayOutputStream(); workbook.write(bos);
	 * byte[] excelBytes = bos.toByteArray(); excelStream = new
	 * ByteArrayInputStream(excelBytes); fileName = "example.xls";
	 * 
	 * return SUCCESS; } finally { // TODO: handle finally clause workbook.close();
	 * } }
	 */

	public String importExcel() throws IOException, InvalidFormatException {

		String relativePath = "/assets/excel";
		String absolutePath = servletRequest.getServletContext().getRealPath("/");
		

		File fileToCreate = new File(absolutePath, filename);
		FileUtils.copyFile(file, fileToCreate);

		Workbook workbook = createWorkbook(new FileInputStream(fileToCreate));

		Sheet sheet = workbook.getSheetAt(0);

		Row firstRow = sheet.getRow(0);

		Iterator<Cell> iterator = firstRow.iterator();

		/*
		 * List<String> cellNames = new ArrayList<String>(); while(iterator.hasNext()) {
		 * cellNames.add(iterator.next().getStringCellValue()); }
		 */

		/*
		 * for(int i = 0; i <= sheet.getLastRowNum(); i++) { Row row = sheet.getRow(i);
		 * Customer customer = new Customer();
		 * customer.setCustomerName(row.getCell(0).getStringCellValue());
		 * customer.setEmail(row.getCell(1).getStringCellValue());
		 * customer.setTelNum(row.getCell(2).getStringCellValue());
		 * customer.setAddress(row.getCell(3).getStringCellValue()); }
		 */

		return SUCCESS;

	}

	public Workbook createWorkbook(InputStream is) throws IOException {
		if (filename.toLowerCase().endsWith("xls")) {
			return new HSSFWorkbook(is);
		}
		if (filename.toLowerCase().endsWith("xlsx")) {
			return new XSSFWorkbook(is);
		}
		return null;
	}

	/*
	 * public List<Customer> importExcel(File file) throws IOException,
	 * InvalidFormatException { List<Customer> dataList = new ArrayList<>();
	 * 
	 * Workbook workbook = WorkbookFactory.create(file); Sheet sheet =
	 * workbook.getSheetAt(1); // Lấy sheet đầu tiên
	 * 
	 * for (Row row : sheet) { Customer customer = new Customer();
	 * customer.setCustomerName(row.getCell(1).getStringCellValue());
	 * customer.setEmail(row.getCell(2).getStringCellValue());
	 * customer.setTelNum(row.getCell(3).getStringCellValue());
	 * customer.setAddress(row.getCell(4).getStringCellValue());
	 * dataList.add(customer); }
	 * 
	 * workbook.close();
	 * 
	 * return dataList; }
	 */

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

	public InputStream getExcelStream() {
		return excelStream;
	}

	public void setExcelStream(InputStream excelStream) {
		this.excelStream = excelStream;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public HttpServletRequest getServletRequest() {
		return servletRequest;
	}

}
