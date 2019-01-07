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

	MemVO membVO = (MemVO) session.getAttribute("memVO");
	Timestamp missing_msg_date = new Timestamp(System.currentTimeMillis());
	Timestamp report_missing_time = new Timestamp(System.currentTimeMillis());
	Timestamp missing_msg_rt_time = new Timestamp(System.currentTimeMillis());
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
<title>Horse Club</title>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!--
			CSS
			============================================= -->
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

</head>
<body>

	<jsp:include page="/index_Header.jsp"
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
					<a href="listAllMissingCase.jsp" class="list-group-item ">失蹤案例總覽</a>
					<a href="addMissing.jsp" class="list-group-item ">失蹤案例新增</a>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-12 post-list blog-post-list">
						<div class="single-post">
							<img class="img-fluid"
								src="<%=request.getContextPath() %>/missingcase/missingcase.do?missingcaseno=${missingCaseVO.missing_case_id}"
								alt="">
							<ul class="tags">
								<li><fmt:formatDate value="${missingCaseVO.missing_date}"
										pattern="yyyy-MM-dd" /></li>
							</ul>
							<button type="button" class="genric-btn primary small"
								style="margin-left: 670px;" data-toggle="modal"
								data-target="#exampleModalCenter">檢舉</button>
							<a href="#">
								<h3>${missingCaseVO.missing_name}</h3>
							</a>
							<div class="content-wrap">
								<p>${missingCaseVO.missing_des}</p>
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
											<input type="hidden" name="report_missing_sta" value="待審核">
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
									type="submit" id="submit"
									class="genric-btn danger circle arrow col-offset-md-6"
									style="margin-left: 731px" value="送出">

							</form>

							<c:forEach var="missingMsgVO" items="${list}">
								<div class="comment-list" id="contentdiv">
									<div class="single-comment justify-content-between d-flex">
										<div class="user justify-content-between d-flex">
											<div class="thumb">
												<img src="img/blog/c1.jpg" alt="">
											</div>
											<div class="desc">
												<h5>
													<a href="#">Emilly Blunt</a><button type="button" class="genric-btn primary small"
								style="margin-left: 670px;" data-toggle="modal"	data-target="#${missingMsgVO.missing_msg_id}">檢舉</button>
												</h5>
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
								
								
								<!--留言檢舉彈出區-->
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
												<input type="hidden" name="missing_msg_rt_sta" value="待審核">
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
							</c:forEach>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>


</script>
</body>
</html>