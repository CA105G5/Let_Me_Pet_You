<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>

<%
  MemVO memVO = (MemVO) request.getAttribute("memVO"); 
%>
<%-- <%= memVO==null %>> --%>
<html>
<head>

<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
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


<title>會員資料修改 - client_update.jsp</title>


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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>
<header id="header" id="home">
				<div class="container">
			<div class="row header-top align-items-center">
				<div class="col-lg-4 col-sm-4 menu-top-left">
					<a href="index.jsp"> <img class="img-fluid"
						src="images/logo2.png" width="200" alt="">
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
				<a href="#"><img style="width:40px;height:40px" class="img-fluid" src="images/login.jpg" data-toggle="tooltip" data-placement="left" title="登入/註冊"></a>
					
				</div>
			</div>
		</div>
		<hr>
			    <div class="container">
			<div class="row align-items-center justify-content-center d-flex">
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li><a href="index.jsp">首頁</a></li>
						<li><a href="about.html">救援</a></li>
						<li><a href="service.html">認養</a></li>
						<li><a href="training.html">失蹤</a></li>
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
				<%-- #nav-menu-container --%>
			</div>
		</div>
			  </header><!-- #header -->



<br><br><br><br><br><br><br><br><br>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="mem.do" name="form1" enctype="multipart/form-data">
<div class="container">
			<div class="h1"></div>
			
			<div class="page-header">
			  <h1 align="center">請修改您的資料</h1>
			</div>


<table class="table table-bordered table-striped table-hover table-condensed">
	<tr>
		<td>會員編號:<font color=red><b>*無法修改</b></font></td>
		<td><%=memVO.getMemb_id()%></td>
	</tr>
	<tr>
		<td>會員帳號:<font color=red><b>*無法修改</b></font></td>
		<td><%=memVO.getMemb_acc()%></td>
	</tr>
	<tr>
		<td>會員密碼:<font color=red><b>*必填</b></font></td>
		<td><input type="TEXT" name="memb_psw" size="45" value="<%=memVO.getMemb_psw()%>" /></td>
	</tr>
	<tr>
		<td>會員姓名:<font color=red><b>*必填</b></font></td>
		<td><input type="TEXT" name="memb_name" size="45" value="<%=memVO.getMemb_name()%>" /></td>
	</tr>
	<tr>
		<td>會員暱稱:<font color=red><b>*必填</b></font></td>
		<td><input type="TEXT" name="memb_nick" size="45" value="<%=memVO.getMemb_nick()%>" /></td>
	</tr>
	<tr>
		<td>會員信箱:<font color=red><b>*必填</b></font></td>
		<td><input type="TEXT" name="memb_email" size="45" value="<%=memVO.getMemb_email()%>" /></td>
	</tr>
	<tr>
		<td>會員手機:</td>
		<td><input type="TEXT" name="memb_cellphone" size="45" value="<%=(memVO.getMemb_cellphone()==null)? "" : memVO.getMemb_cellphone()%>" /></td>
	</tr>
	<tr>
		<td>會員性別:</td>
		<td><input type="RADIO" name="memb_gender" size="45" 
			 value="M" ${(memVO.memb_gender=='M')? 'checked':'' }/>男
				 
			 
		<input type="RADIO" name="memb_gender" size="45" 
			 value="F" ${(memVO.memb_gender=='F')? 'checked':'' }/>女</td>
	</tr>
	<tr>
		<td>信用卡類型:</td>
		<td><input type="TEXT" name="memb_cre_type" size="45" value="<%=(memVO.getMemb_cre_type()==null)? "" : memVO.getMemb_cre_type()%>" /></td>
	</tr>
	<tr>
		<td>持卡人:</td>
		<td><input type="TEXT" name="memb_cre_name" size="45" value="<%=(memVO.getMemb_cre_name()==null)? "" : memVO.getMemb_cre_name()%>" /></td>
	</tr>
	<tr>
		<td>信用卡到期年:</td>
		<td><select name="memb_cre_year" size="1">
		<option value="" ${(memVO.memb_cre_year =='')? 'selected':''}>請選擇年份
		<option value="2019" ${(memVO.memb_cre_year =="2019")? "selected":""}>2019
		<option value="2020" ${(memVO.memb_cre_year =='2020')? 'selected':''}>2020
		<option value="2021" ${(memVO.memb_cre_year =='2021')? 'selected':''}>2021
		<option value="2022" ${(memVO.memb_cre_year =='2022')? 'selected':''}>2022
		<option value="2023" ${(memVO.memb_cre_year =='2023')? 'selected':''}>2023
		<option value="2024" ${(memVO.memb_cre_year =='2024')? 'selected':''}>2024
		<option value="2025" ${(memVO.memb_cre_year =='2025')? 'selected':''}>2025
		<option value="2026" ${(memVO.memb_cre_year =='2026')? 'selected':''}>2026
		    </select>年
		</td>
	</tr>
	<tr>
		<td>信用卡到期月:</td>
		<td><select name="memb_cre_month" size="1">
		<option value="" ${(memVO.memb_cre_month =='')? 'selected':''}>請選擇月份
		<option value="1" ${(memVO.memb_cre_month =='1')? 'selected':''}>1
		<option value="2" ${(memVO.memb_cre_month =='2')? 'selected':''}>2
		<option value="3" ${(memVO.memb_cre_month =='3')? 'selected':''}>3
		<option value="4" ${(memVO.memb_cre_month =='4')? 'selected':''}>4
		<option value="5" ${(memVO.memb_cre_month =='5')? 'selected':''}>5
		<option value="6" ${(memVO.memb_cre_month =='6')? 'selected':''}>6
		<option value="7" ${(memVO.memb_cre_month =='7')? 'selected':''}>7
		<option value="8" ${(memVO.memb_cre_month =='8')? 'selected':''}>8
		<option value="9" ${(memVO.memb_cre_month =='9')? 'selected':''}>9
		<option value="10" ${(memVO.memb_cre_month =='10')? 'selected':''}>10
		<option value="11" ${(memVO.memb_cre_month =='11')? 'selected':''}>11
		<option value="12" ${(memVO.memb_cre_month =='12')? 'selected':''}>12
		    </select>月
		</td>
	</tr>
	<tr>
		<td>會員照片:</td>
		<td>
		<img class="preview" src="<%=request.getContextPath()%>/front-end/members/memImg.do?memb_id=${memVO.memb_id}"/>
		 <div class="size"></div>
		 選擇照片
		<input type="file" class="upl" name="upfile" id="file01">
		</td>
	</tr>
</table>
</div>	

<br>
<input type="hidden" name="action" value="client_update">
<input type="hidden" name="memb_id" value="<%=memVO.getMemb_id()%>">
<input type="hidden" name="memb_acc" value="<%=memVO.getMemb_acc()%>">
<input type="submit" value="送出修改"></FORM>


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

<%-- RWD--%>
<script src="https://code.jquery.com/jquery.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
			
<script>
$(function (){
	 
    function format_float(num, pos)
    {
        var size = Math.pow(10, pos);
        return Math.round(num * size) / size;
    }
 
    function preview(input) {
 
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $('.preview').attr('src', e.target.result);
                var KB = format_float(e.total / 1024, 2);
                $('.size').text("檔案大小：" + KB + " KB");
            }
 
            reader.readAsDataURL(input.files[0]);
        }
    }
 
    $("body").on("change", ".upl", function (){
        preview(this);
    })
    
})
</script>
</body>




</html>