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
// System.out.println("listOneRescue.jsp得到從RescueServlet.java傳過來的請求參數值"+request.getParameter("whichPage"));
// System.out.println("listOneRescue.jsp得到從RescueServlet.java傳過來的請求參數值"+request.getParameter("rsc_id"));

// MemVO memVOinit = new MemVO();
// memVOinit.setMemb_id("M000000005");
// session.setAttribute("memVO", memVOinit);

MemVO memVO =(MemVO) session.getAttribute("memVO");
String memb_id="";
if (memVO !=null){
	memb_id = memVO.getMemb_id();
}else{
	memb_id="";
}

Map<String, String[]> map = new TreeMap<String, String[]>();
map.put("rsc_id",new String[] {rsc_id});
map.put("rscing_ptcp",new String[] {memb_id});

RescuingService rescuingSvc2 = new RescuingService();
List<RescuingVO> list =rescuingSvc2.getAll(map);

Map<String, String[]> map2 = new TreeMap<String, String[]>();
map2.put("rsc_id",new String[] {rsc_id});
map2.put("memb_id",new String[] {memb_id});
RscRtService rscRtSvc = new RscRtService();
List<RscRtVO> rtlist =rscRtSvc.getAll(map2);
System.out.println("rtlist"+rtlist);

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
.btn-rt {
    background-color: #222;
    color: #fff;
    border: 1px solid #222;
    padding: 8px 30px;
    display: block;

}
.btn-rt:hover{
background-color: #fff;
color: #222;
}
.btn-rt.genric-btn.disable {
    color: #222222, 0.3;
    background: #ffc107;
    border: 1px solid transparent;
    cursor: not-allowed;
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
		<div class="row d-flex justify-content-center" style="background-image: url(http://www.savedogs.org/upload/Masthead/r/rw4cztmo87qqjof8mm5wovypicoyu4cl1hx0/main.jpg); height: 250px;width: 1900px;margin-left: 7.5px;margin-right: 0px;">
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
						<h2 class="title" style="margin-bottom: 10px;">救援</h2>
							<ul>
								<li><a href="<%=request.getContextPath()%>/front-end/rescue/addRescue.jsp" class="justify-content-between align-items-center d-flex"><h4>新增救援</h4></a></li>
								<li><a href="<%=request.getContextPath()%>/front-end/rescue/listAllRescueMap.jsp" class="justify-content-between align-items-center d-flex"><h4>今日救援地圖</h4></a></li>
								<li><a href="<%=request.getContextPath()%>/front-end/rescue/listAllRescue.jsp" class="justify-content-between align-items-center d-flex"><h4>救援案例總覽</h4></a></li>
								<li><a href="<%=request.getContextPath()%>/front-end/rescue/listMemRescue.jsp" class="justify-content-between align-items-center d-flex"><h4>待完成救援案例</h4></a></li>
					
							</ul>
					</div>
				</div>
		
	
		
				<!-- Start blog-posts Area -->
			<section class="blog-posts-area section-gap">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-sm-8 post-list blog-post-list">
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
													 
												
												<%}else if (list.isEmpty()){%>
													<form METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/rescuing/rescuing.do">
													<input type="hidden" name="action" value="insert">
													<input type="hidden" name="rsc_id" value="${rescueVO.rsc_id}">
													<input type="hidden" name="rscing_ptcp" value="${memVO.memb_id}">
													<button class="genric-btn primary" title="加入救援">加入救援</button>
													</form>

												<%}else{%>
												
														<a href="#" class="genric-btn disable">已加入救援</a>
												
												<%}%>
											
											</c:if>
											
										</div>
										<div class="col-sm-3"></div>
										<div class="col-sm-3">
											<c:if test="${rescueVO.rsc_sta=='待救援' or rescueVO.rsc_sta=='救援中'}">
											<% if(memVO != null){ %>
												<%if(rtlist.isEmpty()){ %>
													<%if(rescueVO.getRsc_rt_status().equals("已檢舉")){%>
												 	<div class="btn-rt genric-btn disable">已被檢舉</div>
													<%}else{%>
												 	<button type="button" class="btn-rt genric-btn" data-toggle="modal" data-target="#exampleModalCenter" >檢舉</button>
	
												 	<%} %>
												 <%}else{%>
													
													<div class="btn-rt genric-btn disable">已檢舉</div>
												<%}%>	
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
						
                           

									

							
						</div>
					</div>
			</section>	
			
			<div class="col-xs-12 col-sm-1"></div>
			</div>
	</div>
						<!--案例檢舉彈出區-->
						<div class="modal fade" id="exampleModalCenter" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalCenterTitle"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle"
											style="margin-left: 200px;">請輸入檢舉原因:</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
									<span id="comm_error" style="color:red"></span>
										<form METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/rscRt/rscRt.do">
											<div class="input-group mb-3">
											<input type="text" class="form-control" id="rsc_rt_comm"
													name="rsc_rt_comm" aria-label="Default"
													aria-describedby="inputGroup-sizing-default">
											</div>
											<input type="hidden" name="rsc_id"
												value="${rescueVO.rsc_id}">
											<input type="hidden" name="memb_id"
												value="${memVO.memb_id}">
											<input type="hidden" name="requestURL"
												value="/front-end/rescue/rescue.do?action=getOne_For_Display&rsc_id=${rescueVO.rsc_id}"> 
											<input type="hidden" name="action" value="insert">
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">取消</button>
										<input id="submit" type="submit" class="btn btn-primary" value="送出">
									</div>
									</form>
								</div>
							</div>
						</div>
						<!-- 檢舉結束 -->
	

<script>
// (function($){
	$('#submit').on('click',function(){
		
		 if ($("#rsc_rt_comm").val()==null || $("#rsc_rt_comm").val().trim().length==0){
			 
			
			 	$("#comm_error").text("檢舉原因請勿空白!");
			 
			 	 return false;
		 } 
		
		 
		
	})
	
	
	
// })


</script>





	
</body>
</html>