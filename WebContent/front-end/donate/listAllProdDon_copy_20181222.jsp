<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.prodimg.model.ProdImgService"%>
<%@ page import="com.prodimg.model.ProdImgVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.util.*"%>
<%@ page import="com.prod.model.ProdService"%>
<%@ page import="com.prod.model.ProdVO"%>

<%
	List<ProdVO> list;
	list = (List<ProdVO>) request.getAttribute("list");
	if (list==null){
		ProdService prodSvc = new ProdService(); 
		list = prodSvc.getAll();
		pageContext.setAttribute("list", list);
		request.setAttribute("Test", "Test");
	}
%>

<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="img/fav.png">
<!-- Author Meta -->
<meta name="author" content="codepixer">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>Horse Club</title>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!--
			CSS
			============================================= -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/linearicons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/magnific-popup.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/nice-select.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/animate.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/owl.carousel.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 若要使用fai那版外掛icon，要import CDN，快捷鍵facdn=>tab -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- https://fontawesome.com/ 自己的css-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP"
	crossorigin="anonymous">

<style type="text/css">
p {
	font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}

div {
	font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}
</style>
</head>
<body>

	<jsp:include page="/front-end/donate/don_Header.jsp" flush="true" />

	<section class="training-area section-gap">
		<div class="container">
			<div id="sider" class="n-browse-nav m-sticky-on" style="top: 180px; bottom: auto;">
				<div class="row">
					<div class="col-lg-2 cl-md-2" style="top: 180px; bottom: auto;"></div> <!-- position: fixed -->
					<div class="col-xs-12 col-sm-10">
						<div class="row">
							<div class="page-header">
							<%-- 錯誤表列 --%>
								<c:if test="${not empty errorMsgs}">
									<div>
										<font style="color:red">請修正以下錯誤:</font>
										<ul>
										    <c:forEach var="message" items="${errorMsgs}">
												<li style="color:red">${message}</li>
											</c:forEach>
										</ul>
									</div>
								</c:if>
								
								<c:if test="${not empty msg}">
									<div>
										<font style="color:red">${msg}</font>
									</div>
								</c:if>
								
								<h1>愛心商品捐贈紀錄列表 <small>點擊商品名稱查看詳情</small></h1>
							
								<div class="container">
									<div role="tabpanel">
									    <!-- 標籤面板：標籤區 -->
									    <ul class="nav nav-tabs" role="tablist">
									        <li role="presentation" class="active"> 
									            <a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab">審核中</a>
									        </li>
									        <li role="presentation">
									            <a href="#tab2" aria-controls="tab2" role="tab" data-toggle="tab">已上架</a>
									        </li>
									        <li role="presentation">
									            <a href="#tab3" aria-controls="tab3" role="tab" data-toggle="tab">審核不通過</a>
									        </li>
									    </ul>
									
									    <!-- 標籤面板：內容區 -->
									    <div class="tab-content">
									        <div role="tabpanel" class="tab-pane active" id="tab1">
										        <%@ include file="page1.file" %> 
												<table id="table1" class="table table-striped table-bordered table-hover" style="width:100%">
													<thead>
														<tr class="success">
															<th>序號</th>
															<th>照片</th>
															<th>商品編號</th>
															<th>商品名稱</th>
															<th>價格</th>
															<th>數量</th>
															<th>捐贈時間</th>
															<th>商品狀態</th>
															<th>修改</th>
															<th>刪除</th>
														</tr>
													</thead>
													<tbody>
								
														<% int no=0;%>
														<c:forEach var="prodVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>"><% no++; %>
															<c:if test="${prodVO.prod_status==null}" var="condition" scope="page">
																<tr>
																	<td width="50px"><%= (whichPage-1)*rowsPerPage+no %></td>
																	<td><img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${prodVO.prod_id}" alt="" width="50px" style="margin-bottom: auto"></td>
																	<td style=" margin-bottom: auto">${prodVO.prod_id}</td>
																	<td style=" margin-bottom: auto"><a href="<%=request.getContextPath()%>/product/product_upload.do?action=getOne_For_Display&prod_id=${prodVO.prod_id}">${prodVO.prod_name}</a></td>
																	<td style=" margin-bottom: auto">$${prodVO.prod_price}</td>
																	<td style=" margin-bottom: auto">${prodVO.prod_qty}</td>
																	<td style=" margin-bottom: auto">${prodVO.prod_date}</td>
																	<td style=" margin-bottom: auto">${prodVO.prod_status==null? "審核中": prodVO.prod_status}</td>
																	<td>
																		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product_upload.do" style="text-align: center; margin-bottom: auto">
																		<input type="submit" value="修改">
																		<input type="hidden" name="whichPage"  value="<%=whichPage%>">
																		<input type="hidden" name="prod_id"  value="${prodVO.prod_id}">
																		<input type="hidden" name="action"	value="getOne_For_Update"></FORM>
																	</td>
																	<td>
																		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product_upload.do" style="text-align: center; margin-bottom: auto">
																		<input type="submit" value="刪除">
																		<input type="hidden" name="whichPage"  value="<%= whichPage %>">
																		<input type="hidden" name="prod_id"  value="${prodVO.prod_id}">
																		<input type="hidden" name="action" value="delete"></FORM>
																	</td>
																</tr>
															</c:if>
														</c:forEach>
													</tbody>
												</table>
												<%@ include file="page2.file" %>
															        
									        </div>
									        
										    <div role="tabpanel" class="tab-pane" id="tab2">
<%-- 										    <%@ include file="page1.file" %>  --%>
												<table id="table2" class="table table-striped table-bordered table-hover" style="width:100%">
													<thead>
														<tr class="success">
															<th>序號</th>
															<th>照片</th>
															<th>商品編號</th>
															<th>商品名稱</th>
															<th>價格</th>
															<th>數量</th>
															<th>捐贈時間</th>
															<th>商品狀態</th>
															<th>修改</th>
															<th>刪除</th>
														</tr>
													</thead>
													<tbody>
								
														<c:forEach var="prodVO" items="${list}">
															<c:if test="${prodVO.prod_status.equals('上架')}" var="condition" scope="page">
																<tr>
																	<td width="50px"></td>
																	<td><img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${prodVO.prod_id}" alt="" width="50px" style="margin-bottom: auto"></td>
																	<td style=" margin-bottom: auto">${prodVO.prod_id}</td>
																	<td style=" margin-bottom: auto"><a href="<%=request.getContextPath()%>/product/product_upload.do?action=getOne_For_Display&prod_id=${prodVO.prod_id}">${prodVO.prod_name}</a></td>
																	<td style=" margin-bottom: auto">$${prodVO.prod_price}</td>
																	<td style=" margin-bottom: auto">${prodVO.prod_qty}</td>
																	<td style=" margin-bottom: auto">${prodVO.prod_date}</td>
																	<td style=" margin-bottom: auto">${prodVO.prod_status==null? "審核中": prodVO.prod_status}</td>
																	<td>
																		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product_upload.do" style="text-align: center; margin-bottom: auto">
																		<input type="submit" value="修改">
																		<input type="hidden" name="whichPage"  value="<%=whichPage%>">
																		<input type="hidden" name="prod_id"  value="${prodVO.prod_id}">
																		<input type="hidden" name="action"	value="getOne_For_Update"></FORM>
																	</td>
																	<td>
																		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product_upload.do" style="text-align: center; margin-bottom: auto">
																		<input type="submit" value="刪除">
																		<input type="hidden" name="whichPage"  value="<%= whichPage %>">
																		<input type="hidden" name="prod_id"  value="${prodVO.prod_id}">
																		<input type="hidden" name="action" value="delete"></FORM>
																	</td>
																</tr>
															</c:if>
														</c:forEach>
													</tbody>
												</table>
<%-- 												<%@ include file="page2.file" %> --%>
										    </div>
										    
										    <div role="tabpanel" class="tab-pane" id="tab3">
<%-- 										    <%@ include file="page1.file" %>  --%>
												<table id="table3" class="table table-striped table-bordered table-hover" style="width:100%">
													<thead>
														<tr class="success">
															<th>序號</th>
															<th>照片</th>
															<th>商品編號</th>
															<th>商品名稱</th>
															<th>價格</th>
															<th>數量</th>
															<th>捐贈時間</th>
															<th>商品狀態</th>
															<th>修改</th>
															<th>刪除</th>
														</tr>
													</thead>
													<tbody>
								
														<c:forEach var="prodVO" items="${list}" >
															<c:if test="${prodVO.prod_status.equals('審核不通過')}" var="condition" scope="page">
																<tr>
																	<td width="50px"></td>
																	<td><img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${prodVO.prod_id}" alt="" width="50px" style="margin-bottom: auto"></td>
																	<td style=" margin-bottom: auto">${prodVO.prod_id}</td>
																	<td style=" margin-bottom: auto"><a href="<%=request.getContextPath()%>/product/product_upload.do?action=getOne_For_Display&prod_id=${prodVO.prod_id}">${prodVO.prod_name}</a></td>
																	<td style=" margin-bottom: auto">$${prodVO.prod_price}</td>
																	<td style=" margin-bottom: auto">${prodVO.prod_qty}</td>
																	<td style=" margin-bottom: auto">${prodVO.prod_date}</td>
																	<td style=" margin-bottom: auto">${prodVO.prod_status==null? "審核中": prodVO.prod_status}</td>
																	<td>
																		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product_upload.do" style="text-align: center; margin-bottom: auto">
																		<input type="submit" value="修改">
																		<input type="hidden" name="whichPage"  value="<%=whichPage%>">
																		<input type="hidden" name="prod_id"  value="${prodVO.prod_id}">
																		<input type="hidden" name="action"	value="getOne_For_Update"></FORM>
																	</td>
																	<td>
																		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product_upload.do" style="text-align: center; margin-bottom: auto">
																		<input type="submit" value="刪除">
																		<input type="hidden" name="whichPage"  value="<%= whichPage %>">
																		<input type="hidden" name="prod_id"  value="${prodVO.prod_id}">
																		<input type="hidden" name="action" value="delete"></FORM>
																	</td>
																</tr>
															</c:if>
														</c:forEach>
													</tbody>
												</table>
<%-- 												<%@ include file="page2.file" %> --%>
										    </div>
									    
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>



	 <!-- Button trigger modal --> 
<!-- <button type="button" class="btn btn-info btn-lg" id="alertbox">Click here</button> -->

	 <!-- Modal --> 
<!-- <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
<!--   <div class="modal-dialog" role="document"> -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"> -->
<!--         <h5 class="modal-title" id="exampleModalLabel">Modal title</h5> -->
<!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--           <span aria-hidden="true">&times;</span> -->
<!--         </button> -->
<!--       </div> -->
<!--       <div class="modal-body"> -->
<!--         	<p id="error">確定要刪除嗎?</p> -->
<!--       </div> -->
<!--       <div class="modal-footer"> -->
<!--         <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button> -->
<!--         <button type="button" class="btn btn-primary">Confirm</button> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->

<!-- Button trigger script  -->
<!-- <script> 
  	$(document).ready(function(){ 
  	  $('#alertbox').click(function(){ 
  	    $("#error").html("You Clicked on Click here Button"); 
  	      $('#myModal').modal("show"); 
  	    }); 
  	  }); -->
	
<!-- </script> -->


	<script src="<%=request.getContextPath()%>/horse_UI_template/js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/horse_UI_template/js/vendor/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
	<script src="<%=request.getContextPath()%>/horse_UI_template/js/easing.min.js"></script>
	<script src="<%=request.getContextPath()%>/horse_UI_template/js/hoverIntent.js"></script>
	<script src="<%=request.getContextPath()%>/horse_UI_template/js/superfish.min.js"></script>
	<script src="<%=request.getContextPath()%>/horse_UI_template/js/jquery.ajaxchimp.min.js"></script>
	<script src="<%=request.getContextPath()%>/horse_UI_template/js/jquery.magnific-popup.min.js"></script>
	<script src="<%=request.getContextPath()%>/horse_UI_template/js/owl.carousel.min.js"></script>
	<script src="<%=request.getContextPath()%>/horse_UI_template/js/jquery.sticky.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="<%=request.getContextPath()%>/horse_UI_template/js/jquery.nice-select.min.js"></script>
	<script src="<%=request.getContextPath()%>/horse_UI_template/js/parallax.min.js"></script>
	<script src="<%=request.getContextPath()%>/horse_UI_template/js/waypoints.min.js"></script>
	<script src="<%=request.getContextPath()%>/horse_UI_template/js/jquery.counterup.min.js"></script>
	<script src="<%=request.getContextPath()%>/horse_UI_template/js/mail-script.js"></script>
	<script src="<%=request.getContextPath()%>/horse_UI_template/js/main.js"></script>
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>

	<script>
		$(document).ready(function() {
		    $('#table1').DataTable();
		    $('#table2').DataTable();
		    $('#table3').DataTable();
		} );
	</script>
	
	

</body>
</html>



