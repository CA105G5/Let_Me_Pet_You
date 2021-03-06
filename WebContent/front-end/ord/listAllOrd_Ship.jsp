<%@page import="com.mem.model.MemVO"%>
<%@page import="com.prod.model.ProdVO"%>
<%@page import="com.prod.model.ProdService"%>
<%@ page import="com.orditem.model.OrdItemService"%>
<%@ page import="com.orditem.model.OrdItemVO"%>
<%@ page import="com.ord.model.OrdService"%>
<%@ page import="com.ord.model.OrdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.prodimg.model.ProdImgService"%>
<%@ page import="com.prodimg.model.ProdImgVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.util.*"%>

<!-- //要串會員，動態取得會員編號 -->
<%
	List<OrdItemVO> ordItemlist;
	ordItemlist = (List<OrdItemVO>) request.getAttribute("ordItemlist");
	MemVO memVO = (MemVO) session.getAttribute("memVO");
	String memb_id = null;
	if(memVO!=null)
		memb_id = memVO.getMemb_id();
	if (ordItemlist==null){
		ProdService prodSvc = new ProdService(); 
		List<ProdVO> prodList = prodSvc.getProdByMem(memb_id); 
		System.out.println("prodList.size()=" + prodList.size());
		OrdItemService ordItemSvc = new OrdItemService(); 
		ordItemlist = ordItemSvc.getOrdItemByProd(prodList);
		System.out.println("ordItemlist.size()=" + ordItemlist.size());
		pageContext.setAttribute("ordItemlist", ordItemlist);
		request.setAttribute("Test", "Test");
	}
	String tab = (String) request.getAttribute("tab");
	System.out.println("tab=" + tab);
	Integer tab_int = null;
	if (tab==null){
		tab="1";
		tab_int = new Integer(tab);
	}
	
	String ntf_src_id = (String)request.getAttribute("ntf_src_id");
	String ntf_prod_name = (String)request.getAttribute("prod_name");
	String ntf_dt = (String)request.getAttribute("ntf_dt");
	
	
	System.out.println("updateProdDon.jsp得到從ProdServlet.java傳過來的屬性"+request.getAttribute("Test"));
	System.out.println("updateProdDon.jsp得到從ProdServlet.java傳過來的請求參數值"+request.getParameter("whichPage"));
	System.out.println("updateProdDon.jsp得到從ProdServlet.java傳過來的請求參數值"+request.getParameter("prod_id"));
%>
<jsp:useBean id="ordSvc" scope="page" class="com.ord.model.OrdService" />
<jsp:useBean id="prodSvc" scope="page" class="com.prod.model.ProdService" />
		

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的出貨</title>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/logo3.png">

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

.modal {
  overflow-y:auto;
}

/* Timeline */
/* 參考網址https://bootsnipp.com/snippets/pjQlD */
.timeline,
.timeline-horizontal {
list-style: none;
padding: 20px;
position: relative;
}
.timeline:before {
top: 40px;
bottom: 0;
position: absolute;
content: " ";
width: 3px;
background-color: #eeeeee;
left: 50%;
margin-left: -1.5px;
}
.timeline .timeline-item {
margin-bottom: 20px;
position: relative;
}
.timeline .timeline-item:before,
.timeline .timeline-item:after {
content: "";
display: table;
}
.timeline .timeline-item:after {
clear: both;
}
.timeline .timeline-item .timeline-badge {
color: #fff;
width: 54px;
height: 54px;
line-height: 52px;
font-size: 22px;
text-align: center;
position: absolute;
top: 18px;
left: 50%;
margin-left: -25px;
background-color: #7c7c7c;
border: 3px solid #ffffff;
z-index: 100;
border-top-right-radius: 50%;
border-top-left-radius: 50%;
border-bottom-right-radius: 50%;
border-bottom-left-radius: 50%;
}
.timeline .timeline-item .timeline-badge i,
.timeline .timeline-item .timeline-badge .fa,
.timeline .timeline-item .timeline-badge .glyphicon {
top: 2px;
left: 0px;
}
.timeline .timeline-item .timeline-badge.primary {
background-color: #1f9eba;
}
.timeline .timeline-item .timeline-badge.info {
background-color: #5bc0de;
}
.timeline .timeline-item .timeline-badge.success {
background-color: #59ba1f;
}
.timeline .timeline-item .timeline-badge.warning {
background-color: #d1bd10;
}
.timeline .timeline-item .timeline-badge.danger {
background-color: #ba1f1f;
}
.timeline .timeline-item .timeline-panel {
position: relative;
width: 46%;
float: left;
right: 16px;
border: 1px solid #c0c0c0;
background: #ffffff;
border-radius: 2px;
padding: 20px;
-webkit-box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
}
.timeline .timeline-item .timeline-panel:before {
position: absolute;
top: 26px;
right: -16px;
display: inline-block;
border-top: 16px solid transparent;
border-left: 16px solid #c0c0c0;
border-right: 0 solid #c0c0c0;
border-bottom: 16px solid transparent;
content: " ";
}
.timeline .timeline-item .timeline-panel .timeline-title {
margin-top: 0;
color: inherit;
}
.timeline .timeline-item .timeline-panel .timeline-body > p,
.timeline .timeline-item .timeline-panel .timeline-body > ul {
margin-bottom: 0;
}
.timeline .timeline-item .timeline-panel .timeline-body > p + p {
margin-top: 5px;
}
.timeline .timeline-item:last-child:nth-child(even) {
float: right;
}
.timeline .timeline-item:nth-child(even) .timeline-panel {
float: right;
left: 16px;
}
.timeline .timeline-item:nth-child(even) .timeline-panel:before {
border-left-width: 0;
border-right-width: 14px;
left: -14px;
right: auto;
}
.timeline-horizontal {
list-style: none;
position: relative;
padding: 20px 0px 20px 0px;
display: inline-block;
}
.timeline-horizontal:before {
height: 3px;
top: auto;
bottom: 26px;
left: 50px;
right: 0;
width: 78%;
margin-bottom: 20px;
}
.timeline-horizontal .timeline-item {
display: table-cell;
height: 280px;
width: 20%;
min-width: 200px;
float: none !important;
padding-left: 0px;
padding-right: 20px;
margin: 0 auto;
vertical-align: bottom;
}
.timeline-horizontal .timeline-item .timeline-panel {
top: auto;
bottom: 64px;
display: inline-block;
float: none !important;
left: 0 !important;
right: 0 !important;
width: 110px;
margin-bottom: 20px;
}
.timeline-horizontal .timeline-item .timeline-panel:before {
top: auto;
bottom: -16px;
left: 28px !important;
right: auto;
border-right: 16px solid transparent !important;
border-top: 16px solid #c0c0c0 !important;
border-bottom: 0 solid #c0c0c0 !important;
border-left: 16px solid transparent !important;
}
.timeline-horizontal .timeline-item:before,
.timeline-horizontal .timeline-item:after {
display: none;
}
.timeline-horizontal .timeline-item .timeline-badge {
top: auto;
bottom: 0px;
left: 43px;
}

li>a{
	color:black;
}
li>a:hover{
	text-decoration:none;
	color:red;
}

</style>
</head>
<body>

	<jsp:include page="/index_Header.jsp" flush="true" />
	
	<img src="<%=request.getContextPath()%>/front-end/ord/member2.jpg" style="width:1520px">
	
	<section class="training-area">
		<div class="container-fluid">
			<div id="sider" class="n-browse-nav m-sticky-on" style="top: 100px; bottom: auto;">
				<div class="row">
					<div class="col-xs-12 col-sm-2 sidebar" style="margin-left:40px; margin-top: 50px">
						<div class="single-widget category-widget" style="padding-top:0px;">
							<h2 class="title" style="margin-bottom:10px;padding-top:30px;margin-top:0px">我的訂單</h2>
								<ul>
									<li><a href="<%=request.getContextPath()%>/front-end/ord/listAllOrd.jsp" class="justify-content-between align-items-center d-flex"><h4>我的收貨管理</h4></a></li>
									<li><a href="<%=request.getContextPath()%>/front-end/ord/listAllOrd_Ship.jsp" class="justify-content-between align-items-center d-flex"><h4>我的出貨管理</h4></a></li>
						
								</ul>
						</div>
					</div>
					
					<div class="col-xs-12 col-sm-8" style="margin-left:40px; margin-top: 50px; margin-bottom: 100px;">
						<div class="row">
							<div class="">
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
								
								<h1>我的出貨管理 <small>點擊訂單查看明細</small></h1>
							
								<div class="container">
									<div role="tabpanel">
									    <!-- 標籤面板：標籤區 -->
									    <ul class="nav nav-tabs" role="tablist">
									        <li role="presentation" class="active"> 
									            <a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab">待出貨</a>
									        </li>
									        <li role="presentation">
									            <a href="#tab2" aria-controls="tab2" role="tab" data-toggle="tab">已出貨</a>
									        </li>
									        <li role="presentation">
									            <a href="#tab3" aria-controls="tab3" role="tab" data-toggle="tab">已完成</a>
									        </li>
									        <li role="presentation">
									            <a href="#tab4" aria-controls="tab4" role="tab" data-toggle="tab">被檢舉</a>
									        </li>
									    </ul>
									
									    <!-- 標籤面板：內容區 -->
									    <br>
									    <div class="tab-content">
									        <div role="tabpanel" class="tab-pane active" id="tab1">
												<table id="table1" class="table table-striped table-bordered table-hover" style="width:100%">
													<thead>
														<tr class="" style="background-color:#c0ebee">
<!-- 															<th style="width: 30px">序號</th> -->
															<th width="100px">訂單編號</th>
															<th width="100px">照片</th>
															<th width="100px">商品名稱</th>
															<th width="100px">單價</th>
															<th width="100px">數量</th>
															<th width="100px">訂單時間</th>
															<th width="100px">確認出貨</th>
														</tr>
													</thead>
													<tbody>
								
														<% int no=0;%>
														<c:forEach var="ordItemVO" items="${ordItemlist}">
															<c:if test="${ordItemVO.ord_item_sp_status==null}" var="condition" scope="page">
																<% no++; %>
																<tr id="tr_ntf<%= no %>">
<%-- 																	<td><%=no %></td> --%>
<%-- 																	<td style=" margin-bottom: auto">${ordItemVO.ord_id}</td> --%>
																	<!--改成modal彈跳視窗 -->
<%-- 																	<td><A href="<%=request.getContextPath()%>/ordItem/ordItem.do?prod_id=${ordItemVO.prod_id}&ord_id=${ordItemVO.ord_id}&action=getOneModal_For_Detail">${ordItemVO.ord_id}</a></td> --%>
																	<td id="tr_ord_id<%= no %>"><input type="button" value="${ordItemVO.ord_id}" id="ord_detail1" class="btn btn-outline-info mb-1" data-toggle="modal" data-target="#ship_detail<%= no %>"}></td>
																	<!--改成modal彈跳視窗 -->
																	<td style=" margin-bottom: auto"><img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${ordItemVO.prod_id}" alt="" width="50px" style="margin-bottom: auto"></td>
																	<td style=" margin-bottom: auto" id="tr_prod_name<%= no %>"><a href="<%=request.getContextPath()%>/product/product_upload.do?action=getOne_For_Display&prod_id=${ordItemVO.prod_id}">${prodSvc.getOneProd(ordItemVO.prod_id).prod_name}</a></td>
																	<td style=" margin-bottom: auto">${prodSvc.getOneProd(ordItemVO.prod_id).prod_price}</td>
																	<td style=" margin-bottom: auto">${ordItemVO.ord_item_qty}</td>
																	<td style=" margin-bottom: auto"><fmt:formatDate value="${ordSvc.getOneOrd(ordItemVO.ord_id).ord_date}" pattern="yyyy-MM-dd"/></td>
																	<td style=" margin-bottom: auto">
<%-- 																		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ordItem/ordItem.do" style="text-align: center; margin-bottom: auto"> --%>
																		<input type="button" value="確認出貨" id='sp_confirm<%= no %>' class="btn btn-outline-info mb-1">
<%-- 																	<input type="hidden" name="whichPage"  value="<%=whichPage%>"> --%>
																		<input type="hidden" name="prod_id"  value="${ordItemVO.prod_id}">
																		<input type="hidden" name="ord_id"  value="${ordItemVO.ord_id}">
																		<input type="hidden" name="tab"  value="1">
																		<input type="hidden" name="action"	value="getOne_For_Receive_Update">
<!-- 																		</FORM> -->



<!-- 通知要顯示出哪一筆 -->
<script type="text/javascript">
	
// 	$(function(){
		var $ntf_dt = '${ntf_dt}';
		var $tr_ord_id = $("#tr_ord_id<%= no %>").children();
		var $tr_prod_name = $("#tr_prod_name<%= no %>").children();
		console.log("$ntf_dt===" +$ntf_dt);
		console.log("$tr_ord_id===" +$tr_ord_id.val());
		console.log("$tr_prod_name===" +$tr_prod_name.text());
		
		console.log("${ord_id}===" + '${ord_id}');
		console.log("${prod_name}===" + '${prod_name}');
		
		if($ntf_dt.indexOf("請盡快出貨")){
			
			console.log("請盡快出貨===")
				 
			$(".nav-tabs li").attr("class","");
			$(".nav-tabs li").eq(0).attr("class","active");
		}
		console.log("訂單編號===" + '${ord_id}');
		console.log("訂單編號===" + $tr_ord_id.val());
		console.log('${ord_id}'== $tr_ord_id.val());
		console.log("商品名稱===" + '${prod_name}');
		console.log("商品名稱===" + $tr_prod_name.text());
		console.log('${prod_name}'== $tr_prod_name.text());
					
		if('${ord_id}'== $tr_ord_id.val() && '${prod_name}'== $tr_prod_name.text()){
				 
			console.log("ntf_src_id==="+ '${ntf_src_id}');
			console.log("ntf_prod_name="+ '${ntf_prod_name}');
					
			$("#tr_ntf<%= no %>").css("background-color","#fbecbb");
					
		}	
// 	});
</script>






<script>
		 $("#sp_confirm<%= no %>").on('click', function () {
			 var $this = $(this);
			 console.log("$this.next().next().val()="+$this.next().next().val());
			 console.log("$this.next().val()="+$this.next().val());
		        swal({
		            title: "確定出貨？",
		            html: "按下確定出貨後要盡快將商品寄出喔.....",
		            type: "warning", // type can be "success", "error", "warning", "info", "question"
		            showCancelButton: true,
		        	showCloseButton: true,
		        }).then(
		        	   function (result) {
		                if (result) {
		                	$.ajax({
		    					url: '<%=request.getContextPath()%>/ordItem/ordItem.do',
		    					type: "get",
		    					data: { 'action': 'getOne_For_Ship_Update', 'ord_id': $this.next().next().val() , 'prod_id': $this.next().val() },
		    					dataType: 'json',
		    					success: function(res){
		    						console.log("0000000000");
		    						console.log(res);
		    						swal({
		    				    	     title: "完成!",
		    				    	     text: "已完成出貨",
		    				    	     type: "success",
		    				    	     timer: 3000
		    				    	});
		    						console.log("11111111");
<%-- 		    						window.location.href = "<%=request.getContextPath()%>/front-end/ord/listAllOrd_Ship.jsp"; --%>
		    						setInterval(function() { window.location.href = '<%=request.getContextPath()%>/front-end/ord/listAllOrd_Ship.jsp';}, 2000);
		    						console.log("22222222");
		    					},
		    					error: function(res){
		    						console.log("eeeeeeee");
		    						console.log("res="+res);
		    					}
		    				
		    				});
		                }
	            }, function(dismiss) { // dismiss can be "cancel" | "overlay" | "esc" | "cancel" | "timer"
	            		swal("取消", "取消出貨", "error");
		        }).catch(swal.noop);
		    });
		 </script>







																	</td>
																</tr>
																
																
																<!--訂單明細modal -->
<div class="modal" id="ship_detail<%= no %>" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
								                <div class="modal-dialog modal-lg" role="document">
								                    <div class="modal-content">
								                        <div class="modal-header">
								                            <h3 class="modal-title" id="largeModalLabel">訂單明細</h3>
								                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								                                <span aria-hidden="true">&times;</span>
								                            </button>
								                        </div>
								                        <div class="modal-body">
		<div class="container">
			<div class="form-group" style="width:700px">
							<h3>訂單內容</h3>
							<div class="container">
								<hr>
								<div class="row">
									<div class="col-xs-3 col-sm-3">
										<img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${ordItemVO.prod_id}" alt="" width="200px">
									</div>
									<div class="col-xs-6 col-sm-6">
										<h5>${prodSvc.getOneProd(ordItemVO.prod_id).prod_name}
											<span style="font-size: 1em; color: Tomato; text-indent:50px;">
												<i class="fas fa-coins"></i>
												<b>${prodSvc.getOneProd(ordItemVO.prod_id).prod_price}</b>
											</span>
											X ${ordItemVO.ord_item_qty}
										</h5>
									</div>
								</div>
							</div>
							
			</div>
						<br>
						<div class="form-group" style="width:700px">
							<h3>收件人資訊</h3>
							<hr>
<!-- 							<table> -->
<%-- 								<tr><th>收件人</th><td>${ordSvc.getOneOrd(ordItemVO.ord_id).ord_receiver}</td></tr> --%>
<%-- 								<tr><th>收件人電話</th><td>${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_tel}</td></tr> --%>
<%-- 								<tr><th>收件人地址</th><td>${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_add}</td></tr> --%>
<%-- 								<tr><th>收件備註</th><td>${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_comm==null? "無" : ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_comm}</td></tr> --%>
<!-- 							</table> -->
								<span>收件人　　　${ordSvc.getOneOrd(ordItemVO.ord_id).ord_receiver}</span><br>
								<span>收件人電話　${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_tel}</span><br>
								<span>收件人地址　${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_add}</span><br>
								<span>收件備註　　${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_comm==null? "無" : ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_comm}</span><br>
						</div>
						<br>
						<div class="form-group" style="width:1000px; display: ${ordItemVO.ord_item_rt_status.equals("已檢舉")? "" : "none"}" >
							<h3>檢舉資訊</h3>
								<hr>
										<span>檢舉狀態　　　${ordItemVO.ord_item_rt_status}</span><br>
										<span>檢舉時間　　　<fmt:formatDate value="${ordItemVO.ord_item_rt_date}" pattern="yyyy-MM-dd HH:mm:ss"/></span><br>
										<span>檢舉理由　　　${ordItemVO.ord_item_rt_comm}</span><br>
										<span>檢舉照片<br></span>
										<span style="padding-left:100px">${ordItemVO.ord_item_rt_pic}</span><br><br>
										<span>檢舉審核結果　${ordItemVO.ord_item_review==null? "未審核": ordItemVO.ord_item_review}</span><br>
										<span>檢舉審核描述　${ordItemVO.ord_item_rv_des==null? "未審核": ordItemVO.ord_item_rv_des}</span><br>
						</div>
						<br>
						<div class="form-group" style="width:700px">
							<h3 style="display:inline">訂單狀態 </h3>
							<c:choose>
							    <c:when test="${ordItemVO.ord_item_rt_status.equals('已檢舉')}">
							        <span><h4 style="display:inline; padding-left:30px">被檢舉</h4></span>
							    </c:when>
							    <c:when test="${ordItemVO.ord_item_rt_status.equals('未檢舉')}">
							        <span><h4 style="display:inline; padding-left:30px">已完成</h4></span>
							    </c:when>
							    <c:when test="${ordItemVO.ord_item_sp_status!=null && ordItemVO.ord_item_rc_status==null}">
							        <span><h4 style="display:inline; padding-left:30px">已出貨</h4></span>
							    </c:when>
							    <c:when test="${ordItemVO.ord_item_sp_status==null}">
							        <span><h4 style="display:inline; padding-left:30px">待出貨</h4></span>
							    </c:when>
							    <c:otherwise>
							    </c:otherwise>
							</c:choose>
							<hr>
							
						</div>
						<br>
						<div class="form-group" style="width:700px">
							<h3>訂單歷史</h3>
							<hr>
							
								<div class="container">
									<div class="row">
										<div class="col-md-12">
											<div style="display:inline-block;width:700px">
												<ul class="timeline timeline-horizontal">
													<li class="timeline-item" style="width:170px">
														<div class="timeline-badge ${ordSvc.getOneOrd(ordItemVO.ord_id).ord_date==null? '':'primary'}"><i class="glyphicon glyphicon-time"></i></div>
														<div class="timeline-panel">
															<div class="timeline-heading">訂單成立
																<p><small class="text-muted"><fmt:formatDate value="${ordSvc.getOneOrd(ordItemVO.ord_id).ord_date}" pattern="yyyy-MM-dd HH:mm:ss"/></small></p>
															</div>
														</div>
													</li>
													<li class="timeline-item">
														<div class="timeline-badge ${ordItemVO.ord_item_sp_date==null? '':'primary'}"><i class="glyphicon glyphicon-time"></i></div>
														<div class="timeline-panel">
															<div class="timeline-heading">出貨時間
																<p><small class="text-muted"><fmt:formatDate value="${ordItemVO.ord_item_sp_date}" pattern="yyyy-MM-dd HH:mm:ss"/></small></p>
															</div>
														</div>
													</li>
													<li class="timeline-item">
														<div class="timeline-badge ${ordItemVO.ord_item_rc_date==null? '':'primary'}"><i class="glyphicon glyphicon-time"></i></div>
														<div class="timeline-panel">
															<div class="timeline-heading">收貨時間
																<p><small class="text-muted"><fmt:formatDate value="${ordItemVO.ord_item_rc_date}" pattern="yyyy-MM-dd HH:mm:ss"/></small></p>
															</div>
														</div>
													</li>
													<li class="timeline-item">
														<div class="timeline-badge ${ordItemVO.ord_item_rt_date==null? '':'primary'}"><i class="glyphicon glyphicon-time"></i></div>
														<div class="timeline-panel">
															<div class="timeline-heading">檢舉時間
																<p><small class="text-muted"><fmt:formatDate value="${ordItemVO.ord_item_rt_date}" pattern="yyyy-MM-dd HH:mm:ss"/></small></p>
															</div>
														</div>
													</li>
												</ul>
											</div>
										</div>
									</div>
									
								</div>
						</div>
					</div>
						
					</div>
								                        <div class="modal-footer">
								                            <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
<!-- 								                            <button type="button" class="btn btn-primary">送出</button> -->
								                        </div>
								                    </div>
								                </div>
								            </div>	
								                


<!--訂單明細modal -->
																
																
															</c:if>
														</c:forEach>
													</tbody>
												</table>
															        
									        </div>
									        
									        <div role="tabpanel" class="tab-pane" id="tab2">
<%-- 										    <%@ include file="page1.file" %>  --%>
												<table id="table2" class="table table-striped table-bordered table-hover" style="width:100%">
													<thead>
														<tr class="" style="background-color:#c0ebee">
<!-- 															<th style="width: 30px">序號</th> -->
															<th width="100px">訂單編號</th>
															<th width="100px">照片</th>
															<th width="100px">商品名稱</th>
															<th width="100px">單價</th>
															<th width="100px">數量</th>
															<th width="100px">訂單時間</th>
															<th width="100px">出貨狀態</th>
															<th width="100px">出貨時間</th>
														</tr>
													</thead>
													<tbody>
								
														<% int no2=0;%>
														<c:forEach var="ordItemVO" items="${ordItemlist}">
															<c:if test="${ordItemVO.ord_item_sp_status.equals('已出貨') && ordItemVO.ord_item_rc_status==null && ordItemVO.ord_item_rt_status==null }" var="condition" scope="page">
																<% no2++; %>
																<tr>
<%-- 																	<td><%=no2 %></td> --%>
<%-- 																	<td style=" margin-bottom: auto">${ordItemVO.ord_id}</td> --%>
																	<!--改成modal彈跳視窗 -->
<%-- 																	<td><A href="<%=request.getContextPath()%>/ordItem/ordItem.do?prod_id=${ordItemVO.prod_id}&ord_id=${ordItemVO.ord_id}&action=getOneModal_For_Detail">${ordItemVO.ord_id}</a></td> --%>
																	<td><input type="submit" value="${ordItemVO.ord_id}" id="ord_detail2" class="btn btn-outline-info mb-1" data-toggle="modal" data-target="#shipped_detail<%= no2 %>"}></td>
																	<!--改成modal彈跳視窗 -->
																	<td style=" margin-bottom: auto"><img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${ordItemVO.prod_id}" alt="" width="50px" style="margin-bottom: auto"></td>
																	<td style=" margin-bottom: auto"><a href="<%=request.getContextPath()%>/product/product_upload.do?action=getOne_For_Display&prod_id=${ordItemVO.prod_id}">${prodSvc.getOneProd(ordItemVO.prod_id).prod_name}</a></td>
																	<td style=" margin-bottom: auto">${prodSvc.getOneProd(ordItemVO.prod_id).prod_price}</td>
																	<td style=" margin-bottom: auto">${ordItemVO.ord_item_qty}</td>
																	<td style=" margin-bottom: auto"><fmt:formatDate value="${ordSvc.getOneOrd(ordItemVO.ord_id).ord_date}" pattern="yyyy-MM-dd"/></td>
																	<td style=" margin-bottom: auto">${ordItemVO.ord_item_sp_status}</td>
																	<td style=" margin-bottom: auto"><fmt:formatDate value="${ordItemVO.ord_item_sp_date}" pattern="yyyy-MM-dd"/></td>
																</tr>
																
																
																	<!--訂單明細modal -->
<div class="modal" id="shipped_detail<%= no2 %>" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
								                <div class="modal-dialog modal-lg" role="document">
								                    <div class="modal-content">
								                        <div class="modal-header">
								                            <h3 class="modal-title" id="largeModalLabel">訂單明細</h3>
								                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								                                <span aria-hidden="true">&times;</span>
								                            </button>
								                        </div>
								                        <div class="modal-body">
		<div class="container">
			<div class="form-group" style="width:700px">
							<h3>訂單內容</h3>
							<div class="container">
								<hr>
								<div class="row">
									<div class="col-xs-3 col-sm-3">
										<img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${ordItemVO.prod_id}" alt="" width="200px">
									</div>
									<div class="col-xs-6 col-sm-6">
										<h5>${prodSvc.getOneProd(ordItemVO.prod_id).prod_name}
											<span style="font-size: 1em; color: Tomato; text-indent:50px;">
												<i class="fas fa-coins"></i>
												<b>${prodSvc.getOneProd(ordItemVO.prod_id).prod_price}</b>
											</span>
											X ${ordItemVO.ord_item_qty}
										</h5>
									</div>
								</div>
							</div>
							
			</div>
						<br>
						<div class="form-group" style="width:700px">
							<h3>收件人資訊</h3>
							<hr>
<!-- 							<table> -->
<%-- 								<tr><th>收件人</th><td>${ordSvc.getOneOrd(ordItemVO.ord_id).ord_receiver}</td></tr> --%>
<%-- 								<tr><th>收件人電話</th><td>${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_tel}</td></tr> --%>
<%-- 								<tr><th>收件人地址</th><td>${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_add}</td></tr> --%>
<%-- 								<tr><th>收件備註</th><td>${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_comm==null? "無" : ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_comm}</td></tr> --%>
<!-- 							</table> -->
								<span>收件人　　　${ordSvc.getOneOrd(ordItemVO.ord_id).ord_receiver}</span><br>
								<span>收件人電話　${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_tel}</span><br>
								<span>收件人地址　${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_add}</span><br>
								<span>收件備註　　${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_comm==null? "無" : ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_comm}</span><br>
						</div>
						<br>
						<div class="form-group" style="width:1000px; display: ${ordItemVO.ord_item_rt_status.equals("已檢舉")? "" : "none"}" >
							<h3>檢舉資訊</h3>
								<hr>
										<span>檢舉狀態　　　${ordItemVO.ord_item_rt_status}</span><br>
										<span>檢舉時間　　　<fmt:formatDate value="${ordItemVO.ord_item_rt_date}" pattern="yyyy-MM-dd HH:mm:ss"/></span><br>
										<span>檢舉理由　　　${ordItemVO.ord_item_rt_comm}</span><br>
										<span>檢舉照片<br></span>
										<span style="padding-left:100px">${ordItemVO.ord_item_rt_pic}</span><br><br>
										<span>檢舉審核結果　${ordItemVO.ord_item_review==null? "未審核": ordItemVO.ord_item_review}</span><br>
										<span>檢舉審核描述　${ordItemVO.ord_item_rv_des==null? "未審核": ordItemVO.ord_item_rv_des}</span><br>
						</div>
						<br>
						<div class="form-group" style="width:700px">
							<h3 style="display:inline">訂單狀態 </h3>
							<c:choose>
							    <c:when test="${ordItemVO.ord_item_rt_status.equals('已檢舉')}">
							        <span><h4 style="display:inline; padding-left:30px">被檢舉</h4></span>
							    </c:when>
							    <c:when test="${ordItemVO.ord_item_rt_status.equals('未檢舉')}">
							        <span><h4 style="display:inline; padding-left:30px">已完成</h4></span>
							    </c:when>
							    <c:when test="${ordItemVO.ord_item_sp_status!=null && ordItemVO.ord_item_rc_status==null}">
							        <span><h4 style="display:inline; padding-left:30px">已出貨</h4></span>
							    </c:when>
							    <c:when test="${ordItemVO.ord_item_sp_status==null}">
							        <span><h4 style="display:inline; padding-left:30px">待出貨</h4></span>
							    </c:when>
							    <c:otherwise>
							    </c:otherwise>
							</c:choose>
							<hr>
							
						</div>
						<br>
						<div class="form-group" style="width:700px">
							<h3>訂單歷史</h3>
							<hr>
							
								<div class="container">
									<div class="row">
										<div class="col-md-12">
											<div style="display:inline-block;width:700px">
												<ul class="timeline timeline-horizontal">
													<li class="timeline-item" style="width:170px">
														<div class="timeline-badge ${ordSvc.getOneOrd(ordItemVO.ord_id).ord_date==null? '':'primary'}"><i class="glyphicon glyphicon-time"></i></div>
														<div class="timeline-panel">
															<div class="timeline-heading">訂單成立
																<p><small class="text-muted"><fmt:formatDate value="${ordSvc.getOneOrd(ordItemVO.ord_id).ord_date}" pattern="yyyy-MM-dd HH:mm:ss"/></small></p>
															</div>
														</div>
													</li>
													<li class="timeline-item">
														<div class="timeline-badge ${ordItemVO.ord_item_sp_date==null? '':'primary'}"><i class="glyphicon glyphicon-time"></i></div>
														<div class="timeline-panel">
															<div class="timeline-heading">出貨時間
																<p><small class="text-muted"><fmt:formatDate value="${ordItemVO.ord_item_sp_date}" pattern="yyyy-MM-dd HH:mm:ss"/></small></p>
															</div>
														</div>
													</li>
													<li class="timeline-item">
														<div class="timeline-badge ${ordItemVO.ord_item_rc_date==null? '':'primary'}"><i class="glyphicon glyphicon-time"></i></div>
														<div class="timeline-panel">
															<div class="timeline-heading">收貨時間
																<p><small class="text-muted"><fmt:formatDate value="${ordItemVO.ord_item_rc_date}" pattern="yyyy-MM-dd HH:mm:ss"/></small></p>
															</div>
														</div>
													</li>
													<li class="timeline-item">
														<div class="timeline-badge ${ordItemVO.ord_item_rt_date==null? '':'primary'}"><i class="glyphicon glyphicon-time"></i></div>
														<div class="timeline-panel">
															<div class="timeline-heading">檢舉時間
																<p><small class="text-muted"><fmt:formatDate value="${ordItemVO.ord_item_rt_date}" pattern="yyyy-MM-dd HH:mm:ss"/></small></p>
															</div>
														</div>
													</li>
												</ul>
											</div>
										</div>
									</div>
									
								</div>
						</div>
					</div>
						
					</div>
								                        <div class="modal-footer">
								                            <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
<!-- 								                            <button type="button" class="btn btn-primary">送出</button> -->
								                        </div>
								                    </div>
								                </div>
								            </div>	
								                


<!--訂單明細modal -->
																
																
																
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
														<tr class="" style="background-color:#c0ebee">
<!-- 															<th style="width: 30px">序號</th> -->
															<th width="100px">訂單編號</th>
															<th width="100px">照片</th>
															<th width="100px">商品名稱</th>
															<th width="100px">單價</th>
															<th width="100px">數量</th>
															<th width="100px">訂單時間</th>
															<th width="100px">出貨時間</th>
															<th width="100px">收貨時間</th>
														</tr>
													</thead>
													<tbody>
								
														<% int no3=0;%>
														<c:forEach var="ordItemVO" items="${ordItemlist}">
															<c:if test="${ordItemVO.ord_item_rc_status.equals('已收貨')}" var="condition" scope="page">
																<% no3++; %>
																<tr>
<%-- 																	<td><%=no %></td> --%>
<%-- 																	<td style=" margin-bottom: auto">${ordItemVO.ord_id}</td> --%>
																	<!--改成modal彈跳視窗 -->
<%-- 																	<td><A href="<%=request.getContextPath()%>/ordItem/ordItem.do?prod_id=${ordItemVO.prod_id}&ord_id=${ordItemVO.ord_id}&action=getOneModal_For_Detail">${ordItemVO.ord_id}</a></td> --%>
																	<td><input type="submit" value="${ordItemVO.ord_id}" id="ord_detail3" class="btn btn-outline-info mb-1" data-toggle="modal" data-target="#finish_detail<%= no3 %>"}></td>
																	<!--改成modal彈跳視窗 -->
																	<td style=" margin-bottom: auto"><img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${ordItemVO.prod_id}" alt="" width="50px" style="margin-bottom: auto"></td>
																	<td style=" margin-bottom: auto"><a href="<%=request.getContextPath()%>/product/product_upload.do?action=getOne_For_Display&prod_id=${ordItemVO.prod_id}">${prodSvc.getOneProd(ordItemVO.prod_id).prod_name}</a></td>
																	<td style=" margin-bottom: auto">${prodSvc.getOneProd(ordItemVO.prod_id).prod_price}</td>
																	<td style=" margin-bottom: auto">${ordItemVO.ord_item_qty}</td>
																	<td style=" margin-bottom: auto"><fmt:formatDate value="${ordSvc.getOneOrd(ordItemVO.ord_id).ord_date}" pattern="yyyy-MM-dd"/></td>
																	<td style=" margin-bottom: auto"><fmt:formatDate value="${ordItemVO.ord_item_sp_date}" pattern="yyyy-MM-dd"/></td>
																	<td style=" margin-bottom: auto"><fmt:formatDate value="${ordItemVO.ord_item_rc_date}" pattern="yyyy-MM-dd"/></td>
																</tr>
																
																
																	<!--訂單明細modal -->
<div class="modal" id="finish_detail<%= no3 %>" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
								                <div class="modal-dialog modal-lg" role="document">
								                    <div class="modal-content">
								                        <div class="modal-header">
								                            <h3 class="modal-title" id="largeModalLabel">訂單明細</h3>
								                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								                                <span aria-hidden="true">&times;</span>
								                            </button>
								                        </div>
								                        <div class="modal-body">
		<div class="container">
			<div class="form-group" style="width:700px">
							<h3>訂單內容</h3>
							<div class="container">
								<hr>
								<div class="row">
									<div class="col-xs-3 col-sm-3">
										<img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${ordItemVO.prod_id}" alt="" width="200px">
									</div>
									<div class="col-xs-6 col-sm-6">
										<h5>${prodSvc.getOneProd(ordItemVO.prod_id).prod_name}
											<span style="font-size: 1em; color: Tomato; text-indent:50px;">
												<i class="fas fa-coins"></i>
												<b>${prodSvc.getOneProd(ordItemVO.prod_id).prod_price}</b>
											</span>
											X ${ordItemVO.ord_item_qty}
										</h5>
									</div>
								</div>
							</div>
							
			</div>
						<br>
						<div class="form-group" style="width:700px">
							<h3>收件人資訊</h3>
							<hr>
<!-- 							<table> -->
<%-- 								<tr><th>收件人</th><td>${ordSvc.getOneOrd(ordItemVO.ord_id).ord_receiver}</td></tr> --%>
<%-- 								<tr><th>收件人電話</th><td>${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_tel}</td></tr> --%>
<%-- 								<tr><th>收件人地址</th><td>${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_add}</td></tr> --%>
<%-- 								<tr><th>收件備註</th><td>${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_comm==null? "無" : ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_comm}</td></tr> --%>
<!-- 							</table> -->
								<span>收件人　　　${ordSvc.getOneOrd(ordItemVO.ord_id).ord_receiver}</span><br>
								<span>收件人電話　${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_tel}</span><br>
								<span>收件人地址　${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_add}</span><br>
								<span>收件備註　　${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_comm==null? "無" : ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_comm}</span><br>
						</div>
						<br>
						<div class="form-group" style="width:1000px; display: ${ordItemVO.ord_item_rt_status.equals("已檢舉")? "" : "none"}" >
							<h3>檢舉資訊</h3>
								<hr>
										<span>檢舉狀態　　　${ordItemVO.ord_item_rt_status}</span><br>
										<span>檢舉時間　　　<fmt:formatDate value="${ordItemVO.ord_item_rt_date}" pattern="yyyy-MM-dd HH:mm:ss"/></span><br>
										<span>檢舉理由　　　${ordItemVO.ord_item_rt_comm}</span><br>
										<span>檢舉照片<br></span>
										<span style="padding-left:100px">${ordItemVO.ord_item_rt_pic}</span><br><br>
										<span>檢舉審核結果　${ordItemVO.ord_item_review==null? "未審核": ordItemVO.ord_item_review}</span><br>
										<span>檢舉審核描述　${ordItemVO.ord_item_rv_des==null? "未審核": ordItemVO.ord_item_rv_des}</span><br>
						</div>
						<br>
						<div class="form-group" style="width:700px">
							<h3 style="display:inline">訂單狀態 </h3>
							<c:choose>
							    <c:when test="${ordItemVO.ord_item_rt_status.equals('已檢舉')}">
							        <span><h4 style="display:inline; padding-left:30px">被檢舉</h4></span>
							    </c:when>
							    <c:when test="${ordItemVO.ord_item_rt_status.equals('未檢舉')}">
							        <span><h4 style="display:inline; padding-left:30px">已完成</h4></span>
							    </c:when>
							    <c:when test="${ordItemVO.ord_item_sp_status!=null && ordItemVO.ord_item_rc_status==null}">
							        <span><h4 style="display:inline; padding-left:30px">已出貨</h4></span>
							    </c:when>
							    <c:when test="${ordItemVO.ord_item_sp_status==null}">
							        <span><h4 style="display:inline; padding-left:30px">待出貨</h4></span>
							    </c:when>
							    <c:otherwise>
							    </c:otherwise>
							</c:choose>
							<hr>
							
						</div>
						<br>
						<div class="form-group" style="width:700px">
							<h3>訂單歷史</h3>
							<hr>
							
								<div class="container">
									<div class="row">
										<div class="col-md-12">
											<div style="display:inline-block;width:700px">
												<ul class="timeline timeline-horizontal">
													<li class="timeline-item" style="width:170px">
														<div class="timeline-badge ${ordSvc.getOneOrd(ordItemVO.ord_id).ord_date==null? '':'primary'}"><i class="glyphicon glyphicon-time"></i></div>
														<div class="timeline-panel">
															<div class="timeline-heading">訂單成立
																<p><small class="text-muted"><fmt:formatDate value="${ordSvc.getOneOrd(ordItemVO.ord_id).ord_date}" pattern="yyyy-MM-dd HH:mm:ss"/></small></p>
															</div>
														</div>
													</li>
													<li class="timeline-item">
														<div class="timeline-badge ${ordItemVO.ord_item_sp_date==null? '':'primary'}"><i class="glyphicon glyphicon-time"></i></div>
														<div class="timeline-panel">
															<div class="timeline-heading">出貨時間
																<p><small class="text-muted"><fmt:formatDate value="${ordItemVO.ord_item_sp_date}" pattern="yyyy-MM-dd HH:mm:ss"/></small></p>
															</div>
														</div>
													</li>
													<li class="timeline-item">
														<div class="timeline-badge ${ordItemVO.ord_item_rc_date==null? '':'primary'}"><i class="glyphicon glyphicon-time"></i></div>
														<div class="timeline-panel">
															<div class="timeline-heading">收貨時間
																<p><small class="text-muted"><fmt:formatDate value="${ordItemVO.ord_item_rc_date}" pattern="yyyy-MM-dd HH:mm:ss"/></small></p>
															</div>
														</div>
													</li>
													<li class="timeline-item">
														<div class="timeline-badge ${ordItemVO.ord_item_rt_date==null? '':'primary'}"><i class="glyphicon glyphicon-time"></i></div>
														<div class="timeline-panel">
															<div class="timeline-heading">檢舉時間
																<p><small class="text-muted"><fmt:formatDate value="${ordItemVO.ord_item_rt_date}" pattern="yyyy-MM-dd HH:mm:ss"/></small></p>
															</div>
														</div>
													</li>
												</ul>
											</div>
										</div>
									</div>
									
								</div>
						</div>
					</div>
						
					</div>
								                        <div class="modal-footer">
								                            <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
<!-- 								                            <button type="button" class="btn btn-primary">送出</button> -->
								                        </div>
								                    </div>
								                </div>
								            </div>	
								                


<!--訂單明細modal -->
																
																
																
																
																
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
														<tr class="" style="background-color:#c0ebee">
<!-- 															<th style="width: 30px">序號</th> -->
															<th width="100px">訂單編號</th>
															<th width="100px">照片</th>
															<th width="100px">商品名稱</th>
															<th width="100px">單價</th>
															<th width="100px">數量</th>
															<th width="100px">訂單時間</th>
															<th width="100px">出貨時間</th>
															<th width="100px">檢舉時間</th>
															<th width="100px">檢舉理由</th>
															<th width="100px">檢舉審核結果</th>
														</tr>
													</thead>
													<tbody>
								
													<% int no4=0;%>
														<c:forEach var="ordItemVO" items="${ordItemlist}">
															<c:if test="${ordItemVO.ord_item_rt_status.equals('已檢舉')}" var="condition" scope="page">
																<% no4++; %>
																<tr>
<%-- 																	<td style=" margin-bottom: auto">${ordItemVO.ord_id}</td> --%>
																	<!--改成modal彈跳視窗 -->
<%-- 																	<td><A href="<%=request.getContextPath()%>/ordItem/ordItem.do?prod_id=${ordItemVO.prod_id}&ord_id=${ordItemVO.ord_id}&action=getOneModal_For_Detail">${ordItemVO.ord_id}</a></td> --%>
																	<td><input type="submit" value="${ordItemVO.ord_id}" id="ord_detail4" class="btn btn-outline-info mb-1" data-toggle="modal" data-target="#report_detail<%= no4 %>"}></td>
																	<!--改成modal彈跳視窗 -->
																	<td style=" margin-bottom: auto"><img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${ordItemVO.prod_id}" alt="" width="50px" style="margin-bottom: auto"></td>
																	<td style=" margin-bottom: auto"><a href="<%=request.getContextPath()%>/product/product_upload.do?action=getOne_For_Display&prod_id=${ordItemVO.prod_id}">${prodSvc.getOneProd(ordItemVO.prod_id).prod_name}</a></td>
																	<td style=" margin-bottom: auto">${prodSvc.getOneProd(ordItemVO.prod_id).prod_price}</td>
																	<td style=" margin-bottom: auto">${ordItemVO.ord_item_qty}</td>
																	<td style=" margin-bottom: auto"><fmt:formatDate value="${ordSvc.getOneOrd(ordItemVO.ord_id).ord_date}" pattern="yyyy-MM-dd"/></td>
																	<td style=" margin-bottom: auto"><fmt:formatDate value="${ordItemVO.ord_item_sp_date}" pattern="yyyy-MM-dd"/></td>
																	<td style=" margin-bottom: auto"><fmt:formatDate value="${ordItemVO.ord_item_rt_date}" pattern="yyyy-MM-dd"/></td>
																	<td style=" margin-bottom: auto">${ordItemVO.ord_item_rt_comm}</td>
																	<td style=" margin-bottom: auto">${ordItemVO.ord_item_review}</td>
																</tr>
																
																	<!--訂單明細modal -->
<div class="modal" id="report_detail<%= no4 %>" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
								                <div class="modal-dialog modal-lg" role="document">
								                    <div class="modal-content">
								                        <div class="modal-header">
								                            <h3 class="modal-title" id="largeModalLabel">訂單明細</h3>
								                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								                                <span aria-hidden="true">&times;</span>
								                            </button>
								                        </div>
								                        <div class="modal-body">
		<div class="container">
			<div class="form-group" style="width:700px">
							<h3>訂單內容</h3>
							<div class="container">
								<hr>
								<div class="row">
									<div class="col-xs-3 col-sm-3">
										<img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${ordItemVO.prod_id}" alt="" width="200px">
									</div>
									<div class="col-xs-6 col-sm-6">
										<h5>${prodSvc.getOneProd(ordItemVO.prod_id).prod_name}
											<span style="font-size: 1em; color: Tomato; text-indent:50px;">
												<i class="fas fa-coins"></i>
												<b>${prodSvc.getOneProd(ordItemVO.prod_id).prod_price}</b>
											</span>
											X ${ordItemVO.ord_item_qty}
										</h5>
									</div>
								</div>
							</div>
							
			</div>
						<br>
						<div class="form-group" style="width:700px">
							<h3>收件人資訊</h3>
							<hr>
<!-- 							<table> -->
<%-- 								<tr><th>收件人</th><td>${ordSvc.getOneOrd(ordItemVO.ord_id).ord_receiver}</td></tr> --%>
<%-- 								<tr><th>收件人電話</th><td>${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_tel}</td></tr> --%>
<%-- 								<tr><th>收件人地址</th><td>${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_add}</td></tr> --%>
<%-- 								<tr><th>收件備註</th><td>${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_comm==null? "無" : ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_comm}</td></tr> --%>
<!-- 							</table> -->
								<span>收件人　　　${ordSvc.getOneOrd(ordItemVO.ord_id).ord_receiver}</span><br>
								<span>收件人電話　${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_tel}</span><br>
								<span>收件人地址　${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_add}</span><br>
								<span>收件備註　　${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_comm==null? "無" : ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_comm}</span><br>
						</div>
						<br>
						<div class="form-group" style="width:1000px; display: ${ordItemVO.ord_item_rt_status.equals("已檢舉")? "" : "none"}" >
							<h3>檢舉資訊</h3>
								<hr>
										<span>檢舉狀態　　　${ordItemVO.ord_item_rt_status}</span><br>
										<span>檢舉時間　　　<fmt:formatDate value="${ordItemVO.ord_item_rt_date}" pattern="yyyy-MM-dd HH:mm:ss"/></span><br>
										<span>檢舉理由　　　${ordItemVO.ord_item_rt_comm}</span><br>
										<span>檢舉照片<br></span>
										<span style="padding-left:100px">${ordItemVO.ord_item_rt_pic}</span><br><br>
										<span>檢舉審核結果　${ordItemVO.ord_item_review==null? "未審核": ordItemVO.ord_item_review}</span><br>
										<span>檢舉審核描述　${ordItemVO.ord_item_rv_des==null? "未審核": ordItemVO.ord_item_rv_des}</span><br>
						</div>
						<br>
						<div class="form-group" style="width:700px">
							<h3 style="display:inline">訂單狀態 </h3>
							<c:choose>
							    <c:when test="${ordItemVO.ord_item_rt_status.equals('已檢舉')}">
							        <span><h4 style="display:inline; padding-left:30px">被檢舉</h4></span>
							    </c:when>
							    <c:when test="${ordItemVO.ord_item_rt_status.equals('未檢舉')}">
							        <span><h4 style="display:inline; padding-left:30px">已完成</h4></span>
							    </c:when>
							    <c:when test="${ordItemVO.ord_item_sp_status!=null && ordItemVO.ord_item_rc_status==null}">
							        <span><h4 style="display:inline; padding-left:30px">已出貨</h4></span>
							    </c:when>
							    <c:when test="${ordItemVO.ord_item_sp_status==null}">
							        <span><h4 style="display:inline; padding-left:30px">待出貨</h4></span>
							    </c:when>
							    <c:otherwise>
							    </c:otherwise>
							</c:choose>
							<hr>
							
						</div>
						<br>
						<div class="form-group" style="width:700px">
							<h3>訂單歷史</h3>
							<hr>
							
								<div class="container">
									<div class="row">
										<div class="col-md-12">
											<div style="display:inline-block;width:700px">
												<ul class="timeline timeline-horizontal">
													<li class="timeline-item" style="width:170px">
														<div class="timeline-badge ${ordSvc.getOneOrd(ordItemVO.ord_id).ord_date==null? '':'primary'}"><i class="glyphicon glyphicon-time"></i></div>
														<div class="timeline-panel">
															<div class="timeline-heading">訂單成立
																<p><small class="text-muted"><fmt:formatDate value="${ordSvc.getOneOrd(ordItemVO.ord_id).ord_date}" pattern="yyyy-MM-dd HH:mm:ss"/></small></p>
															</div>
														</div>
													</li>
													<li class="timeline-item">
														<div class="timeline-badge ${ordItemVO.ord_item_sp_date==null? '':'primary'}"><i class="glyphicon glyphicon-time"></i></div>
														<div class="timeline-panel">
															<div class="timeline-heading">出貨時間
																<p><small class="text-muted"><fmt:formatDate value="${ordItemVO.ord_item_sp_date}" pattern="yyyy-MM-dd HH:mm:ss"/></small></p>
															</div>
														</div>
													</li>
													<li class="timeline-item">
														<div class="timeline-badge ${ordItemVO.ord_item_rc_date==null? '':'primary'}"><i class="glyphicon glyphicon-time"></i></div>
														<div class="timeline-panel">
															<div class="timeline-heading">收貨時間
																<p><small class="text-muted"><fmt:formatDate value="${ordItemVO.ord_item_rc_date}" pattern="yyyy-MM-dd HH:mm:ss"/></small></p>
															</div>
														</div>
													</li>
													<li class="timeline-item">
														<div class="timeline-badge ${ordItemVO.ord_item_rt_date==null? '':'primary'}"><i class="glyphicon glyphicon-time"></i></div>
														<div class="timeline-panel">
															<div class="timeline-heading">檢舉時間
																<p><small class="text-muted"><fmt:formatDate value="${ordItemVO.ord_item_rt_date}" pattern="yyyy-MM-dd HH:mm:ss"/></small></p>
															</div>
														</div>
													</li>
												</ul>
											</div>
										</div>
									</div>
									
								</div>
						</div>
					</div>
						
					</div>
								                        <div class="modal-footer">
								                            <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
<!-- 								                            <button type="button" class="btn btn-primary">送出</button> -->
								                        </div>
								                    </div>
								                </div>
								            </div>	
								                


<!--訂單明細modal -->
																
																
																
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
					</div>

				</div>
			</div>
		</div>
	</section>

	
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
		
		$("ul.nav-menu li").attr('class', "" );
		$("#member").attr('class', 'menu-active menu-has-children' )
		 
		 
	</script>
	
	
	
</body>
</html>



