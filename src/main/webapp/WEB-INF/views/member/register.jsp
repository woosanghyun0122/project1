<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.project.multimarket.member.*" %>
 <%@page import="com.project.multimarket.common.*" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="../../multimarket/resources/css/nav.css" rel="stylesheet" type="text/css">
    
     <style type="text/css">
        * { margin:0; padding:0; vertical-align:middle; }
        body {font-family: Arial, Helvetica, sans-serif;padding:10px;}
        form .input1 { border:2px hsl(0, 100%, 50%) solid; width:200px; height:20px }
        
        </style>
</head>
<body>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<!------ Include the above in your HEAD tag ---------->
<% MemberDto dto = (MemberDto)request.getAttribute("memberDto") ;%>

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
                     <li><a href="${commonURL}/member/myinfo">내정보</a></li>
                     <li><a href="${commonURL}/member/logout">로그아웃</a></li>
                    <li><a href="${commonURL}/cart/list">장바구니</a></li>
                    <li><a href="${commonURL}">홈으로</a></li>
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
<section>
<form class="form-horizontal" name="myform" id="myform">
<h1 style="padding-top:10px;text-align:center; margin-top:10px">회원가입</h1>
<fieldset>
<div style="text-align: center">

<% if(dto.getUserid().equals("")) {%>
<div class="form-group">
  <input type="hidden" name="idcheck" id="idcheck" value="N">
  <label class="col-md-4 control-label" for="fn">아이디</label>  
  <div class="col-md-4">
   <div class="input-group">
  <input id="userid" name="userid" type="text" placeholder="아이디" class="form-control input-md" required="" >
    <span class="input-group-btn">
    <button class="btn btn-success" type="button" id="btnDuplicate">중복체크</button> 
    </span>
    </div>
  </div>
</div>
<%}else { %>
  <input type="hidden" name="idcheck" id="idcheck" value="Y">
  <label class="col-md-4 control-label" for="fn">아이디</label>  
  <div class="col-md-4">
  <input id="userid" name="userid" type="text" placeholder="아이디" class="form-control input-md" required="" value="<%=dto.getUserid()%>" readonly>
  </div>
<%} %>

<div class="form-group">
  <label class="col-md-4 control-label" for="fn">비밀번호</label>  
  <div class="col-md-4">
  <input id="pw" name="pw" type="password" placeholder="비밀번호" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Form Name -->

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="fn">이름</label>  
  <div class="col-md-4">
  <input id="username" name="username" type="text" placeholder="이름" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="phone">핸드폰 번호</label>  
  <div class="col-md-4">
  <input id="phone" name="phone" type="text" placeholder="핸드폰 번호" class="form-control input-md" required="">
    
  </div>
</div>


<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" >생년월일</label>  
  <div class="col-md-4">
  <input id="birthday" name="birthday" type="text" placeholder="생년월일" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="email">이메일</label>  
  <div class="col-md-4">
  <input id="email" name="email" type="text" placeholder="email" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="zip">우편번호</label>  
  <div class="col-md-4">
  <input id="zipcode" name="zipcode" type="text" placeholder="우편번호" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="address">주소</label>  
  <div class="col-md-4">
  <input id="address" name="address" type="text" placeholder="주소" class="form-control input-md" required="">
    
  </div>
</div>





<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="selectbasic">선호하는 신발사이즈</label>
  <div class="col-md-4">
    <select id="selectbasic" name="selectbasic" class="form-control input-md">
      <option>200 </option>
      <option>210 </option>
      <option>220 </option>
      <option>230 </option>
      <option>240 </option>
      <option>250 </option>
      <option>260 </option>
      <option>270 </option>
      <option>280 </option>
      <option>290</option>
    </select>
  </div>
</div>

</fieldset>
  <div class="col-md-4" style="text-align:center; padding-left:670px" >
    <button type="button" class="btn btn-primary" onclick="goRegister()">회원가입완료</button>
  </div>
</form>
</section>
<br><br><br>
        <footer class="py-5 bg-danger">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; MultiMarket 2022</p></div>
        </footer>

</body>
</html>
<script>

$(()=>{
	$("#btnDuplicate").click(()=>{
		$.ajax({
			url:"<%=request.getContextPath() %>/member/isDuplicate",
			data:{userid:$("#userid").val()},
			dataType:"json",
			type:"POST"
		})
		.done((data)=>{
			console.log(data.result);
			if(data.result=="true"){
				alert("이미 사용중인 아이디입니다.");
			}
			else{
				alert("사용가능합니다.")
				$("#idcheck").val("Y");
				$("#userid").prop("readonly",true);
			}
		})
		.fail((error)=>{
			console.log(error);
		})
	})
})



function goRegister(){
	
	   var frmData = new FormData(document.myform);
	   console.log( frmData );
	   var userid='<%=dto.getUserid()%>';
	   if (userid =='')
	   {
		   url="<%=request.getContextPath() %>/member/insert";	 
		   msg="회원가입이 되었습니다.";
	   }
	   else
	   {
		   url="<%=request.getContextPath() %>/member/update";
		   msg="회원 정보가 수정되었습니다."
	   }   
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
	      location.href="<%=request.getContextPath() %>/"; //시작화면으로 이동하기
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
