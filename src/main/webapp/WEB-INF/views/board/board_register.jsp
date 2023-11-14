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
    <style>
    #pw-text1, #pw-text2, #pw-text3, #pw-text4,
    #title-text1, #content-text1, #userId-text1, #deletedate-text1
    {
        	color: red;
        	font-weight: bold;
        	margin-top: 5px;
        }
    </style>
</head>
<body style="margin:150px">
    <div class="container d-flex justify-content-center align-items-center flex-column">
        <form name="form1" method="post" action="board/register" style="width:700px; text-align: left;">
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" class="form-control" id="title" placeholder="제목을 입력하세요">
                <div id="title-text1">제목을 입력해주세요.</div>
            </div>
            <div class="form-group">
           		 <label for="content">내용</label>
           		 <textarea class="form-control summernote" rows="5" id="content"></textarea>
           		 <div id="content-text1">내용을 입력해주세요.</div>
            </div>
            <div class="form-group">
                <label for="userId">계정</label>
                <input type="text" class="form-control" id="userId" placeholder="계정을 입력하세요" onchange="validateDate()">
                <div id="userId-text1">계정을 입력해주세요.</div>
            </div>
            <div class="form-group">
                <label for="deletedate">삭제일</label>
                <input type="date" class="form-control" id="deletedate">
                <div id="deletedate-text1">삭제일을 입력해주세요.</div>
            </div>
            <div class="form-group">
                <label for="passwd">비밀번호</label>
                <input type="text" class="form-control" id="passwd" placeholder="게시글 비밀번호를 입력하세요">
				<div id="pw-text1">비밀번호를 입력해주세요.</div>
                <div id="pw-text2">8자리 ~ 12자리 이내로 입력해주세요.</div>
				<div id="pw-text3">비밀번호는 공백 없이 입력해주세요.</div>
				<div id="pw-text4">영문,숫자,특수문자를 혼합하여 입력해주세요.</div>
            </div>
            <br>
            <br>
        </form>
        <div class="text-center">
            <button id="btn-save" class="btn btn-dark">글 작성</button>
            <a href="/" class="btn btn-danger">취소</a>
        </div>
    </div>
    <script>
      $('.summernote').summernote({
        tabsize: 2,
        height: 300
      });
      var today = new Date();  // 현재 날짜를 가져오기
      var tomorrow = new Date(today);  // 내일 날짜 계산
      tomorrow.setDate(today.getDate());
      var formattedDate = tomorrow.toISOString().split('T')[0]; // 날짜를 'YYYY-MM-DD' 형식으로 포맷팅
      var deleteDateInput = document.getElementById('deletedate'); // input 요소 찾기
      deleteDateInput.min = formattedDate; // min 속성 설정
	</script>
    <script src="${path}/resources/js/board.js"></script>
</body>
</html>