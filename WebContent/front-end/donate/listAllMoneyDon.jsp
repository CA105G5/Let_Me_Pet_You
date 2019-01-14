<%@page import="com.donate.model.DonateService"%>
<%@page import="com.donate.model.DonateVO"%>
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
	List<DonateVO> list;
	list = (List<DonateVO>) request.getAttribute("list");
	MemVO memVO = (MemVO) session.getAttribute("memVO");
	String memb_id = null;
	if(memVO!=null)
		memb_id = memVO.getMemb_id();
	if (list==null){
		DonateService donSvc = new DonateService(); 
		list = donSvc.getAllByMem(memb_id);
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
								
								<h1>捐款紀錄 <small></small></h1>
							
<!-- 								<div class="container"> -->
<!-- 									<div role="tabpanel"> -->
<!-- 									    標籤面板：標籤區 -->
<!-- 									    <ul class="nav nav-tabs" role="tablist"> -->
<!-- 									        <li role="presentation" class="active">  -->
<!-- 									            <a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab">審核中</a> -->
<!-- 									        </li> -->
<!-- 									        <li role="presentation"> -->
<!-- 									            <a href="#tab2" aria-controls="tab2" role="tab" data-toggle="tab">已上架</a> -->
<!-- 									        </li> -->
<!-- 									        <li role="presentation"> -->
<!-- 									            <a href="#tab3" aria-controls="tab3" role="tab" data-toggle="tab">已下架</a> -->
<!-- 									        </li> -->
<!-- 									        <li role="presentation"> -->
<!-- 									            <a href="#tab4" aria-controls="tab4" role="tab" data-toggle="tab">審核不通過</a> -->
<!-- 									        </li> -->
<!-- 									    </ul> -->
									
									    <!-- 標籤面板：內容區 -->
									    <br>
<!-- 									    <div class="tab-content"> -->
<!-- 									        <div role="tabpanel" class="tab-pane active" id="tab1"> -->
												<table id="table1" class="table table-striped table-bordered table-hover" style="width:100%">
													<thead>
														<tr class="success">
															<th style="width: 100px">捐款人</th>
															<th style="width: 100px">捐款時間</th>
															<th style="width: 100px">捐款金額</th>
															<th style="width: 100px">捐款方式</th>
															<th style="width: 100px">款項狀態</th>
															<th style="width: 100px">愛心幣發放金額</th>
														</tr>
													</thead>
													<tbody>
								
														<% int no=0;%>
														<c:forEach var="donateVO" items="${list}">
<%-- 															<c:if test="${donateVO.donate_status==null}" var="condition" scope="page"> --%>
																<% no++; %>
																<tr id="${donateVO.donate_id}" style="color: ${donateVO.donate_id.equals(donate_id)? 'orange':''}">
<%-- 																	<td><%=no %></td> --%>
																	<td style=" margin-bottom: auto">${donateVO.donate_name}</td>
																	<td style=" margin-bottom: auto"><fmt:formatDate value="${donateVO.donate_date}" pattern="yyyy-MM-dd"/></td>
																	<td style=" margin-bottom: auto">${donateVO.donate_amount}</td>
																	<td style=" margin-bottom: auto">${donateVO.donate_src}</td>
																	<td style=" margin-bottom: auto">${donateVO.donate_status==null? '待確認' : donateVO.donate_status}</td>
																	<td style=" margin-bottom: auto">${donateVO.donate_coin==0? '未發放' : donateVO.donate_coin}</td>
																</tr>
<%-- 															</c:if> --%>
														</c:forEach>
													</tbody>
												</table>
															        
<!-- 									        </div> -->
									        
									    
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
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
		
		$("ul.nav-menu li").attr('class', "" );
		$("#member").attr('class', 'menu-active menu-has-children' )
		 
		 
	</script>

</body>
</html>



