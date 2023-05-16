package com.tpv.model;



public class User {
	private Integer id;
	private String name;
	private String email;
	private String password;
	private Integer isActive;
	private Integer isDelete;
	private String groupRole;
	
	private int currentPage;
	private int pageSize;
	private int totalRecords;

	public User() {
		super();
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getIsActive() {
		return isActive;
	}

	public void setIsActive(Integer isActive) {
		this.isActive = isActive;
	}

	public String getGroupRole() {
		return groupRole;
	}

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

	public void setGroupRole(String groupRole) {
		this.groupRole = groupRole;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}



	
	
		

}
