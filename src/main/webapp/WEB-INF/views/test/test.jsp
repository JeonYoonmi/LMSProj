<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>

	<c:forEach var="userVO" items="${ list }">
		<p>${ userVO.userId }</p>
		<p>${ userVO.userName }</p>
	</c:forEach>
</body>

</html>