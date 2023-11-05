<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<title>게시물 등록</title>
</head>

<body style="margin:150px">
<div class= "container">
			<form>
				<div class="form-group">
					<label for="id">글 번호</label>
					<input type="text" class="form-control" id="id" value=${board.id} readonly>
				</div>
				<div class="form-group">
					<label for="title">제목</label>
					<input type="text" class="form-control" id="title" value=${board.title}>
				</div>
				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" id="content">${board.content }</textarea>
				</div>
				<div class="form-group">
					<label for="writer">작성자</label>
					<input type="text" class="form-control" id="writer" value=${board.writer}>
				</div>
			</form>
			<br>
			<a href="http://localhost:8080/board/register" class="btn btn-primary">수정</a>
			<button type="button" class="btn btn-danger" id="btn-delete">삭제</button>
</div>
	<script src="${path}/resources/js/board.js"></script>
</body>
</html>