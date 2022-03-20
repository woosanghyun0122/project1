<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.project.multimarket.common.*" %>
  <%@page import="com.project.multimarket.product.*" %>
 <%@page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>MultiMarket</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
      <link href="/../multimarket/resources/css/carousel.css" rel="stylesheet">
  
</head>
<body>
	<%@include file="../include/nav.jsp" %>
	
	<%List<ProductDto> list = (List<ProductDto>)request.getAttribute("relatedItemsList");
		List<ProductDto> list1 = (List<ProductDto>)request.getAttribute("mainList");
	%>
	
<!-- Carousel -->
<div id="demo" class="carousel slide" data-bs-ride="carousel">

  <!-- Indicators/dots -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
  </div>
  
  <!-- The slideshow/carousel -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <a href="<%=request.getContextPath()%>/product/list/o"><img src="<%=request.getContextPath()%>/resources/images/main1.jpeg" alt="main1" class="d-block" style="width:100%;height:100%" ></a>
    </div>
    <div class="carousel-item">
      <a href="<%=request.getContextPath()%>/product/brand/Adidas"><img src="<%=request.getContextPath()%>/resources/images/main2.jpeg" alt="main2" class="d-block" style="width:100%;height:100%"></a>
    </div>
    <div class="carousel-item">
      <a href="<%=request.getContextPath()%>/product/brand/Nike"><img src="<%=request.getContextPath()%>/resources/images/main3.jpeg" alt="main3" class="d-block" style="width:100%"></a>
    </div>
  </div>
  
  <!-- Left and right controls/icons -->
  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>

<div class="container marketing">
	
	<h1 style="text-align:center">Best Brand</h1><br>
    <!-- Three columns of text below the carousel -->
    <div class="row">
      <div class="col-lg-4">
        <h2>Nike</h2>
      	
        <img src="<%=request.getContextPath()%>/resources/images/nike.png" style="width:100px;height:100px">
		<br><br>
        <p><a class="btn btn-secondary" href="<%=request.getContextPath()%>/product/brand/Nike">View details &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <h2>Adidas</h2>
      	
        <img src="<%=request.getContextPath()%>/resources/images/adidas.jpeg" style="width:100px;height:100px">
		<br><br>
        <p><a class="btn btn-secondary" href="<%=request.getContextPath()%>/product/brand/Adidas">View details &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
          <h2>New Balance</h2>
      	
        <img src="<%=request.getContextPath()%>/resources/images/newbalance.jpeg" style="width:100px;height:100px">
		<br><br>
        <p><a class="btn btn-secondary" href="<%=request.getContextPath()%>/product/brand/NewBalance">View details &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->


    <!-- START THE FEATURETTES -->
<form id="myform" name="myform">
	<input type="hidden" id="num" name="num" value="">
    <hr class="featurette-divider">
			<h1 style="text-align:center;font-weight:25px">MD'S PICK</h1>
            <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                	<%for(ProductDto pdto : list){ 
                		
                	%>
                     <div class="col mb-3">
	                    	
	                        <div class="card h-60">
	                            <!-- Product image-->
	                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">인기</div>
	             	            <div class="card-img-top" style="height:200px; background-image:url('<%=request.getContextPath()%>/resources/shoes/<%=pdto.getImage() %>'); background-repeat: no-repeat; background-size:100% 100%">
	                            </div>
	                            <!-- Product details-->
	                            <div class="card-body p-4">
	                                <div class="text-center">
	                                    <!-- Product name-->
	                                    <p class="fw-bolder" style="font-weigth:bold; font-size:15px;height:80px"><%=pdto.getName() %></p>
	                                    <!-- Product price-->
	                                   <h5><%=pdto.getPrice() %> 원</h5> 
	                                </div>
	                            </div>
	                            <!-- Product actions-->
	                             	<button type="button" class="btn btn-secondary" onclick="goView('<%=pdto.getNum()%>')">제품 상세보기</button>
	                        </div>
	                    </div>
                      <%
                		} %>
                		
                </div>
            </div>
        </section>

    <hr class="featurette-divider">
		<h1 style="text-align:center;font-weight:25px">NEW ARRIVAL</h1>
			
            <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                
                
                <%for(ProductDto pdto : list1){ %> 
	                    <div class="col mb-3">
	                    	
	                        <div class="card h-60">
	                            <!-- Product image-->
	             	            <div class="card-img-top" style="height:200px; background-image:url('<%=request.getContextPath()%>/resources/shoes/<%=pdto.getImage() %>'); background-repeat: no-repeat; background-size:100% 100%">
	                            </div>
	                            <!-- Product details-->
	                            <div class="card-body p-4">
	                                <div class="text-center">
	                                    <!-- Product name-->
	                                    <p class="fw-bolder" style="font-weigth:bold; font-size:15px;height:80px"><%=pdto.getName() %></p>
	                                    <!-- Product price-->
	                                   <h5><%=pdto.getPrice() %> 원</h5> 
	                                </div>
	                            </div>
	                            <!-- Product actions-->
	                             	<button type="button" class="btn btn-secondary" onclick="goView('<%=pdto.getNum()%>')">제품 상세보기</button>
	                        </div>
	                    </div>
                    <%} %>
                    
                </div>
            </div>
        </section>
</form>
    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->

  </div><!-- /.container -->


  <!-- FOOTER -->
        <footer class="py-5 bg-danger">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; MultiMarket 2022</p></div>
        </footer>
</main>



      
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

</script>
