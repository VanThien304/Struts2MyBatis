package com.tpv.controller;

import java.io.Reader;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.tpv.model.User;

public class LoginAction extends ActionSupport implements SessionAware {

	private static final long serialVersionUID = 1L;

	private String email;
	private String password;


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

	private Map<String, Object> session;

	/*
	 * public Map<String, Object> getSession() { return session; }
	 */

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;

	}

	private boolean isValidUser(User user) throws Exception{
		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession sqlSession = sqlSessionFactory.openSession();
		User result = sqlSession.selectOne("User.login", user); 
		if (user.getEmail().equals(result.getEmail()) && user.getPassword().equals(result.getPassword())) {
			return true;
		} else {
			return false;
		}
	}

	
	@Override
	public String execute() throws Exception {
		
		clearFieldErrors();
		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession sqlSession = sqlSessionFactory.openSession();

		try {
			User user = new User();
			user.setEmail(email);
			user.setPassword(password);
			
			User result = sqlSession.selectOne("User.login", user);
			
			if (result != null) {
				System.out.println("Login Success!");
				session.put("user", result);
				return SUCCESS;
			} else {
				User u = new User(email, password);
				if(isValidUser(u)) {
					session.put("user", u);
					return SUCCESS;
				}else {
					addFieldError("invalid", "Invalid email or password!");
				}
			}
		} catch (Exception e) { 
			e.printStackTrace();
			
		}
		return INPUT;
	}
	
	
	public String executes() throws Exception {
		clearFieldErrors();

		User user = (User) session.get("user");
		if (user != null) {
			return SUCCESS;
		} else {
			User u = new User(email, password);
			if (isValidUser(u)) {
				session.put("user", u);
				return SUCCESS;
			} else {
				addFieldError("invalid", "Invalid email and password!");
			}
		}
		return INPUT;
	}

}
