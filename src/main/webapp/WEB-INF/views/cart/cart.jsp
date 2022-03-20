<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="com.project.multimarket.cart.*" %>
   <%@page import="java.util.*" %>
  
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
</head>
<body>
<form name="myform" id="myform">
<input type="hidden" id="cart_id" name="cart_id" value="">
<input type="hidden" id="userid" name="userid" value="">
<input type="hidden" id="num" name="num" value="">
<%@include file="../include/nav.jsp" %>

<%List<CartDto> list = (List<CartDto>)request.getAttribute("cartList"); %>

<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">장바구니</h1>
     </div>
</section>

<div class="container mb-4">
    <div class="row">
        <div class="col-12">
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col"> </th>
                            <th scope="col">제품명</th>
                            <th scope="col">재고</th>
                            <th scope="col">사이즈</th>
                            <th scope="col" class="text-center">수량</th>
                            <th scope="col" class="text-right">가격</th>
                            
                            <th> </th>
                        </tr>
                    </thead>
                    <tbody>
                    	<% for(CartDto cart : list){ %>
                        <tr>
                            <td><img style="width:50px; height:50px" src="<%=request.getContextPath()%>/resources/shoes/<%=cart.getProduct_image() %>" /> </td>
                            <td onclick="goView(<%=cart.getProduct_num()%>)"><%=cart.getProduct_name() %></td>
                            <td><%=cart.getProduct_quantity() %></td>
                            <td class="text-right" id="size"><%=cart.getSize() %></td>
                            
                         	<td>
	                         	<div class="center">
									<div class="input-group">
			                            <span class="input-group-btn">
											    <button type="button" class="btn btn-default btn-number" id="minus" name="minus" data-type="minus" onclick="minus1(<%=cart.getCart_id()%>)">
											           <span class="glyphicon glyphicon-minus">ㅡ</span>
											              </button>
										</span>
										<input type="text" id="amount<%=cart.getCart_id() %>" name="amount" class="form-control-sm input-number" value="<%=cart.getAmount() %>" min="1" max="100" style="text-align:center">
										     <span class="input-group-btn">
										        <button type="button" class="btn btn-default btn-number" data-type="plus" data-field="quant[1]" id="plus" name="plus" onclick="plus1(<%=cart.getCart_id()%>)">
										              <span class="glyphicon glyphicon-plus">+</span>
										        </button>
										   </span>
									</div>
								</div>
							</td>
                            <td class="text-right" id="price<%=cart.getCart_id()%>" name="price"><%=cart.getPrice() %></td>
                            <td class="text-right"><button class="btn btn-sm btn-danger" id="delete" onclick="goDelete('<%=cart.getCart_id()%>')"><i class="fa fa-trash"></i> </button> </td>
                        </tr>
  
                        <%} %>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>소계</td>
                            <td></td>
                            <td class="text-right" id="subtotal"></td>
                            
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>배송비</td>
                            <td></td>
                            <td class="text-right" id="shipping"></td>
                            
                        </tr>
                        <tr>
                            <td></td>
                            <td>  <button type="button" class="btn btn-danger" onclick="goDeleteAll('<%=userid%>')">장바구니 비우기</button></td>
                            <td></td>
                            <td></td>
                            <td style="color:red"><strong>Total</strong></td>
                            <td></td>
                            <td class="text-right" id="totalprice" style="font-weight:bold; color:red; font-size:16px"></td>
                            
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col mb-2">
            <div class="row">
                <div class="col-sm-12  col-md-6">
                    <button class="btn btn-block btn-light" onclick="goList()">계속 쇼핑하기</button>
                </div>
                <div class="col-sm-12 col-md-6 text-right">
                    <button class="btn btn-lg btn-block btn-success text-uppercase" onclick="goPay()">결제하기</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="py-5 bg-danger">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; MultiMarket 2022</p></div>
        </footer>
</form>
</body>
</html>

<script>

window.onload=function(){
	
	var sum=0;
	var arr = document.getElementsByName("price");
	console.log("price------------------" + arr.length);
	var arr1 = document.getElementsByName("amount");
	for(var i=0; i<arr.length; i++) {
		var price = parseInt(arr[i].innerHTML);
		var amount = parseInt(arr1[i].value);
			//for(var j=0; j<arr1.length; j++){
			//}
		var total = amount* price;
		console.log("total--------------------------------------"+total);
		sum += total;
		console.log("sum-------------"+sum);
	}
		document.getElementById("subtotal").innerText = sum;
		var subtotal = parseInt(document.getElementById("subtotal").innerText);
		console.log("subtotal-------------"+subtotal);
		var shipping = document.getElementById("shipping").innerHTML;
		console.log("shipping-------------"+shipping);
		var totalprice = document.getElementById("totalprice").innerHTML;
		console.log("totalprice-------------"+totalprice);
		
		if(subtotal>100000){
			var shipping = "0원";
			 document.getElementById("shipping").innerHTML= shipping;
			console.log("shipping-------------"+shipping);
			var totalprice =subtotal;
			document.getElementById("totalprice").innerHTML=totalprice;
			console.log("totalprice-------------"+totalprice);
		}
		else{
			var shipping = "2500원";
			 document.getElementById("shipping").innerHTML= shipping;
			console.log("shipping-------------"+shipping);
			var totalprice =subtotal;
			document.getElementById("totalprice").innerHTML=totalprice;
			console.log("totalprice-------------"+totalprice);

		}
		

}

function minus1(id){
	
	var sum = 0;
	var price = parseInt(document.getElementById("price"+id).innerText);
	console.log("price------------------" + price);
	var amount = parseInt(document.getElementById("amount"+id).value);
	console.log("amount-----------------" + amount);
	if(amount-1>0) document.getElementById("amount"+id).value=amount-1;
	total(id);
}

function plus1(id){
	
	var sum = 0;
	var price = parseInt(document.getElementById("price"+id).innerText);
	console.log("price------------------" + price);
	var amount = parseInt(document.getElementById("amount"+id).value);
	console.log("amount-----------------" + amount);
	
	amount = amount+1;
	console.log("plus1-amount--->"+amount);
	document.getElementById("amount"+id).value=amount;
	
	total(id);
}

function total(id){
	var sum = 0;
	var arr = document.getElementsByName("price");
	console.log("price------------------" + arr.length);
	var arr1 = document.getElementsByName("amount");
	console.log("amount-----------------" + arr1.length);
	for(var i=0; i<arr.length; i++) {
		var price = parseInt(arr[i].innerHTML);
		var amount = parseInt(arr1[i].value);
			//for(var j=0; j<arr1.length; j++){
			//}
		console.log("price"+id+"------------------------------------"+price);
		console.log("amount"+id+"---------------------------------"+amount);
		var total = amount* price;
		console.log("total--------------------------------------"+total);
		sum += total;
	}

	console.log(sum);

	document.getElementById("subtotal").innerText=sum;
	
	if(sum<100000){
		document.getElementById("shipping").innerHTML="2500원";
		//var totalprice = document.getElementById("subtotal").innerText;
		var totalprice = sum+2500;
		document.getElementById("totalprice").innerHTML=totalprice;
	} else {
		document.getElementById("shipping").innerHTML="0원";
		//var totalprice = document.getElementById("subtotal").innerText;
		var totalprice = sum;
		document.getElementById("totalprice").innerHTML=totalprice;
	}
	
}



function goList(){
	
	location.href="<%=request.getContextPath() %>/product/brand/Nike"; 
}

function goPay(){
	
	if(confirm('구매하시겠습니까?')){
		alert("구매를 완료하였습니다.");
		location.href="<%=request.getContextPath() %>/";
	}
	else{
		alert("구매를 취소하였습니다.");
	}
	
}

function goDelete(cart_id){
	
 	var frm = document.myform;
 	frm.cart_id.value = cart_id; 
 	frm.action = "<%=request.getContextPath() %>/cart/delete";
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

function goView(num){
	
	var frm = document.myform;
	frm.num.value=num;
	frm.method="get";
	frm.action= "<%=request.getContextPath()%>/product/view";
	frm.submit();
}

</script>