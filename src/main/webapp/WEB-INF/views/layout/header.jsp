<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-light bg-light static-top">
    <div class="container">
    	<a href="${pageContext.request.contextPath }/"><img alt="" src="images/logo-black.png" width="110" height="60"></a>
    	
    	<span style="float: right;">
	     	<a href="${pageContext.request.contextPath }/board" style="margin-right: 100px; text-decoration: none; font-size: 20px; color: black;">BOARD</a>
	     	<a href="${pageContext.request.contextPath }/fqa" style="margin-right: 100px; text-decoration: none; font-size: 20px; color: black;">FAQ</a>
	     	<a href="${pageContext.request.contextPath }/booking" style="margin-right: 100px; text-decoration: none; font-size: 20px; color: black;">BOOKING</a>
    	<c:choose>
    		<c:when test="${empty(loginMember) }">
    			<a class="btn btn-primary btn-header" href="${pageContext.request.contextPath }/login">Login</a>		
    		</c:when>
    		<c:otherwise>
    			<a href="#" style="margin-right: 100px; text-decoration: none; font-size: 20px; color: black;">MYPAGE</a>
    			<a class="btn btn-primary btn-header" href="${pageContext.request.contextPath }/logout">Logout</a>	
    		</c:otherwise>
    	</c:choose>
    	</span>
    </div>
</nav>
