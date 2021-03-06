<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mem.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  MemVO memVO = (MemVO) session.getAttribute("memVO"); //MemServlet.java(Concroller), 存入req的memVO物件
%>

<html> 
<head>

<%-- Mobile Specific Meta --%>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

<title>浪我陪你-會員資料</title>

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
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>
<style>#success_message{ display: none;}</style>
</head>
<body bgcolor='white'>
<jsp:include page="/index_Header.jsp" flush="true"/>

<div class="container">

    <form class="well form-horizontal" action="mem.do" method="post"  id="contact_form" enctype="multipart/form-data">
<fieldset>
<br>
<!-- Form Name -->
<legend align="center">會員資料!</legend>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label">會員帳號:</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  
  <input  name="memb_acc" placeholder="至多20碼英文大小寫數字" class="form-control"  type="text"  value="<%=memVO.getMemb_acc()%>" disabled>
    </div>
  </div>
</div>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label" >會員密碼:</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
<!--   <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> -->
  <input name="memb_psw" placeholder="至多20碼英文大小寫數字" class="form-control"  type="text" value="<%=memVO.getMemb_psw()%>" disabled>
    </div>
  </div>
</div>

<!-- Text input-->
       <div class="form-group">
  <label class="col-md-4 control-label">會員姓名:</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
<!--         <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span> -->
  <input name="memb_name" placeholder="eg. 王小明" class="form-control"  type="text" value="<%=memVO.getMemb_name()%>" disabled>
    </div>
  </div>
</div>


<!-- Text input-->
       
<div class="form-group">
  <label class="col-md-4 control-label">會員暱稱:</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
<!--         <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span> -->
  <input name="memb_nick" placeholder="eg. 大衛海鮮" class="form-control" type="text" value="<%=memVO.getMemb_nick()%>" disabled>
    </div>
  </div>
</div>

<!-- Text input-->
      
<div class="form-group">
  <label class="col-md-4 control-label">會員信箱:</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
<!--         <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span> -->
  <input name="memb_email" placeholder="eg. xxx@gmail.com" class="form-control" type="text" value="<%=memVO.getMemb_email()%>" disabled>
    </div>
  </div>
</div>

<!-- radio checks -->
<div class="form-group">
  <label class="col-md-4 control-label">會員性別:</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
<!--         <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span> -->
  <input name="memb_gender" class="form-control" type="text" value="<% if ("M".equals(memVO.getMemb_gender())){out.println("男");}else if ("F".equals(memVO.getMemb_gender())){out.println("女");}else{out.println("未填寫");};%>" disabled>
    </div>
  </div>
</div>


<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label">會員手機:</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
<!--         <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span> -->
  <input name="memb_cellphone" class="form-control"  type="text" value="<%= (memVO.getMemb_cellphone()==null)? "未填寫" : memVO.getMemb_cellphone()%>" disabled>
    </div>
</div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label">信用卡類型:</label>  
   <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
<!--         <span class="input-group-addon"><i class="glyphicon glyphicon-globe"></i></span> -->
  <input name="memb_cre_type" class="form-control" type="text" value="<%= (memVO.getMemb_cre_type()==null)? "未填寫" : memVO.getMemb_cre_type()%>" disabled>
    </div>
  </div>
</div>

<!-- Text input-->
 
<div class="form-group">
  <label class="col-md-4 control-label">信用卡持卡人:</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
<!--         <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span> -->
  <input name="memb_cre_name" class="form-control"  type="text" value="<%= (memVO.getMemb_cre_name()==null)? "未填寫" : memVO.getMemb_cre_name()%>" disabled>
    </div>
  </div>
</div>

<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label">信用卡到期年:</label>  
    <div class="col-md-4 inputGroupContainer">
	    <div class="input-group">
	<!--         <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span> -->
	  <input name="memb_cre_year" class="form-control"  type="text" value="<%= (memVO.getMemb_cre_year()==null)? "未填寫" : memVO.getMemb_cre_year()+'年'%>" disabled>
	    </div>
	</div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label">信用卡到期月:</label>  
    <div class="col-md-4 inputGroupContainer">
	    <div class="input-group">
	<!--         <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span> -->
	  <input name="memb_cre_month" class="form-control"  type="text" value="<%= (memVO.getMemb_cre_month()==null)? "未填寫" : memVO.getMemb_cre_month()+'月'%>" disabled>
	    </div>
	</div>
</div>  






<!-- Photo area -->
  
<div class="form-group">
  <label class="col-md-4 control-label">會員照片</label>
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <img src="<%=request.getContextPath()%>/front-end/members/memImg.do?memb_id=${memVO.memb_id}"/>
  </div>
  </div>
</div>

<!-- Success message -->
<!-- <div class="alert alert-success" role="alert" id="success_message">Success <i class="glyphicon glyphicon-thumbs-up"></i> Thanks for contacting us, we will get back to you shortly.</div> -->

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4">
  	<div align="center"><a href="<%=request.getContextPath()%>/front-end/members/client_update.jsp">修改資料</a></div>
  </div>
</div>

</fieldset>
</form>

    </div><!-- /.container -->








<script>
$("ul.nav-menu li").attr('class', "" );
$("#member").attr('class', 'menu-active menu-has-children' )

</script>

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