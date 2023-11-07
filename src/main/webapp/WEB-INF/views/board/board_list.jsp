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
    <div class="container" style="max-width: 700px;">
        <div class="mx-auto">
        	<form name="form1" method="post" action="/">
        		<select name="searchOption">
        			<option value="all" <c:out value="${searchOption=='all'?'selected':''}"/>>전체</option>
        			<option value="writer" <c:out value="${searchOption=='writer'?'selected':''}"/>>등록자</option>
        			<option value="content" <c:out value="${searchOption=='content'?'selected':''}"/>>내용</option>
        			<option value="title" <c:out value="${searchOption=='title'?'selected':''}"/>>제목</option>
        		</select>
        		<input name="keyword" value="${keyword}">
        		<input type="submit" value="조회">
        	</form>
        
            <br>
            <table class="table table-horizontal table-bordered">
                <thead class="thead-strong">    
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>등록자</th>
                        <th>등록 날짜</th>
                        <th>조회 수</th>
                    </tr>
                </thead>  
                <tbody id="tbody">
                    <c:forEach items="${boards}" var="board">
                        <c:set var="i" value="${i+1}"/>
                        <tr>
                            <td>${i }</td>
                            <td><c:url value="/board/detail/${board.id}" var="url"/><a href="${url}"><c:out value="${board.title}" escapeXml="false"/></a></td>
                            <td><c:out value="${board.userId}"/></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${board.regdate}"/></td>
                            <td><c:out value="${board.viewCount}"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>
            <div class="text-center">
                <a href="http://localhost:8080/board/register" class="btn btn-primary">게시글 등록</a>
            </div>
        </div>
    </div>
</body>
</html>
