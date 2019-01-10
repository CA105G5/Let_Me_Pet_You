<%@page import="com.mem.model.MemVO"%>
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
	MemVO memVO = (MemVO) session.getAttribute("memVO");
	String memb_id = null;
	if(memVO!=null)
		memb_id = memVO.getMemb_id();
	if (list==null){
		ProdService prodSvc = new ProdService(); 
		list = prodSvc.getProdByMem(memb_id);
		pageContext.setAttribute("list", list);
		request.setAttribute("Test", "Test");
	}
	String tab = (String) request.getAttribute("tab");
	System.out.println("tab=" + tab);
	Integer tab_int = null;
	if (tab==null){
		tab="1";
		tab_int = new Integer(tab);
	}
	
	System.out.println("updateProdDon.jsp得到從ProdServlet.java傳過來的屬性"+request.getAttribute("Test"));
	System.out.println("updateProdDon.jsp得到從ProdServlet.java傳過來的請求參數值"+request.getParameter("whichPage"));
	System.out.println("updateProdDon.jsp得到從ProdServlet.java傳過來的請求參數值"+request.getParameter("prod_id"));
%>
		

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Horse Club</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">


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


	<jsp:include page="/index_Header.jsp" flush="true" />
	
<!-- 	<div class="container"> -->
<!-- 			<div class="row"> -->

<!-- 			<!-- 左側邊list-group --> 
<!-- 			<div class="col-xs-12 col-sm-3"> -->
<!-- 				<div id="sider" class="n-browse-nav m-sticky-on" style="top: 150px; position: fixed; bottom: auto"> -->
<!-- 					<h3>捐贈紀錄</h3> -->
<!-- 					<hr> -->
<%-- 					<h5><a href="<%=request.getContextPath()%>/front-end/donate/listAllProdDon.jsp">愛心捐款紀錄</a></h5> --%>
<!-- 					<hr> -->
<%-- 					<h5><a href="<%=request.getContextPath()%>/front-end/donate/listAllProdDon.jsp">愛心商品捐贈紀錄</a></h5> --%>
<!-- 					<hr> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
	
	
	<section class="training-area section-gap">
		<div class="container">
			<div id="sider" class="n-browse-nav m-sticky-on" style="top: 180px; bottom: auto;">
				<div class="row">
					<div class="col-lg-2 cl-md-2" style="top: 180px; bottom: auto;">
						<div id="sider" class="n-browse-nav m-sticky-on" style="top: 150px; position: fixed; bottom: auto">
							<h3>捐贈紀錄</h3>
							<hr>
							<h5><a href="<%=request.getContextPath()%>/front-end/donate/listAllMoneyDon.jsp">愛心捐款紀錄</a></h5>
							<hr>
							<h5><a href="<%=request.getContextPath()%>/front-end/donate/listAllProdDon.jsp">愛心商品捐贈紀錄</a></h5>
							<hr>
						</div>
					</div> <!-- position: fixed -->
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
									            <a href="#tab3" aria-controls="tab3" role="tab" data-toggle="tab">已下架</a>
									        </li>
									        <li role="presentation">
									            <a href="#tab4" aria-controls="tab4" role="tab" data-toggle="tab">審核不通過</a>
									        </li>
									    </ul>
									
									    <!-- 標籤面板：內容區 -->
									    <br>
									    <div class="tab-content">
									        <div role="tabpanel" class="tab-pane active" id="tab1">
												<table id="table1" class="table table-striped table-bordered table-hover" style="width:100%">
													<thead>
														<tr class="success">
															<th style="width: 30px">序號</th>
															<th style="width: 50px">照片</th>
															<th>商品編號</th>
															<th>商品名稱</th>
															<th>適用動物</th>
															<th>商品種類</th>
															<th>價格</th>
															<th>捐贈數量</th>
															<th>申請日期</th>
															<th>狀態</th>
															<th>修改</th>
														</tr>
													</thead>
													<tbody>
								
														<% int no=0;%>
														<c:forEach var="prodVO" items="${list}">
															<c:if test="${prodVO.prod_review==null}" var="condition" scope="page">
																<% no++; %>
																<tr>
																	<td><%=no %></td>
																	<td><img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${prodVO.prod_id}" alt="" width="50px" style="margin-bottom: auto"></td>
																	<td style=" margin-bottom: auto">${prodVO.prod_id}</td>
																	<td style=" margin-bottom: auto"><a href="<%=request.getContextPath()%>/product/product_upload.do?action=getOne_For_Display&prod_id=${prodVO.prod_id}">${prodVO.prod_name}</a></td>
																	<td style=" margin-bottom: auto">${prodVO.prod_ani_type_id}</td>
																	<td style=" margin-bottom: auto">${prodVO.prod_type_id}</td>
																	<td style=" margin-bottom: auto">$${prodVO.prod_price}</td>
																	<td style=" margin-bottom: auto">${prodVO.prod_qty}</td>
																	<td style=" margin-bottom: auto"><fmt:formatDate value="${prodVO.prod_date}" pattern="yyyy-MM-dd"/></td>
																	<td style=" margin-bottom: auto">${prodVO.prod_review==null? "審核中": prodVO.prod_review}</td>
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
									        
										    <div role="tabpanel" class="tab-pane" id="tab2">
<%-- 										    <%@ include file="page1.file" %>  --%>
												<table id="table2" class="table table-striped table-bordered table-hover" style="width:100%">
													<thead>
														<tr class="success">
															<th style="width: 30px">序號</th>
															<th style="width: 50px">照片</th>
															<th>商品編號</th>
															<th>商品名稱</th>
															<th>適用動物</th>
															<th>商品種類</th>
															<th>價格</th>
															<th>捐贈數量</th>
															<th>庫存量</th>
															<th>申請日期</th>
															<th>狀態</th>
															<th>申請下架</th>
														</tr>
													</thead>
													<tbody>
								
														<% int no2=0;%>
														<c:forEach var="prodVO" items="${list}">
															<c:if test="${prodVO.prod_status.equals('上架')}" var="condition" scope="page">
																<% no2++; %>
																<tr>
																	<td><%=no2 %></td>
																	<td><img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${prodVO.prod_id}" alt="" width="50px" style="margin-bottom: auto"></td>
																	<td style=" margin-bottom: auto">${prodVO.prod_id}</td>
																	<td style=" margin-bottom: auto"><a href="<%=request.getContextPath()%>/product/product_upload.do?action=getOne_For_Display&prod_id=${prodVO.prod_id}">${prodVO.prod_name}</a></td>
																	<td style=" margin-bottom: auto">${prodVO.prod_ani_type_id}</td>
																	<td style=" margin-bottom: auto">${prodVO.prod_type_id}</td>
																	<td style=" margin-bottom: auto">$${prodVO.prod_price}</td>
																	<td style=" margin-bottom: auto">${prodVO.prod_qty}</td>
																	<td style=" margin-bottom: auto">${prodVO.prod_stock}</td>
																	<td style=" margin-bottom: auto"><fmt:formatDate value="${prodVO.prod_date}" pattern="yyyy-MM-dd"/></td>
																	<td style=" margin-bottom: auto">${prodVO.prod_status}</td>
																	<td>
																		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product_upload.do" style="text-align: center; margin-bottom: auto">
																		<input type="submit" value="下架" id="off">
<%-- 																		<input type="hidden" name="whichPage"  value="<%=whichPage%>"> --%>
																		<input type="hidden" name="prod_id"  value="${prodVO.prod_id}">
																		<input type="hidden" name="tab"  value="2">
																		<input type="hidden" name="action"	value="off"></FORM>
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
															<th style="width: 30px">序號</th>
															<th style="width: 50px">照片</th>
															<th>商品編號</th>
															<th>商品名稱</th>
															<th>適用動物</th>
															<th>商品種類</th>
															<th>價格</th>
															<th>捐贈數量</th>
															<th>庫存量</th>
															<th>申請日期</th>
															<th>狀態</th>
															<th>重新上架</th>
														</tr>
													</thead>
													<tbody>
								
														<% int no3=0;%>
														<c:forEach var="prodVO" items="${list}">
															<c:if test="${prodVO.prod_status.equals('下架')}" var="condition" scope="page">
																<% no3++; %>
																<tr>
																	<td><%=no3 %></td>
																	<td><img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${prodVO.prod_id}" alt="" width="50px" style="margin-bottom: auto"></td>
																	<td style=" margin-bottom: auto">${prodVO.prod_id}</td>
																	<td style=" margin-bottom: auto"><a href="<%=request.getContextPath()%>/product/product_upload.do?action=getOne_For_Display&prod_id=${prodVO.prod_id}">${prodVO.prod_name}</a></td>
																	<td style=" margin-bottom: auto">${prodVO.prod_ani_type_id}</td>
																	<td style=" margin-bottom: auto">${prodVO.prod_type_id}</td>
																	<td style=" margin-bottom: auto">$${prodVO.prod_price}</td>
																	<td style=" margin-bottom: auto">${prodVO.prod_qty}</td>
																	<td style=" margin-bottom: auto">${prodVO.prod_stock}</td>
																	<td style=" margin-bottom: auto"><fmt:formatDate value="${prodVO.prod_date}" pattern="yyyy-MM-dd"/></td>
																	<td style=" margin-bottom: auto">${prodVO.prod_status}</td>
																	<td>
																		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product_upload.do" style="text-align: center; margin-bottom: auto">
																		<input type="submit" value="重新上架">
<%-- 																		<input type="hidden" name="whichPage"  value="<%=whichPage%>"> --%>
																		<input type="hidden" name="prod_id"  value="${prodVO.prod_id}">
																		<input type="hidden" name="tab"  value="3">
																		<input type="hidden" name="action"	value="getOne_For_Update"></FORM>
																	</td>
																</tr>
															</c:if>
														</c:forEach>
													</tbody>
												</table>
<%-- 												<%@ include file="page2.file" %> --%>
										    </div>
										    
										    <div role="tabpanel" class="tab-pane" id="tab4">
<%-- 										    <%@ include file="page1.file" %>  --%>
												<table id="table4" class="table table-striped table-bordered table-hover" style="width:100%">
													<thead>
														<tr class="success">
															<th style="width: 30px">序號</th>
															<th style="width: 50px">照片</th>
															<th>商品編號</th>
															<th>商品名稱</th>
															<th>適用動物</th>
															<th>商品種類</th>
															<th>價格</th>
															<th>捐贈數量</th>
															<th>申請日期</th>
															<th>狀態</th>
															<th>原因</th>
															<th>修改</th>
														</tr>
													</thead>
													<tbody>
								
														<% int no4=0;%>
														<c:forEach var="prodVO" items="${list}">
															<c:if test="${prodVO.prod_review.equals('不通過')}" var="condition" scope="page">
																<% no4++; %>
																<tr>
																	<td><%=no4 %></td>
																	<td><img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${prodVO.prod_id}" alt="" width="50px" style="margin-bottom: auto"></td>
																	<td style=" margin-bottom: auto">${prodVO.prod_id}</td>
																	<td style=" margin-bottom: auto"><a href="<%=request.getContextPath()%>/product/product_upload.do?action=getOne_For_Display&prod_id=${prodVO.prod_id}">${prodVO.prod_name}</a></td>
																	<td style=" margin-bottom: auto">${prodVO.prod_ani_type_id}</td>
																	<td style=" margin-bottom: auto">${prodVO.prod_type_id}</td>
																	<td style=" margin-bottom: auto">$${prodVO.prod_price}</td>
																	<td style=" margin-bottom: auto">${prodVO.prod_qty}</td>
																	<td style=" margin-bottom: auto"><fmt:formatDate value="${prodVO.prod_date}" pattern="yyyy-MM-dd"/></td>
																	<td style=" margin-bottom: auto">${prodVO.prod_review}</td>
																	<td style=" margin-bottom: auto">${prodVO.prod_review_des}</td>
																	<td>
																		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product_upload.do" style="text-align: center; margin-bottom: auto">
																		<input type="submit" value="修改">
<%-- 																		<input type="hidden" name="whichPage"  value="<%=whichPage%>"> --%>
																		<input type="hidden" name="prod_id"  value="${prodVO.prod_id}">
																		<input type="hidden" name="tab"  value="4">
																		<input type="hidden" name="action"	value="getOne_For_Update"></FORM>
																	</td>
<!-- 																	<td> -->
<%-- 																		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product_upload.do" style="text-align: center; margin-bottom: auto"> --%>
<!-- 																		<input type="submit" value="刪除"> -->
<%-- <%-- 																		<input type="hidden" name="whichPage"  value="<%= whichPage %>"> --%>
<%-- 																		<input type="hidden" name="prod_id"  value="${prodVO.prod_id}"> --%>
<!-- 																		<input type="hidden" name="action" value="delete"></FORM> -->
<!-- 																	</td> -->
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


	<!-- 注意!!! 若有多個jquery會衝突 -->
	<script src="<%=request.getContextPath()%>/horse_UI_template/js/jquery.dataTables.js"></script>
	<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>

	<script>
		$(document).ready(function() {
		    $('#table1').DataTable();
		    $('#table2').DataTable();
		    $('#table3').DataTable();
		    $('#table4').DataTable();
		} );
	</script>
	
	
	<script>
// 		$(document).ready(function() {
<%-- 			$("#tab<%=tab%>").attr("class","tab-pane active"); --%>
<%-- 			$("li[role='presentation']:eq(<%=tab_int-1%>)").attr("class","active"); --%>
<%-- 			console.log($("li[role='presentation']:eq(<%=tab_int-1%>)").attr("class")); --%>
<%-- 			console.log($("#tab<%=tab%>")); --%>
// 		} );
	</script>	
	
	<script>
		$('#off').on('click',function(e){
		    e.preventDefault();
		    var form = $(this).parents('form');
		    swal({
	            title: "確定下架？",
	            html: "下架後就無法再重新上架囉",
	            type: "warning", // type can be "success", "error", "warning", "info", "question"
	            showCancelButton: true,
	        	showCloseButton: true,
	        }).then(
	        	   function (result) {
	        		   form.submit();
            }, function(dismiss) { // dismiss can be "cancel" | "overlay" | "esc" | "cancel" | "timer"
            		swal("取消", "取消下架", "error");
	        }).catch(swal.noop);
		});
		
	
	</script>
	
	<script>
		
		$("ul.nav-menu li").attr('class', "" );
		$("#member").attr('class', 'menu-active menu-has-children' )
		 
		 
	</script>

</body>
</html>



