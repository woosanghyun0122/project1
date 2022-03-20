<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.project.multimarket.common.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/../multimarket/resources/css/nav.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
 <style type="text/css">
        * { margin:0; padding:0; vertical-align:middle; }
        body {font-family: Arial, Helvetica, sans-serif;padding:10px;}
        form .input1 { border:2px hsl(0, 100%, 50%) solid; width:200px; height:20px }
        .bar{list-style-type: none; float: left; margin-left:20px;}
        
        </style>
        </head>
        
        
        <body>
        <% 
			request.setAttribute("commonURL", request.getContextPath());
			
			String userid= StringUtil.nullToValue(session.getAttribute("userid"), "");
			String username= StringUtil.nullToValue(session.getAttribute("username"), "");
			String email= StringUtil.nullToValue(session.getAttribute("email"), "");
			String phone= StringUtil.nullToValue(session.getAttribute("phone"), "");
		
		%>
	  <nav>
        <div id="wrap">
            <header> 
              <div style="list-style:none">
	            <div id="logo" style="float: left;margin-right:50px">
	                <a href="${commonURL }"><img src="/../multimarket/resources/images/logo.png" alt="Multi-Market" width="150" height="80"></a>
	            </div>            

                <div id="head_link">
                    <ul>
                    <%if(userid.equals("")) {%>
                   <li><a href="${commonURL}/member/login">로그인</a></li>
                     <li><a href="${commonURL}/member/register">회원가입</a></li>
                    <li><a href="#" onclick="goalert()">장바구니</a></li>
                    <li><a href="${commonURL}">홈으로</a></li>
                     <%} else{ %>
                     <li><a href="${commonURL}/member/myinfo"><%=username %>님</a></li>
                     <li><a href="${commonURL}/favorite/list">좋아요</a></li>
                     <li><a href="${commonURL}/cart/list">장바구니</a></li>
                     <li><a href="${commonURL}">홈으로</a></li>                     
                     <li><a href="${commonURL}/member/logout">로그아웃</a></li>
                    <%} %>
                    </ul>
                </div>
                <br>

              </div>
            </header>
        	</div>
        </nav>
           <br/> <br/> <br/>
           <nav class="navbar navbar-expand-lg navbar-light bg-danger">
			  <div class="container-fluid">
			    <div class="collapse navbar-collapse" id="navbarNav">
			      <ul class="navbar-nav">
			        <li class="nav-item">
			          <a class="nav-link" href="/multimarket/product/brand/Nike" style="color:white;font-weight: bold;margin-left:400px;padding-right:50px">brand</a>    
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="/multimarket/product/list/m" style="color:white;font-weight: bold;padding-right:50px">Men</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="/multimarket/product/list/f" style="color:white;font-weight: bold;padding-right:50px">Women</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="/multimarket/product/list/o" style="color:white;font-weight: bold">Sale</a>
			        </li>
			      </ul>
			    </div>
			  </div>
			</nav>

<br/>
        

        </body>
</html>
<script>

function goalert(){
	
	alert("로그인이 필요합니다.");
	location.href="<%=request.getContextPath() %>/member/login";
}


</script>


