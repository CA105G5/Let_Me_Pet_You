<%@page import="java.util.List"%>
<%@page import="com.prod.model.ProdService"%>
<%@page import="com.prod.model.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
	
<%
	List<ProdVO> prodReviewList;
	prodReviewList = (List<ProdVO>) request.getAttribute("prodReviewList");
	if (prodReviewList==null){
		ProdService prodSvc = new ProdService(); 
		prodReviewList = prodSvc.getAll();
		pageContext.setAttribute("prodReviewList", prodReviewList);
		request.setAttribute("Test", "Test");
		System.out.println("prodReviewList= " + prodReviewList);
	}
	String tab = (String) request.getAttribute("tab");
	System.out.println("tab=" + tab);
	Integer tab_int = null;
	if (tab==null){
		tab="1";
		tab_int = new Integer(tab);
	}
%>	

<jsp:useBean id="prodImgSvc" scope="page" class="com.prodimg.model.ProdImgService" />
<jsp:useBean id="rescueSvc" scope="page" class="com.rescue.model.RescueService" />
	
	
<!doctype html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>浪我陪你-後台-愛心商品管理</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
<%--     <link rel="stylesheet" href="<%=request.getContextPath()%>/backend_UI_template/assets/css/lib/datatable/dataTables.bootstrap.min.css"> --%>
<!--     <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'> -->
    
<!--     <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

<!--     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script> -->

	
	<!-- 若要使用fai那版外掛icon，要import CDN，快捷鍵facdn=>tab -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- https://fontawesome.com/ 自己的css-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP"
	crossorigin="anonymous">
	
	
<!--     加上審核彈跳modal -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!--     加上審核彈跳modal -->

	
    

	<!-- w3 CSS tabs -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<!-- w3 CSS tabs -->


    
<!-- datatable -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/backend_UI_template/assets/css/lib/datatable/dataTables.bootstrap.min.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
<!-- datatable -->

    
<!-- sweetAlert -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>
    


   <style>
   
	* {box-sizing:border-box}
	
	/* Slideshow container */
	.slideshow-container {
	  max-width: 1000px;
	  position: relative;
	  margin: auto;
	}
	
	/* Hide the images by default */
	.mySlides {
	  display: none;
	}
	
	/* Next & previous buttons */
	.prev_slide, .next_slide {
	  cursor: pointer;
	  position: absolute;
	  top: 50%;
	  width: auto;
	  margin-top: -22px;
	  padding: 16px;
	  color: white;
	  font-weight: bold;
	  font-size: 18px;
	  transition: 0.6s ease;
	  border-radius: 0 3px 3px 0;
	  user-select: none;
	}
	
	/* Position the "next button" to the right */
	.next_slide {
	  right: 0;
	  border-radius: 3px 0 0 3px;
	}
	
	/* On hover, add a black background color with a little bit see-through */
	.prev_slide:hover, .next_slide:hover {
	  background-color: rgba(0,0,0,0.8);
	}
	
	/* Caption text */
	.text {
	  color: #f2f2f2;
	  font-size: 15px;
	  padding: 8px 12px;
	  position: absolute;
	  bottom: 8px;
	  width: 100%;
	  text-align: center;
	}
	
	/* Number text (1/3 etc) */
	.numbertext {
	  color: #f2f2f2;
	  font-size: 12px;
	  padding: 8px 12px;
	  position: absolute;
	  top: 0;
	}
	
	/* The dots/bullets/indicators */
	.dot {
	  cursor: pointer;
	  height: 15px;
	  width: 15px;
	  margin: 0 2px;
	  background-color: #bbb;
	  border-radius: 50%;
	  display: inline-block;
	  transition: background-color 0.6s ease;
	}
	
	.active, .dot:hover {
	  background-color: #717171;
	}
	
	/* Fading animation */
	.fade {
	  -webkit-animation-name: fade;
	  -webkit-animation-duration: 5s;
	  animation-name: fade;
	  animation-duration: 5s;
	}
	
	@-webkit-keyframes fade {
	  from {opacity: .6} 
	  to {opacity: 1}
	}
	
	@keyframes fade {
	  from {opacity: .6} 
	  to {opacity: 1}
	}
	
/* button click動畫 */ 
.button { 
  display: inline-block; 
  padding: 15px 25px; 
  font-size: 24px; 
  cursor: pointer; 
  text-align: center; 
  text-decoration: none; 
  outline: none; 
  color: #fff; 
  background-color: #4CAF50; 
  border: none; 
  border-radius: 15px; 
  box-shadow: 0 9px #999; 
} 
	
.button:hover {background-color: #3e8e41}
	
.button:active { 
background-color: #3e8e41; 
box-shadow: 0 5px #666; 
transform: translateY(4px); 
} 

/* div.content{ */
/*   overflow-x: scroll; */
/* } */

html {
    overflow-x: scroll; 
    overflow-y: scroll;
  }

</style>
</head>

<body onload="connect()" onunload="disconnect()">
<!-- <body onload="connectRescue()" onunload="disconnectRescue()"> -->

	<jsp:include page="/back-end/manager/back_end_index_header.jsp" flush="true" />
	
 <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
<!--         Header -->
<!--         <header id="header" class="header"> -->
<!--         </header> -->
        
        <!-- Content -->
<!--         <div class="breadcrumbs"> -->
<!--             <div class="breadcrumbs-inner"> -->
<!--                 <div class="row m-0"> -->
<!--                     <div class="col-sm-12"> -->
<!--                         <div class="page-header float-left"> -->
<!--                             <div class="page-title"> -->
<!--                                 <h1>Dashboard</h1> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="col-sm-12"> -->
<!--                         <div class="page-header float-right"> -->
<!--                             <div class="page-title"> -->
<!--                                 <ol class="breadcrumb text-right"> -->
<!--                                     <li><a href="#">Dashboard</a></li> -->
<!--                                     <li><a href="#">Table</a></li> -->
<!--                                     <li class="active">Data table</li> -->
<!--                                 </ol> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
        <div class="content" style="height: 1800px">
            <div class="animated fadeIn">
                <div class="row">

                    <div class="col-xs-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">愛心商品管理</strong>
                            </div>
                            <div class="card-body">
                            
                            
                            
                            
                            
                            <div class="w3-container">

  <div class="w3-row">
    <a href="javascript:void(0)" onclick="openTab(event, 'toBeReviewed');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding w3-border-red"><h4>待審核商品</h4></div>
    </a>
    <a href="javascript:void(0)" onclick="openTab(event, 'reviewed');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding"><h4>上架中</h4></div>
    </a>
  </div>

  <div id="toBeReviewed" class="w3-container city" style="display:''; width:1100px">
 	<p> </p> 
    <table id="bootstrap-data-table2" class="table table-striped table-bordered table-hover" style="width:100%">
													<thead>
<!-- 														<tr class="success"> -->
														<tr>
															<th style="width: 30px">序號</th>
															<th style="width: 100px">照片</th>
															<th>商品編號</th>
															<th>商品名稱</th>
															<th>適用動物</th>
															<th>商品種類</th>
															<th>價格</th>
															<th>捐贈數量</th>
															<th>申請日期</th>
															<th>狀態</th>
															<th>審核</th>
														</tr>
													</thead>
													<tbody>
								
														<% int no=0;%>
														<c:forEach var="prodVO" items="${prodReviewList}">
															<c:if test="${prodVO.prod_review==null}" var="condition" scope="page">
																<% no++; %>
																<tr>
																	<td><%=no %></td>
																	<td><img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${prodVO.prod_id}" alt="" style="margin-bottom: auto"></td>
																	<td style=" margin-bottom: auto">${prodVO.prod_id}</td>
																	<td style=" margin-bottom: auto"><a href="<%=request.getContextPath()%>/product/product_upload.do?action=getOne_For_Display&prod_id=${prodVO.prod_id}">${prodVO.prod_name}</a></td>
																	<td style=" margin-bottom: auto">${prodVO.prod_ani_type_id}</td>
																	<td style=" margin-bottom: auto">${prodVO.prod_type_id}</td>
																	<td style=" margin-bottom: auto">$${prodVO.prod_price}</td>
																	<td style=" margin-bottom: auto">${prodVO.prod_qty}</td>
																	<td style=" margin-bottom: auto"><fmt:formatDate value="${prodVO.prod_date}" pattern="yyyy-MM-dd"/></td>
																	<td style=" margin-bottom: auto">審核中</td>
																	<td>
<%-- 																		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product_upload.do" style="text-align: center; margin-bottom: auto"> --%>
<%-- 																		<input type="hidden" name="whichPage"  value="<%=whichPage%>"> --%>
																		<input type="hidden" name="prod_id"  value="${prodVO.prod_id}">
																		<input type="hidden" name="tab"  value="1">
																		<input type="hidden" name="location"  value="back">
																		<input type="hidden" name="action"	value="getOneModal_For_Display">
																		<input type="submit" value="審核" id="review" class="btn btn-outline-info mb-1" data-toggle="modal" data-target="#${prodVO.prod_id}">
																		<!--改成modal彈跳視窗 -->
<%-- 																		<A href="<%=request.getContextPath()%>/product/product_upload.do?prod_id=${prodVO.prod_id}&action=getOneModal_For_Display">審核</a> --%>
																		<!--改成modal彈跳視窗 -->
<!-- 																		</FORM> -->
																	</td>
																</tr>
								            
								            
								            
								            
								            
								            
<!-- 審核 -->
								            <div class="modal" id="${prodVO.prod_id}" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
								                <div class="modal-dialog modal-lg" role="document">
								                    <div class="modal-content">
								                        <div class="modal-header">
								                            <h3 class="modal-title" id="largeModalLabel"><b style="color:black">商品上架審核</b></h3>
								                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								                                <span aria-hidden="true">&times;</span>
								                            </button>
								                        </div>
								                        <div class="modal-body">
					<div class="form-group col-xs-12 col-sm-12">
						<h3>商品內容</h3>
						<hr>
					</div>
<!-- 						<div class="form-group" style="width:700px"> -->
<!-- 						<div class="form-group col-xs-12 col-sm-12"> -->
<!-- 							<div class="container"> -->
<!-- 								<div class="row"> -->
									<div class="col-xs-12 col-sm-12">
<%-- 										<img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${ordItemVO.prod_id}" alt="" width="200px"> --%>
										
										<!-- Slideshow container -->
										<div class="slideshow-container col-xs-12 col-sm-12" >
												
											<!-- Full-width images with number and caption text -->
											<% int i =1; %> 
											<c:forEach var="prodImgVO" items="${prodImgSvc.getOneProdImg(prodVO.prod_id)}">
												<div class="mySlides<%=no %>" >
			<!-- 							    <div class="mySlides fade"> -->
													<div class="numbertext" style="color:gray"><%=i%>/${prodImgSvc.getOneProdImg(prodVO.prod_id).size()}</div>
													<img src="<%=request.getContextPath()%>/util/PicReader2?prod_img_id=${prodImgVO.prod_img_id}">
													<div class="text"> </div>
												</div>
												<% i++; %>  
											</c:forEach>
													
											<!-- Next and previous buttons -->
											<a class="prev_slide" onclick="plusSlides<%=no %>(-1)">&#10094;</a>
											<a class="next_slide" onclick="plusSlides<%=no %>(1)">&#10095;</a>
										</div>
										<br>
										<br>
												
										<!-- The dots/circles -->
										<div style="display: table; margin: 0 auto;">
			<!-- 						<div style="text-align:center"> -->
											<% int j =1; %> 
											<c:forEach var="prodImgVO" items="${prodImgSvc.getOneProdImg(prodVO.prod_id)}">
												<span class="dot<%=no %> dot" onclick="currentSlide<%=no %>(<%=j%>)"></span> 
												<% j++; %> 
											</c:forEach>
										</div>
									</div>
									<div class="form-group col-xs-12 col-sm-12">
										<hr>
										<h3>${prodVO.prod_name}
											<span style="font-size: 1em; color: Tomato; text-indent:50px;">
												<i class="fas fa-coins"></i>
												<b>${prodVO.prod_price}</b>
											</span>
										</h3>
										<br>
										<h4>商品資訊: <p>${prodVO.prod_info}</p></h4>
										<h4>捐贈數量: ${prodVO.prod_qty}</h4>
										<h4>產品分類: ${prodVO.prod_type_id}</h4>
										<h4>適用動物: ${prodVO.prod_ani_type_id}</h4>
									</div>
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<br> -->
						
<!-- 						<div class="form-group" style="width:700px"> -->
						<div class="form-group col-xs-12 col-sm-12">
						<hr>
							<h3>商品詳情</h3>
							<br>
							${prodVO.prod_des}
						</div>
						
						
<!-- 						<hr> -->
						<br>
							<div class="form-group col-xs-12 col-sm-12">
							<hr>
											<h3>商品審核</h3>
											
							</div>
<!-- 						<div class="form-group" style="width:700px"> -->
												<div class="form-group col-xs-12 col-sm-12">
<!-- 												<div class="input-group-icon mt-10 col-xs-8 col-sm-8" style="height: 100px; "> -->
<%-- 													<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product_upload.do" style="text-align: center; margin-bottom: auto"> --%>
<!-- 														<div class="input-group-icon mt-10" style="width: 200px; "> -->
															<div class="icon">
																<i class="fa fa-thumb-tack" aria-hidden="true"></i>
																審核結果: <br><span id="result_error<%=no %>" style="color:red"></span>
																<div class="form-select" id="default-select">
																	<select style="width: 120px" id="review_result<%=no %>" name="prod_review">
																		<option value="0">請選擇</option>
																		<option value="通過" ${ prodVO.prod_review.equals("通過")? "selected":""}>通過</option>
																		<option value="不通過" ${ prodVO.prod_review.equals("不通過")? "selected":""}>不通過</option>
																	</select>
																</div>
															</div>
												</div>
															
												<br>
<!-- 												<div class="col-xs-10 col-sm-10"> -->
												<div class="form-group col-xs-12 col-sm-12">
													<i class="glyphicon glyphicon-comment"></i>
													審核原因: <br><span id="reason_error<%=no %>" style="color:red"></span>
													<textarea name="prod_review_des" class="form-control custom-control" id="reason<%=no %>" rows="5">${ prodVO.prod_review_des==null? "": prodVO.prod_review_des}</textarea>
<!-- 												</div> -->
												</div>
											
						
						
<!-- 						</div> -->
						<br>
						<div class="form-group col-xs-12 col-sm-12">
							<input type="hidden" name="prod_id"  id="product_id" value="${prodVO.prod_id}">
							<input type="hidden" name="action"	value="getOne_For_Review_Update">
							<input type="button" value="提交" class="button" id="submit<%=no %>">
<%-- 							<input type="button" value="提交" class="button" id="submit<%=no %>" onclick="reviewSubmit()"> --%>
						</div>
<!-- 						</FORM> -->
						<br>
						
						
						
						
						
									
<!-- 					</div> -->
													</div>
								                        <div class="modal-footer">
<!-- 								                            <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button> -->
<!-- 								                            <button type="button" class="btn btn-primary">Confirm</button> -->
								                        </div>
								                    </div>
								                </div>	
											</div>	
											
											
											
<!-- 審核 -->
											
<script type="text/javascript">
(function($) {
	$('#submit<%=no %>').on('click', function () {
// 	function reviewSubmit(){
// 		 var c=0;
		 $("#result_error<%=no %>").text("");
		 $("#reason_error<%=no %>").html("");
		 console.log("11111111");
		 console.log("reason<%=no %>=" + $("#reason<%=no %>").val());
		 console.log("review_result<%=no %>=" + $("#review_result<%=no %>").val());
		 console.log("prod_id="+ '${prod_id}');
		 console.log("22222222");
// 		 return false;
		 
		 var has_empty = false;
		 
		 var $review_result = $("#review_result<%=no %>").val();
		 if ($("#review_result<%=no %>").val()==0){
			 $("#result_error<%=no %>").text("請選擇審核結果");
			 has_empty = true;
// 			 c++;
		 } 
		 
		 if ($("#reason<%=no %>").val()==null || $("#reason<%=no %>").val().trim().length==0){
			 has_empty = true;
			 $("#reason_error<%=no %>").text("請輸入審核原因");
// 			 if (c==0)
// 			 	$("#reason_error").text("請輸入審核描述");
// 			 else
// 			 	$("#reason_error").html("<br>請輸入審核描述");
			 
		 } 
		 if ( has_empty ) { 
		 	 return false; 
		 }
		 
		 var $this = $(this);
		 console.log("$this"+$this);
		 console.log("$this.val()"+$this.val());
		 console.log("11111111");
		 console.log("reason<%=no %>=" + $("#reason<%=no %>").val());
		 console.log("review_result<%=no %>=" + $("#review_result<%=no %>").val());
		 console.log("prod_id="+ '${prodVO.prod_id}');
		 console.log("22222222");
	     	$.ajax({
	    		url: '<%=request.getContextPath()%>/product/product_upload.do',
	    		type: "post",
	    		data: { 'action': 'getOne_For_Review_Update', 'prod_id': '${prodVO.prod_id}', 'prod_review' : $("#review_result<%=no %>").val(), 'prod_review_des' : $("#reason<%=no %>").val()  },
	    		dataType: 'json',
	    		success: function(res){
	    			console.log("0000000000");
	    			console.log(res);
	    			
	    			if ($review_result=='通過'){
		    			swal({
		    				title: "完成!",
		    				text: "審核通過，產品已推播上架!",
		    				type: "success",
		    				timer: 3000
		    			});
		    			 var jsonObj = {"prod_id" : '${prodVO.prod_id}', "prod_name" : '${prodVO.prod_name}', "prod_price" : '${prodVO.prod_price}'};
		    		     webSocket.send(JSON.stringify(jsonObj));
	    			} else{
	    				swal({
		    				title: "完成!",
		    				text: "產品審核不通過!",
		    				type: "success",
		    				timer: 3000
		    			});
	    			}
	    			console.log("11111111");
	    			setInterval(function() { window.location.href = '<%=request.getContextPath()%>/back-end/product/back_shop.jsp';}, 2000);
	    			console.log("22222222");
	    		},
	    		error: function(res){
	    			console.log("eeeeeeee");
	    			console.log("res="+res);
	    		}
	    	});
// 	};
		});
})(jQuery);
	
</script>	


<!-- 幻燈片js -->
<script type="text/javascript">
	var slideIndex = 1;
	showSlides<%=no %>(slideIndex);
	
	// Next/previous controls
	function plusSlides<%=no %>(n) {
	  showSlides<%=no %>(slideIndex += n);
	  console.log("plusSlides_slideIndex=" + slideIndex);
	}
	
	// Thumbnail image controls
	function currentSlide<%=no %>(n) {
	  showSlides<%=no %>(slideIndex = n);
	  console.log("currentSlide=" + slideIndex);
	}
	
	function showSlides<%=no %>(n) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides<%=no %>");
	  var dots = document.getElementsByClassName("dot<%=no %>");
	  if (n > slides.length) {slideIndex = 1} 
	  if (n < 1) {slideIndex = slides.length}
	  var $no = <%=no %>;
	  console.log("slides.length="+slides.length);
	  console.log("$no="+$no);
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none"; 
	  }
	  for (i = 0; i < dots.length; i++) {
	      dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex-1].style.display = "block"; 
	  dots[slideIndex-1].className += " active";
	}
</script>
<!-- 幻燈片js -->  	
											
					
								            
								            
								            
								            
								            
								            
								            
								            
								            
								            
								            
								            
															</c:if>
														</c:forEach>
													</tbody>
												</table>
	
											
												
												
  </div>

  <div id="reviewed" class="w3-container city" style="display:none" style="width:1100px">
    <p> </p> 
    <table id="bootstrap-data-table" class="table table-striped table-bordered table-hover" style="width:100%">
													<thead>
<!-- 														<tr class="success"> -->
														<tr>
															<th style="width: 30px">序號</th>
															<th style="width: 100px">照片</th>
															<th>商品編號</th>
															<th>商品名稱</th>
															<th>適用動物</th>
															<th>商品種類</th>
															<th>價格</th>
															<th>捐贈數量</th>
															<th>申請日期</th>
															<th>狀態</th>
															<th>下架</th>
															<th>修改</th>
														</tr>
													</thead>
													<tbody>
								
														<% int no1=0;%>
														<c:forEach var="prodVO" items="${prodReviewList}">
															<c:if test="${prodVO.prod_status.equals('上架')}" var="condition" scope="page">
																<% no1++; %>
																<tr>
																	<td><%=no1 %></td>
																	<td><img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${prodVO.prod_id}" alt="" style="margin-bottom: auto"></td>
																	<td style=" margin-bottom: auto">${prodVO.prod_id}</td>
																	<td style=" margin-bottom: auto"><a href="<%=request.getContextPath()%>/product/product_upload.do?action=getOne_For_Display&prod_id=${prodVO.prod_id}">${prodVO.prod_name}</a></td>
																	<td style=" margin-bottom: auto">${prodVO.prod_ani_type_id}</td>
																	<td style=" margin-bottom: auto">${prodVO.prod_type_id}</td>
																	<td style=" margin-bottom: auto">$${prodVO.prod_price}</td>
																	<td style=" margin-bottom: auto">${prodVO.prod_qty}</td>
																	<td style=" margin-bottom: auto"><fmt:formatDate value="${prodVO.prod_date}" pattern="yyyy-MM-dd"/></td>
																	<td style=" margin-bottom: auto">${prodVO.prod_status}</td>
																	<td>
																		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product_upload.do" style="text-align: center; margin-bottom: auto">
																		<input type="submit" value="下架">
<%-- 																		<input type="hidden" name="whichPage"  value="<%=whichPage%>"> --%>
																		<input type="hidden" name="prod_id"  value="${prodVO.prod_id}">
																		<input type="hidden" name="location"  value="back">
																		<input type="hidden" name="tab"  value="2">
																		<input type="hidden" name="action"	value="off"></FORM>
																	</td>
																	<td>
																		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product_upload.do" style="text-align: center; margin-bottom: auto">
																		<input type="submit" value="修改">
<%-- 																		<input type="hidden" name="whichPage"  value="<%=whichPage%>"> --%>
																		<input type="hidden" name="prod_id"  value="${prodVO.prod_id}">
																		<input type="hidden" name="tab"  value="1">
																		<input type="hidden" name="action"	value="getOne_For_Update"></FORM>
																	</td>
																</tr>
															</c:if>
														</c:forEach>
													</tbody>
												</table>
  </div>
  
  <!--救援推播modal -->
<div class="modal" id="product_push_modal" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="largeModalLabel">有新的逾時案例尚待分派</h3>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container">
					<div class="form-group" style="width:700px">
						<a id="broadcast_rescue_link" href='<%=request.getContextPath()%>/back-end/rescue/back_delayed_rescue.jsp' style="text-decoration:none;">
							<h5>請盡快分派志工前往救援.....</h5>
						</a>
						<div class="container" id="info">
							<hr>
<!-- 							<div class="row"> -->
<!-- 								<div class="col-xs-3 col-sm-3"> -->
<!-- 									<img class="img-fluid" src="" alt="" width="300px"> -->
<!-- 								</div> -->
<!-- 								<div class="col-xs-6 col-sm-6"> -->
<!-- 									<h5><span id="broadcast_rescue_name"></span> -->
<!-- 									</h5> -->
<!-- 								</div> -->
<!-- 							</div> -->
						</div>
					</div>
					<br>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
			</div>
		</div>
	</div>
</div>	
								                
<!--救援推播modal -->
  
  
  

</div>
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            </div>
                        </div>
                    </div>


                </div>
            </div><!-- .animated -->
        </div><!-- .content -->   
        <!-- /.content -->
        <div class="clearfix"></div>
    </div>
    <!-- /#right-panel -->
    



	<script src="<%=request.getContextPath()%>/backend_UI_template/assets/js/lib/data-table/datatables.min.js"></script>
    <script src="<%=request.getContextPath()%>/backend_UI_template/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/backend_UI_template/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
    <script src="<%=request.getContextPath()%>/backend_UI_template/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/backend_UI_template/assets/js/lib/data-table/jszip.min.js"></script>
    <script src="<%=request.getContextPath()%>/backend_UI_template/assets/js/lib/data-table/vfs_fonts.js"></script>
    <script src="<%=request.getContextPath()%>/backend_UI_template/assets/js/lib/data-table/buttons.html5.min.js"></script>
    <script src="<%=request.getContextPath()%>/backend_UI_template/assets/js/lib/data-table/buttons.print.min.js"></script>
    <script src="<%=request.getContextPath()%>/backend_UI_template/assets/js/lib/data-table/buttons.colVis.min.js"></script>
    <script src="<%=request.getContextPath()%>/backend_UI_template/assets/js/init/datatables-init.js"></script>

    

    <!-- w3 css tab -->
	<script>
		function openTab(evt, cityName) {
		  var i, x, tablinks;
		  x = document.getElementsByClassName("city");
		  for (i = 0; i < x.length; i++) {
		    x[i].style.display = "none";
		  }
		  tablinks = document.getElementsByClassName("tablink");
		  for (i = 0; i < x.length; i++) {
		    tablinks[i].className = tablinks[i].className.replace(" w3-border-red", "");
		  }
		  document.getElementById(cityName).style.display = "block";
		  document.getElementById(cityName).style.width = "1100px";
		  evt.currentTarget.firstElementChild.className += " w3-border-red";
		}
	</script>
	<!-- w3 css tab -->
	
	<!-- backend datatable  -->
	<script type="text/javascript">
	
		$(document).ready(function() {
        	$('#bootstrap-data-table1').DataTable();
        	$('#bootstrap-data-table2').DataTable();
      	});
  	</script>
  	<!-- backend datatable  -->



<!-- 救援推播 -->
<script>
    
    var MyPoint_res = "/RescueEchoServer";
    var host_res = window.location.host;
    var path_res = window.location.pathname;
    var webCtx_res = path_res.substring(0, path_res.indexOf('/', 1));
    var endPointURL_res = "wss://" + window.location.host + webCtx_res + MyPoint_res;
    console.log("endPointURL_res"+endPointURL_res);
    
	var webSocket_res;
	
	function connectRescue() {
		// 建立 websocket 物件
		webSocket_res = new WebSocket(endPointURL_res);
		console.log("websocket_rescue已連線");
		
		webSocket_res.onopen = function(event) {
			
		};

		webSocket_res.onmessage = function(event) {
			var jsonObj = JSON.parse(event.data);
			var length = Object.keys(jsonObj).length;
			
			console.log("jsonObj==="+jsonObj); 
			console.log("Object.keys(jsonObj).length==="+Object.keys(jsonObj).length); 
			console.log("length==="+length); 
			
			var i =0;
			for (i=0; i<length;i++){
				var res_id = Object.keys(jsonObj)[i];
				var res_name = jsonObj[Object.keys(jsonObj)[i]]
				console.log("res_id===="+Object.keys(jsonObj)[i]); 
				console.log("res_name==="+jsonObj[Object.keys(jsonObj)[i]]); 
				$("#info").html("");
				$("#info").append(
						"<hr>"+
						"<div class='row'>"+
							"<div class='col-xs-12 col-sm-12'>"+
								"<img class='img-fluid' src="+
								"<%=request.getContextPath()%>/"+
								"back-end/rescue/rescueImg.do?rsc_id="+
								res_id+ " alt='' title='點擊查看詳情' style='width:100px;'>"+
							"</div>"+
							"<a href='<%=request.getContextPath()%>/back-end/rescue/back_delayed_rescue.jsp' style='text-decoration:none;'>"+
								"<div class='col-xs-12 col-sm-12' style='padding-top:50px'>"+
									"<h5><span>"+res_name+"</span>"+
									"</h5>"+
								"</div>"+
							"</a>"+
						"</div>");
						
			
			}

	        console.log("img_src=====");
			$('#product_push_modal').modal('show');

		};

		webSocket_res.onclose = function(event) {
			
		};
	}
	
	function disconnectRescue() {
		webSocket_res.close();
	}

</script>


<!-- 商品上架推播 -->
<script>
    
    var MyPoint = "/ProductEchoServer";
    var host = window.location.host;
    var path = window.location.pathname;
    var webCtx = path.substring(0, path.indexOf('/', 1));
    var endPointURL = "wss://" + window.location.host + webCtx + MyPoint;
    
	var statusOutput = document.getElementById("statusOutput");
	var webSocket;
	
	function connect() {
		// 建立 websocket 物件
		webSocket = new WebSocket(endPointURL);
		
		webSocket.onopen = function(event) {
			
		};

		webSocket.onmessage = function(event) {

		};

		webSocket.onclose = function(event) {
			
		};
	}
	
	function disconnect () {
		webSocket.close();
	}

</script>

  	

</body>
</html>


