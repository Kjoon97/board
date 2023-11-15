<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<html>
<head>
<title>게시물 리스트</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<style>
h1, h4, p {
	text-align: left; /* 왼쪽 정렬로 변경 */
}

.right-align {
	text-align: right; /* 오른쪽 정렬 */
}

#date {
	font-size: 13px;
	color: #999;
}

#viewCount {
	font-size: 13px;
	color: #999;
}

.modal-delete-bg {
	width: 100%;
	height: 100%;
	position: fixed;
	background: rgba(0, 0, 0, 0.6);
	z-index: 5;
	padding-top: 10%;
	padding-left: 37%;
	visibility: hidden;
	opacity: 0;
	transition: all 0.5s;
}

.white-bg {
	background: white;
	border-radius: 5px;
	padding: 30px;
	width: 500px;
}

.show {
	display: block;
	opacity: 1;
	visibility: visible;
}

#pw-text1, #pw-text2, #pw-text3, #pw-text4 {
	color: red;
	font-weight: bold;
	margin-top: 5px;
}
</style>
</head>
<body>
	<div class="modal-delete-bg">
		<div class="white-bg">
			<h4>비밀번호 입력하세요</h4>
			<form>
				<div class="my-3">
					<input type="text" class="form-control" id="passwd" placeholder="게시글 비밀번호를 입력하세요">
                	<div id="pw-text1">비밀번호를 입력해주세요.</div>
                	<div id="pw-text2">8자리 ~ 12자리 이내로 입력해주세요.</div>
					<div id="pw-text3">비밀번호는 공백 없이 입력해주세요.</div>
					<div id="pw-text4">영문,숫자,특수문자를 혼합하여 입력해주세요.</div>
				</div>
			</form>
			<div style="text-align: right;">
				<button type="submit" class="btn btn-outline-dark" id="modal-delete-submit">확인</button>
				<button type="button" class="btn btn-outline-dark" id="modal-delete-close">취소</button>
			</div>
		</div>
	</div>

	<div class="container text-center" style="width: 870px; padding: 150px">
		<h1>공지사항</h1>
		<br>
		<h4>롯데관광의 공지사항 및 새로운 소식을 알려드립니다.</h4>
		<hr>
		<input type="text" class="form-control" id="id" value=${board.id } style="display: none">
		<p style="height: 12px">
			<c:out value="${board.title}" />
		</p>
		<div style="display: flex; justify-content: space-between; height: 25px;">
			<div>
				<p id="date" style="display: inline-block; margin-right: 5px">
					작성일:
					<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${board.regdate}" />
				</p>
				<p id="date" style="display: inline-block;">
					수정일:
					<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${board.updatedate}" />
				</p>
				<p id="viewCount" style="display: inline-block; margin-left: 15px;">
					조회:
					<c:out value="${board.viewCount}" />
				</p>
			</div>
		</div>
			<p id="date">			
				삭제 예정일:
			<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${board.deletedate}" />
			</p>
		<hr>
		<br>
		<div class="container text-center">
			<pre>
				<c:out value="${board.content}" escapeXml="false" />
			</pre>
		</div>
		<br>
		<hr>
		<br>
		<!-- 오른쪽 정렬 스타일을 적용한 부분 -->
		<div class="right-align">
			<a href="/" class="btn btn-outline-dark">목록</a>
			<!--<button id="update-btn" type="button" class="btn btn-outline-dark">수정</button>-->
			<a href="/board/modify/${board.id}" class="btn btn-outline-dark">수정</a>
			<button id="delete-btn" type="button" class="btn btn-outline-dark">삭제</button>
		</div>
	</div>
	<script src="${path}/resources/js/board.js"></script>
</body>
</html>