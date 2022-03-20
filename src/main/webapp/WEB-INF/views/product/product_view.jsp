<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.project.multimarket.product.*" %>
  <%@page import="com.project.multimarket.member.*" %>
    <%@page import="com.project.multimarket.favorite.*" %>
  
 <%@page import="java.util.*" %>
<!DOCTYPE html>
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>MultiMarket - 제품 상세보기</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="#" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        
        <!-- Core theme CSS (includes Bootstrap)-->
		<link href="../../multimarket/resources/css/product_view.css" rel="stylesheet" type="text/css">
		
		    <style>
		    	body { padding: 0; margin: 0; width: 100%; } 
		  		  .img-wrapper { position: relative; width: 270px; height: 200px; }
		
				.img-wrapper img { position: absolute; top: 0; left: 0; transform: translate(50, 50); width: 100%; height: 100%; object-fit: cover; margin: auto; }
		
		    
		    
		    </style>
		
    </head>
    <body>
    


    
        <!-- Navigation-->
	<%@include file="../include/nav.jsp" %>
	<% 
	
		ProductDto dto = (ProductDto)request.getAttribute("productDto"); 
		List<ProductDto> list = (List<ProductDto>)request.getAttribute("relatedItemsList");

	    MemberDto memberDto = null;
		if(!userid.isBlank())
			memberDto = (MemberDto)request.getAttribute("memberDto");
	%>

<form id="myform" name="myform">
		<input type="hidden" name="userid" id="userid" value="<%=userid%>">
		<input type="hidden" name="product_num" id="product_num" value="<%=dto.getNum() %>">
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="<%=request.getContextPath()%>/resources/shoes/<%=dto.getImage() %>" alt="..." /></div>
                    <div class="col-md-6">
                        <div class="medium mb-3"><%=dto.getBrand() %></div>
                        <h1 class="display-5 fw-bolder"><%=dto.getName() %></h1><br>
                        
                        <div class="fs-5 mb-5" style="margin:0 0 0 0">
                       <p>재고 : <%=dto.getQuantity() %></p>
                       
                     	  <div class="col-md-4">
							  <span> 사이즈</span> 
							  <select id="size" name="size" class="form-control input-md">
							      <option value="200">200 </option>
							      <option value="210">210 </option>
							      <option value="220">220 </option>
							      <option value="230">230 </option>
							      <option value="240">240 </option>
							      <option value="250">250 </option>
							      <option value="260">260 </option>
							      <option value="270">270 </option>
							      <option value="280">280 </option>
							      <option value="290">290</option>
							    </select>
							    <br>
							  </div>
							  <p>입고일:&nbsp; <%=dto.getIn_date() %></p>
							  <p>배송지역: &nbsp;&nbsp;<%= memberDto != null ? memberDto.getAddress() : "" %></p>
							   <div class="center">
							  <div class="input-group">

								  		<p>수량: &nbsp;</p>
								          <span class="input-group-btn">
								              <button type="button" class="btn btn-default btn-number" id="minus" name="minus" data-type="minus" onclick="minus1()">
								                  <span class="glyphicon glyphicon-minus">ㅡ</span>
								              </button>
								          </span>
							          <input type="text" id="amount" name="amount" class="form-control-sm input-number" value="1" min="1" max="100" style="text-align:center">
							          <span class="input-group-btn">
							              <button type="button" class="btn btn-default btn-number" data-type="plus" data-field="quant[1]" id="plus" name="plus" onclick="plus2()">
							                  <span class="glyphicon glyphicon-plus">+</span>
							              </button>
							          </span>
						      </div>
						      </div>
						      
						      </div>
						      </div>
							  <hr>
							  <div style="display:block">
							  <p style="text-align:center;padding-left:235px;font-weight:bold;font-size:20px"> 총 결제금액 
							  <span style="color:red;font-weight:bold;font-size:30px;float:right" id="totalprice"><%=dto.getPrice() %>원</span></p><br>
							  </div>
                        	<div class="d-flex justify-content-end">
  							<a class="btn icon-btn btn-danger" href="javascript:goFavorite();"><span class="glyphicon btn-glyphicon glyphicon-thumbs-up img-circle text-dagner" style="float:left;font-size:50px">
  							</span>&#9829;</a> &nbsp;                 
                            <button class="btn btn-outline-dark flex-shrink-0" type="button" onclick="goCart()">
                                <i class="bi-cart-fill me-1"></i>
                                Add to cart
                            </button>
                             &nbsp; 
                            <button type="button" class="btn btn-primary" onclick="goCalc()">구매하기</button>
                            
                        </div>
                        
                    </div>
                </div>
            </div>
        </section>
        <!-- Related items section-->
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">Related products</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                	<%for(ProductDto pdto : list){ 
                		
                	%>
                      <div class="col mb-3">
                        <div class="card h-60">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">인기</div>
                            <!-- Product image-->
		                     <div class="img-wrapper">
                            <a href="<%=request.getContextPath() %>/product/view?num=<%=pdto.getNum() %>">
                            <img class="card-img-top" src="<%=request.getContextPath()%>/resources/shoes/<%=pdto.getImage() %>" onclick="goView('<%=pdto.getNum()%>')" alt="..." /></a>
                            </div>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
  									 <p class="fw-bolder" style="font-weigth:bold; font-size:15px"><%=pdto.getName() %></p>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <h5><%=pdto.getPrice() %>원</h5>
                                </div>
                            </div>
                    
                      </div>
                     </div>
                      <%
                		} %>
                		
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-danger">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; MultiMarket 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <!-- Core theme JS-->
        </form>

    </body>
</html>
<script>

function goPrice(){
	
	
	//var amount = document.getElementById('amount');
	//var price = <%=dto.getPrice()%>;
	//var total = parseInt(amount) * parseInt(price);
	//document.getElementById("total").innerText = totalprice;
	
}

function goCalc(){
	

	if(confirm('구매하시겠습니까?')){
		alert("구매를 완료하였습니다.");
	}
	else{
		alert("구매를 취소하였습니다.");
	}
}

function minus1()
{
	let now = parseInt(document.getElementById("amount").value);
	if(now-1>0) document.getElementById("amount").value=now-1;
	
	//var price= <%=dto.getPrice()%>;
	var total = (now-1) * parseInt(price);
	document.getElementById("totalprice").innerText=total+"원";

	
}

function plus2()
{
	let now = parseInt(document.getElementById("amount").value);
	document.getElementById("amount").value=now+1;
	
	var price= <%=dto.getPrice()%>;
	var total = (now+1) * parseInt(price);
	
	document.getElementById("totalprice").innerText=total+"원";
}



function goCart(){
		if(confirm("장바구니에 담으시겠습니까?")){
		const userid = '<%=userid%>';
		
		console.log();
		if(userid== ""){
			alert("로그인이 필요합니다.");
			location.href="<%=request.getContextPath()%>/member/login";
		}
		else{
			if(confirm("장바구니로 이동하시겠습니까?")){
			let frm = document.myform;
			frm.action = "<%=request.getContextPath()%>/cart/insert";
			frm.method="get";
			frm.submit();
			}
			else{
				location.href="<%=request.getContextPath()%>/product/list/m";
			}
		}
	}
}

function goFavorite(){
	
	if(confirm("좋아요 목록에 추가하시겠습니까?")){
		const userid = '<%=userid%>';
		
		if(userid== ""){
			alert("로그인이 필요합니다.");
			location.href="<%=request.getContextPath()%>/member/login";
		}
		else{
			$.ajax({
				url:"<%=request.getContextPath() %>/favorite/isDuplicate",
				data:{product_num:$("#product_num").val()},
				dataType:"json",
				type:"POST"
			})
			.done((data)=>{
				console.log(data.result);
				if(data.result=="true"){
					alert("이미 선택되어 있는 상품입니다.");
				}
				else{
					
				
					if(confirm("좋아요 목록으로 이동하시겠습니까?")){
						let frm = document.myform;
						frm.action = "<%=request.getContextPath()%>/favorite/insert";
						frm.method="get";
						frm.submit();
						}
						else{
							location.href="<%=request.getContextPath()%>/";
							}
				}
			})
			.fail((error)=>{
				console.log(error);
			})
		}
	}
	
}


</script>
