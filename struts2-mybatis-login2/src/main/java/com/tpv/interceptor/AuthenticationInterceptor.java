package com.tpv.interceptor;

import java.io.Reader;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.tpv.model.User;

public class AuthenticationInterceptor implements Interceptor{


	
	private static final long serialVersionUID = 1309873028297240120L;

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		Map<String, Object> session =  actionInvocation.getInvocationContext().getSession();
		User user = (User) session.get("user");
		if(user == null) {
			return ActionSupport.LOGIN;
		}else {
			
			return actionInvocation.invoke();
		}
	}

}
