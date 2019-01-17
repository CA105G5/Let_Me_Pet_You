<%@page import="java.sql.Timestamp"%>
<%@page import="com.mem.model.MemVO"%>
<%@page import="java.util.List"%>
<%@page import="com.missingMsg.model.*"%>
<%@page import="com.missingCase.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	missingCaseVO missingCaseVO = (missingCaseVO) request.getAttribute("missingCaseVO");
	String missing_case_id = request.getParameter("missing_case_id");
	missingMsgService missingMsgSvc = new missingMsgService();
	
	
	List<missingMsgVO> list = missingMsgSvc.findByCase(missing_case_id);
	pageContext.setAttribute("list", list);
	
	String owner = missingCaseVO.getMemb_id();
	String missing_name = missingCaseVO.getMissing_name();

	String memb_id= null;
	MemVO membVO = (MemVO) session.getAttribute("memVO");
	if(membVO!=null){
		memb_id = membVO.getMemb_id();
	}
	pageContext.setAttribute("membVO", membVO);
	Timestamp missing_msg_date = new Timestamp(System.currentTimeMillis());
	Timestamp report_missing_time = new Timestamp(System.currentTimeMillis());
	Timestamp missing_msg_rt_time = new Timestamp(System.currentTimeMillis());
	
	
%>
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
<jsp:useBean id="missingMsgRtSvc" scope="page" class="com.missingMsgReport.model.missingMsgReportService" />
<html>
<head>
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
<title>單一失蹤案例</title>

<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<script src="js/jquery-1.12.3.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/ckeditor2/ckeditor.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<script src="js/jquery-1.12.3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>

<style>
	#openChat:hover{
		cursor: pointer;
	}

</style>


</head>
<body onload="connect();" onunload="disconnect();">

	<jsp:include page="/index_Header.jsp"
		flush="true" />

<div class="row d-flex justify-content-center" style="background-image: url(https://www.i-adopt.com.tw/frontend/images/banner/adopt.jpg); height: 250px;width: 1900px;margin-left: 7.5px;margin-right: 0px;">
				<div class="col-md-9 pb-40 header-text text-center" style="margin-top: 100px;">
						<h1 class="pb-10"> 失蹤詳情</h1>
				</div>
			</div>
	<!-- End banner Area -->
	<section class="blog-posts-area section-gap">
	<nav aria-label="breadcrumb">
			  <ol class="breadcrumb" style="margin-left: 850px;">
			    <li class="breadcrumb-item" style="font-weight: 900;"><a href="<%=request.getContextPath()%>/front-end/missingCase/listAllMissingCase.jsp">失蹤寵物</a></li>
			    <li class="breadcrumb-item active" aria-current="page" style="font-weight: 900;">失蹤寵物詳情</li>
			  </ol>
		</nav>
		<div class="container" style="top: 180px">
			
			<div class="container">
				<div class="row">
					<div class="col-lg-12 post-list blog-post-list">
						<div class="single-post">
						<div style="text-align:center;">
							<img class="img-fluid"
								src="<%=request.getContextPath() %>/missingcase/missingcase.do?missingcaseno=${missingCaseVO.missing_case_id}"
								alt="">
						</div>		
							<ul class="tags">
								<li><fmt:formatDate value="${missingCaseVO.missing_date}"
										pattern="yyyy-MM-dd" /></li>
								<c:if test="${missingCaseVO.memb_id == membVO.memb_id}">	
								<li><button class="genric-btn danger circle arrow" type="submit" id="down" style="margin-left: 900px;">我要下架</button></li>
							</c:if>		
							</ul>
								
						<div style="float:right;">
							<ul class="nav-menu">
								<li class="menu-has-children"><a class="item"><i class="fa fa-thumb-tack"></i></a>
									<ul>
										<li><form method="post"
												action="<%=request.getContextPath()%>/front-end/missingCase/miss.do">
												<button class="genric-btn primary small" type="submit" id="update2">編輯</button>
												<input type="hidden" name="action" value="getOne_For_Update">
												<input type="hidden" name="missing_case_id" value="${missingCaseVO.missing_case_id}">
											</form>
										<button type="button" class="genric-btn primary small" data-toggle="modal" data-target="#exampleModalCenter">檢舉</button>
									</li>
									</ul>
								</li>
							</ul>	
						</div>
							<a href="#">
								<h1>${missingCaseVO.missing_name}</h1>
							</a>
							<div class="content-wrap">
								<p><h3>${missingCaseVO.missing_des}</h3></p>
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
										<form METHOD="post"
											ACTION="<%=(membVO == null)
					? request.getContextPath() + "/front-end/members/login.jsp"
					: "http://localhost:8081/CA105G5/front-end/missingCase/reportMissing.do"%>">
											<div class="input-group mb-3">
												<input type="text" class="form-control"
													name="report_missing_cont" aria-label="Default"
													aria-describedby="inputGroup-sizing-default">
											</div>
											<input type="hidden" name="missing_case_id"
												value="<%=request.getParameter("missing_case_id")%>">
											<input type="hidden" name="memb_id"
												value="<%=(membVO == null) ? "" : membVO.getMemb_id()%>">
											<input type="hidden" name="report_missing_sta" value="未審核">
											<input type="hidden" name="report_missing_time"
												value="<%=report_missing_time%>"> <input
												type="hidden" name="action" value="insert">
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">取消</button>
										<input type="hidden" class="btn btn-primary" name="missingCase"value="<%=request.getContextPath()%>/front-end/missingCase/miss.do?action=getOne_For_Display&missing_case_id=${missingCaseVO.missing_case_id}">
										<input type="submit" class="btn btn-primary" value="送出">
									</div>
									</form>
								</div>
							</div>
						</div>
						<!-- 檢舉結束 -->

						<section class="nav-area pt-50 pb-100"
							style="padding-top: 50px; padding-bottom: 50px;">
							<div class="row justify-content-between">
								<div class="col-sm-12 nav-right justify-content-end d-flex">
									<div class="post-details">
										<p>連絡失主</p>
										<h3 class="text-uppercase">
											<a href="#">${memSvc.getOneMem(missingCaseVO.memb_id).memb_nick}</a>
											<a id="openChat" onclick="window.open('<%=request.getContextPath()%>/util/chat.jsp', 'Chat', config='height=500, width=500');">
												<i class="fa fa-commenting"></i>
											</a>
										</h3>
									</div>
									<div class="thumb">
										<img src="<%=request.getContextPath()%>/front-end/members/memImg.do?memb_id=${missingCaseVO.memb_id}" alt="">
									</div>
								</div>
							</div>

						</section>
						
<!---------------------------------------------- 以下是留言區------------------------------------------------------ -->
						<div class="comment-sec-area">
							<h3 class="text-uppercase" style="color: red">留言區</h3>
							<br>
							<h4 class="pb50">Leave a Reply...</h4>


							<form
								action="<%=(membVO == null)
					? request.getContextPath() + "/front-end/members/login.jsp"
					: request.getContextPath() + "/front-end/missingMsg/missingMsg.do"%>"
								method="post">
								<textarea class="form-control mb-10" name="missing_msg_cont"
									id="missing_msg_cont" placeholder="Messege"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Messege'"></textarea>
								<input type="hidden" name="missing_case_id" id="missing_case_id"
									value="<%=request.getParameter("missing_case_id")%>"> <input
									type="hidden" name="missing_msg_date" id="missing_msg_date"
									value="<%=missing_msg_date%>"> <input type="hidden"
									name="memb_id" id="memb_id"
									value="<%=(membVO == null) ? "" : membVO.getMemb_id()%>">
								<input type="hidden" name="URL"
									value="<%=request.getRequestURL()%>"> <input
									type="hidden" name="action" value="insert"> <input
									type="submit" id="msgSubmit"
									class="genric-btn danger circle arrow col-offset-md-6"
									style="margin-left: 1020px" value="送出">

							</form>
							<c:forEach var="missingMsgVO" items="${list}" varStatus="i">
							<c:if test="${missingMsgRtSvc.getOneMissingRt(missingMsgVO.missing_msg_id).missing_msg_rt_sta !='通過' }">
								<div class="comment-list" id="m${i.index}">
									<div class=" justify-content-between d-flex">
										<div class="user justify-content-between d-flex">
											<div class="thumb">
												<img width="200" height="200" src="<%=request.getContextPath()%>/front-end/members/memImg.do?memb_id=${missingMsgVO.memb_id}" alt="">
											</div>
											<div class="desc">
												<h5>
													<a href="#">${memSvc.getOneMem(missingMsgVO.memb_id).memb_nick}</a>
												</h5>
												
						<div style="float:right">
							<ul class="nav-menu">
								<li class="menu-has-children"><a class="item"><i class="fa fa-thumb-tack"></i></a>
									<ul>
										<li>
											<button type="button" class="genric-btn primary small"
								 data-toggle="modal" data-target="#${missingMsgVO.missing_msg_id}">檢舉</button>
										</li>
										<li>
											<button type="button" class="genric-btn primary small"
								            id="${i.index}">刪除</button>
										</li>
									</ul>
								</li>
							</ul>	
						</div>
								<br>				
												
												<p class="date">
													<fmt:formatDate value="${missingMsgVO.missing_msg_date}"
														pattern="yyyy-MM-dd" />
												</p>
												<p class="comment">${missingMsgVO.missing_msg_cont}</p>
											</div>
											<input type="hidden" name="missing_msg_id" value="${missingMsgVO.missing_msg_id}">
										</div>
									</div>
								</div>
								
<!--------------------------------------------留言檢舉彈出區------------------------>
							<div class="modal fade" id="${missingMsgVO.missing_msg_id}" tabindex="-1"
								role="dialog" aria-labelledby="#${missingMsgVO.missing_msg_id}"
								aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="${missingMsgVO.missing_msg_id}"
												style="margin-left: 200px;">請輸入檢舉原因:</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<form METHOD="post"
												ACTION="<%=(membVO == null)
					? request.getContextPath() + "/front-end/members/login.jsp"
					: request.getContextPath() + "/front-end/missingCase/missingMsgReport.do"%>">
												<div class="input-group mb-3">
													<input type="text" class="form-control"
														name="missing_msg_rt_cont" aria-label="Default"
														aria-describedby="inputGroup-sizing-default">
												</div>
												
												<input type="hidden" name="missing_case_id"
													value="<%=request.getParameter("missing_case_id")%>">
												<input type="hidden" name="memb_id"
													value="<%=(membVO == null) ? "" : membVO.getMemb_id()%>">
												<input type="hidden" name="missing_msg_rt_sta" value="未審核">
												<input type="hidden" name="missing_msg_rt_time"
													value="<%=missing_msg_rt_time%>"> <input
													type="hidden" name="action" value="insert">
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">取消</button>
											<input type="submit" class="btn btn-primary" value="送出">
										<input type="hidden" name="missing_msg_id" value="${missingMsgVO.missing_msg_id}">
										</div>
										</form>
									</div>
								</div>
							</div>
							<!-- 檢舉結束 -->
							
							
	<script type="text/javascript">						
//刪除留言
	$('#${i.index}').click(function(e){
		if(${missingMsgVO.memb_id != membVO.memb_id}){
			swal("刪除失敗！你不是留言的人！","","warning");
			return false;
		}else{
			swal({
	            title: "確定刪除？",
	            html: "按下確定後資料會永久刪除",
	            type: "question", 
	            showCancelButton: true,
	        	showCloseButton: true,
	        }).then(
		        	  function (result) {
		                  if (result) {
		                	  console.log("11111111111111");
		                	 $.ajax({
		                			url : '<%=request.getContextPath()%>/front-end/missingMsg/missingMsg.do',
		                			type : 'Post',
		    						data : {
		    							action : 'delete',
		    							missing_msg_id : '${missingMsgVO.missing_msg_id}',
		    						},
		    						success: function(result){
		    							 console.log("222222222");
		    								$('#m${i.index}').hide();
		    						}
		                	 })
		                      swal("完成!", "資料已經刪除", "success");
		                  }
		              }, function(dismiss) { // dismiss can be "cancel" | "overlay" | "esc" | "cancel" | "timer"
		             		swal("取消", "資料未被刪除", "error");
		   	       }).catch(swal.noop);
		}
	});
	</script>					
							
							</c:if>
							</c:forEach>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>

	<script>
	$('#update2').click(function(e){
		if(${missingCaseVO.memb_id != membVO.memb_id}){
			swal("編輯失敗！你並不是發文的人！","","warning");
			return false;
		}
	});	
	
	$('#msgSubmit').click(function(e){
		if($('#missing_msg_cont').val().trim()== ""){
			swal("留言失敗！留言內容請勿空白！","","warning");
			return false;
		}else{
			$('#msgSubmit').submit();
		}
		
	});
	
	$('#down').click(function(e){
		swal({
            title: "確定下架？",
            html: "確定後案例就會下架囉！",
            type: "question", 
            showCancelButton: true,
        	showCloseButton: true,
        }).then(
	        	  function (result) {
	                  if (result) {
	                	  console.log("11111111111111");
	                	 $.ajax({
	                			url : '<%=request.getContextPath()%>/missingCaseAjax.do',
	                			type : 'Post',
	    						data : {
	    							action : 'getChange',
	    							status : '下架',
	    							missing_case_id : '${missingCaseVO.missing_case_id}',
	    						},
	    						success: function(result){
	    							swal("完成！案例已下架！", "", "success");
	    							setTimeout(function(){window.location.href="<%=request.getContextPath()%>/front-end/missingCase/listAllMissingCase.jsp"},3000);
	    						}
	                	 })
	                      
	                  }
	              }, function(dismiss) { // dismiss can be "cancel" | "overlay" | "esc" | "cancel" | "timer"
	             		swal("取消", "案例未被下架！", "error");
	   	       }).catch(swal.noop);
		
		
		
	})
	

	</script>
	
	
	<!-- 聊天室js   -->
<script>

	var MyPoint = "/MissingEchoServer/"+"<%=missing_case_id%>";
	var host = window.location.host;
	var path = window.location.pathname;
	var webCtx = path.substring(0, path.indexOf('/', 1));
	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
	
	var webSocket;
	console.log("endPointURL==="+endPointURL);
	console.log("memb_id==="+"<%=memb_id%>");
	console.log("owner==="+"<%=owner%>");
	
	function connect() {
		console.log("endPointURL==="+endPointURL);
		
		// 建立 websocket 物件
		webSocket = new WebSocket(endPointURL);
		
		webSocket.onopen = function(event) {
			
		};
	
		webSocket.onmessage = function(event) {
			 var jsonObj = JSON.parse(event.data);
		     var $missing_case_id = jsonObj.missing_case_id;
		     var $missing_owner = jsonObj.missing_owner;
		     var $missing_name = jsonObj.missing_name;
		     var $memb_id = "<%=memb_id%>";
		     console.log("memb_id==="+"<%=memb_id%>");
			 console.log("missing_owner==="+$missing_owner);
			 console.log("missingCase===onMeaasge==="+$missing_case_id);
			 console.log("missing_name===onMeaasge==="+$missing_name);
			 if (<%=memb_id!=null%> && $memb_id == $missing_owner){
			 	console.log("失主在線上===");
				$.ajax({
					url: '<%=request.getContextPath()%>/front-end/missingCase/miss.do',
					type: "get",
					data: { 'action': 'openChat', 'missing_case_id': $missing_case_id, 'missing_name': $missing_name },
					dataType: 'json',
					success: function(res){
						console.log("res==="+res);
						window.open('<%=request.getContextPath()%>/util/chat.jsp', 'Chat', config='height=500, width=500');
					},
					error: function(res){
						console.log(res);
					}

				});
				
				<%--=<%session.setAttribute("missing_case_id", $missing_case_id);%> --%>
				<%--<%session.setAttribute("missing_name", $missing_name);%> --%>
				
			 }
	        
		};
	
		webSocket.onclose = function(event) {
// 			updateStatus("已從聊天室離線");
		};
	}
	
	
	
	function disconnect () {
		webSocket.close();
	}
	
	
	

	$('#openChat').on('click', function () {
// 給自己用的
		<%session.setAttribute("missing_case_id", missing_case_id);%>
		<%session.setAttribute("missing_name", missing_name);%>
// 給自己用的

// 若失主在線上做跳窗推播用的
		var jsonObj = {"missing_case_id" : "<%=missing_case_id%>", "missing_owner":"<%=owner%>","missing_name":"<%=missing_name%>"};
	    webSocket.send(JSON.stringify(jsonObj));
// 若失主在線上做跳窗推播用的
	});

	
	
	$("ul.nav-menu li").attr('class', "" );
	$("#missing").attr('class', 'menu-active menu-has-children' )

</script>
<!-- 聊天室js   -->
	
	

</body>
</html>