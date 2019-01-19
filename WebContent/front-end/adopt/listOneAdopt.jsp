<%@page import="com.AdoptApply.model.AdoptApplyVO"%>
<%@page import="com.AdoptApply.model.AdoptApplyService"%>
<%@page import="com.AdoptMsg.model.AdoptMsgService"%>
<%@page import="com.AdoptMsg.model.AdoptMsgVO"%>
<%@page import="com.mem.model.MemVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	AdoptMsgVO adoptMsgVO = (AdoptMsgVO)request.getAttribute("adoptMsgVO");
	String adopt_id = request.getParameter("adopt_id");
	pageContext.setAttribute("adopt_id", adopt_id);
	AdoptMsgService adoptMsgSvc = new AdoptMsgService();
	List<AdoptMsgVO> list = adoptMsgSvc.findByAdopt(adopt_id);
	pageContext.setAttribute("list", list);
	MemVO membVO = (MemVO) session.getAttribute("memVO");
	pageContext.setAttribute("membVO", membVO);
// 	String url = request.getContextPath() +"/front-end/adopt/adoptionServlet.do?action=getOne_For_Display&adopt_id="+adopt_id;
// 	session.setAttribute("adopt",url);
	
	
	AdoptApplyService adoptApplySvc = new AdoptApplyService();
	List<AdoptApplyVO> list2 =  adoptApplySvc.getAllApply();
	pageContext.setAttribute("list2", list2);
%>

<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
<jsp:useBean id="adoptMsgRtSvc" scope="page" class="com.AdoptMsgReport.moedl.AdoptMsgReportService" />
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
<title>Adopt</title>

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
</head>
<body>

	<jsp:include page="/index_Header.jsp"
		flush="true" />

	<!-- End banner Area -->
	<section class="blog-posts-area section-gap">
		<div class="container" style="top: 180px">
			<div class="row d-flex justify-content-center">
				<div class="col-md-9 pb-40 header-text text-center">
					<h1 class="pb-10">單一案例瀏覽</h1>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-12 post-list blog-post-list">
						<div class="single-post">
						<div style="text-align:center;">
							<img class="img-fluid"
								src="<%=request.getContextPath() %>/front-end/adopt/adoptImg.do?adopt_id=${adoptionVO.adopt_id}">
						</div>
							<ul class="tags">
								<li><fmt:formatDate value="${adoptionVO.adopt_btime}"
										pattern="yyyy-MM-dd" /></li>
							</ul>
						<div style="float:right;">
							<button type="button" class="genric-btn primary small"
								style="margin-left: 670px;" id="apply" data-toggle="modal"
								data-target="#exampleModalCenter">申請</button>
						</div>
							<a href="#">
								<h1>${adoptionVO.adopt_species}</h1>
							</a>
							<div class="content-wrap">
								<p><h3>${adoptionVO.adopt_des}</h3></p>
							</div>
						</div>

						<!--案例檢舉彈出區-->
						<div class="modal fade" id="exampleModalCenter" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalCenterTitle"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h3 class="modal-title" id="exampleModalLongTitle"
											style="margin-left: 150px;">請輸入申請原因:</h3>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<form METHOD="post"
											ACTION="<%=(membVO == null)
  					? request.getContextPath() + "/front-end/members/login.jsp" 
 					: request.getContextPath()+"/AdoptApply.do"%>"> 
											<div class="input-group mb-3">
										<textarea class="single-textarea form-group"
									name="adopt_des" placeholder="Messege"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Messege'"></textarea>
												<script> CKEDITOR.replace( 'adopt_des', {}); </script> 	
											</div>
											<input type="hidden" name="adopt_id"
												value="<%=request.getParameter("adopt_id")%>">
											<input type="hidden" name="memb_id"
												value="<%=(membVO == null) ? "" : membVO.getMemb_id()%>">
											 <input type="hidden" name="action" value="insert">
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">取消</button>
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
										<p>認養發起人</p>
										<h3 class="text-uppercase">
											<a href="#">${memSvc.getOneMem(adoptionVO.adopt_sponsor).memb_nick}</a>
										</h3>
									</div>
									<div class="thumb">
										<img src="<%=request.getContextPath()%>/front-end/members/memImg.do?memb_id=${adoptionVO.adopt_sponsor}" alt="">
									</div>
								</div>
							</div>

						</section>
						<div class="comment-sec-area">
							<h3 class="text-uppercase" style="color: red">留言區</h3>
							<br>
							<c:if test="${not empty errorMsgs}">
									<c:forEach var="message" items="${errorMsgs}">
										<div class="alert alert-danger" role="alert">
                                        	${message}
                                    	</div>
									</c:forEach>
							</c:if>
							<br>
							<h4 class="pb50">Leave a Reply...</h4>


							<form
								action="<%=(membVO == null)
					? request.getContextPath() + "/front-end/members/login.jsp"
					: request.getContextPath() + "/front-end/adopt/adoptMsgServlet.do"%>"
								method="post">
								<textarea class="form-control mb-10" name="adopt_msg_comm"
									id="adopt_msg_comm" placeholder="Messege"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Messege'"></textarea>
								<input type="hidden" name="adopt_id" id="adopt_id" value="<%=adopt_id%>">  
								<input type="hidden" name="adopt_msg_sper" id="adopt_msg_sper" value="<%=(membVO == null) ? "" : membVO.getMemb_id()%>">
								 <input
									type="hidden" name="action" value="insert"> <input
									type="submit" id="submit"
									class="genric-btn danger circle arrow col-offset-md-6"
									style="margin-left: 1020px;" value="送出">

							</form>

							<c:forEach var="adoptMsgVO" items="${list}" varStatus="i">
							<c:if test="${adoptMsgRtSvc.getOneAdoptMsgRt(adoptMsgVO.adopt_msg_id).adopt_msg_rt_status !='通過'}">
								<div class="comment-list" id="m${i.index}">
									<div class="single-comment justify-content-between d-flex">
										<div class="user justify-content-between d-flex">
											<div class="thumb">
												<img  width="200" height="200" src="<%=request.getContextPath()%>/front-end/members/memImg.do?memb_id=${adoptMsgVO.adopt_msg_sper}">
											</div>
											<div class="desc">
												<h5>
													<a href="#">${memSvc.getOneMem(adoptMsgVO.adopt_msg_sper).memb_nick}</a>
								
						<div style="float:right">
							<ul class="nav-menu">
								<li class="menu-has-children"><a class="item"><i class="fa fa-thumb-tack"></i></a>
									<ul>
										<li>
											<button type="button" class="genric-btn primary small"
								 data-toggle="modal"	data-target="#${adoptMsgVO.adopt_msg_id}">檢舉</button>
										</li>
										<li>
<!-- 											<form method="post" -->
<%-- 												action="<%=request.getContextPath()%>/front-end/adopt/adoptMsgServlet.do"> --%>
												<button class="genric-btn primary small" type="submit" id="${i.index}">刪除</button>
												<input type="hidden" name="action" value="delete">
												<input type="hidden" name="adopt_msg_id" value="${adoptMsgVO.adopt_msg_id}">
												<input type="hidden" name="adopt_id" value="<%=request.getParameter("adopt_id")%>">
<!-- 											</form> -->
										</li>
									</ul>
								</li>
							</ul>	
						</div>
								
								
												</h5>
												<p class="date">
													<fmt:formatDate value="${adoptMsgVO.adopt_msg_time}"
														pattern="yyyy-MM-dd" />
												</p>
												<p class="comment">${adoptMsgVO.adopt_msg_comm}</p>
											</div>
											<input type="hidden" name="adopt_msg_id" value="${adoptMsgVO.adopt_msg_id}">
										</div>
									</div>
								</div>
								
								
								<!--留言檢舉彈出區-->
							<div class="modal fade" id="${adoptMsgVO.adopt_msg_id}" tabindex="-1"
								role="dialog" aria-labelledby="#${missingMsgVO.missing_msg_id}"
								aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="${adoptMsgVO.adopt_msg_id}"
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
					: request.getContextPath() + "/front-end/adopt/AdoptMsgReportServlet.do"%>"> 
												<div class="input-group mb-3">
													<input type="text" class="form-control"
														name="adopt_msg_rt_comm" aria-label="Default"
														aria-describedby="inputGroup-sizing-default">
												</div>
												
												<input type="hidden" name="adopt_id"
													value="<%=request.getParameter("adopt_id")%>">
												<input type="hidden" name="memb_id"
													value="<%=(membVO == null) ? "" : membVO.getMemb_id()%>">
												 <input type="hidden" name="action" value="insert">
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">取消</button>
											<input type="submit" class="btn btn-primary" value="送出">
										<input type="hidden" name="adopt_msg_id" value="${adoptMsgVO.adopt_msg_id}">
										</div>
										</form>
									</div>
								</div>
							</div>
							<!-- 檢舉結束 -->
<script>
//刪除留言
	$('#${i.index}').click(function(e){
		if(${adoptMsgVO.adopt_msg_sper != membVO.memb_id}){
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
		                			url : '<%=request.getContextPath()%>/front-end/adopt/adoptMsgServlet.do',
		                			type : 'Post',
		    						data : {
		    							action : 'delete',
		    							adopt_msg_id : '${adoptMsgVO.adopt_msg_id}',
		    							memb_id : '${adoptMsgVO.adopt_msg_sper}',
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
//新增留言

	
	
	
	
	
	
	
	
	
	</script>
							
							
							</c:if>
							</c:forEach>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<c:forEach var="AdoptApplyVO" items="${list2}">
	<c:if test="${AdoptApplyVO.memb_id == membVO.memb_id && AdoptApplyVO.adopt_id == adopt_id}">
	<script>
	$('#apply').click(function(e){
		if(${AdoptApplyVO.memb_id == membVO.memb_id && AdoptApplyVO.adopt_id == adopt_id}){
			swal({
				title: "你已經申請過了！",
				type: "warning", 
				showCloseButton: true,
			});
			return false;
		}
	});	
	
	$("ul.nav-menu li").attr('class', "" );
	$("#adopt").attr('class', 'menu-active menu-has-children' )

	
	</script>
	</c:if>
	</c:forEach>


	
</body>
</html>