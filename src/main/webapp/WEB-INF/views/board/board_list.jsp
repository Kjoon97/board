<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<style>
nav.page.navigation {
    display: flex;
    justify-content: center;
}

#searchForm {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    margin-bottom: 20px; /* 조절 가능한 여백 */
}

#searchForm select,
#searchForm input[type="text"],
#searchForm button {
    height: 38px;
}

#searchForm select,
#searchForm input[type="text"] {
    margin-right: 10px;
}

#searchForm button {
    margin-left: 10px;
}

#searchForm input[type="text"] {
    width: 150px; /* 너비 조절 가능 */
}

#searchForm button {
    margin-left: -10px; /* 버튼을 왼쪽으로 이동 */
}
.table {
    width: 870px;
    margin: auto; /* 가운데 정렬을 위해 추가 */
}

thead {
	font-weight: normal;
    background-color:#f0f0f0;
    text-align: center;
    height: 43.39px; /* 높이 조절 가능 */
}

th:first-child {
    width: 80px; /* 번호 칸 너비 조절 가능 */
}

th:nth-child(2) {
    width: 590px; /* 제목 칸 너비 조절 가능 */
}

th:nth-child(3) {
    width: 120px; /* 작성일 칸 너비 조절 가능 */
}

th:nth-child(4) {
    width: 80px; /* 조회 칸 너비 조절 가능 */
}

td:first-child, td:nth-child(3), td:nth-child(4) {
    text-align: center;
}

td:nth-child(2) a {
    text-decoration: none; /* 호버 시에 밑줄 제거 */
    color: #000 !important; /* 링크 텍스트 색상을 검은색으로 설정 */
}
h1, h4 {
    text-align: left; /* 왼쪽 정렬로 변경 */
}
</style>
</head>
<body style="margin: 150px">
	<div class="container text-center" style="width: 870px;">
	<h1>공지사항</h1>
	<br>
	<h4>롯데관광의 공지사항 및 새로운 소식을 알려드립니다.</h4>
	<br>
		<div class="container text-center" style="width: 870px;">
            <!-- 검색기능 -->
            <!-- 검색기능 -->
            <form id="searchForm" action="/list" method="get" style="width: 870px;">
                <select name="type" style="width: 110px; height: 35px;">
                    <option value="T" <c:out value='${pageMaker.cri.type eq "T"?"selected": "" }'/>>제목</option>
                    <option value="C" <c:out value='${pageMaker.cri.type eq "C"?"selected": "" }'/>>내용</option>
                    <option value="W" <c:out value='${pageMaker.cri.type eq "W"?"selected": "" }'/>>작성자</option>
                </select>
                <input type="text" name="keyword" value="<c:out value='${pageMaker.cri.keyword}'/>" style="width: 310.52px; height: 34px;">
                <button class="btn btn-primary" style="width: 80px; height: 34px;">검색</button>
            </form>
			<table class="table table-horizontal table-bordered">
				<thead class="thead-strong">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회</th>
					</tr>
				</thead>
				<tbody id="tbody">
					<c:forEach items="${boards}" var="board">
						<c:set var="i" value="${i+1}" />
						<tr>
							<td>${i+(pageMaker.cri.pageNum-1)*pageMaker.cri.amount}</td>
							<td>
								<c:url value="/board/detail/${board.id}" var="url" />
								<a href="${url}">
									<c:out value="${board.title}" escapeXml="false" />
								</a>
							</td>
							<td>
								<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" />
							</td>
							<td>
								<c:out value="${board.viewCount}" />
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br>

			<!-- Paging -->
			<nav class="page navigation">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous"><a class="page-link" href="${pageMaker.startPage - 1}">Prev</a></li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active" : "" } "><a class="page-link" href="${num}">${num}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<li class="paginate_button next"><a class="page-link" href="${pageMaker.endPage + 1}">Next</a></li>
					</c:if>
				</ul>
			</nav>
			<!-- /.page -->

			<form id='actionForm' action="/list" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="type" value="<c:out value='${pageMaker.cri.type}'/>">
				<input type="hidden" name="keyword" value="<c:out value='${pageMaker.cri.keyword}'/>">
			</form>

			<br>
			<div class="text-center">
				<a href="http://localhost:8080/board/register" class="btn btn-primary">게시글 등록</a>
			</div>
		</div>
	</div>
	<script>
		var actionForm = $('#actionForm');
		$('.paginate_button a').on('click', function(e) {
			e.preventDefault(); //걸어둔 링크로 이동하는 것을 일단 막음 
			actionForm.find('input[name="pageNum"]').val($(this).attr('href'));
			actionForm.submit();
		});

		var searchForm = $('#searchForm');
		$('#searchForm button').on('click', function(e) {
			if (!searchForm.find('option:selected').val()) {
				alert('검색종류를 선택하세요');
				return false;
			}
			if (!searchForm.find('input[name="keyword"]').val()) {
				alert('키워드를 입력하세요');
				return false;
			}
			e.preventDefault();
			searchForm.find('input[name="pageNum"]').val('1');
			searchForm.submit();
		});
	</script>
</body>
</html>
