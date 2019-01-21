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
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon--> 
<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/logo3.png">
<!-- Author Meta -->
<meta name="author" content="codepixer">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>浪我陪你-待完成救援案例</title>


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
	<div class="row d-flex justify-content-center" style="background-image: url(http://www.savedogs.org/upload/Masthead/r/rw4cztmo87qqjof8mm5wovypicoyu4cl1hx0/main.jpg); height: 280px;width: 1900px;margin-left: 7.5px;margin-right: 0px;">
				<div class="col-md-9 pb-40 header-text text-center" style="margin-top: 100px;">
				<br><br><br>
				<h1 class="pb-10"style="color:white;">搶救生命，分秒必爭</h1>
				</div>
			</div>
			<div class="container-fulid">
			<div class="row">
				<div class="col-xs-12 col-sm-1"></div>
<!-- 				左側邊list-group -->
 				<div class="col-xs-12 col-sm-2">
				<div class="single-widget category-widget">
						<h2 class="title" style="margin-bottom:10px;padding-top:0px;margin-top:0px">救援</h2>
							<ul>
								<li><a href="<%=request.getContextPath()%>/front-end/rescue/addRescue.jsp" class="justify-content-between align-items-center d-flex"><h4>新增救援</h4></a></li>
								<li><a href="<%=request.getContextPath()%>/front-end/rescue/listAllRescueMap.jsp" class="justify-content-between align-items-center d-flex"><h4>今日救援地圖</h4></a></li>
								<li><a href="<%=request.getContextPath()%>/front-end/rescue/listAllRescue.jsp" class="justify-content-between align-items-center d-flex"><h4>救援案例總覽</h4></a></li>
								<li><a href="<%=request.getContextPath()%>/front-end/rescue/listMemRescue.jsp" class="justify-content-between align-items-center d-flex"><h4>待完成救援案例</h4></a></li>
					
							</ul>
					</div>
			</div>
		
		
			<div class="col-xs-12 col-sm-8">
				<div class="content">
            <div class="animated fadeIn">
                <div class="row">

                    <div class="col-md-12" style="padding-top:40px;">
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
		<div class="col-xs-12 col-sm-1"></div>
	</div>
</div>
	
	
	

</body>
</html>