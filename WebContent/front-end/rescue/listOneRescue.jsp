<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.rescue.model.*"%>
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

MemVO memVOinit = new MemVO();
memVOinit.setMemb_id("M000000005");
session.setAttribute("memVO", memVOinit);

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




// MemService memSvc1 = new MemService();
// MemVO memVO = memSvc1.getOneMem("M000000005");
session.setAttribute("memVO",memVO);
%>
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService"/>
<jsp:useBean id="rescuingSvc" scope="page" class="com.rescuing.model.RescuingService"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>救援案例</title>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/horse_UI_template/css/linearicons.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/horse_UI_template/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/horse_UI_template/css/bootstrap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/horse_UI_template/css/magnific-popup.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/horse_UI_template/css/nice-select.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/horse_UI_template/css/animate.min.css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/horse_UI_template/css/owl.carousel.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/horse_UI_template/css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

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

	<jsp:include page="/front-end/rescue/rescue_header.jsp" flush="true" />
		
				<!-- Start blog-posts Area -->
			<section class="blog-posts-area section-gap">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-sm-8 post-list blog-post-list">
							<div class="single-post">
								<img class="img-fluid" src="<%=request.getContextPath()%>/back-end/rescue/rescueImg.do?rsc_id=${rescueVO.rsc_id}" alt="">
								
								
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
										<div class="comment-wrap col-sm-8">
											<ul>
										
<%-- 											<c:if test="${rescueVO.rsc_sta=='待救援' or rescueVO.rsc_sta=='救援中'}"> --%>
											
<%-- 												<a href="<%=request.getContextPath()%>/front-end/rescuing/rescuing.do?rsc_id=${rescueVO.rsc_id}&rscing_ptcp=${memVO.memb_id}&action=insert"  --%>
<!-- 												class="genric-btn primary">加入救援</a> -->
											
<!-- 												<a href="#" class="genric-btn disable">已加入救援</a> -->
											
<%-- 											</c:if> --%>
											
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
											
											</ul>
										</div>
										
										
										
										
										
										
										
<!-- 										<div class="social-wrap col-lg-6"> -->
<!-- 											<ul> -->
<!-- 												<li><a href="#"><i class="fa fa-facebook"></i></a></li> -->
<!-- 												<li><a href="#"><i class="fa fa-twitter"></i></a></li> -->
<!-- 												<li><a href="#"><i class="fa fa-dribbble"></i></a></li> -->
<!-- 												<li><a href="#"><i class="fa fa-behance"></i></a></li> -->
<!-- 											</ul> -->
											
<!-- 										</div> -->
									</div>
								</div>

                            <!-- Start nav Area -->
                            <section class="nav-area pt-50 pb-100">
                                <div class="container">
                                    <div class="row ">
                                        <div class="col-sm-3 nav-left justify-content-start d-flex">
                                            <div class="thumb">
                                                <img style="width:100px;height:100px"  src="<%=request.getContextPath()%>/back-end/members/memImg.do?memb_id=${memSvc.getOneMem(rescueVO.rsc_sponsor).memb_id}" alt="">
                                            </div>
                                            <div class="post-details">
                                                <p>救援發起者</p>
                                                <h4 class="text-uppercase">${memSvc.getOneMem(rescueVO.rsc_sponsor).memb_nick}</h4>
                                            </div>
                                        </div>
<!--                                         <div class="col-sm-3 nav-right justify-content-end d-flex"> -->
<!--                                             <div class="post-details"> -->
<!--                                                 <p>Prev Post</p> -->
<!--                                                 <h4 class="text-uppercase"><a href="#">A Discount Toner</a></h4> -->
<!--                                             </div>              -->
<!--                                             <div class="thumb"> -->
<!--                                                 <img src="img/blog/next.jpg" alt=""> -->
<!--                                             </div>                          -->
<!--                                         </div> -->
                                    </div>
                                </div>    
                            </section>
                            <!-- End nav Area -->

<!--                             Start comment-sec Area -->
<!--                             <section class="comment-sec-area pt-80 pb-80"> -->
<!--                                 <div class="container"> -->
<!--                                     <div class="row flex-column"> -->
<!--                                         <h5 class="text-uppercase pb-80">05 Comments</h5> -->
<!--                                         <br> -->
<!--                                         <div class="comment-list"> -->
<!--                                             <div class="single-comment justify-content-between d-flex"> -->
<!--                                                 <div class="user justify-content-between d-flex"> -->
<!--                                                     <div class="thumb"> -->
<!--                                                         <img src="img/blog/c1.jpg" alt=""> -->
<!--                                                     </div> -->
<!--                                                     <div class="desc"> -->
<!--                                                         <h5><a href="#">Emilly Blunt</a></h5> -->
<!--                                                         <p class="date">December 4, 2017 at 3:12 pm </p> -->
<!--                                                         <p class="comment"> -->
<!--                                                             Never say goodbye till the end comes! -->
<!--                                                         </p> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                                 <div class="reply-btn"> -->
<!--                                                        <a href="" class="btn-reply text-uppercase">reply</a>  -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="comment-list left-padding"> -->
<!--                                             <div class="single-comment justify-content-between d-flex"> -->
<!--                                                 <div class="user justify-content-between d-flex"> -->
<!--                                                     <div class="thumb"> -->
<!--                                                         <img src="img/blog/c2.jpg" alt=""> -->
<!--                                                     </div> -->
<!--                                                     <div class="desc"> -->
<!--                                                         <h5><a href="#">Emilly Blunt</a></h5> -->
<!--                                                         <p class="date">December 4, 2017 at 3:12 pm </p> -->
<!--                                                         <p class="comment"> -->
<!--                                                             Never say goodbye till the end comes! -->
<!--                                                         </p> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                                 <div class="reply-btn"> -->
<!--                                                        <a href="" class="btn-reply text-uppercase">reply</a>  -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="comment-list left-padding"> -->
<!--                                             <div class="single-comment justify-content-between d-flex"> -->
<!--                                                 <div class="user justify-content-between d-flex"> -->
<!--                                                     <div class="thumb"> -->
<!--                                                         <img src="img/blog/c3.jpg" alt=""> -->
<!--                                                     </div> -->
<!--                                                     <div class="desc"> -->
<!--                                                         <h5><a href="#">Emilly Blunt</a></h5> -->
<!--                                                         <p class="date">December 4, 2017 at 3:12 pm </p> -->
<!--                                                         <p class="comment"> -->
<!--                                                             Never say goodbye till the end comes! -->
<!--                                                         </p> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                                 <div class="reply-btn"> -->
<!--                                                        <a href="" class="btn-reply text-uppercase">reply</a>  -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="comment-list"> -->
<!--                                             <div class="single-comment justify-content-between d-flex"> -->
<!--                                                 <div class="user justify-content-between d-flex"> -->
<!--                                                     <div class="thumb"> -->
<!--                                                         <img src="img/blog/c4.jpg" alt=""> -->
<!--                                                     </div> -->
<!--                                                     <div class="desc"> -->
<!--                                                         <h5><a href="#">Emilly Blunt</a></h5> -->
<!--                                                         <p class="date">December 4, 2017 at 3:12 pm </p> -->
<!--                                                         <p class="comment"> -->
<!--                                                             Never say goodbye till the end comes! -->
<!--                                                         </p> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                                 <div class="reply-btn"> -->
<!--                                                        <a href="" class="btn-reply text-uppercase">reply</a>  -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="comment-list"> -->
<!--                                             <div class="single-comment justify-content-between d-flex"> -->
<!--                                                 <div class="user justify-content-between d-flex"> -->
<!--                                                     <div class="thumb"> -->
<!--                                                         <img src="img/blog/c5.jpg" alt=""> -->
<!--                                                     </div> -->
<!--                                                     <div class="desc"> -->
<!--                                                         <h5><a href="#">Emilly Blunt</a></h5> -->
<!--                                                         <p class="date">December 4, 2017 at 3:12 pm </p> -->
<!--                                                         <p class="comment"> -->
<!--                                                             Never say goodbye till the end comes! -->
<!--                                                         </p> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                                 <div class="reply-btn"> -->
<!--                                                        <a href="" class="btn-reply text-uppercase">reply</a>  -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div>                                                                                                                                                                 -->
<!--                                     </div> -->
<!--                                 </div>     -->
<!--                             </section> -->
<!--                             End comment-sec Area -->
                            
<!--                             Start commentform Area -->
<!--                             <section class="commentform-area pt-80"> -->
<!--                                 <div class="container"> -->
<!--                                     <h5 class="pb-50">Leave a Reply</h5> -->
<!--                                     <div class="row flex-row d-flex"> -->
<!--                                         <div class="col-lg-4 col-md-6"> -->
<!--                                             <input name="name" placeholder="Enter your name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your name'" class="common-input mb-20 form-control" required="" type="text"> -->
<!--                                             <input name="email" placeholder="Enter your email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your email'" class="common-input mb-20 form-control" required="" type="email"> -->
<!--                                             <input name="Subject" placeholder="Subject" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your Subject'" class="common-input mb-20 form-control" required="" type="text"> -->

<!--                                         </div> -->
<!--                                         <div class="col-lg-8 col-md-6"> -->
<!--                                             <textarea class="form-control mb-10" name="message" placeholder="Messege" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'" required=""></textarea> -->
<!--                                             <a class="primary-btn mt-20" href="#">Comment</a> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div>     -->
<!--                             </section> -->
<!--                             End commentform Area -->


							</div>																		
						</div>
						
                           

									

							
						</div>
					</div>
				</div>	
			</section>	

	
	



	<script src="<%=request.getContextPath()%>/horse_UI_template/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/horse_UI_template/js/vendor/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
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
</body>
</html>