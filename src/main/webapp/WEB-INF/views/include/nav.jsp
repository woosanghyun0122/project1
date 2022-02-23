<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.project.multimarket.common.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../../multimarket/resources/css/nav.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
 <style type="text/css">
        * { margin:0; padding:0; vertical-align:middle; }
        body {font-family: Arial, Helvetica, sans-serif;padding:10px;}
        form .input1 { border:2px hsl(0, 100%, 50%) solid; width:200px; height:20px }
        </style>
        </head>
        
        
        <body>
        <nav>
        <div id="wrap">
            <header> <div id="logo">
                <img src="../../multimarket/resources/images/logo.png" alt="Multi-Market" width="150" height="80">
                </div> 

                <div id="head_link">
                    <ul>
                    <li><a href="#">로그인</a></li>
                    <li><a href="#">회원가입</a></li>
                    <li><a href="#">장바구니</a></li>
                    <li><a href="#">홈으로</a></li>
                    </ul>
                </div>
                <br>
                <div id="search"> 
                    <form>
                        <input name="input" type="text" class="main_input">
                        <input name="search" type="button" value="검 색" class="btnl">
                    </form>
                </div>
            </header>
            
        </div>
        </nav>

        </body>
</html>