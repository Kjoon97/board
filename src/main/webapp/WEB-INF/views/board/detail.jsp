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
        #viewCount{
        	font-size: 13px;
        	color: #999;
        }
        
    </style>
</head>
<body style="margin: 150px">
    <div class="container text-center" style="width: 870px;">
        <h1>공지사항</h1>
        <br>
        <h4>롯데관광의 공지사항 및 새로운 소식을 알려드립니다.</h4>
        <hr>
        <input type="text" class="form-control" id="id" value=${board.id} style="display:none">
        <p style="height:12px"><c:out value="${board.title}"/></p>
        <div style="display: flex; justify-content: space-between; height:25px;">
            <div>
                <p id="date" style="display: inline-block; margin-right:5px">작성일: <fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${board.regdate}"/></p>
                <p id="date" style="display: inline-block;">수정일: <fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${board.updatedate}"/></p>
                <p id="viewCount" style="display: inline-block; margin-left: 10px;">조회: <c:out value="${board.viewCount}"/></p>
            </div>
        </div>
        <hr>
        <br>
        <div class="container text-center">
            <pre><c:out value="${board.content}" escapeXml="false"/></pre>
        </div>
        <br>
        <hr>
        <br>
        <!-- 오른쪽 정렬 스타일을 적용한 부분 -->
        <div class="right-align">
            <a href="/" class="btn btn-outline-dark">목록</a>
            <a href="/board/modify/${board.id}" class="btn btn-outline-dark">수정</a>
            <button id="btn-delete" type="button" class="btn btn-outline-dark">삭제</button>
        </div>
    </div>
    <script src="${path}/resources/js/board.js"></script>
</body>
</html>