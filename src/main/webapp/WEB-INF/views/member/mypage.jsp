<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.project.multimarket.member.*" %>
  <%@page import="com.project.multimarket.common.*" %>
 
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<html>
<head>
  <title>My Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="/../multimarket/resources/css/nav.css" rel="stylesheet" type="text/css">
  
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
           <nav class="navbar navbar-expand-lg navbar-light bg-danger" style="float:left;width:100%">
			  <div class="container-fluid">
			    <div class="collapse navbar-collapse" id="navbarNav">
			      <ul class="navbar-nav">
			        <li class="nav-item">
			          <a class="nav-link" href="/multimarket/product/brand/Nike" style="color:white;font-weight: bold;margin-left:400px;padding-right:50px;font-size:17px">brand</a>    
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="/multimarket/product/list/m" style="color:white;font-weight: bold;padding-right:50px;font-size:17px">Men</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="/multimarket/product/list/f" style="color:white;font-weight: bold;padding-right:50px;font-size:17px">Women</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="/multimarket/product/list/o" style="color:white;font-weight: bold;font-size:17px">Sale</a>
			        </li>
			      </ul>
			    </div>
			  </div>
			</nav>

<br/>


<%
MemberDto dto = (MemberDto)request.getAttribute("memberDto");
%>

<div class="container bootstrap snippet">
	<form id="myform" name="myform">
    <div class="row">
  		<div class="col-sm-10"><h1><%=dto.getUserid() %></h1></div>
    </div>
    <div class="row">
  		<div class="col-sm-3"><!--left col-->
              

      <div class="text-center">
        <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar">
        <h6><%=dto.getUsername() %> 님</h6>
      </div></hr><br>

          
          <ul class="list-group">
            <li class="list-group-item text-muted">Activity <i class="fa fa-dashboard fa-1x"></i></li>
            <li class="list-group-item text-right" style="font-size:13px"><a href="${commonURL}/cart/list"><span class="pull-left"><strong>Cart</strong></span></a></li>
            <li class="list-group-item text-right"style="font-size:13px"><a href="${commonURL}/favorite/list"><span class="pull-left"><strong>Favorite</strong></span></a></li>
            <li class="list-group-item text-right"style="font-size:13px"><span class="pull-left"><strong>Post</strong></span></li>
            <li class="list-group-item text-right"style="font-size:13px"><span class="pull-left"><strong>Followers</strong></span></li>
          </ul> 
               
          
          
        </div><!--/col-3-->
    	<div class="col-sm-9">

          <div class="tab-content">
            <div class="tab-pane active" id="home">
                <hr>
                  <form class="form" action="##" method="post" id="registrationForm">
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                              <label for="first_name"><h4>이름</h4></label>
                              <input type="text" class="form-control" name="username" id="username" placeholder="이름" title="enter your first name if any." value="<%=dto.getUsername()%>">
                          </div>
                      </div>
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                            <label for="last_name"><h4>아이디</h4></label>
                              <input type="text" class="form-control" name="userid" id="userid" placeholder="아이디" title="enter your last name if any." value="<%=dto.getUserid()%>">
                          </div>
                      </div>
          
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                              <label for="phone"><h4>전화번호</h4></label>
                              <input type="text" class="form-control" name="phone" id="phone" placeholder="전화번호" title="enter your phone number if any." value="<%=dto.getPhone()%>">
                          </div>
                      </div>
          
                      <div class="form-group">
                          <div class="col-xs-6">
                             <label for="mobile"><h4>생년월일</h4></label>
                              <input type="text" class="form-control" name="birthday" id="birthday" placeholder="생년월일" title="enter your mobile number if any." value="<%=dto.getBirthday()%>">
                          </div>
                      </div>
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                              <label for="email"><h4>Email</h4></label>
                              <input type="email" class="form-control" name="email" id="email" placeholder="you@email.com" title="enter your email." value="<%=dto.getEmail()%>">
                          </div>
                      </div>
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                              <label for="email"><h4>주소</h4></label>
                              <input type="email" class="form-control" id="address" name="address" placeholder="주소" title="enter a location" value="<%=dto.getAddress()%>">
                          </div>
                      </div>
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                              <label for="password"><h4>Password</h4></label>
                              <input type="password" class="form-control" name="pw" id="pw" placeholder="비밀번호" title="enter your password." value="<%=dto.getPw()%>">
                          </div>
                      </div>
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                            <label for="password2"><h4>우편번호</h4></label>
                              <input type="text" class="form-control" name="zipcode" id="zipcode" placeholder="우편번호" title="enter your password2." value="<%=dto.getZipcode()%>">
                          </div>
                      </div>
                      <div class="form-group">
                           <div class="col-xs-12">
                                <br>
                              	<button class="btn btn-lg btn-success" type="button" onclick="goSave()"><i class="glyphicon glyphicon-ok-sign" style="text-align:center"></i> 저장하기</button>
                            </div>
                      </div>
              	</form>
              
              <hr>
              
             </div><!--/tab-pane-->

               
              </div><!--/tab-pane-->
          </div><!--/tab-content-->

        </div>
        </form><!--/col-9-->
    </div><!--/row-->
   </body>
   
   </html>
   
   <script>
   function goSave(){
	   
	   var frmData = new FormData(document.myform);
	   console.log(frmData);
	   url="<%=request.getContextPath() %>/member/update"
	   msg="회원 정보가 수정되었습니다."
   
		   $.ajax({
			      url:url,
			      data:frmData,
			      contentType:false,
			      processData:false,
			      type:"POST",
			   })
			   .done( (result)=>{
			      console.log(result);
			      alert(msg);
			      location.href="<%=request.getContextPath() %>/member/myinfo"; //시작화면으로 이동하기
			   })
			   .fail( (error)=>{
			      console.log(error);
			   })
   }
   function goalert(){
		
		alert("로그인이 필요합니다.");
		location.href="<%=request.getContextPath() %>/member/login";
	}
   
   </script>
    
                                                      