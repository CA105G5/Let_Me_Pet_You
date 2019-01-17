<%@page import="com.mem.model.MemVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*"%>
<%@page import="com.ntf.model.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<!-- 	這版是套首頁的版本 -->
<%  
	
	MemVO memVO = (MemVO) session.getAttribute("memVO");
	System.out.println("111111111111111111111111111="+session.getId());
	System.out.println( "是否登入:"+ (memVO != null));
	
%>

	
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<!-- Mobile Specific Meta -->
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
<title>浪我陪你</title>

<!--
			CSS
			============================================= -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/linearicons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/magnific-popup.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/nice-select.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/animate.min.css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/owl.carousel.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 若要使用fai那版外掛icon，要import CDN，快捷鍵facdn=>tab -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- https://fontawesome.com/ 自己的css-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP"
	crossorigin="anonymous">
	
<!-- sweetAlert -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>

<style type="text/css">

	*{
		font-size:16px;
	}

	#nav-menu-container a{
		font-size:16px;
	}

	p {
		　 font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
			monospace;
	}
	
	div {
		font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
			monospace;
	}
	
/* 	購物車icon */
#cart-container {
  float: right;
  width: 100px;
  position: relative;
}

#itemCount {
  position: absolute;
  display: none;
  top: -10px;
  left: -10px;
  width: 20px;
  height: 20px;
  border-radius: 50%;
  background: red;
  color: white;
  text-align: center;
}

i.fa-shopping-cart:hover {
  cursor: pointer;
}
	
#fav_icon:hover {
  cursor: pointer;
}

.show{
	display:inline!important;
}
	
	
	
</style>
</head>
<body>
	<jsp:useBean id="MemberService" scope="page" class="com.mem.model.MemService"/>
	<jsp:useBean id="ntfSvc" scope="page" class="com.ntf.model.NtfService"/>
	<header id="header" id="home" style="height:117px">
		<div class="container">
			<div class="row header-top align-items-center">
				<div class="col-lg-3 col-sm-3 menu-top-left">
					<a href="<%=request.getContextPath()%>/index.jsp"> <img class="img-fluid"
						src="<%=request.getContextPath()%>/horse_UI_template/img/logo2.png" width="200" alt="">
					</a>
				</div>
				<div class="col-lg-6 menu-top-middle justify-content-center d-flex">
					<div class="container">
						<div class="row align-items-center justify-content-center d-flex">
							<nav id="nav-menu-container" style="font-size:16px">
								<ul class="nav-menu">
									<li class="menu-active"><a href="<%=request.getContextPath()%>/index.jsp">首頁</a></li>
									<li class="menu-has-children" id="member"><a href="<%=request.getContextPath()%>/index.jsp">會員</a>
										<ul>
											<li><a href="<%=request.getContextPath()%>/front-end/members/listOneMember.jsp">查看會員資料</a></li>
											<li><a href="<%=request.getContextPath()%>/front-end/pet/pet.do?action=select_pet">查看我的寵物資料</a></li>
											<li><a href="<%=request.getContextPath()%>/index.jsp">查看我的救援案例</a></li>
											<li><a href="<%=request.getContextPath()%>/index.jsp">查看我的認養案例</a></li>
											<li><a href="<%=request.getContextPath()%>/index.jsp">查看我的失蹤寵物</a></li>
											<li><a href="<%=request.getContextPath()%>/front-end/donate/listAllProdDon.jsp">查看我的捐贈紀錄</a></li>
											<li><a href="<%=request.getContextPath()%>/front-end/ord/listAllOrd.jsp">我的訂單管理</a></li>
											<li><a href="<%=request.getContextPath()%>/front-end/prodtrack/listAllProdTrack.jsp">我的追蹤商品</a></li>
										</ul>
									</li>
									<li class="menu-has-children" id="rescue"><a href="<%=request.getContextPath()%>/front-end/rescue/listAllRescueMap.jsp">救援</a>
										<ul>
											<li><a href="<%=request.getContextPath()%>/front-end/rescue/listAllRescue.jsp">救援案例總覽</a></li>
											<li><a href="<%=request.getContextPath()%>/front-end/rescue/addRescue.jsp">新增救援案例</a></li>
											<li><a href="<%=request.getContextPath()%>/front-end/rescue/listMemRescue.jsp">待完成救援案例</a></li>
										</ul>
									</li>
									<li class="menu-has-children" id="adopt"><a href="<%=request.getContextPath()%>/front-end/adopt/listAllAdopt.jsp">認養</a>
										<ul>
											<li><a href="<%=request.getContextPath()%>/front-end/adopt/addAdopt.jsp">新增認養案例</a></li>
											<li><a href="<%=request.getContextPath()%>/front-end/adopt/listAllAdopt.jsp">認養案例瀏覽</a></li>
										</ul>
									</li>
									<li class="menu-has-children" id="missing"><a href="<%=request.getContextPath()%>/front-end/missingCase/listAllMissingCase.jsp">失蹤</a>
								    	<ul>
											<li><a href="<%=request.getContextPath()%>/front-end/missingCase/addMissing.jsp">新增失蹤案例</a></li>
											<li><a href="<%=request.getContextPath()%>/front-end/missingCase/listAllMissingCase.jsp">失蹤案例瀏覽</a></li>
										</ul>
									</li>
								
									<li class="menu-has-children" id="donate"><a href="<%=request.getContextPath()%>/front-end/donate/addMoneyDon.jsp">捐贈</a>
										<ul>
											<li><a href="<%=request.getContextPath()%>/front-end/donate/addMoneyDon.jsp">愛心捐款</a></li>
											<li><a href="<%=request.getContextPath()%>/front-end/donate/addProdDon.jsp">愛心商品捐贈</a></li>
										</ul>
									</li>
									<li id="shop"><a href="<%=request.getContextPath()%>/front-end/product/listAllProd.jsp">商城</a></li>
		<!-- 						<li><a href="contact.html">關於我們</a></li> -->
		<!-- 						<li><a href="elements.html">常見問題</a></li> -->
								</ul>
							</nav>
				<%-- #nav-menu-container --%>
						</div>
					</div>
				</div>
				
				
				<div class="col-lg-3 col-sm-3">
					<div class="row">
						<div id="cart-container" class="col-lg-1 col-sm-1">
							<a id="cart_icon"><i class="fa fa-shopping-cart fa-1x" aria-hidden="true"></i></a>
							<span id="itemCount"></span>
						</div>
						<div style="text-align:right; padding-left:20px; width:20px">
<!-- 							<a id="fav_icon"><i class="glyphicon glyphicon-heart" style="color: red; font-size:15px"  id="fav_heart"></i></a> -->
							<a id="fav_icon">
								<div class="buttons" style="display:inline">
									<img src="<%=request.getContextPath()%>/front-end/ord/twitter-heart-fix.png" style="display:inline; width:15px">
<!-- 						        	<span class="like-btn-fix" id="like-btn-fix" style="display:inline; padding-right:30px"></span> -->
						        </div>
							</a>
						</div> 
						<div class="col-lg-11 col-sm-11 menu-top-right">
							<% if(memVO == null){ %>
							<a href="<%=request.getContextPath()%>/front-end/members/login.jsp"><img style="width:40px;height:40px" class="img-fluid" src="<%=request.getContextPath()%>/images/login.jpg" data-toggle="tooltip" data-placement="left" title="登入/註冊">登入/註冊</a>
							<%}else{ %>
							<div align="center"  style="font-size:14px">
<%-- 								<a href="<%=request.getContextPath()%>/front-end/members/listAllNtfs.jsp"><i class="fa fa-bell"></i></a> --%>
								
								<%
									out.print(memVO.getMemb_nick()+"，你好");
								%>
								<a href="<%=request.getContextPath()%>/front-end/members/mem.do?action=logout">
								<img style="width:40px;height:40px" class="img-fluid" src="<%=request.getContextPath()%>/images/logout.png" data-toggle="tooltip" data-placement="left" title="登出">
								登出
								</a><br>
								<div class="dropdown for-notification" style="display:inline">
			                            <button class="" type="button" id="notification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" 
			                            style="padding:0px;color:#007bff;background-color:#ffffff;border-width:0px;width:18px;height:18px">
			                                <i class="fa fa-bell"></i>
			                                <div style="margin:0px;padding:0px;width:13px;height:13px">
			                                	<h6 style="background-color:#ff0000;color:white;margin-top: -20;margin-bottom: 0px;margin-right: -10;margin-left: 10px;">
			                                	<%
													List<NtfVO> list = ntfSvc.getAllNtfsFromSameMember(memVO.getMemb_id());
													pageContext.setAttribute("list",list);
													if(list.size()>0)
													out.print(list.size());													
												%>
			                                	</h6>
			                                </div>
			                            </button>
			                            <div class="dropdown-menu" aria-labelledby="notification">
			                                <% if(list.size()==0){out.print("目前沒有未讀的通知");} else{%>
			                                <p class="red">未讀的訊息有:</p>
			                                <c:forEach var="ntfVO" items="${list}">
												<a class="dropdown-item media" href="<%=request.getContextPath()%>/front-end/ntf/ntf.do?action=sort_type&ntf_id=${ntfVO.ntf_id}">
			                                    <i class="fa fa-check"></i>
			                                    <p>${ntfVO.ntf_dt}</p>
			                                	</a>
												
											</c:forEach>
			                                <%} %>
			                                
			                                
			                            </div>
			                   </div>
								&nbsp;&nbsp;&nbsp;
								<a href="<%=request.getContextPath()%>/front-end/members/cur_dt.jsp" style="font-size:14px">愛心幣餘額</a>
								<% out.print("尚有:    "+MemberService.getOneMem(memVO.getMemb_id()).getMemb_balance()+"元");}%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr>
			    
		

	</header>
	<!-- #header -->
	<br>
	<br>

	<br>
	<br>

	<br>
	<br>
	
	<script src="<%=request.getContextPath()%>/horse_UI_template/js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
<!-- 		下面這個會讓tab-panel和會員的下拉彈跳選單衝突 -->
<%-- 	<script src="<%=request.getContextPath()%>/horse_UI_template/js/vendor/bootstrap.min.js"></script> --%>
<!-- 		下面這個會讓tab-panel和會員的下拉彈跳選單衝突 -->

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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	
	<script type="text/javascript">
	
			// 	購物車
			// 	顯示購物車數量
			$(function(){
				$.ajax({
					url: '<%=request.getContextPath()%>/prodcart.do',
					type: "get",
					success: function(res){
						console.log(res);
						if (parseInt(res) > 0){
							console.log("parseInt = " + parseInt(res));
							$('#itemCount').html(res).css('display', 'block');
						} 
					},
					error: function(res){
						console.log(res);
					}
				
				});
			});
	

		$("#cart_icon").click(function(){
			$.ajax({
				url: '<%=request.getContextPath()%>/prodcart.do',
				type: "get",
				success: function(res){
					console.log(res);
					if (parseInt(res) < 1){
	//						alert("購物車中無商品");
						swal("Oops.....", "購物車中無商品", "warning").catch(swal.noop);
						return false;
					} else{
						console.log("redirect.....");
						console.log("<%=request.getContextPath()%>/prodcart.do?action=check_Cart");
						window.location.href = "<%=request.getContextPath()%>/prodcart.do?action=check_Cart";
					}
				},
				error: function(res){
					console.log(res);
				}
			
			});
		});
	
	
		$("#fav_icon").click(function(){
			$.ajax({
				url: '<%=request.getContextPath()%>/prodtrack.do',
				type: "get",
				success: function(res){
					console.log(res);
					if (parseInt(res) < 1){
	// 					alert("尚無追蹤商品");
						swal("Oops.....", "尚無追蹤商品", "warning").catch(swal.noop);
						return false;
					} else{
						window.location.href = "<%=request.getContextPath()%>/prodtrack.do?action=check_Fav";
					}
				},
				error: function(res){
					console.log(res);
				}
			
			});
		});
		
		$(".nav-menu li").click(function(){
			$(this).attr('class', 'menu-active' );
		});
		
	
	</script>


</body>
</html> 



