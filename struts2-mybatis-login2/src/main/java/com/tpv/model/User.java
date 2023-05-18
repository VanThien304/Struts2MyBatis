package com.tpv.model;

public class User {
	private Integer id;
	private String name;
	private String email;
	private String password;
	private Integer isActive;
	private Integer isDelete;
	private String groupRole;

	
	
	public User() {
		super();
	
	}

	
	public User(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}



	public User(Integer id, String name, String email, String password, Integer isActive, Integer isDelete, String groupRole) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.isActive = isActive;
		this.isDelete = isDelete;
		this.groupRole = groupRole;
	}
	
	public User(String name, String email, String password, Integer isActive, Integer isDelete, String groupRole) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.isActive = isActive;
		this.isDelete = isDelete;
		this.groupRole = groupRole;
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

	public Integer getIsActive() {
		return isActive;
	}

	public void setIsActive(Integer isActive) {
		this.isActive = isActive;
	}

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

	public String getGroupRole() {
		return groupRole;
	}

	public void setGroupRole(String groupRole) {
		this.groupRole = groupRole;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
