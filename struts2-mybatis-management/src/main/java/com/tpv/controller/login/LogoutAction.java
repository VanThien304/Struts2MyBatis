package com.tpv.controller.login;


import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class LogoutAction extends ActionSupport implements SessionAware {

	private static final long serialVersionUID = 1L;

	private Map<String, Object> session;

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public String execute() throws Exception {
		 session.remove("user"); 
			/*
			 * Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
			 * SqlSessionFactory sqlSessionFactory = new
			 * SqlSessionFactoryBuilder().build(reader); SqlSession session =
			 * sqlSessionFactory.openSession(); session.clearCache();
			 */
		return SUCCESS;
	}

}
