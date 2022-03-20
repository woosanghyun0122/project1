<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="com.project.multimarket.favorite.*" %>
   <%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Favorite</title>

	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link href="../../multimarket/resources/css/favorite.css" rel="stylesheet" type="text/css">
	
</head>
<body>
<!------ Include the above in your HEAD tag ---------->
	<%@include file="../include/nav.jsp" %>
	<%
		List<FavoriteDto> list = (List<FavoriteDto>)request.getAttribute("favoriteList");
		int totalCnt = (Integer)request.getAttribute("totalCnt");
	%>
<!-- Team -->
<section id="team" class="pb-5">
     <form name="myform" id="myform">
     	<input type="hidden" name="num" id="num" value=""/>
     	<input type="hidden" name="favorite_id" id="favorite_id" value=""/>
        <input type="hidden" name="userid" id="userid" value=""/>
    <div class="container">
        <h5 class="section-title h1">좋아요 (${totalCnt})</h5>
        <div class="row">

        
            <!-- Team member -->
            <% for(FavoriteDto dto : list){ %>
            <div class="col-xs-12 col-sm-6 col-md-4" style="float:left">
                <div class="image-flip" >
                    <div class="mainflip flip-0">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                	<h5 style="float:left"><%=dto.getProduct_brand() %></h5><br><br>
                                    <p><img class=" img-fluid" src="<%=request.getContextPath()%>/resources/shoes/<%=dto.getProduct_image() %>"  alt="card image"></p>
                                    <h4 class="card-title" onclick="goView('<%=dto.getProduct_num()%>')"><%=dto.getProduct_name() %></h4><br>
                                    <p class="card-text" style="font-weight:bold"><%=dto.getPrice() %> 원</p>
                                    <button class="btn btn-sm btn-danger" id="delete" onclick="goDelete('<%=dto.getFavorite_id()%>')"><i class="fa fa-trash"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ./Team member -->
			<%} %>
			<br>
        </div>
        			     <button type="button" style="float:right" class="btn btn-danger" onclick="goDeleteAll('<%=userid%>')">목록 비우기</button>
        
    </div>
    
</section>
<!-- Team -->
</form>
</body>
</html>

<script>

function goView(num){
	
	var frm = document.myform;
	frm.num.value=num;
	frm.method="get";
	frm.action= "<%=request.getContextPath()%>/product/view";
	frm.submit();
}

function goDelete(favorite_id){
	
 	var frm = document.myform;
 	frm.favorite_id.value = favorite_id; 
 	frm.action = "<%=request.getContextPath() %>/favorite/delete";
 	frm.submit();
	
}

function goDeleteAll(userid){
	
	alert("모두 삭제하시겠습니까?");
	var frm = document.myform;
	frm.userid.value=userid;
	console.log(userid);
 	frm.action = "<%=request.getContextPath() %>/favorite/deleteall";
 	frm.submit();
}
</script>