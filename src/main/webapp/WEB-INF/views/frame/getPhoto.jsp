<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String memFnm = request.getParameter("memFnm");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진</title>
<style type="text/css">
	#memFnmImg {
		width : 100%;
	}
</style>
</head>
<body>
	<img id = "memFnmImg" alt="등록사진.jpg" src="/resources/profileImg/<%=memFnm%>">
</body>
</html>