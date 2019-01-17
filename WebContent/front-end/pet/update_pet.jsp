<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.pet.model.*"%>
<%@ page import="java.util.*"%>
<%
  PetVO petVO = (PetVO) request.getAttribute("petVO");
  MemVO memVO = (MemVO)	session.getAttribute("memVO");
  java.sql.Date pet_birth = null;
  try {
	  pet_birth = petVO.getPet_birth();
   } catch (Exception e) {
	   pet_birth = new java.sql.Date(System.currentTimeMillis());
   }
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


<title>浪我陪你-寵物資料修改</title>


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

    <form class="well form-horizontal" action="pet.do" method="post"  id="contact_form" enctype="multipart/form-data">
<fieldset>

<!-- Form Name -->
<legend align="center">請修改寵物資料</legend>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label">寵物編號:<font color=red><b>*無法修改</b></font></label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  
  <input  class="form-control"  type="text"  value="<%=petVO.getPet_id()%>" disabled>
    </div>
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label">主人姓名:<font color=red><b>*無法修改</b></font></label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  
  <input   class="form-control"  type="text"  value="<%=memVO.getMemb_name()%>" disabled>
    </div>
  </div>
</div>



<!-- Text input-->
       <div class="form-group">
  <label class="col-md-4 control-label">寵物姓名:<font color=red><b>*必填</b></font></label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
    <input type="TEXT" name="pet_name" size="45" value="<%=petVO.getPet_name()%>" />
<!--         <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span> -->
    </div>
  </div>
</div>


<!-- radio checks -->
 <div class="form-group">
                        <label class="col-md-4 control-label">寵物性別:</label>
                        <div class="col-md-4" >
                            <div class="radio" >
                                <label>
                                	<input type="RADIO" name="pet_gender" size="45" 
			 							value="M" ${(petVO.pet_gender=='M')? 'checked':'' }/>公
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="RADIO" name="pet_gender" size="45" 
			 							value="F" ${(petVO.pet_gender=='F')? 'checked':'' }/>母
                                </label>
                            </div>
                           
                        </div>
</div>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label">出生日期:</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
<!--         <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span> -->
 <input  type="text" name="pet_birth" id="f_date1" value="<%= (petVO==null)? "" : petVO.getPet_birth()%>">
    </div>
</div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label">寵物描述:</label>  
   <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
<!--         <span class="input-group-addon"><i class="glyphicon glyphicon-globe"></i></span> -->
<textarea name="pet_descr" rows="5" cols="30">${petVO.pet_descr}</textarea>

    </div>
  </div>
</div>

<div class="form-group"> 
  <label class="col-md-4 control-label">寵物種類:</label>
    <div class="col-md-4 selectContainer">
    <div class="input-group">
<!--         <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span> -->
    <select name="pet_type" size="1">
		<option value="" ${(petVO.pet_type =='')? 'selected':''}>請選擇寵物種類
		<option value="貓" ${(petVO.pet_type =="貓")? "selected":""}>貓
		<option value="狗" ${(petVO.pet_type =='狗')? 'selected':''}>狗
		<option value="飛禽" ${(petVO.pet_type =='飛禽')? 'selected':''}>飛禽
		<option value="其他" ${(petVO.pet_type =='其他')? 'selected':''}>其他
	</select>
  </div>
</div>
</div>





<!-- Photo area -->
  
<div class="form-group">
  <label class="col-md-4 control-label">寵物照片:</label>
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
    	<img class="preview" src="<%=request.getContextPath()%>/front-end/pet/petImg.do?pet_id=${petVO.pet_id}"/>
		 <div class="size"></div>
		 選擇照片
		<input type="file" class="upl" name="upfile" id="file01">
  </div>
  </div>
</div>

<!-- Success message -->
<!-- <div class="alert alert-success" role="alert" id="success_message">Success <i class="glyphicon glyphicon-thumbs-up"></i> Thanks for contacting us, we will get back to you shortly.</div> -->

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4">
  	<input type="hidden" name="action" value="update_pet">
	<input type="hidden" name="pet_id" value="<%=petVO.getPet_id()%>">
	<input type="hidden" name="memb_id" value="<%=memVO.getMemb_id()%>">
    <button type="submit" class="btn btn-warning" >送出修改 <span class="glyphicon glyphicon-send"></span></button>
  </div>
</div>

</fieldset>
</form>

    </div><!-- /.container -->






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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: 'normal',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=pet_birth%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           maxDate:               '+pet_birth'  // 去除今日(不含)之後
        });
        
        
   
        // ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

        //      1.以下為某一天之前的日期無法選擇
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.以下為某一天之後的日期無法選擇
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
</script>			
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
<script>
$("ul.nav-menu li").attr('class', "" );
$("#member").attr('class', 'menu-active menu-has-children' )

</script>
</body>




</html>