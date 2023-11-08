<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ page session="false" %>
<html>
<head>
	<title>게시물 리스트</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body style="margin:150px">
	<div align=center>
	<input type="text" class="form-control" id="id" value=${board.id} style=display:none>
		<table class="table table-horizontal table-bodered" style="width:700px">
		  <thead class="thead-strong">	
		  	<tr>
		    	<th>제목</th>
		    	<th>등록자</th>
		    	<th>내용</th>
		    	<th>등록 날짜</th>
		    	<th>수정 날짜</th>
		    	<th>조회 수</th>
		  	</tr>
		   </thead>
		   <tbody id="tbody">
			  <tr>
			  	<td><c:out value="${board.title}"/></td>
			    <td><c:out value="${board.userId}"/></td>
			    <td><c:out value="${board.content}"/></td>
			    <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${board.regdate}"/></td>
			    <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${board.updatedate}"/></td>
			    <td><c:out value="${board.viewCount}"/></td>
			  </tr>
		  </tbody>
		</table>
		<br>
			<a href="/list" class="btn btn-warning">목록</a>
			<a href="/board/modify/${board.id}" class="btn btn-primary">수정</a>
			<button id="btn-delete" type="button" class="btn btn-danger">삭제</button>
	</div>
	<script src="${path}/resources/js/board.js"></script>
</body>
</html>