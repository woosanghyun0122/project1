<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.project.multimarket.product.*" %>
  <%@page import="com.project.multimarket.common.*" %>
 <%@page import="java.util.*" %>
 

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Multimarket</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
		<link href="/../multimarket/resources/css/product_list.css" rel="stylesheet" type="text/css">
		
		    <style>
		    	body { padding: 0; margin: 0; width: 100%; } 
		  		  .img-wrapper { position: relative; width: 270px; height: 200px; }
		
				.img-wrapper img { position: absolute; top: 0; left: 0; transform: translate(50, 50); width: 100%; height: 100%; object-fit: cover; margin: auto; }
		
		    
		    </style>
    </head>
    <body>
    <%
    	String num = StringUtil.nullToValue(request.getParameter("num"), "");
    %>
    <%
    	int totalCnt = (Integer)request.getAttribute("totalCnt");
   		List<ProductDto> list = (List<ProductDto>)request.getAttribute("adidasList");
    %>
	
	<%@include file="../include/nav.jsp" %>
        <form name="myform">
        <input type="hidden" name="num" id="num" value=""/>
           <div class="text-center text-black">
               <h1 class="display-4 fw-bolder">Adidas (${totalCnt})</h1>
               <br>
   <nav class="navbar navbar-expand-lg navbar-white bg-white" aria-label="Tenth navbar example">
    <div class="container-fluid">

      <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
        <ul class="navbar-nav">
          <li class="nav-item">
           <a class="nav-link" href="<%=request.getContextPath()%>/product/brand/Nike" style="font-size:xx-large;color:silver">Nike &nbsp;/</a>&nbsp;&nbsp;&nbsp;
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=request.getContextPath()%>/product/brand/Adidas" style="font-size:xx-large;color:silver">Adidas &nbsp;/</a>&nbsp;&nbsp;&nbsp;
          </li>
           <li class="nav-item">
            <a class="nav-link" href="<%=request.getContextPath()%>/product/brand/NewBalance" style="font-size:xx-large;color:silver">New Balance</a>&nbsp;&nbsp;&nbsp;
          </li>         
        </ul>
      </div>
    </div>
  </nav>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                
                
                <%for(ProductDto dto : list){ %> 
	                    <div class="col mb-3">
	                    	
	                        <div class="card h-60">
	                            <!-- Product image-->
	                            <div class="card-img-top" style="height:200px;">
		                            <div class="img-wrapper">
		                            	<img src="<%=request.getContextPath()%>/resources/shoes/<%=dto.getImage() %>"  alt="..." />
		                            </div>
	                            </div>
	                            <!-- Product details-->
	                            <div class="card-body p-4">
	                                <div class="text-center">
	                                    <!-- Product name-->
	                                    <p class="fw-bolder" style="font-weigth:bold; font-size:15px; height:80px"><%=dto.getName() %></p>
	                                    <!-- Product price-->
	                                   <h5><%=dto.getPrice() %> 원</h5> 
	                                </div>
	                            </div>
	                            <!-- Product actions-->
	                             	<button type="button" class="btn btn-secondary" onclick="goView('<%=dto.getNum()%>')">제품 상세보기</button>
	                        </div>
	                    </div>
                    <%} %>
                    
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