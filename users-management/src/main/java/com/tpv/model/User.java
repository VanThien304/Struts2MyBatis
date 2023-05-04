package com.tpv.model;

public class User {
	private Long id;
	private String name;
	private String email;
	private String password;
	private Boolean isActive;
	private String groupRoleId;

	public User() {
		super();
	}

	public User(Long id, String name, String email, String password, Boolean isActive, String groupRoleId) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.isActive = isActive;
		this.groupRoleId = groupRoleId;
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

	public String getGroupRoleId() {
		return groupRoleId;
	}

	public void setGroupRoleId(String groupRoleId) {
		this.groupRoleId = groupRoleId;
	}


	
	

}
