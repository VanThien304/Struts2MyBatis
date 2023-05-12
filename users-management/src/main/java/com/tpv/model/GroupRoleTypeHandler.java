package com.tpv.model;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

public class GroupRoleTypeHandler extends BaseTypeHandler<GroupRole> {

	@Override
	public GroupRole getNullableResult(ResultSet rs, String columnName) throws SQLException {
		   String value = rs.getString(columnName);
	        if (rs.wasNull()) {
	            return null;
	        } else {
	            return GroupRole.valueOf(value.toUpperCase());
	        }
	}

	@Override
	public GroupRole getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
		  String value = rs.getString(columnIndex);
	        if (rs.wasNull()) {
	            return null;
	        } else {
	            return GroupRole.valueOf(value.toUpperCase());
	        }
	}

	@Override
	public GroupRole getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		 String value = cs.getString(columnIndex);
	        if (cs.wasNull()) {
	            return null;
	        } else {
	            return GroupRole.valueOf(value.toUpperCase());
	        }
	}

	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, GroupRole parameter, JdbcType jdbcType)
			throws SQLException {
		ps.setString(i, parameter.toString());
		
	}

}
