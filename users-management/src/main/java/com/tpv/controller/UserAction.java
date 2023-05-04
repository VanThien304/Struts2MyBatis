package com.tpv.controller;

import java.io.IOException;
import java.io.Reader;
import java.net.URL;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.tpv.model.User;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String name;
	private String email;
	private String password;
	private Boolean isActive;
	private String groupRole;
	
	private User user;
	
	private List<User> users;
	

	public String getAllUser() throws SQLException, Exception {
		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
	    SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);		
	    SqlSession session = sqlSessionFactory.openSession();
	      
	      //select contact all contacts		
	      users = (ArrayList) session.selectList("User.getAll");
	          
	      for(User u : users ){    	  
	         System.out.println(u.getId());
	         System.out.println(u.getName());
	         System.out.println(u.getEmail());        
	         System.out.println(u.getPassword());   
	         System.out.println(u.getIsActive()); 
	         System.out.println(u.getGroupRoleId());
	         
	      }  
			
	      System.out.println("Records Read Successfully ");          
	      session.commit();   
	      session.close();		
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


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
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
	
	

}
