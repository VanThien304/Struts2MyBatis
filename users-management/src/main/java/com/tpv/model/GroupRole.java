package com.tpv.model;

public class GroupRole {
	private Long id;
	private String groupName;

	@Override
	public String toString() {
		return "GroupRole [id=" + id + ", groupRole=" + groupName + "]";
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
