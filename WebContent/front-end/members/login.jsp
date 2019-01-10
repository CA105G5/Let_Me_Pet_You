<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<%-- Mobile Specific Meta --%>
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
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>登入畫面</title>
<%-- 放自己css前 --%>
<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
			<%--
			CSS
			============================================= --%>
			<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/linearicons.css">
			<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/font-awesome.min.css">
			<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/bootstrap.css">
			<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/magnific-popup.css">
			<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/nice-select.css">					
			<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/animate.min.css">
			<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">	
			<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/owl.carousel.css">
			<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

<%-- 若要使用fai那版外掛icon，要import CDN，快捷鍵facdn=>tab --%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<style>
#p1{
    opacity: 0.3; //設為完全不透明
    filter: alpha(opacity=30); // IE8 與更早的版本
}
</style>
</head>
<body background="">
<jsp:include page="/index_Header.jsp" flush="true" />

			  


<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<div class="container">

    <form class="well form-horizontal" action="mem.do" method="post"  id="contact_form">
<fieldset>

<!-- Form Name -->
<div class="h1"></div>
			
			<div class="page-header">
			  <h1 align="center">請輸入帳號與密碼</h1>
			  
			</div>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label">會員帳號:</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  
  <input  name="memb_acc" class="form-control"  type="text">
    </div>
  </div>
</div>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label" >會員密碼:</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
<!--   <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> -->
  <input name="memb_psw" class="form-control"  type="password" >
    </div>
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4">
  	<input type="hidden" name="action" value="login">
    <button type="submit" class="btn btn-warning">登入 <span class="glyphicon glyphicon-send"></span></button>
  </div>
</div>

</fieldset>
</form>

    </div><!-- /.container -->
    <div align="center"><a href="<%=request.getContextPath()%>/front-end/members/forget_psw.jsp">我忘記密碼了</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/front-end/members/addMembers.jsp">註冊成為新會員</a></div>
    
 		  
			  
			  
			  
<%-- 模板後script 加在自己的script前--%>
<script src="<%=request.getContextPath()%>/horse_UI_template/js/vendor/jquery-2.2.4.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
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