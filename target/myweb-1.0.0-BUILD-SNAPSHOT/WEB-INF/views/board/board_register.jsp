<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
	<title>게시물 등록</title>
</head>
<body>
<h1>
	게시물 등록   
</h1>
<div class= "container">
<form name="form1" method="post" action="board/register">
	<label for="title">제목</label>
    <input type="text" class="form-control" id="title" placeholder="제목을 입력하세요">
        <div class="form-group">
            <label for="content">내용</label>
            <textarea class="form-control summernote" rows="5" id="content" placeholder="내용을 입력하세요"></textarea>
        </div>
	<label for="writer">계정</label>
    <input type="text" class="form-control" id="writer" placeholder="계정을 입력하세요">
	</form>
	<br>
	<br>
	<div style="text-align: right;">
        <button id="btn-save" class="btn btn-outline-dark">글 작성</button>
    </div>
</div>
	<script>
      $('.summernote').summernote({
        tabsize: 2,
        height: 300
      });
	</script>
	<script src="${path}/resources/js/board.js"></script>
</body>
</html>