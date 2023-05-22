package com.tpv.controller.user;

import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import java.util.HashMap;

import com.tpv.model.User;

import org.apache.ibatis.executor.ExecutorException;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.PropertyConfigurator;
import org.apache.logging.log4j.core.jackson.Log4jJsonObjectMapper;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.EmailValidator;
import com.opensymphony.xwork2.validator.annotations.RegexFieldValidator;

public class UserAction extends ActionSupport implements SessionAware {

	private static final long serialVersionUID = 1L;

	private Integer id;
	private String name;
	private String email;
	private String password;
	private String confirmPassword;
	private Integer isActive;
	private Integer isDelete;
	private String groupRole;
	private Boolean booleanActive;
	private String keywork;

	private int currentPage;
	private int totalPages;
	private int totalRecord;

	private int offset;
	private int pageSize;

	private User user;

	private List<User> users = new ArrayList<User>();

	private Map<String, Object> userSession;

	public void setSession(Map<String, Object> session) {
		userSession = session;
	}

	public String getUserById() throws SQLException, Exception {

		try {
			Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			SqlSession session = sqlSessionFactory.openSession();

			user = session.selectOne("User.getById", id);
			// Print the student details
			System.out.println(user.getId());
			System.out.println(user.getName());
			System.out.println(user.getEmail());
			System.out.println(user.getPassword());
			System.out.println(user.getGroupRole());
			System.out.println(user.getIsActive());

			session.commit();
			session.close();
			return "success";

		} catch (Exception e) {

			e.printStackTrace();
			addActionError("Error retrieving user: " + e.getMessage());
			return "error";
		}
	}

	public String getUserByActive() throws SQLException, Exception {
		try {
			Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			SqlSession session = sqlSessionFactory.openSession();

			users = session.selectList("User.getUserByActive", isActive);

			System.out.println("users" + users);

			session.commit();
			session.close();
			return "success";

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			addActionError("Error retrieving user: " + e.getMessage());
			return "error";
		}
	}

	public String getAllUsers() throws SQLException, Exception {

		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sqlSessionFactory.openSession();
		try {
			Connection conn = session.getConnection();
			if (conn.isClosed()) {
				session = sqlSessionFactory.openSession();
				conn = session.getConnection();
			}

			users = session.selectList("User.getAll");
			System.out.println("Records Read Successfully ");

			return "success";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return "success";

	}

	public String searchUser() throws SQLException, Exception {
		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sqlSessionFactory.openSession();
		try {
			if (keywork.length() == 0) {
				System.out.println("vui long nhap du lieu de tim kiem!");
				return "error";
			}
			PropertyConfigurator.configure(keywork);

			users = session.selectList("User.search", keywork);
			for (User user : users) {

				System.out.println("user id = " + user.getId());
				System.out.println("name = " + user.getName());
				System.out.println("email" + user.getEmail());
				System.out.println("GroupRole = " + user.getGroupRole());
				System.out.println("Active" + user.getIsActive());
			}
			session.commit();
			return "success";
		} catch (Exception e) {
			return "error";
		} finally {
			session.close();
		}

	}

	public String createUser() throws SQLException, Exception {

		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sqlSessionFactory.openSession();
		try {

			// Create a new student object
//		     user = new User(name, email, password, isActive, isDelete, groupRole);
			user = new User();

			boolean hasError = false;

			if (user != null) {
				if (name.length() < 3) {
					addFieldError("name", "tên không được trống và tên nhập vào phải lớn hơn 2 ký tự!");
					hasError = true;
				}

				if (email.length() < 9) {
					addFieldError("email", "email không được trống, email phải đúng định dạng @gmail.com!");
					hasError = true;
				}

				if (password.length() < 5) {
					addFieldError("password", "password không được trống, password phải lớn hơn 5 ký tự!");
					hasError = true;
				}

				if (!password.equals(confirmPassword)) {
					addFieldError("confirmPassword", "mật khẩu không trùng khớp!!");
					hasError = true;
				}

			}
			if (hasError) {
				return INPUT;
			}

			user.setName(name);
			user.setEmail(email);
			user.setPassword(password);
			if (booleanActive == true) {
				user.setIsActive(1);
			} else {
				user.setIsActive(0);
			}
			user.setIsDelete(0);
			user.setGroupRole(groupRole);

			session.insert("User.insert", user);
			System.out.println("record inserted successfully");
			session.commit();
			return SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			addActionError("Error retrieving user: " + e.getMessage());

		} finally {
			session.close();
		}
		return INPUT;

	}

	public String setActiveUserById() throws SQLException, Exception, ExecutorException {
		if (id == null) {
			return "error";
		}
		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sqlSessionFactory.openSession();

		try {
			Connection conn = session.getConnection();
			if (conn.isClosed()) {
				session = sqlSessionFactory.openSession();
				conn = session.getConnection();
			}
			// select a particular user using id
			user = (User) session.selectOne("User.getById", id);

			if (user.getIsActive() == 0) {
				user.setIsActive(1);
			} else {
				user.setIsActive(0);
			}

			// Update the user record
			session.update("User.setActiveUser", user);
			System.out.println("Record set Active user successfully");
			session.commit();

			// verifying the record
			User u = session.selectOne("User.getById", id);
			System.out.println("Details of the student after update operation");
			System.out.println(u.toString());
			session.commit();
			return "success";
		} catch (Exception e) {
			// TODO: handle exception
			return "error";
		} finally {
			session.close();
		}
	}

	public String updateUser() throws SQLException, Exception, ExecutorException {
		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sqlSessionFactory.openSession();

		if (id == null) {
			return "error";
		}
		
		try {
			boolean hasError = false;

			if (user != null) {
				if (name.length() < 3) {
					addFieldError("name", "tên không được trống và tên nhập vào phải lớn hơn 2 ký tự!");
					hasError = true;
				}

				if (email.length() < 9) {
					addFieldError("email", "email không được trống, email phải đúng định dạng @gmail.com!");
					hasError = true;
				}

				if (password.length() < 5) {
					addFieldError("password", "password không được trống, password phải lớn hơn 5 ký tự!");
					hasError = true;
				}

				if (!password.equals(confirmPassword)) {
					addFieldError("confirmPassword", "mật khẩu không trùng khớp!!");
					hasError = true;
				}

			}
			if (hasError) {
				return INPUT;
			}
			// select a particular user using id
			user = (User) session.selectOne("User.getById", id);
			System.out.println("User ID = " + id);
			System.out.println("Current details of the student are");
			System.out.println(user.toString());

			user.setName(name);
			user.setEmail(email);
			user.setPassword(password);
			if (booleanActive == true) {
				user.setIsActive(1);
			} else {
				user.setIsActive(0);
			}
			user.setGroupRole(groupRole);
			// Update the user record
			session.update("User.update", user);
			System.out.println("Record updated successfully");

			session.commit();

			// verifying the record
			User u = session.selectOne("User.getById", id);
			session.commit();
			return SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			
		} finally {
			session.close();
		}
		return INPUT;
	}

	public String deleteUserById() throws SQLException, Exception {
		if (id == null) {
			return "error";
		}
		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sqlSessionFactory.openSession();

		// Delete operation
		int res = session.delete("User.deleteById", id);

		System.out.println(id);
		System.out.println(res);
		session.commit();
		session.close();
		System.out.println("Record deleted successfully");
		return "success";
	}

	public List<User> getUser() {
		return users;
	}

	public void setUser(ArrayList<User> users) {
		this.users = users;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(ArrayList<User> users) {
		this.users = users;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getIsActive() {
		return isActive;
	}

	public void setIsActive(Integer isActive) {
		this.isActive = isActive;
	}

	public String getGroupRole() {
		return groupRole;
	}

	public void setGroupRole(String groupRole) {
		this.groupRole = groupRole;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public Map<String, Object> getUserSession() {
		return userSession;
	}

	public void setUserSession(Map<String, Object> userSession) {
		this.userSession = userSession;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getKeywork() {
		return keywork;
	}

	public void setKeywork(String keywork) {
		this.keywork = keywork;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public Boolean getBooleanActive() {
		return booleanActive;
	}

	public void setBooleanActive(Boolean booleanActive) {
		this.booleanActive = booleanActive;
	}

}
