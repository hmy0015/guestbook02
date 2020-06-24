<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	int no = Integer.parseInt(request.getParameter("no"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action = "/gb02/pbc" method = "get">
		비밀번호
		<input type ='hidden' name = 'action' value='delete'> 
		<input type ='hidden' name = 'no' value=<%= no %>> 
		<input type ='password' name = 'pw' > 
		<button type = 'submit'>확인</button>
	</form>
	<br>
	<a href = '/gb02/pbc?action=addList'>메인으로 돌아가기</a>
</body>
</html>