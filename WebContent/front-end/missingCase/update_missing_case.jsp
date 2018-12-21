<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.missingCase.model.*"%>

<%
	missingCaseVO missingCaseVO = (missingCaseVO) request.getAttribute("missingCaseVO");

%>

<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
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
<title>Horse Club</title>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
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

<!-- �Y�n�ϥ�fai�����~��icon�A�nimport CDN�A�ֱ���facdn=>tab -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- https://fontawesome.com/ �ۤv��css-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP"
	crossorigin="anonymous">

<style type="text/css">
p {
	�@ font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}

div {
	font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}
</style>
</head>
<body>

	<jsp:include page="/front-end/missingCase/missing_case_header.jsp"
		flush="true" />

	<!-- ���䤺�e�� -->
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-3">
				<div class="list-group">
					<a href="listAllMissingCase.jsp" class="list-group-item ">���ܮר��`��</a>
					<a href="addMissing.jsp" class="list-group-item ">���ܮרҷs�W</a>
			</div>
		</div>
					<!-- �k�䤺�e�� -->
					<div class="col-xs-12 col-sm-9">
						<p>
						<FORM METHOD="post" ACTION="miss.do">
							<div class="form-group">
								<c:if test="${not empty errorMsgs}">
									<font style="color: red">�Эץ��H�U���~:</font>
									<ul>
										<c:forEach var="message" items="${errorMsgs}">
											<label style="color: red">${message}</label>
										</c:forEach>
									</ul>
								</c:if>
						</FORM>
						<FORM action="miss.do" name="form1" method="post" enctype="multipart/form-data">
							<table>
								<tr>
									<td>�Ϥ��w��:</td>
									<td><img id="img" class="preview" src="<%=request.getContextPath()%>/missingcase/missingcase.do?missingcaseno=${missingCaseVO.missing_case_id}"/>
									<div class="size"></div><input type="file" class="upl" name="upfile" id="file01">
									</td>
								</tr>
								<tr>
									<td>�|���s��:</td>
									<td><%=missingCaseVO.getMemb_id()%></td>
								</tr>
								<tr>
									<td>�d���W��:</td>
									<td><input type="TEXT" name="missingName" size="45"
										value="<%=missingCaseVO.getMissing_name()%>" /></td>
								</tr>
								<tr>
									<td>���ܤ��:</td>
									<td><input name="hiredate" id="m_date1" type="text"></td>
								</tr>
								<tr>
									<td>���e�y�z:</td>
									<td><input type="TEXT" size="45" name="missingDes"
										value="<%=missingCaseVO.getMissing_des()%>" /></td>
								</tr>
								<tr>
									<td>�a�I</td>
									<td><input type="TEXT" name="loc" size="45"
										value="<%=missingCaseVO.getMissing_loc()%>" /></td>
							</table>
							<br> <input type="hidden" name="action" value="update">
							<input type="hidden" name="membno" value="<%=missingCaseVO.getMemb_id()%>">
							<input type="hidden" name="missing_case_id" value=<%=missingCaseVO.getMissing_case_id() %>>
							<input type="submit" value="�e�X�s�W">
						</FORM>

					</div>
				</div>
			</div>
			
			<script src="js/vendor/jquery-2.2.4.min.js"></script>
<!-- 			<script -->
<!-- 				src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" -->
<!-- 				integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" -->
<!-- 				crossorigin="anonymous"></script> -->
<!-- 			<script src="js/vendor/bootstrap.min.js"></script> -->
<!-- 			<script type="text/javascript" -->
<!-- 				src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script> -->
<!-- 			<script src="js/easing.min.js"></script> -->
<!-- 			<script src="js/hoverIntent.js"></script> -->
<!-- 			<script src="js/superfish.min.js"></script> -->
<!-- 			<script src="js/jquery.ajaxchimp.min.js"></script> -->
<!-- 			<script src="js/jquery.magnific-popup.min.js"></script> -->
<!-- 			<script src="js/owl.carousel.min.js"></script> -->
<!-- 			<script src="js/jquery.sticky.js"></script> -->
<!-- 			<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<!-- 			<script src="js/jquery.nice-select.min.js"></script> -->
<!-- 			<script src="js/parallax.min.js"></script> -->
<!-- 			<script src="js/waypoints.min.js"></script> -->
<!-- 			<script src="js/jquery.counterup.min.js"></script> -->
<!-- 			<script src="js/mail-script.js"></script> -->
<!-- 			<script src="js/main.js"></script> -->
						
</body>
<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->
	<% 
	  java.sql.Timestamp hiredate = null;
	  try {
		    hiredate = missingCaseVO.getMissing_date();
	   } catch (Exception e) {
		    hiredate = new java.sql.Timestamp(System.currentTimeMillis());
	   }
	%>
<script>
	        // ----------------------------------------------------------�H�U�ΨӱƩw�L�k��ܪ����-----------------------------------------------------------

	        //      1.�H�U���Y�@�Ѥ��e������L�k���
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

	        
	        //      2.�H�U���Y�@�Ѥ��᪺����L�k���
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


	        //      3.�H�U����Ӥ�����~������L�k��� (�]�i���ݭn������L���)
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
                $('#img').attr('src', e.target.result);
                var KB = format_float(e.total / 1024, 2);
                $('.size').text("�ɮפj�p�G" + KB + " KB");
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    $("body").on("change", ".upl", function (){
        preview(this);
    })
    
})
</script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
	<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
	<script>
	  $.datetimepicker.setLocale('zh');
		        $('#m_date1').datetimepicker({
			       theme: '',              //theme: 'dark',
			       timepicker:false,       //timepicker:true,
			       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
			       format:'Y-m-d',         //format:'Y-m-d H:i:s',
				   value: '<%=hiredate%>', // value:   new Date(),
		           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
		           //startDate:	            '2017/07/10',  // �_�l��
		           //minDate:               '-1970-01-01', // �h������(���t)���e
		           //maxDate:               '+1970-01-01'  // �h������(���t)����
		        });
	</script>
	<style>
	  .xdsoft_datetimepicker .xdsoft_datepicker {
	           width:  300px;   /* width:  300px; */
	  }
	  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	           height: 151px;   /* height:  151px; */
	  }
	</style>
</html>