<%@page import="com.mem.model.MemVO"%>
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
	String memb_id = memVO.getMemb_id();
	if (ordItemlist==null){
		OrdService ordSvc = new OrdService(); 
		List<OrdVO> ordList = ordSvc.getOrdByMem(memb_id); 
		System.out.println("ordList.size()=" + ordList.size());
		OrdItemService ordItemSvc = new OrdItemService(); 
		ordItemlist = ordItemSvc.getOrdItemByOrd(ordList);
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
<title>Horse Club</title>

<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet">
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

<!-- sweetAlert -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>

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

</style>
</head>
<body>

	<jsp:include page="/front-end/ord/ord_Header.jsp" flush="true" />

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
								
								<h1>我的收貨管理 <small>點擊訂單查看明細</small></h1>
							
								<div class="container">
									<div role="tabpanel">
									    <!-- 標籤面板：標籤區 -->
									    <ul class="nav nav-tabs" role="tablist">
									        <li role="presentation" class="active"> 
									            <a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab">待收貨</a>
									        </li>
									        <li role="presentation">
									            <a href="#tab2" aria-controls="tab2" role="tab" data-toggle="tab">已完成</a>
									        </li>
									        <li role="presentation">
									            <a href="#tab3" aria-controls="tab3" role="tab" data-toggle="tab">已檢舉</a>
									        </li>
									    </ul>
									
									    <!-- 標籤面板：內容區 -->
									    <br>
									    <div class="tab-content">
									        <div role="tabpanel" class="tab-pane active" id="tab1">
												<table id="table1" class="table table-striped table-bordered table-hover" style="width:100%">
													<thead>
														<tr class="success">
<!-- 															<th style="width: 30px">序號</th> -->
															<th width="100px">訂單編號</th>
															<th width="100px">照片</th>
															<th width="100px">商品名稱</th>
															<th width="100px">單價</th>
															<th width="100px">數量</th>
															<th width="100px">訂單時間</th>
															<th width="100px">確認收貨</th>
															<th width="100px">檢舉</th>
														</tr>
													</thead>
													<tbody>
								
														<% int no=0;%>
														<c:forEach var="ordItemVO" items="${ordItemlist}">
															<c:if test="${ordItemVO.ord_item_rc_status==null && ordItemVO.ord_item_rt_status==null}" var="condition" scope="page">
																<% no++; %>
																<tr>
<%-- 																	<td><%=no %></td> --%>
<%-- 																	<td style=" margin-bottom: auto">${ordItemVO.ord_id}</td> --%>
																	<!--改成modal彈跳視窗 -->
																	<td><A href="<%=request.getContextPath()%>/ordItem/ordItem.do?prod_id=${ordItemVO.prod_id}&ord_id=${ordItemVO.ord_id}&action=getOneModal_For_Detail">${ordItemVO.ord_id}</a></td>
																	<!--改成modal彈跳視窗 -->
																	<td style=" margin-bottom: auto"><img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${ordItemVO.prod_id}" alt="" width="50px" style="margin-bottom: auto"></td>
																	<td style=" margin-bottom: auto"><a href="<%=request.getContextPath()%>/product/product_upload.do?action=getOne_For_Display&prod_id=${ordItemVO.prod_id}">${prodSvc.getOneProd(ordItemVO.prod_id).prod_name}</a></td>
																	<td style=" margin-bottom: auto">${prodSvc.getOneProd(ordItemVO.prod_id).prod_price}</td>
																	<td style=" margin-bottom: auto">${ordItemVO.ord_item_qty}</td>
																	<td style=" margin-bottom: auto"><fmt:formatDate value="${ordSvc.getOneOrd(ordItemVO.ord_id).ord_date}" pattern="yyyy-MM-dd"/></td>
																	<td style=" margin-bottom: auto">
<%-- 																		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ordItem/ordItem.do" style="text-align: center; margin-bottom: auto"> --%>
																		<input type="button" value="${ordItemVO.ord_item_sp_status==null? '尚未出貨': '確認收貨'} " id='rc_confirm<%= no %>' ${ordItemVO.ord_item_sp_status==null? "disabled": ""}>
<%-- 																	<input type="hidden" name="whichPage"  value="<%=whichPage%>"> --%>
																		<input type="hidden" name="prod_id"  value="${ordItemVO.prod_id}">
																		<input type="hidden" name="ord_id"  value="${ordItemVO.ord_id}">
																		<input type="hidden" name="tab"  value="1">
																		<input type="hidden" name="action"	value="getOne_For_Receive_Update">
<!-- 																		</FORM> -->


<script>
		 $("#rc_confirm<%= no %>").on('click', function () {
			 var $this = $(this);
			 console.log("$this.next().next().val()="+$this.next().next().val());
			 console.log("$this.next().val()="+$this.next().val());
		        swal({
		            title: "確定收貨？",
		            html: "按下確定收貨後就無法再檢舉囉",
		            type: "warning", // type can be "success", "error", "warning", "info", "question"
		            showCancelButton: true,
		        	showCloseButton: true,
		        }).then(
		        	   function (result) {
		                if (result) {
		                	$.ajax({
		    					url: '<%=request.getContextPath()%>/ordItem/ordItem.do',
		    					type: "get",
		    					data: { 'action': 'getOne_For_Receive_Update', 'ord_id': $this.next().next().val() , 'prod_id': $this.next().val() },
		    					dataType: 'json',
		    					success: function(res){
		    						console.log("0000000000");
		    						console.log(res);
		    						swal({
		    				    	     title: "完成!",
		    				    	     text: "已完成收貨",
		    				    	     type: "success",
		    				    	     timer: 3000
		    				    	});
		    						console.log("11111111");
		    						window.location.href = "<%=request.getContextPath()%>/front-end/ord/listAllOrd.jsp";
		    						console.log("22222222");
		    					},
		    					error: function(res){
		    						console.log("eeeeeeee");
		    						console.log("res="+res);
		    					}
		    				
		    				});
		                }
	            }, function(dismiss) { // dismiss can be "cancel" | "overlay" | "esc" | "cancel" | "timer"
	            		swal("取消", "取消收貨", "error");
		        }).catch(swal.noop);
		    });
		 </script>







																	</td>
																	<td style=" margin-bottom: auto">
																		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ordItem/ordItem.do" style="text-align: center; margin-bottom: auto">
																		<input type="submit" value="檢舉" id="report" ${ordItemVO.ord_item_sp_status==null? "disabled": ""}>
<%-- 																		<A type="button" href="<%=request.getContextPath()%>/ordItem/ordItem.do?prod_id=${ordItemVO.prod_id}&ord_id=${ordItemVO.ord_id}&action=getOneModal_For_Report">檢舉</a> --%>
<%-- 																	<input type="hidden" name="whichPage"  value="<%=whichPage%>"> --%>
																		<input type="hidden" name="prod_id"  value="${ordItemVO.prod_id}">
																		<input type="hidden" name="ord_id"  value="${ordItemVO.ord_id}">
																		<input type="hidden" name="tab"  value="1">
																		<input type="hidden" name="action"	value="getOneModal_For_Report">
																		</FORM>
																	
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
<!-- 															<th style="width: 30px">序號</th> -->
															<th width="100px">訂單編號</th>
															<th width="100px">照片</th>
															<th width="100px">商品名稱</th>
															<th width="100px">單價</th>
															<th width="100px">數量</th>
															<th width="100px">收貨時間</th>
															<th width="100px">訂單狀態</th>
														</tr>
													</thead>
													<tbody>
								
														<% int no2=0;%>
														<c:forEach var="ordItemVO" items="${ordItemlist}">
															<c:if test="${ordItemVO.ord_item_rc_status.equals('已收貨')}" var="condition" scope="page">
																<% no2++; %>
																<tr>
<%-- 																	<td><%=no2 %></td> --%>
<%-- 																	<td style=" margin-bottom: auto">${ordItemVO.ord_id}</td> --%>
																	<!--改成modal彈跳視窗 -->
																	<td><A href="<%=request.getContextPath()%>/ordItem/ordItem.do?prod_id=${ordItemVO.prod_id}&ord_id=${ordItemVO.ord_id}&action=getOneModal_For_Detail">${ordItemVO.ord_id}</a></td>
																	<!--改成modal彈跳視窗 -->
																	<td style=" margin-bottom: auto"><img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${ordItemVO.prod_id}" alt="" width="50px" style="margin-bottom: auto"></td>
																	<td style=" margin-bottom: auto"><a href="<%=request.getContextPath()%>/product/product_upload.do?action=getOne_For_Display&prod_id=${ordItemVO.prod_id}">${prodSvc.getOneProd(ordItemVO.prod_id).prod_name}</a></td>
																	<td style=" margin-bottom: auto">${prodSvc.getOneProd(ordItemVO.prod_id).prod_price}</td>
																	<td style=" margin-bottom: auto">${ordItemVO.ord_item_qty}</td>
																	<td style=" margin-bottom: auto"><fmt:formatDate value="${ordItemVO.ord_item_rc_date}" pattern="yyyy-MM-dd"/></td>
																	<td style=" margin-bottom: auto">已完成</td>
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
<!-- 															<th style="width: 30px">序號</th> -->
															<th width="100px">訂單編號</th>
															<th width="100px">照片</th>
															<th width="100px">商品名稱</th>
															<th width="100px">單價</th>
															<th width="100px">數量</th>
															<th width="100px">檢舉時間</th>
															<th width="100px">檢舉理由</th>
															<th width="100px">檢舉審核狀態</th>
														</tr>
													</thead>
													<tbody>
								
														<% int no3=0;%>
														<c:forEach var="ordItemVO" items="${ordItemlist}">
															<c:if test="${ordItemVO.ord_item_rt_status.equals('已檢舉')}" var="condition" scope="page">
																<% no3++; %>
																<tr>
<%-- 																	<td><%=no %></td> --%>
<%-- 																	<td style=" margin-bottom: auto">${ordItemVO.ord_id}</td> --%>
																	<!--改成modal彈跳視窗 -->
																	<td><A href="<%=request.getContextPath()%>/ordItem/ordItem.do?prod_id=${ordItemVO.prod_id}&ord_id=${ordItemVO.ord_id}&action=getOneModal_For_Detail">${ordItemVO.ord_id}</a></td>
																	<!--改成modal彈跳視窗 -->
																	<td style=" margin-bottom: auto"><img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${ordItemVO.prod_id}" alt="" width="50px" style="margin-bottom: auto"></td>
																	<td style=" margin-bottom: auto"><a href="<%=request.getContextPath()%>/product/product_upload.do?action=getOne_For_Display&prod_id=${ordItemVO.prod_id}">${prodSvc.getOneProd(ordItemVO.prod_id).prod_name}</a></td>
																	<td style=" margin-bottom: auto">${prodSvc.getOneProd(ordItemVO.prod_id).prod_price}</td>
																	<td style=" margin-bottom: auto">${ordItemVO.ord_item_qty}</td>
																	<td style=" margin-bottom: auto"><fmt:formatDate value="${ordItemVO.ord_item_rt_date}" pattern="yyyy-MM-dd"/></td>
																	<td style=" margin-bottom: auto">${ordItemVO.ord_item_rt_comm}</td>
																	<td style=" margin-bottom: auto">${ordItemVO.ord_item_review==null? "未審核": ordItemVO_Modal.ord_item_review}</td>
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




<!--    加上明細彈跳modal  -->
<c:if test="${openModal!=null}">

<div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true" style="overflow: hidden">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
				
			<div class="modal-header" style="height:500px">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3 class="modal-title" id="myModalLabel">The Bootstrap modal-header</h3>
            </div>
			
			<div class="modal-body">
<!-- =========================================以下為原listOneEmp.jsp的內容========================================== -->
               <jsp:include page="/front-end/ord/listOneOrdDetailModal.jsp" />
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
<!--    加上明細彈跳modal  -->   


<!--    加上檢舉彈跳modal  -->
<c:if test="${ReportModal!=null}">

<div class="modal fade" id="ReportModal" tabindex="-1" role="dialog" aria-labelledby="ReportModal" aria-hidden="true" style="overflow: hidden">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
				
			<div class="modal-header" style="height:auto">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3 class="modal-title" id="myModalLabel">The Bootstrap modal-header</h3>
            </div>
			
			<div class="modal-body">
<!-- =========================================以下為原listOneEmp.jsp的內容========================================== -->
               <jsp:include page="/front-end/ord/listOneReportModal.jsp" />
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
    		 $("#ReportModal").modal({show: true});
        </script>
</c:if>
<!--    加上檢舉彈跳modal  -->   



<!-- 	顯示購物車數量 -->
	<script>
		$(function(){
			$.ajax({
				url: '<%=request.getContextPath()%>/prodcart.do',
				type: "get",
				success: function(res){
					console.log(res);
					if (parseInt(res) > 0){
						console.log("parseInt = " + parseInt(res));
						$('#itemCount').html(res).css('display', 'block');
					} 
				},
				error: function(res){
					console.log(res);
				}
			
			});
		});
	</script>



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
	<!-- 注意!!! 若有多個jquery會衝突 -->
	<script src="https://code.jquery.com/jquery.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 	<script src="https://code.jquery.com/jquery-3.3.1.js"></script> -->
<!-- 	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script> -->
	<script src="<%=request.getContextPath()%>/horse_UI_template/js/jquery.dataTables.js"></script>
	<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>

	<script>
		$(document).ready(function() {
		    $('#table1').DataTable();
		    $('#table2').DataTable();
		    $('#table3').DataTable();
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
//  		 $("#rc_confirm").on('click', function () {
//  			 var $this = $(this);
//  			 console.log("$this.next().next().val()="+$this.next().next().val());
//  			 console.log("$this.next().val()="+$this.next().val());
//  		        swal({
//  		            title: "確定收貨？",
//  		            html: "按下確定收貨後就無法再檢舉囉",
//  		            type: "warning",  // type can be "success", "error", "warning", "info", "question"
//  		            showCancelButton: true,
//  		        	showCloseButton: true,
//  		        }).then(
//  		        	   function (result) {
//  		                if (result) {
//  		                	$.ajax({
<%--  		    					url: '<%=request.getContextPath()%>/ordItem/ordItem.do', --%> 
//  		    					type: "get",
//  		    					data: { 'action': 'getOne_For_Receive_Update', 'ord_id': $this.next().next().val() , 'prod_id': $this.next().val() },
//  		    					dataType: 'json',
//  		    					success: function(res){
//  		    						console.log("0000000000");
//  		    						console.log(res);
//  		    						swal({
//  		    				    	     title: "完成!",
//  		    				    	     text: "已完成收貨",
//  		    				    	     type: "success",
//  		    				    	     timer: 3000
//  		    				    	});
//  		    						console.log("11111111");
<%--  		    						window.location.href = "<%=request.getContextPath()%>/front-end/ord/listAllOrd.jsp"; --%> 
//  		    						console.log("22222222");
//  		    					},
//  		    					error: function(res){
//  		    						console.log("eeeeeeee");
//  		    						console.log("res="+res);
//  		    					}
		    				
//  		    				});
//  		                }
//  	            }, function(dismiss) {  // dismiss can be "cancel" | "overlay" | "esc" | "cancel" | "timer"
//  	            		swal("取消", "取消收貨", "error");
//  		        }).catch(swal.noop);
//  		    });
	
		 
//  		 sweet alert上傳照片fail......
//  		 $("#report").on('click', function () {
//  			 swal({
//  	    			title: '檢舉訂單 ',
//  	    			html:
//  		    			'<form>' +
//  		    			  '<div class="form-group">' +
//  		    			    '<label for="reason" class="pull-left">請輸入檢舉理由</label>' +
//  		    			    '<textarea class="form-control" id="reason" rows="5" placeholder="請輸入檢舉理由"></textarea>' +
//  		    			  '</div>' +
//  		    			  '<div class="form-group">' +
//  		    			    '<label for="report_img" class="pull-left">請上傳照片</label>' +
//  		    			    '<input type="file" class="form-control" id="report_img" name="report_img" multiple style="width: 500px;">' +
//  		    			  	'<br>' +
//  		    			  	'<div id="preview"><img src="" width="100px" style="bottom-padding: 50px"></div>' +
//  		    			  '</div>' +
//  		    			'</form>' ,
//  	    			type: "warning",
//  	    			showCancelButton: true,
//  		        	showCloseButton: true,
//  	    			preConfirm: function () {
//  		                 return new Promise(function (resolve, reject) {
//  		                     var data = {};
//  		                     console.log("111111111");
//  		                     data.action ="sweetAlert";
//  		                     data.reason = $('#reason').val();
//  		                     data.pics = $('#report_img').val();
//  		                     console.log(data.reason);
//  		                     console.log(data.pics);
//  		                     if(data.reason!=null) data.reason = $('#reason').val().trim();
//  		                 		if (!data.reason) reject('請輸入檢舉理由！');
//  		                 		else if (!data.pics) reject('請上傳照片！');
//  		                 		else {
//  		                 			console.log("22222222");
//  		                 			$.ajax({
//  		                				 type: "GET",
//  		                				 url: "",
//  		                				 data: data,
//  		                				 dataType: "json",
//  		                				 success: function (result){
//  		                					if("N" === result.pass){
//  		                						reject('Oops檢舉發生錯誤.....');
//  		                					} else {
//  		                						resolve(result);
//  		                					}
//  		                			     },
//  		                	             error: function(){
//  		                	            	 	reject('AJAX發生錯誤囉!');
//  		                	             }
//  		                	        });
//  		                 		}
//  		                 })
//  		             },
//  		             onOpen: function () {
//  		                 $('#reason').focus();
//  		             },
//  			    }).then(function (result) {
//  			    	if (result) {
//  				    	swal({
//  				    		   	type: 'success',
//  				    			title: '檢舉成功',
//  				    		 })
//  			    	}
//  			 	}, function(dismiss) {  //dismiss can be "cancel" | "overlay" | "esc" | "cancel" | "timer"
//              		swal("取消", "取消檢舉", "error");
//  		        }).catch(swal.noop);
//  		 });
	
		 
//   預覽照片
<!-- 		 '<script>' + -->
//   			'var i;'+
//  			'var files = $("#form :file");' +
//  			'$("#report_img").change(function() {'+
//  				'$("#preview").html("");' +
//  				'console.log(this);' +
//  				'readURL(this);' +
//  			'});' +
		
//  			'function readURL(input) {' +
//  				'if (input.files && input.files.length>= 0) {' +
//  					'for (var i = 0; i < input.files.length; i++) {' +
//  						'var reader = new FileReader();' +
//  						'reader.readAsDataURL(input.files[i]);' +
//  						'reader.onload = function(e) {' +
//  						'var img = $("<img width='300' height='200'>").attr('src', e.target.result);' +
//  							'console.log(img);' +
//  							'$("#preview").append(img).append("　　").append("　　");' +
//  						'}' +
//  					'}' +
//  				'}' +
//  			'}' +
<!--    		'</script>',   -->
		 
		 
		 
	</script>

</body>
</html>



