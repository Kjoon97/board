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
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <title>게시물 수정</title>
    <style>
    #pw-text1, #pw-text2, #pw-text3, #pw-text4,
    #title-text1, #content-text1, #userId-text1
    {
        	color: red;
        	font-weight: bold;
        	margin-top: 5px;
        }
    </style>
</head>

<body style="margin:150px">
    <div class="container d-flex justify-content-center align-items-center flex-column"> <!-- 변경된 부분 -->
        <form style="width:700px; text-align: left;">
            <div class="form-group">
                <input type="text" class="form-control" id="id" value=${board.id} style="display:none">
            </div>
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" class="form-control" id="title" value="${board.title}">
                <div id="title-text1">제목을 입력해주세요.</div>
            </div>
            <div class="form-group">
                <label for="content">내용</label>
                <textarea class="form-control summernote" rows="5" id="content" style="width:700px; height:500px;">${board.content}</textarea>
                <div id="content-text1">내용을 입력해주세요.</div>
            </div>
            <div class="form-group">
                <label for="userId">작성자</label>
                <input type="text" class="form-control" id="userId" value="${board.userId}">
                <div id="userId-text1">계정을 입력해주세요.</div>
            </div>
            <div class="form-group">
                <label for="passwd">비밀번호</label>
                <input type="text" class="form-control" id="passwd" placeholder="게시글 비밀번호를 입력하세요">
                <div id="pw-text1">비밀번호를 입력해주세요.</div>
                <div id="pw-text2">8자리 ~ 12자리 이내로 입력해주세요.</div>
				<div id="pw-text3">비밀번호는 공백 없이 입력해주세요.</div>
				<div id="pw-text4">영문,숫자,특수문자를 혼합하여 입력해주세요.</div>
            </div>
        </form>
        <div class="text-center mt-3"> <!-- 변경된 부분 -->
            <button id="update-btn" type="button" class="btn btn-primary">완료</button>
            <a href="/board/detail/${board.id}" class="btn btn-danger">취소</a>
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