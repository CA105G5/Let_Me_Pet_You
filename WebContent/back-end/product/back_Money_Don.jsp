<%@page import="com.donate.model.DonateService"%>
<%@page import="com.mem.model.MemVO"%>
<%@page import="com.donate.model.DonateVO"%>
<%@page import="java.util.List"%>
<%@page import="com.prod.model.ProdService"%>
<%@page import="com.prod.model.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
	
<%
	List<DonateVO> list;
	list = (List<DonateVO>) request.getAttribute("list");
	MemVO memVO = (MemVO) session.getAttribute("memVO");
	String memb_id = null;
	if(memVO!=null)
		memb_id = memVO.getMemb_id();
	if (list==null){
		DonateService donSvc = new DonateService(); 
		list = donSvc.getAll();
		pageContext.setAttribute("list", list);
		request.setAttribute("Test", "Test");
		System.out.println("list.size()="+list.size());
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
    
<%--     <link rel="stylesheet" href="<%=request.getContextPath()%>/backend_UI_template/assets/css/lib/datatable/dataTables.bootstrap.min.css"> --%>
<!--     <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'> -->
    
<!--     <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

<!--     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script> -->

<!--     加上審核彈跳modal -->
<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!--     加上審核彈跳modal -->

	
    

	<!-- w3 CSS tabs -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<!-- w3 CSS tabs -->
	
	<!-- 若要使用fai那版外掛icon，要import CDN，快捷鍵facdn=>tab -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- https://fontawesome.com/ 自己的css-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP"
	crossorigin="anonymous">



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
                                <strong class="card-title">愛心捐贈款項確認</strong>
                            </div>
                            <div class="card-body">
                            
                            
                            
                            
                            
                            <div class="w3-container">

  <div class="w3-row">
    <a href="javascript:void(0)" onclick="openTab(event, 'toBeReviewed');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding w3-border-red"><h4>款項待確認</h4></div>
    </a>
    <a href="javascript:void(0)" onclick="openTab(event, 'reviewed');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding"><h4>款項已確認</h4></div>
    </a>
  </div>

  <div id="toBeReviewed" class="w3-container city" style="display:''; width:1100px">
 	<p> </p> 
    <table id="bootstrap-data-table2" class="table table-striped table-bordered table-hover" style="width:100%">
													<thead>
														<tr class="success">
															<th style="width: 100px">捐款人</th>
															<th style="width: 100px">捐款人電話</th>
<!-- 															<th style="width: 100px">捐款人e-mail</th> -->
															<th style="width: 100px">捐款時間</th>
															<th style="width: 80px">捐款方式</th>
															<th style="width: 80px">捐款金額</th>
															<th style="width: 120px">捐款帳號/卡號</th>
															<th style="width: 80px">收款確認</th>
<!-- 															<th style="width: 100px">愛心幣發放</th> -->
														</tr>
													</thead>
													<tbody>
														<% int no=0;%>
														<c:forEach var="donateVO" items="${list}">
															<c:if test="${donateVO.donate_status==null || donateVO.donate_status.equals('待確認')}" var="condition" scope="page">
																<% no++; %>
																<tr>
<%-- 																	<td><%=no %></td> --%>
																	<td style=" margin-bottom: auto">${donateVO.donate_name}</td>
																	<td style=" margin-bottom: auto">${donateVO.donate_phone}</td>
<%-- 																	<td style=" margin-bottom: auto">${donateVO.donate_mail}</td> --%>
																	<td style=" margin-bottom: auto"><fmt:formatDate value="${donateVO.donate_date}" pattern="yyyy-MM-dd"/></td>
																	<td style=" margin-bottom: auto">${donateVO.donate_src}</td>
																	<td style=" margin-bottom: auto">${donateVO.donate_amount}</td>
																	<td style=" margin-bottom: auto">${donateVO.donate_src_trn==null? donateVO.donate_src_cre : donateVO.donate_src_trn}</td>
																	<td><input type="button" value="收款確認" id="receive<%= no %>" class="btn btn-outline-info mb-1" >
	 																<input type="hidden" name="donate_id"  value="${donateVO.donate_id}">
<%-- 																	<td style=" margin-bottom: auto">${donateVO.donate_coin==0? '未發放' : donateVO.donate_coin}</td> --%>
																</tr>
		<script>
		(function($) {
		 $("#receive<%= no %>").on('click', function () {
			 var $this = $(this);
			 console.log("$this.next().val()="+$this.next().val());
		        swal({
		            title: "確定收款？",
		            html: "按下確定收貨後就無法再取消囉",
		            type: "warning", // type can be "success", "error", "warning", "info", "question"
		            showCancelButton: true,
		        	showCloseButton: true,
		        }).then(
		        	   function (result) {
		                if (result) {
		                	$.ajax({
		    					url: '<%=request.getContextPath()%>/donate/donate.do?action=receive_update',
		    					type: "get",
		    					data: { 'action': 'receive_update', 'donate_id': $this.next().val(), 'donate_status': '已收到'},
		    					dataType: 'json',
		    					success: function(res){
		    						console.log("0000000000");
		    						console.log(res);
		    						swal({
		    				    	     title: "完成!",
		    				    	     text: "已完成收貨 (兩秒後跳轉原頁面)",
		    				    	     type: "success",
		    				    	     timer: 2000
		    				    	});
		    						console.log("11111111");
		    						setInterval(function() { window.location.href = '<%=request.getContextPath()%>/back-end/product/back_Money_Don.jsp';}, 2000);
		    						console.log("22222222");
		    					},
		    					error: function(res){
		    						console.log("eeeeeeee");
		    						console.log("res="+res);
		    					}
		    				
		    				});
		                }
	            }, function(dismiss) { // dismiss can be "cancel" | "overlay" | "esc" | "cancel" | "timer"
	            		swal("取消", "款項待確認", "error");
		        }).catch(swal.noop);
		    });
		})(jQuery);
		 </script>													
																
																
																
																
																
																
																
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
															<th style="width: 100px">捐款人</th>
															<th style="width: 100px">捐款人電話</th>
<!-- 															<th style="width: 100px">捐款人e-mail</th> -->
															<th style="width: 100px">捐款時間</th>
															<th style="width: 80px">捐款方式</th>
															<th style="width: 80px">捐款金額</th>
															<th style="width: 120px">捐款帳號/卡號</th>
															<th style="width: 80px">款項狀態</th>
															<th style="width: 100px">愛心幣發放</th>
														</tr>
													</thead>
													<tbody>
														<% int no2=0;%>
														<c:forEach var="donateVO" items="${list}">
															<c:if test="${donateVO.donate_status.equals('已收到')}" var="condition" scope="page">
																<% no2++; %>
																<tr>
<%-- 																	<td><%=no2 %></td> --%>
																	<td style=" margin-bottom: auto">${donateVO.donate_name}</td>
																	<td style=" margin-bottom: auto">${donateVO.donate_phone}</td>
<%-- 																	<td style=" margin-bottom: auto">${donateVO.donate_mail}</td> --%>
																	<td style=" margin-bottom: auto"><fmt:formatDate value="${donateVO.donate_date}" pattern="yyyy-MM-dd"/></td>
																	<td style=" margin-bottom: auto">${donateVO.donate_src}</td>
																	<td style=" margin-bottom: auto">${donateVO.donate_amount}</td>
																	<td style=" margin-bottom: auto">${donateVO.donate_src_trn==null? donateVO.donate_src_cre : donateVO.donate_src_trn}</td>
																	<td style=" margin-bottom: auto">已確認</td>
																	<td style=" margin-bottom: auto">${donateVO.donate_coin}</td>
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
    <!-- /#right-panel -->
   </div>
    



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
  	

  	

</body>
</html>


