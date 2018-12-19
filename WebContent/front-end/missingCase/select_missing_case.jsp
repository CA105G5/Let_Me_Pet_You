<%@ page language="java" contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

		<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
			<!--
			CSS
			============================================= -->
			<link rel="stylesheet" href="css/linearicons.css">
			<link rel="stylesheet" href="css/font-awesome.min.css">
			<link rel="stylesheet" href="css/bootstrap.css">
			<link rel="stylesheet" href="css/magnific-popup.css">
			<link rel="stylesheet" href="css/nice-select.css">					
			<link rel="stylesheet" href="css/animate.min.css">
			<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">	
			<link rel="stylesheet" href="css/owl.carousel.css">
			<link rel="stylesheet" href="css/main.css">
<title>失蹤案例</title>

<style>
</style>

</head>
<body>
	<header id="header" id="home">
		<div class="container">
			<div class="row header-top align-items-center">
				<div class="col-lg-4 col-sm-4 menu-top-left">
					<a href="index.html"> <img class="img-fluid"
						src="img/logo2.png" width="200" alt="">
					</a>
				</div>
				<div class="col-lg-4 menu-top-middle justify-content-center d-flex">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="請輸入關鍵字">
						<span class="input-group-btn">
							<button class="btn btn-info" type="button">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</span>
					</div>
				</div>
				<div class="col-lg-4 col-sm-4 menu-top-right">
					<a class="tel">會員登入/ 註冊</a> <a href="#"><span
						class="fa fa-user"></span></a>
					<!-- style="font-size: 1.5rem;" -->
				</div>
			</div>
		</div>
		<hr>
		<div class="container">
			<div class="row align-items-center justify-content-center d-flex">
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li><a href="index.html">首頁</a></li>
						<li><a href="about.html">救援</a></li>
						<li><a href="service.html">認養</a></li>
						<li class="menu-has-children"><a href="training.html">失蹤</a>
							<ul>	
								<li><a href="listAllMissingCase.jsp">查看案例詳情</a></li>
								<li><a href="addMissingCase.jsp">新增失蹤案例</a></li>
							</ul></li>
						<li><a href="events.html">協尋</a></li>
						<li><a href="pricing.html">捐贈</a>
							<ul>
								<li><a href="blog-home.html">愛心捐款</a></li>
								<li><a href="blog-single.html">愛心物資捐贈</a></li>
								<li><a href="blog-single.html">許願物資捐贈</a></li>
							</ul></li>
						<li class="menu-has-children menu-active"><a href="">商城</a></li>
						<li><a href="contact.html">關於我們</a></li>
						<li><a href="elements.html">常見問題</a></li>
					</ul>
				</nav>
				<!-- #nav-menu-container -->
			</div>
		</div>
	</header>
	<!-- start banner Area -->
			<section class="banner-area relative" id="home">	
				<div class="overlay overlay-bg"></div>
				<div class="container">				
					<div class="row d-flex align-items-center justify-content-center">
						<div class="about-content col-lg-12">
							<h1 class="text-white">
								失蹤案例		
							</h1>	
							<p class="text-white link-nav"><a href="#">Home </a>  <span class="lnr lnr-arrow-right"></span>  <a href="#">失蹤案例</a></p>
						</div>	
					</div>
				</div>
			</section>
			<!-- End banner Area -->	

		<div class="container">
		  <div class="row">
		  	<!-- 左側邊 -->
		  	<div class="col-xs-12 col-sm-3">
		  		<div class="list-group">
		  			<a href="listAllMissingCase.jsp" class="list-group-item active">失蹤案例總覽</a>
		  			<a href="#" class="list-group-item">清單項目 2</a>
		  			<a href="#" class="list-group-item">清單項目 3</a>
		  			<a href="#" class="list-group-item">清單項目 3</a>
		  			<a href="#" class="list-group-item">清單項目 3</a>
		  			<a href="#" class="list-group-item">清單項目 3</a>
		  		</div>
		  	</div>

		  	<!-- 右邊內容區 -->
		  	<div class="col-xs-12 col-sm-9">
		  		<h1>title</h1>
				<p>
				<FORM METHOD="post" ACTION="miss.do">
				<div class="form-group">
					<label>查詢案例編號(ex.S000000001)</label>
					<input type="text" name="missing_case_id">
				    <input type="hidden" name="action" value="getOne_For_Display">
				    <input type="submit" value="送出" class="form-control">
					</div>
   				 </FORM>
		  		</p>
				


		  		<ul class="pagination">
		  		  <li><a href="#">&laquo;</a></li>
		  		  <li><a href="#">1</a></li>
		  		  <li><a href="#">2</a></li>
		  		  <li class="active"><a href="#">3</a></li>
		  		  <li><a href="#">4</a></li>
		  		  <li><a href="#">5</a></li>
		  		  <li><a href="#">&raquo;</a></li>
		  		</ul>


		  		<ul class="pager">
		  			<li class="previous"><a href="#">&larr; 上一頁</a></li>
		  			<li class="next"><a href="#">下一頁 &rarr;</a></li>
		  		</ul>
		  	</div>
		  </div>
		</div>


<p>This is the Home page for 失蹤案例: 首頁</p>

<h3>資料查詢:</h3>
	
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

    <FORM METHOD="post" ACTION="miss.do" >
        <b>輸入案例編號 (如S000000001):</b>
        <input type="text" name="missing_case_id">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>

  <jsp:useBean id="missingCaseSvc" scope="page" class="com.missingCase.model.missingCaseService" />
   
  <li>
     <FORM METHOD="post" ACTION="miss.do" >
       <b>選擇案例編號:</b>
       <select size="1" name="missing_case_id">
         <c:forEach var="missingCaseVO" items="${missingCaseSvc.all}" > 
          <option value="${missingCaseVO.missing_case_id}">${missingCaseVO.missing_case_id}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="miss.do" >
       <b>選擇失蹤寵物名稱:</b>
       <select size="1" name="missing_case_id">
         <c:forEach var="missingCaseVO" items="${missingCaseSvc.all}" > 
          <option value="${missingCaseVO.missing_case_id}">${missingCaseVO.missing_name}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
     </FORM>
  </li>
</ul>


<h3>員工管理</h3>

<ul>
  <li><a href='addMissing.jsp'>Add</a> a new Emp.</li>
</ul>

</body>
</html>