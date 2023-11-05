<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>register</title>
<style>
th, label{
    color: #fff;
    font-family: inherit;
    margin-left: 50px;   
}
h2{
  color:#fff;
   font-family: inherit;
   margin: 50px;
}
table{
   border-collapse: separate;
   border-spacing: 30px;
}
#title{
   width: 830px;/* 가로 사이즈 */
   border-radius: 4px;
   padding: 10px; /* 내부여백 */
   padding-left: 12px;
    
}

#content{
   width: 830px;/* 가로 사이즈 */
   height: 300px;
   border-radius: 4px;
   padding: 10px; /* 내부여백 */
   padding-left: 12px;
}
body{
    
    background-color: #000000;
    font-family: 'Poppins', sans-serif;
    margin-top:150px;
}

select {
	width: 830px; /* 가로 사이즈 */
    padding: 10px; /* 내부여백 */
    padding-left: 12px;
    border: 1px solid #ddd;
    background-size: 30px; /* 화살표 크기 */
    border-radius: 4px;
    box-sizing: border-box;
    font-size: 12px;
    color: #000;
    outline:none;
}
</style>
</head>
<body>
	<div align=center>
		<h2>modify</h2>
		<form name=modifyform action="http://localhost:8080/myweb/board/modify/movie<c:out value="${movieId}"/>" method="post">
		<table>	
			<tr><th>title</th><td><input id ="title" type="text" name="title" value="${board.title}"></td></tr>
			<tr><th>content</th><td><textarea id ="content" type="text" name="content">${board.content}</textarea></td></tr>
            <tr><th>score</th><td>
            <select name ="score" type="text">
               <option value="10"> 10점 </option>
               <option value="8"> 8점 </option>
               <option value="6"> 6점 </option>
               <option value="4"> 4점 </option>
               <option value="2"> 2점 </option>
            </select>
            </td></tr>
         </table>
         <br>
			<input class="btn btn-outline-warning" type="submit" name="submit" value="수정">&nbsp&nbsp&nbsp&nbsp
			<input class="btn btn-outline-warning" type="reset" name="reset" value="다시 작성">
		</form>
	</div>
</body>
</html>