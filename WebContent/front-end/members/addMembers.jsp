<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>


<%
  MemVO memVO = (MemVO) request.getAttribute("memVO");
%>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
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
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>浪我陪你-會員資料新增 </title>
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
			
<style>#success_message{ display: none;}</style>


</head>
<body bgcolor='white'>
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

    <form class="well form-horizontal" action="mem.do" method="post"  id="contact_form" enctype="multipart/form-data">
<fieldset>

<!-- Form Name -->
<legend align="center">歡迎加入會員!</legend>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label">會員帳號:<font color=red><b>*必填</b></font></label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  
  <input id="memb_acc"  name="memb_acc" placeholder="至多20碼英文大小寫數字" class="form-control"  type="text"  value="<%= (memVO==null)? "" : memVO.getMemb_acc()%>">
    </div>
  </div>
</div>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label" >會員密碼:<font color=red><b>*必填</b></font></label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
<!--   <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> -->
  <input id="memb_psw" name="memb_psw" placeholder="至多20碼英文大小寫數字" class="form-control"  type="text" value="<%= (memVO==null)? "" : memVO.getMemb_psw()%>">
    </div>
  </div>
</div>

<!-- Text input-->
       <div class="form-group">
  <label class="col-md-4 control-label">會員姓名:<font color=red><b>*必填</b></font></label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
<!--         <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span> -->
  <input id="memb_name" name="memb_name" placeholder="eg. 王小明" class="form-control"  type="text" value="<%= (memVO==null)? "" : memVO.getMemb_name()%>">
    </div>
  </div>
</div>


<!-- Text input-->
       
<div class="form-group">
  <label class="col-md-4 control-label">會員暱稱:<font color=red><b>*必填</b></font></label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
<!--         <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span> -->
  <input id="memb_nick" name="memb_nick" placeholder="eg. 大衛海鮮" class="form-control" type="text" value="<%= (memVO==null)? "" : memVO.getMemb_nick()%>">
    </div>
  </div>
</div>

<!-- Text input-->
      
<div class="form-group">
  <label class="col-md-4 control-label">會員信箱:<font color=red><b>*必填</b></font></label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
<!--         <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span> -->
  <input id="memb_email" name="memb_email" placeholder="eg. xxx@gmail.com" class="form-control" type="text" value="<%= (memVO==null)? "" : memVO.getMemb_email()%>">
    </div>
  </div>
</div>

<!-- radio checks -->
 <div class="form-group">
                        <label class="col-md-4 control-label">會員性別:</label>
                        <div class="col-md-4" >
                            <div class="radio" >
                                <label>
                                	<input id="memb_gender_M" type="RADIO" name="memb_gender" size="45" 
			 							value="M" ${(memVO.memb_gender=='M')? 'checked':'' }/>男
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="RADIO" name="memb_gender" size="45" 
			 							value="F" ${(memVO.memb_gender=='F')? 'checked':'' }/>女
                                </label>
                            </div>
                        </div>
</div>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label">會員手機:</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
<!--         <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span> -->
  <input name="memb_cellphone" placeholder="eg. 0987654321" class="form-control"  type="text" value="<%= (memVO==null)? "" : memVO.getMemb_cellphone()%>">
    </div>
</div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label">信用卡類型:</label>  
   <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
<!--         <span class="input-group-addon"><i class="glyphicon glyphicon-globe"></i></span> -->
  <input name="memb_cre_type" placeholder="eg. vista" class="form-control" type="text" value="<%= (memVO==null)? "" : memVO.getMemb_cre_type()%>">
    </div>
  </div>
</div>

<!-- Text input-->
 
<div class="form-group">
  <label class="col-md-4 control-label">信用卡持卡人:</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
<!--         <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span> -->
  <input name="memb_cre_name" placeholder="eg. 王小明" class="form-control"  type="text" value="<%= (memVO==null)? "" : memVO.getMemb_cre_name()%>">
    </div>
  </div>
</div>

<!-- Select Basic -->
<div class="form-group"> 
  <label class="col-md-4 control-label">信用卡到期年:</label>
    <div class="col-md-4 selectContainer">
    <div class="input-group">
<!--         <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span> -->
    <select name="memb_cre_year" class="form-control selectpicker" style="padding-bottom: 0px;">
		<option value="" ${(memVO.memb_cre_year =='')? 'selected':''}>請選擇年份
		<option value="2019" ${(memVO.memb_cre_year =="2019")? "selected":""}>2019年
		<option value="2020" ${(memVO.memb_cre_year =='2020')? 'selected':''}>2020年
		<option value="2021" ${(memVO.memb_cre_year =='2021')? 'selected':''}>2021年
		<option value="2022" ${(memVO.memb_cre_year =='2022')? 'selected':''}>2022年
		<option value="2023" ${(memVO.memb_cre_year =='2023')? 'selected':''}>2023年
		<option value="2024" ${(memVO.memb_cre_year =='2024')? 'selected':''}>2024年
		<option value="2025" ${(memVO.memb_cre_year =='2025')? 'selected':''}>2025年
		<option value="2026" ${(memVO.memb_cre_year =='2026')? 'selected':''}>2026年
	</select>
  </div>
</div>
</div>
   
<div class="form-group"> 
  <label class="col-md-4 control-label">信用卡到期月:</label>
    <div class="col-md-4 selectContainer">
    <div class="input-group">
<!--         <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span> -->
    
    <select name="memb_cre_month" class="form-control selectpicker" style="padding-bottom: 0px;">
		<option value="" ${(memVO.memb_cre_month =='')? 'selected':''}>請選擇月份
		<option value="1" ${(memVO.memb_cre_month =='1')? 'selected':''}>1月
		<option value="2" ${(memVO.memb_cre_month =='2')? 'selected':''}>2月
		<option value="3" ${(memVO.memb_cre_month =='3')? 'selected':''}>3月
		<option value="4" ${(memVO.memb_cre_month =='4')? 'selected':''}>4月
		<option value="5" ${(memVO.memb_cre_month =='5')? 'selected':''}>5月
		<option value="6" ${(memVO.memb_cre_month =='6')? 'selected':''}>6月
		<option value="7" ${(memVO.memb_cre_month =='7')? 'selected':''}>7月
		<option value="8" ${(memVO.memb_cre_month =='8')? 'selected':''}>8月
		<option value="9" ${(memVO.memb_cre_month =='9')? 'selected':''}>9月
		<option value="10" ${(memVO.memb_cre_month =='10')? 'selected':''}>10月
		<option value="11" ${(memVO.memb_cre_month =='11')? 'selected':''}>11月
		<option value="12" ${(memVO.memb_cre_month =='12')? 'selected':''}>12月
		    </select>
  </div>
</div>
</div>





<!-- Photo area -->
  
<div class="form-group">
  <label class="col-md-4 control-label">會員照片</label>
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <input type="file" class="upl" name="upfile" id="file01">
		<img class="preview" src=""/>
		<div class="size"></div>
  </div>
  </div>
</div>

<!-- Success message -->
<!-- <div class="alert alert-success" role="alert" id="success_message">Success <i class="glyphicon glyphicon-thumbs-up"></i> Thanks for contacting us, we will get back to you shortly.</div> -->

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4">
  	<input type="hidden" name="action" value="insert">
    <button type="submit" class="btn btn-warning" >成為會員 <span class="glyphicon glyphicon-send"></span></button>
  </div>
</div>

</fieldset>
</form>
<button id="miracleBtn" style="background-color:blue"></button>
    </div><!-- /.container -->






<%-- 模板script --%>
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
<script type="text/javascript">
			$('#miracleBtn').click(function(){
				console.log('1111111111111111');
				$('#memb_acc').val('ppp');
				$('#memb_psw').val('123');
				$('#memb_name').val('吳永志');
				$('#memb_nick').val('peter1');
				$('#memb_email').val('wspishandsome@gmail.com');
				
				
			});
			</script>
</body>




</html>