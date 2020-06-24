<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.javaex.vo.GuestVo"%>

<%
	List<GuestVo> gList = (List<GuestVo>) request.getAttribute("guestList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/gb02/pbc" method="get">
		<table border='1'>
			<tbody>
				<tr>
					<td>이름</td>
					<td><input type="hidden" name="action" value="add">
						<input type='text' name='name'></td>
					<td>비밀번호</td>
					<td><input type='password' name='pw'></td>
				</tr>

				<tr>
					<td colspan='4'><textarea cols='65' rows='5' name='content'></textarea>
					</td>
				</tr>

				<tr>
					<td colspan='4'>
						<button type='submit'>확인</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>

	<br>

	<form action="" method="post">

		<%
			for (GuestVo vo : gList) {
		%>
		<table border='1'>
			<colgroup>
				<col style="width: 50px;">
				<col style="width: 100px;">
				<col style="width: 230px;">
				<col style="width: 100px;">
			</colgroup>

			<tbody>
				<tr>
					<td><%=vo.getNo()%></td>
					<td><%=vo.getName()%></td>
					<td><%=vo.getDate()%></td>
					<td><a href='/gb02/pbc?action=deleteForm&no=<%=vo.getNo()%>'> 삭제 </a></td>
				</tr>

				<tr>
					<td colspan='4'><%=vo.getContent()%></td>
				</tr>
			</tbody>
		</table>
	</form>
	<br>
	<%
		}
	%>
</body>
</html>