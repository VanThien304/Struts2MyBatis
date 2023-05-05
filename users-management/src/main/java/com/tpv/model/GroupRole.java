package com.tpv.model;

public class GroupRole {
	private Long id;
	private String groupName;

	public GroupRole(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupRole) {
		this.groupName = groupRole;
	}

}
