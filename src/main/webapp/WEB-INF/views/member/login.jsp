<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="../../multimarket/resources/css/login.css" rel="stylesheet" type="text/css">
<style >

.login {
	background-color: #FFFFFF;
}
</style>

   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
   <%@include file="../include/nav.jsp" %>


<div class="login">
	<h1 style="text-align: center">로그인</h1>
	<br>
    <form method="post" name="myform" id="myform">
    	<input type="text" name="userid" placeholder="아이디" required="required" />
        <input type="password" name="pw" placeholder="비밀번호" required="required" style="background-color:white"/>
        	<br/><br>
	        <button type="button" class="btn btn-primary btn-block btn-large" onclick="goLogin()" >로그인</button>
	        <br/>
			<div id="head_link" style=" float:left;font-size:0.75em;">
                    <ul style="list-style:none;">
                   <li style="float:left;padding:0 8px;border-right:1px solid #999"><a href="<%=request.getContextPath() %>/member/findid">아이디 찾기 </a></li>
                     <li style="float:left;padding:0 8px;border-right:1px solid #999"><a href="<%=request.getContextPath() %>/member/findpw">비밀번호 찾기</a></li>
                    <li style="float:left;padding:0 8px;border-right:1px solid #999"> <a href="<%=request.getContextPath() %>/member/register">회원가입</a></li>
                    </ul>
            </div>
            
    </form>

</div>
</body>
</html>

<script>

function goLogin(){
	
	var frmData = new FormData(document.myform);
	   console.log( frmData );
	      
	   $.ajax({
	      url:"<%=request.getContextPath() %>/member/login_proc",
	      data:frmData,
	      contentType:false,
	      processData:false,
	      type:"POST",
	   })
	   .done( (result)=>{
	      	if(result.flag=="1")
			{
	      		alert("로그인 성공");
	      		location.href="<%=request.getContextPath() %>/";
			}
	      	else if(result.flag=="2")
	      	{
	      		alert("아이디를 찾을 수 없습니다.");
	      	}
	      	else  
	      	{
	      		alert("패스워드가 일치하지 않습니다.");	
	      	}
	   })
	   .fail( (error)=>{
	      console.log(error);
	   })
	}

function goFindid(){
	
	location.href="<%=request.getContextPath() %>/member/findid"; 

}

function goFindpw(){
	location.href="<%=request.getContextPath() %>/member/findpw";
}

function goRegister(){
	location.href="<%=request.getContextPath() %>/member/register";
}


</script>