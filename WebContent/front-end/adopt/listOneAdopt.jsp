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
	AdoptMsgService adoptMsgSvc = new AdoptMsgService();
	List<AdoptMsgVO> list = adoptMsgSvc.findByAdopt(adopt_id);
	pageContext.setAttribute("list", list);
	MemVO membVO = (MemVO) session.getAttribute("memVO");
	
	String url = request.getContextPath() +"/front-end/adopt/adoptionServlet.do?action=getOne_For_Display&adopt_id="+adopt_id;
	session.setAttribute("adopt",url);
%>
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
</head>
<body>

	<jsp:include page="/front-end/missingCase/missing_case_header.jsp"
		flush="true" />

	<!-- End banner Area -->
	<section class="blog-posts-area section-gap">
		<div class="container" style="top: 180px">
			<div class="row d-flex justify-content-center">
				<div class="col-md-9 pb-40 header-text text-center">
					<h1 class="pb-10"></h1>
					<p>Who are in extremely love with eco friendly system.</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-3">
				<div class="list-group">
					<a href="listAllAdopt.jsp" class="list-group-item ">認養案例總覽</a>
					<a href="addAdopt.jsp" class="list-group-item ">認養案例新增</a>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-12 post-list blog-post-list">
						<div class="single-post">
							<img class="img-fluid"
								src="<%=request.getContextPath() %>/front-end/adopt/adoptImg.do?adopt_id=${adoptionVO.adopt_id}"
								alt="">
							<ul class="tags">
								<li><fmt:formatDate value="${adoptionVO.adopt_btime}"
										pattern="yyyy-MM-dd" /></li>
							</ul>
							<button type="button" class="genric-btn primary small"
								style="margin-left: 670px;" id="apply" data-toggle="modal"
								data-target="#exampleModalCenter">申請</button>
							<a href="#">
								<h3>${adoptionVO.adopt_species}</h3>
							</a>
							<div class="content-wrap">
								<p>${adoptionVO.adopt_des}</p>
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
										<p>連絡失主</p>
										<h4 class="text-uppercase">
											<a href="#">失蹤的人</a>
										</h4>
									</div>
									<div class="thumb">
										<img src="img/blog/next.jpg" alt="">
									</div>
								</div>
							</div>

						</section>
						<div class="comment-sec-area">
							<h3 class="text-uppercase" style="color: red">留言區</h3>
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
								<input type="hidden" name="adopt_id" id="adopt_id"
									value="<%=request.getParameter("adopt_id")%>">  
									<input type="hidden" name="adopt_msg_sper" id="adopt_msg_sper"
									value="<%=(membVO == null) ? "" : membVO.getMemb_id()%>">
								 <input
									type="hidden" name="action" value="insert"> <input
									type="submit" id="submit"
									class="genric-btn danger circle arrow col-offset-md-6"
									style="margin-left: 731px" value="送出">

							</form>

							<c:forEach var="adoptMsgVO" items="${list}">
								<div class="comment-list" id="contentdiv">
									<div class="single-comment justify-content-between d-flex">
										<div class="user justify-content-between d-flex">
											<div class="thumb">
												<img src="img/blog/c1.jpg" alt="">
											</div>
											<div class="desc">
												<h5>
													<a href="#">Emilly Blunt</a><button type="button" class="genric-btn primary small"
								style="margin-left: 670px;" data-toggle="modal"	data-target="#${adoptMsgVO.adopt_msg_id}">檢舉</button>
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
							</c:forEach>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
<script>
// $("#apply").on("click", function(){
// 	swal({
// 		title: '請輸入申請原因 ',
// 		html:
// 			'<form>' +
// 			  '<div class="form-group">' +
// 			    '<label for="reason" class="pull-left">檢舉原因：</label>' +
// 			    '<input type="text" class="form-control" id="reason" placeholder="reason">' +
// 			  '</div>' +
// 			'</form>',	
// 		type: "warning",
// 		preConfirm: function () {
// 			 return new Promise(function (resolve, reject) {
// 				 var data = {};
// 				 data.action = "insert";
// 				 data.adopt_des = $('reason').val().trim();
// 				 data.memb_id = '${membVO.memb_id}';
<%-- 				 data.daopt_id = '<%=adopt_id%>'; --%>
// 				 if (!data.adopt_des) reject('請輸入原因！');
// 			 })
			
// 		}
// 	})
	
	
// })


</script>



	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/vendor/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/easing.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/hoverIntent.js"></script>
	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/superfish.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/jquery.ajaxchimp.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/jquery.magnific-popup.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/owl.carousel.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/jquery.sticky.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/jquery.nice-select.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/parallax.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/waypoints.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/jquery.counterup.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/mail-script.js"></script>
	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/main.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js"
		type="text/javascript"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="js/jquery-1.12.3.min.js"></script>
</body>
</html>