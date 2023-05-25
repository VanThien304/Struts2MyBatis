<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Login Page</title>
</head>
<body>



<table>
    <!-- Hiển thị danh sách người dùng -->
    <s:iterator value="userList">
        <tr>
            <td><s:property value="id" /></td>
            <td><s:property value="name" /></td>
            <!-- Các cột khác -->
        </tr>
    </s:iterator>
</table>

<div>
    <!-- Hiển thị phân trang -->
    <s:url var="paginationUrl" action="pagination">
        <s:param name="currentPage" value="%{#currentPage}" />
    </s:url>
    
    <s:if test="totalPages > 1">
        <s:set var="startPage" value="#currentPage - 2" />
        <s:set var="endPage" value="#currentPage + 2" />
        
        <s:if test="startPage < 1">
            <s:set var="endPage" value="#endPage + (1 - #startPage)" />
            <s:set var="startPage" value="1" />
        </s:if>
        
        <s:if test="endPage > totalPages">
            <s:set var="startPage" value="#startPage - (#endPage - #totalPages)" />
            <s:set var="endPage" value="#totalPages" />
        </s:if>
        
        <ul>
            <li><a href="<s:url action="pagination"><s:param name="currentPage" value="1" /></s:url>">Đầu</a></li>
            <s:if test="startPage > 1"><li><a href="<s:url action="pagination"><s:param name="currentPage" value="#startPage - 1" /></s:url>">...</a></li></s:if>
            <s:iterator begin="#startPage" end="#endPage" status="loopStatus">
                <s:if test="#loopStatus.index + 1 == #currentPage"><li class="active"><s:property value="#currentPage" /></li></s:if>
                <s:else><li><a href="<s:url action="pagination"><s:param name="currentPage" value="#loopStatus.index + 1" /></s:url>"><s:property value="#loopStatus.index + 1" /></a></li></s:else>
            </s:iterator>
            <s:if test="endPage < totalPages"><li><a href="<s:url action="pagination"><s:param name="currentPage" value="#endPage + 1" /></s:url>">...</a></li></s:if>
            <li><a href="<s:url action="pagination"><s:param name="currentPage" value="#totalPages" /></s:url>">Cuối</a></li>
        </ul>
    </s:if>
</div>


</body>
</html>