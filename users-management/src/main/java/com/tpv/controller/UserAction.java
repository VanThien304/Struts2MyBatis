package com.tpv.controller;

import java.io.Reader;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.tpv.model.User;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport implements SessionAware{

	private static final long serialVersionUID = 1L;

	private Integer id;
	private String name;
	private String email;
	private String password;
	private Boolean isActive;
	private Boolean isDelete;
	private String groupRole;

	private User user;

	private List<User> users;

	private Map<String, Object> userSession ;

	public void setSession(Map<String, Object> session) {
	   userSession = session ;
	}
	
	
	
	public String getUserById() throws SQLException, Exception {
		try {
			Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			SqlSession session = sqlSessionFactory.openSession();

	/*		if (user.getId() == null) {
				addActionError("User not found.");
				return "error";
			} else {*/
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
//			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			addActionError("Error retrieving user: " + e.getMessage());
			return "error";
		}
	}

	public String getAllUser() throws SQLException, Exception {
		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sqlSessionFactory.openSession();

		// select contact all contacts
		users = (ArrayList) session.selectList("User.getAll");

		for (User u : users) {
			System.out.println(u.getId());
			System.out.println(u.getName());
			System.out.println(u.getEmail());
			System.out.println(u.getPassword());
			System.out.println(u.getIsActive());
			System.out.println(u.getIsDelete());
			System.out.println(u.getGroupRole());

		}

		System.out.println("Records Read Successfully ");
		session.commit();
		session.close();
		return "success";
	}

	public String loginUser() throws SQLException, Exception {
		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sqlSessionFactory.openSession();

		user.setName(name);
		user.setPassword(password);

		session.selectOne("User.login", user);
		System.out.println("id = " + user.getId());
		System.out.println("name = " + user.getName());
		System.out.println("password = " + user.getPassword());
		System.out.println("record inserted successfully");
		
		
		
		session.commit();
		session.close();
		return "success";
	}

	public String createUser() throws SQLException, Exception {
		try {
			Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			SqlSession session = sqlSessionFactory.openSession();

			// Create a new student object
//		     user = new User(name, email, password, isActive, isDelete, groupRole); 
			user = new User();
			user.setName(name);
			user.setEmail(email);
			user.setPassword(password);
			user.setIsActive(true);
			user.setIsDelete(false);
			user.setGroupRole(groupRole);
			validate(user);
			// Insert student data
			session.insert("User.insert", user);
			System.out.println("record inserted successfully");
			session.commit();
			session.close();
			return "success";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			addActionError("Error retrieving user: " + e.getMessage());
			
		}
		return "error";

	}

	public String updateUser() throws SQLException, Exception {
		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sqlSessionFactory.openSession();

		// select a particular user using id
		user = (User) session.selectOne("User.getById", id);
		System.out.println("Current details of the student are");
		System.out.println(user.toString());

		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setIsActive(isActive);
		user.setGroupRole(groupRole);
		// Update the user record
		session.update("User.update", user);
		System.out.println("Record updated successfully");
		session.commit();
		session.close();

		// verifying the record
		User u = session.selectOne("User.getById", id);
		System.out.println("Details of the student after update operation");
		System.out.println(u.toString());
		session.commit();
		session.close();
		return "success";
	}

	public String deleteUserById() throws SQLException, Exception {
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

	public void validate(User user) {
		if (user.getName().length() == 0) {
			addFieldError("name", "username required!");
		}
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

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
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

	public Boolean getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Boolean isDelete) {
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

	
}
