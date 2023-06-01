package com.tpv.controller.login;

import java.io.Reader;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.Validator;
import com.tpv.model.User;

public class LoginAction extends ActionSupport implements SessionAware {

	private static final long serialVersionUID = 1L;

	private String email;
	private String password;
	private String groupRole;

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

	public String getGroupRole() {
		return groupRole;
	}

	public void setGroupRole(String groupRole) {
		this.groupRole = groupRole;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;

	}


	
	@Override
	public String execute() throws Exception {
		
		clearFieldErrors();
		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession sqlSession = sqlSessionFactory.openSession();

		try {
			User user = new User();
			
			user.setGroupRole(groupRole);
			user.setEmail(email);
			user.setPassword(password);
			
			User result = sqlSession.selectOne("User.login", user);
			
			if (result != null) {
				System.out.println("Login Success!");
				session.put("user", result);
				return SUCCESS;
			} else {
				   User emailCheck = sqlSession.selectOne("User.getEmailUser", user.getEmail());
		            if (emailCheck == null) {
		                addFieldError("email", "Email không tồn tại!");
		            } else {
		                addFieldError("password", "Mật khẩu không đúng!");
		            }
					return INPUT;
			}
		} catch (Exception e) { 
			e.printStackTrace();	
		}
		return INPUT;
	}

}
