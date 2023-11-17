<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<title>게시물 등록</title>
	<%@include file="../layout/header.jsp" %>
    <link href="${path}/resources/css/register.css" rel="stylesheet" type="text/css">
</head>
<body style="margin:150px">
    <div class="container d-flex justify-content-center align-items-center flex-column">
        <form name="form1" method="post" action="board/register" style="width:700px; text-align: left;">
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" class="form-control" id="title" placeholder="제목을 입력하세요">
                <div id="title-text1">제목을 입력해주세요.</div>
                <div id="title-text2">100자 이내로 입력해주세요.</div>
            </div>
            <div class="form-group">
           		 <label for="content">내용</label>
           		 <textarea class="form-control summernote" rows="5" id="content"></textarea>
           		 <div id="content-text1">내용을 입력해주세요.</div>
            </div>
            <div class="form-group">
                <label for="userId">계정</label>
                <input type="text" class="form-control" id="userId" placeholder="계정을 입력하세요">
                <div id="userId-text1">계정을 입력해주세요.</div>
                <div id="userId-text2">12자리 이내로 입력해주세요.</div>
            </div>
            <div class="form-group">
                <label for="deletedate">삭제일</label>
                <input type="date" class="form-control" id="deletedate">
                <div id="deletedate-text1">삭제일을 입력해주세요.</div>
            </div>
            <div class="form-group">
                <label for="passwd">비밀번호</label>
                <input type="password" class="form-control" id="passwd" placeholder="게시글 비밀번호를 입력하세요">
				<div id="pw-text1">비밀번호를 입력해주세요.</div>
                <div id="pw-text2">8자리 ~ 12자리 이내로 입력해주세요.</div>
				<div id="pw-text3">비밀번호는 공백 없이 입력해주세요.</div>
				<div id="pw-text4">영문,숫자,특수문자를 혼합하여 입력해주세요.</div>
            </div>
            <br>
            <br>
        </form>
        <div class="text-center">
            <button id="btn-save" class="btn btn-outline-dark">확인</button>
            <a href="/" class="btn btn-outline-dark">취소</a>
        </div>
    </div>
    <script src="${path}/resources/js/register.js"></script>
    <script src="${path}/resources/js/board.js"></script>
</body>
</html>