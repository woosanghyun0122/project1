<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
	<h1 style="text-align: center">비밀번호찾기</h1>
    <form method="post" name="myform" id="myform">
    <input type="hidden" name="idcheck" id="idcheck" value="N"/>
    
    	<input type="text" name="userid" placeholder="아이디" required="required" style="background-color: #FFFFFF"/>
    	<input type="text" name="username" placeholder="이름" required="required" style="background-color: #FFFFFF"/>
        <input type="text" name="phone" placeholder="전화번호" required="required" style="background-color: #FFFFFF"/>
        
	        <button type="button" class="btn btn-primary btn-block btn-large" onclick="goFindpw()" >비밀번호찾기</button>
	        <br/>

 		 <div class="input-group mb-3">
     	<div id="result"> </div>
    </div>
        
    </form>
</div>
</body>
</html>
</html>


<script>

function goFindpw(){
	console.log("findpw");
	var frmData = new FormData(document.myform);
	console.log( frmData );
	
	$.ajax({
		url:"<%=request.getContextPath() %>/member/findpw_proc",
		data:frmData,
		contentType:false,
		processData:false,
		type:"POST",
	})
	.done((result)=>{
		if(result.result=="fail"){
			alert("비밀번호를 찾을 수 없습니다.")
		}
		else{
			$("#result").html("비밀번호는 <strong>" + result.result +"</strong> 입니다.");
		}
	})
	.fail( (error)=>{
		console.log(error);
	})
	
} 

</script>