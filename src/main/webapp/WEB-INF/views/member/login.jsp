<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../../multimarket/resources/css/login.css" rel="stylesheet" type="text/css">
<style >

.login {
	background-color: #FFFFFF;
}
</style>
</head>
<body>
<%@include file="../include/nav.jsp" %>

<div class="login">
	<h1 style="text-align: center">로그인</h1>
    <form method="post">
    	<input type="text" name="u" placeholder="아이디" required="required" style="background-color: #FFFFFF"/>
        <input type="password" name="p" placeholder="비밀번호" required="required" style="background-color: #FFFFFF"/>
        <button type="submit" class="btn btn-primary btn-block btn-large" style="" >로그인</button>
    </form>
</div>
</body>
</html>