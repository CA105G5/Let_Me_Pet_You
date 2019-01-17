<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.rescue.model.*"%>
<%@ page import="com.rscRt.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.rescuing.model.*"%>
<%@ page import="java.util.*"%>


<%
RescueVO rescueVO  = (RescueVO) request.getAttribute("rescueVO");
String rsc_id = rescueVO.getRsc_id();
//判斷是否登入
MemVO memVO =(MemVO) session.getAttribute("memVO");
String memb_id="";
if (memVO !=null){
	memb_id = memVO.getMemb_id();
}else{
	memb_id="";
}
//判斷是否有加入救援了
Map<String, String[]> map = new TreeMap<String, String[]>();
map.put("rsc_id",new String[] {rsc_id});
map.put("rscing_ptcp",new String[] {memb_id});

RescuingService rescuingSvc2 = new RescuingService();
List<RescuingVO> list =rescuingSvc2.getAll(map);
//判斷是否有檢舉過
RscRtService rscRtSvc = new RscRtService();


// MemService memSvc1 = new MemService();
// MemVO memVO = memSvc1.getOneMem("M000000005");
session.setAttribute("memVO",memVO);
%>
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService"/>
<jsp:useBean id="rescuingSvc" scope="page" class="com.rescuing.model.RescuingService"/>
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
<title>浪我陪你-救援案例</title>


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
.btn-reply {
    background-color: #222;
    color: #fff;
    border: 1px solid #222;
    padding: 8px 30px;
    display: block;

}
.btn-reply:hover{
	background-color:#fff;
	color:#222;
}


</style>
</head>
<body>

	<jsp:include page="/index_Header.jsp" flush="true" />
	<div class="container-fuild">
			<div class="row">

<!-- 				左側邊list-group -->
				<div class="col-sm-1"></div>
 				<div class="col-xs-12 col-sm-2">
				<div id="sider" class="n-browse-nav m-sticky-on" style="top: 150px; position: fixed; bottom: auto">
					<h3>救援</h3>
					<hr>
					<h5><a href="<%=request.getContextPath()%>/front-end/rescue/addRescue.jsp">新增救援</a></h5>
					<hr>
					<h5><a href="<%=request.getContextPath()%>/front-end/rescue/listAllRescueMap.jsp">今日救援地圖</a></h5>
					<hr>
					<h5><a href="<%=request.getContextPath()%>/front-end/rescue/listAllRescue.jsp">救援案例總覽</a></h5>
					<hr>
					<h5><a href="<%=request.getContextPath()%>/front-end/rescue/listMemRescue.jsp">待完成救援案例</a></h5>
					<hr>
					
				</div>
			</div>
		</div>
	</div>
	
		
				<!-- Start blog-posts Area -->
			<section class="blog-posts-area section-gap">
				<div class="container-fuild">
					<div class="row justify-content-center">
					<div class="col-sm-3"></div>
						<div class="col-sm-6 post-list blog-post-list">
							<div class="single-post">
								<img style="width:auto;height:500px;display:block; margin:auto;" class="img-fluid" src="<%=request.getContextPath()%>/back-end/rescue/rescueImg.do?rsc_id=${rescueVO.rsc_id}" alt="">
								
								
									<h1>
										${rescueVO.rsc_name}
									</h1>
								
								<div class="content-wrap">
									<p>
										地點：${rescueVO.rsc_add}
									</p>
									<p>
										發起時間：<fmt:formatDate value="${rescueVO.rsc_btime}" type="both" />
									</p>
									
									<c:if test="${not empty rescueVO.rsc_etime}">
					                <p>
										完成時間：<fmt:formatDate value="${rescueVO.rsc_etime}" type="both" />
									</p>
				                    </c:if>
									


									<blockquote class="generic-blockquote">
										${rescueVO.rsc_des}
									</blockquote>
									
									

								</div>
								<div class="bottom-meta">
									<div class="user-details row align-items-center">
										<div class="comment-wrap col-sm-6">
											
											<c:if test="${rescueVO.rsc_sta=='待救援' or rescueVO.rsc_sta=='救援中'}">
											
												<% if(memVO == null){ %>
												<h3 style="color:red">請先登入才可加入救援 </h3>
													 
												
												<%}else if (list.isEmpty()){ %>
													
														<a href="<%=request.getContextPath()%>/front-end/rescuing/rescuing.do?rsc_id=${rescueVO.rsc_id}&rscing_ptcp=${memVO.memb_id}&action=insert" 
														class="genric-btn primary">加入救援</a>
												<%}else{%>
												
														<a href="#" class="genric-btn disable">已加入救援</a>
												
												<%}%>
											
											</c:if>
											
										</div>
										
										<div class="col-sm-6">
										<c:if test="${rescueVO.rsc_sta=='待救援' or rescueVO.rsc_sta=='救援中'}">
										<% if(memVO != null){ %>
										
<%-- 										<%}else if (){ %> --%>
											
										<%}else{%>
										<div  class="btn-reply genric-btn">檢舉</div>

										<%}%>
										</c:if>	
										</div>
									</div>
								</div>

                            <!-- Start nav Area -->
                            <section class="nav-area pt-50 pb-100">
                                <div class="container">
                                    <div class="row ">
                                        <div class="col-sm-3 nav-left justify-content-start d-flex">
                                            <div class="thumb">
                                                <img style="width:auto;height:100px"  src="<%=request.getContextPath()%>/back-end/members/memImg.do?memb_id=${memSvc.getOneMem(rescueVO.rsc_sponsor).memb_id}" alt="">
                                            </div>
                                            <div class="post-details">
                                                <p>救援發起者</p>
                                                <h4 class="text-uppercase">${memSvc.getOneMem(rescueVO.rsc_sponsor).memb_nick}</h4>
                                            </div>
                                        </div>

                                    </div>
                                </div>    
                            </section>
           

							</div>																		
						</div>
						<!--如有人完成顯示-->
						<div class="col-sm-2 sidebar">
							
                           

									

							
						</div>
					</div>
					</div>
			</section>	

	
	






	
</body>
</html>