<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ page session="false" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시물 리스트</title>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body style="margin:150px">
	<div align=center>
		<table class="table table-horizontal table-bodered">
		  <thead class="thead-strong">	
		  	<tr>
		    	<th>번호</th>
		    	<th>제목</th>
		    	<th>등록자</th>
		    	<th>등록 날짜</th>
		    	<th>수정 날짜</th>
		  	</tr>
		   </thead>
		   <tbody id="tbody">
		  <c:forEach items="${boards}" var="board">
		  	<c:set var="i" value="${i+1}"/>
			  <tr>
			    <td>${i }</td>
			    <td><c:url value="/board/detail/${board.id}" var="url"/><a href="${url}"><c:out value="${board.title}" escapeXml="false"/></a></td>
			    <td><c:out value="${board.writer}"/></td>
			    <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${board.regdate}"/></td>
			    <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${board.updatedate}"/></td>
			  </tr>
		  </c:forEach>
		  </tbody>
		</table>
		<br>
		<a href="http://localhost:8080/board/register" class="btn btn-primary">게시글 등록</a>
	</div>
</body>
</html>