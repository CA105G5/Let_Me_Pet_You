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
	
	
<!doctype html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>浪我陪你-後台</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="stylesheet" href="<%=request.getContextPath()%>/backend_UI_template/assets/css/lib/datatable/dataTables.bootstrap.min.css">
    
    
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
    
    <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
<!--     加上審核彈跳modal -->
<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!--     加上審核彈跳modal -->

	
    

	<!-- w3 CSS tabs -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<!-- w3 CSS tabs -->








   <style>
   
	   p{
	   		font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
			monospace;
		}

		div{
			font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
				monospace;
		}
   
	    #weatherWidget .currentDesc {
	        color: #ffffff!important;
	    }
        .traffic-chart {
            min-height: 335px;
        }
        #flotPie1  {
            height: 150px;
        }
        #flotPie1 td {
            padding:3px;
        }
        #flotPie1 table {
            top: 20px!important;
            right: -10px!important;
        }
        .chart-container {
            display: table;
            min-width: 270px ;
            text-align: left;
            padding-top: 10px;
            padding-bottom: 10px;
        }
        #flotLine5  {
             height: 105px;
        }

        #flotBarChart {
            height: 150px;
        }
        #cellPaiChart{
            height: 160px;
        }
        
	
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
	.prev, .next {
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
	.next {
	  right: 0;
	  border-radius: 3px 0 0 3px;
	}
	
	/* On hover, add a black background color with a little bit see-through */
	.prev:hover, .next:hover {
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

</style>
</head>

<body>

	<jsp:include page="/back-end/product/back_shop_Header.jsp" flush="true" />
	
 <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
<!--         Header -->
<!--         <header id="header" class="header"> -->
<!--         </header> -->
        
        <!-- Content -->
        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>Dashboard</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="#">Dashboard</a></li>
                                    <li><a href="#">Table</a></li>
                                    <li class="active">Data table</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="content">
            <div class="animated fadeIn">
                <div class="row">

                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">愛心商品捐贈審核</strong>
                            </div>
                            <div class="card-body">
                            
                            
                            
                            
                            
                            <div class="w3-container">

  <div class="w3-row">
    <a href="javascript:void(0)" onclick="openTab(event, 'toBeReviewed');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding w3-border-red"><h4>待審核</h4></div>
    </a>
    <a href="javascript:void(0)" onclick="openTab(event, 'reviewed');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding"><h4>上架中</h4></div>
    </a>
  </div>

  <div id="toBeReviewed" class="w3-container city" style="display:''; width:1100px">
 	<p> </p> 
    <table id="bootstrap-data-table2" class="table table-striped table-bordered table-hover" style="width:100%">
													<thead>
														<tr class="success">
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
																
											<div class="modal" id="${prodVO.prod_id}" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
								                <div class="modal-dialog modal-lg" role="document">
								                    <div class="modal-content">
								                        <div class="modal-header">
								                            <h5 class="modal-title" id="largeModalLabel">審核捐贈申請</h5>
								                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								                                <span aria-hidden="true">&times;</span>
								                            </button>
								                        </div>
								                        <div class="modal-body">
								                            <section class="training-area section-gap">
		<div class="container">
			<div id="sider" class="n-browse-nav m-sticky-on" style="top: 150px; bottom: auto;">
<!-- 				<div class="row"> -->
<!-- 					<div class="col-lg-3 cl-md-3" style="top: 180px; bottom: auto;"></div> -->
					<div class="col-xs-10 col-sm-10">
					<div class="row">
						<div class="col-xs-10 col-sm-10">
						
							<!-- Slideshow container -->
							<div class="slideshow-container">
									
								<!-- Full-width images with number and caption text -->
								<% int i =1; %> 
								<c:forEach var="prodImgVO" items="${prodImgSvc.getOneProdImg(prodVO.prod_id)}">
									<div class="mySlides" >
<!-- 							    <div class="mySlides fade"> -->
										<div class="numbertext"><%=i%>/${prodImgSvc.getOneProdImg(prodVO.prod_id).size()}</div>
										<img src="<%=request.getContextPath()%>/util/PicReader2?prod_img_id=${prodImgVO.prod_img_id}" style="width:50%">
										<div class="text"> </div>
									</div>
									<% i++; %> 
								</c:forEach>
										
								<!-- Next and previous buttons -->
								<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
								<a class="next" onclick="plusSlides(1)">&#10095;</a>
							</div>
							<br>
									
							<!-- The dots/circles -->
							<div>
<!-- 						<div style="text-align:center"> -->
								<% int j =1; %> 
								<c:forEach var="prodImgVO" items="${prodImgSvc.getOneProdImg(prodVO.prod_id)}">
									<span class="dot" onclick="currentSlide(<%=j%>)"></span> 
									<% j++; %> 
								</c:forEach>
							</div>
						</div>

						<div class="col-xs-10 col-sm-10">
							<h3>${prodVO.prod_name}
								<span style="font-size: 1em; color: Tomato; text-indent:300px;">
									<i class="fas fa-coins"></i>
									<b>${prodVO.prod_price}</b>
								</span>
							</h3>
							<hr>
							<h4>商品資訊: <p>${prodVO.prod_info}</p></h4>
							<h4>捐贈數量: ${prodVO.prod_stock}</h4>
							<h4>產品分類: ${prodVO.prod_type_id}</h4>
							<h4>適用動物: ${prodVO.prod_ani_type_id}</h4>
							<hr>
							<div>
								<h3>審核</h3>
								<div class="row">
									<div class="input-group-icon mt-10 col-xs-8 col-sm-8" style="height: 100px; ">
										<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product_upload.do" style="text-align: center; margin-bottom: auto">
											<div class="input-group-icon mt-10" style="width: 200px; ">
												<div class="icon">
													<i class="fa fa-thumb-tack" aria-hidden="true"></i>
												</div>
												<div class="form-select" id="default-select">
													<select style="width: 120px" id="prod_review" name="prod_review">
														<option value="0">審核結果</option>
														<option value="通過" ${ prodVO.prod_review.equals("通過")? "selected":""}>通過</option>
														<option value="不通過" ${ prodVO.prod_review.equals("不通過")? "selected":""}>不通過</option>
													</select>
												</div>
											</div> 
									</div>
								
									<br>
									<div class="col-xs-10 col-sm-10">
										審核原因: <br>
										<textarea name="prod_review_des" class="form-control custom-control" rows="5" style="resize:none; width: 250px;">${ prodVO.prod_review_des==null? "": prodVO.prod_review_des}</textarea>
									</div>
								
								</div>
								
								<br>
								<div>
<!-- 							<div style="text-align:right"> -->
									<input type="hidden" name="prod_id"  value="${prodVO.prod_id}">
									<input type="hidden" name="action"	value="getOne_For_Review_Update">
									<input type="submit" value="提交" class="button"></FORM>
								</div>
							
							</div>
						</div>
					</div>

						<div class="container">
							<div id="sider" class="n-browse-nav m-sticky-on"
								style="top: 150px; bottom: auto;">
								<div class="row">
									<div class="col-lg-10 cl-md-10" style="top: 30px; bottom: auto;">
										<div class="">
												${prodVO.prod_des}
										</div>
									</div>
								</div>
							</div>
						</div>
						<hr>
						
						
					</div>
				</div>
			</div>
		</div>
	</section>
								                        </div>
								                        <div class="modal-footer">
								                            <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
<!-- 								                            <button type="button" class="btn btn-primary">Confirm</button> -->
								                        </div>
								                    </div>
								                </div>
								            </div>
															</c:if>
														</c:forEach>
													</tbody>
												</table>
												
  </div>

  <div id="reviewed" class="w3-container city" style="display:none" style="width:1100px">
    <p> </p> 
    <table id="bootstrap-data-table" class="table table-striped table-bordered table-hover" style="width:100%">
													<thead>
														<tr class="success">
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
																</tr>
															</c:if>
														</c:forEach>
													</tbody>
												</table>
  </div>

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
    
<!--    加上審核彈跳modal  -->
<c:if test="${openModal!=null}">

<div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
				
			<div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3 class="modal-title" id="myModalLabel">The Bootstrap modal-header</h3>
            </div>
			
			<div class="modal-body">
<!-- =========================================以下為原listOneEmp.jsp的內容========================================== -->
               <jsp:include page="/front-end/product/listOneProdModal.jsp" />
<!-- =========================================以上為原listOneEmp.jsp的內容========================================== -->
			</div>
			
			<div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
		
		</div>
	</div>
</div>

        <script>
    		 $("#basicModal").modal({show: true});
        </script>
</c:if>
<!--    加上審核彈跳modal  -->   
    

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
  	
<script type="text/javascript">
	var slideIndex = 1;
	showSlides(slideIndex);
	
	// Next/previous controls
	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}
	
	// Thumbnail image controls
	function currentSlide(n) {
	  showSlides(slideIndex = n);
	}
	
	function showSlides(n) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("dot");
	  if (n > slides.length) {slideIndex = 1} 
	  if (n < 1) {slideIndex = slides.length}
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

<script type="text/javascript">
	
	 $("#submit").on('click', function () {
		 var c=0;
		 $("#result_error").text("");
		 $("#reason_error").html("");
		 console.log("#report_result="+$("#report_result").val());
		 console.log("#reason="+$("#reason").val());
		 console.log("ord_id="+ '${ord_id}');
		 console.log("prod_id="+ '${prod_id}');
		 
		 var has_empty = false;
		    
		 if ($("#report_result").val()==0){
			 $("#result_error").text("請輸入審核理由");
			 has_empty = true;
			 c++;
		 } 
		 
		 if ($("#reason").val()==null || $("#reason").val().trim().length==0){
			 has_empty = true;
			 if (c==0)
			 	$("#reason_error").text("請輸入審核描述");
			 else
			 	$("#reason_error").html("<br>請輸入審核描述");
			 
		 } 
		 if ( has_empty ) { 
		 	 return false; 
		 }
		 
		 var $this = $(this);
		 console.log("11111111");
		 console.log("reason=" + $("#reason").val());
		 console.log("report_result=" + $("#report_result").val());
		 console.log("22222222");
	     	$.ajax({
	    		url: '<%=request.getContextPath()%>/ordItem/ordItem.do',
	    		type: "post",
	    		data: { 'action': 'getOne_For_Review_Update', 'ord_id': '${ord_id}' , 'prod_id': '${prod_id}', 'ord_item_review' : $("#report_result").val(), 'ord_item_rv_des' : $("#reason").val()  },
	    		dataType: 'json',
	    		success: function(res){
	    			console.log("0000000000");
	    			console.log(res);
	    			swal({
	    				title: "完成!",
	    				text: "已完成審核",
	    				type: "success",
	    				timer: 3000
	    			});
	    			console.log("11111111");
	    			window.location.href = "<%=request.getContextPath()%>/back-end/ord/back_listAllOrd.jsp";
	    			console.log("22222222");
	    		},
	    		error: function(res){
	    			console.log("eeeeeeee");
	    			console.log("res="+res);
	    		}
	    	});
		});
</script>
  	

</body>
</html>


