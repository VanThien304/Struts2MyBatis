package com.tpv.model;

public enum GroupRole {

	ADMIN("Admin"), EDITOR("Editor"), REVIEWER("Reviewer");

	private final String displayName;

	private GroupRole(String displayName) {
		this.displayName = displayName;
	}

	public String getDisplayName() {
		return displayName;
	}

}
