package com.tpv.controller;

import java.io.Reader;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionContext;
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
			user.setEmail(email);
			User existingUser = sqlSession.selectOne("User.getByEmail", email);
			if (existingUser == null) {
				addFieldError("email", "Đăng nhập không thành công. Vui lòng kiểm tra email!.");
				
				return INPUT;
			}
			user.setPassword(password);
			User result = sqlSession.selectOne("User.login", user);
			if (result != null) {
				System.out.println("Login Success!");
				session.put("user", result);

				return SUCCESS;
			} else {
				addFieldError("password", "Đăng nhập không thành công. Vui lòng kiểm tra mật khẩu!.");
				
				return INPUT;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return INPUT;
	}

	public String redirectToSession() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		if (session.containsKey("user")) {
			// Session tồn tại
			User user = (User) session.get("user");
			System.out.println("User: " + user.getEmail());
			
			return SUCCESS;
		} else {
			// Session không tồn tại
			System.out.println("Session không tồn tại.");
			
			return INPUT;
		}
		
	}
}
