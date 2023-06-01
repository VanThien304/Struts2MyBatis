package com.tpv.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.tpv.model.User;
import com.tpv.controller.product.ProductAction;

public class AuthenticationInterceptor implements Interceptor {

	private static final long serialVersionUID = 1309873028297240120L;

	private User user;

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
		Map<String, Object> session = actionInvocation.getInvocationContext().getSession();
		User user = (User) session.get("user");

		/*
		 * if (user == null) { return ActionSupport.LOGIN; } else { return
		 * actionInvocation.invoke(); }
		 */

		if (user == null) {
			return ActionSupport.LOGIN;
		} else if ("1".equals(user.getGroupRole())) {
			return actionInvocation.invoke();
		} else if (user.getGroupRole().equals(2)) {
			if (actionInvocation.getAction().getClass().equals(ProductAction.class)) {
				return actionInvocation.invoke();
			} else {
				return "accessDenied";

			}
		}
		return "accessDenied";

	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
