<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.rescuing.model.*"%>
<%@ page import="com.rescue.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="java.util.*"%>


<%
	MemVO memVO =(MemVO) session.getAttribute("memVO");


	RescuingService rescuingSvc = new RescuingService();
	Map<String,String[]> map = new TreeMap<String, String[]>();
	map.put("rscing_sta",new String[] {"救援中"});
	map.put("rscing_ptcp",new String[] {memVO.getMemb_id()});
	List<RescuingVO> memRescuingList = rescuingSvc.getAll(map);

	pageContext.setAttribute("memRescuingList",memRescuingList);
	int x = 0;

    
%>
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService"/>
<jsp:useBean id="regionSvc" scope="page" class="com.region.model.RegionService"/>
<jsp:useBean id="rescueSvc" scope="page" class="com.rescue.model.RescueService"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>待完成救援案例</title>


<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP"
	crossorigin="anonymous">
<script src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>

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
	
			<div class="container">
			<div class="row">

<!-- 				左側邊list-group -->
 				<div class="col-xs-12 col-sm-2">
				<div id="sider" class="n-browse-nav m-sticky-on" style="top: 150px; position: fixed; bottom: auto">
					<h3>救援</h3>
					<hr>
					<h5><a href="<%=request.getContextPath()%>/front-end/rescue/addRescue.jsp">新增救援</a></h5>
					<hr>
					<h5><a href="<%=request.getContextPath()%>/front-end/rescuing/rescuing.do?action=rescueMap">今日救援地圖</a></h5>
					<hr>
					<h5><a href="<%=request.getContextPath()%>/front-end/rescue/listAllRescue.jsp">救援案例總覽</a></h5>
					<hr>
					<h5><a href="<%=request.getContextPath()%>/front-end/rescue/listMemRescue.jsp">待完成救援案例</a></h5>
					<hr>
					
				</div>
			</div>
		
		
			<div class="col-xs-12 col-sm-10">
				<div class="content">
            <div class="animated fadeIn">
                <div class="row">

                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">待完成的救援</strong>
                            </div>
                            <div class="card-body">
                                <table style="text-align:center" id="bootstrap-data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                        	<th style="width: 30px">序號</th>
                                        	<th><center>加入救援時間</center></th>
                                            <th><center>救援案例編號</center></th>
                                            <th><center>發起案例會員</center></th>
                                            <th><center>發起時間</center></th>
                                            <th><center>完成救援</center></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% int no=0;%>
										<c:forEach var="rescuingVO" items="${memRescuingList}">
										
												<% no++; %>
												<tr>
													<td><%=no %></td>
													<td style=" margin-bottom: auto"><fmt:formatDate value="${rescuingVO.rscing_btime}" type="both" /></td>
													<td style=" margin-bottom: auto"><a href="<%=request.getContextPath()%>/front-end/rescue/rescue.do?action=getOne_For_Display&rsc_id=${rescuingVO.rsc_id}">${rescuingVO.rsc_id}</a></td>
													<td style=" margin-bottom: auto">${memSvc.getOneMem(rescueSvc.getOneRescue(rescuingVO.rsc_id).rsc_sponsor).memb_id}<br>暱稱：${memSvc.getOneMem(rescueSvc.getOneRescue(rescuingVO.rsc_id).rsc_sponsor).memb_nick}</td>
													<td style=" margin-bottom: auto"><fmt:formatDate value="${rescueSvc.getOneRescue(rescuingVO.rsc_id).rsc_btime}" type="both" /></td>
													<td style=" margin-bottom: auto">
													<form method="post" action="<%=request.getContextPath()%>/front-end/rescuing/rescuing.do">
													<input type="hidden"name="action" value="rescueReport">
													<input type="hidden"name="rsc_id" value="${rescuingVO.rsc_id}">
													<input type="hidden"name="rscing_ptcp" value="${rescuingVO.rscing_ptcp}">
													
													<c:choose>
													<c:when test="${rescueSvc.getOneRescue(rescuingVO.rsc_id).rsc_sta !='完成救援送審中'}"> 
													<button class="genric-btn success circle arrow">完成救援<span class="lnr lnr-arrow-right"></span></button>
													</c:when>   
													<c:when test="${rescueSvc.getOneRescue(rescuingVO.rsc_id).rsc_sta=='完成救援送審中'}"> 
													<c:choose>
													<c:when test="${rescuingVO.rscing_cdes==null}">
													<div class="genric-btn success circle arrow " style="cursor: not-allowed" disabled="disabled" title="救援專區">已有會員送出完成報告</div>
													</c:when>
													<c:otherwise>
													<div class="genric-btn success circle arrow " style="cursor: not-allowed" disabled="disabled" title="救援專區">已送出完成報告</div>
													</c:otherwise>
													</c:choose>
													</c:when>   
													</c:choose> 
													</form>
													</td>
												</tr>
									    
								        								
										</c:forEach>
                                    </tbody>
                                </table>
            				</div>
                        </div>
                    </div>


                </div>
            </div><!-- .animated -->
        </div><!-- .content -->
					
						
			
		</div>
	</div>
</div>
	
	
	

</body>
</html>