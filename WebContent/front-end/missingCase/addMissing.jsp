<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.missingCase.model.*"%>

<%
 missingCaseVO missingCaseVO = (missingCaseVO) request.getAttribute("missingCaseVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>員工資料新增 - addEmp.jsp</title>

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

<table id="table-1">
	<tr><td>
		 <h3>失蹤案例新增 - addMissing.jsp</h3></td><td>
		 <h4><a href="select_missing_case.jsp"><img src="images/icons-return.png" width="32" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料新增:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<FORM action="miss.do" method=post enctype="multipart/form-data">
<input type="file" name="upfile" id="file01">

<table>
<tr><td>圖片預覽:</td><td><img id="pre01"></td></tr>
	<tr>
		<td>會員編號:</td>
		<td><input type="TEXT" name="membno" size="45" 
			 value="<%= (missingCaseVO==null)? "ex.M000000001" :missingCaseVO.getMemb_id()%>" /></td>
	</tr>
	<tr>
		<td>寵物名稱:</td>
		<td><input type="TEXT" name="missingName" size="45"
			 value="<%= (missingCaseVO==null)? "你的寵物" :missingCaseVO.getMissing_name()%>" /></td>
	</tr>
	<tr>
		<td>失蹤日期:</td>
		<td><input name="hiredate" id="m_date1" type="text"></td>
	</tr>
	<tr>
		<td>內容描述:</td>
		<td><input type="TEXT" size="45" name="missingDes"
			 value="<%= (missingCaseVO==null)? "內容描述" : missingCaseVO.getMissing_des()%>" /></td>
	</tr>
	<tr>
		<td>地點</td>
		<td><input type="TEXT" name="loc" size="45"
			 value="<%= (missingCaseVO==null)? "失蹤地點" : missingCaseVO.getMissing_loc()%>" /></td>
	<%--</tr>

	<jsp:useBean id="deptSvc" scope="page" class="com.missingCase.model.*" /> --%>
	<tr>
	<%--	<td>部門:<font color=red><b>*</b></font></td>
		<td><select size="1" name="deptno">
			<c:forEach var="deptVO" items="${deptSvc.all}">
				<option value="${deptVO.deptno}" ${(empVO.deptno==deptVO.deptno)? 'selected':'' } >${deptVO.dname}
			</c:forEach>
		</select></td>
	</tr> --%>

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>
</body>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<%
  java.sql.Timestamp hiredate = null;
  try {
	    hiredate = missingCaseVO.getMissing_date();
   } catch (Exception e) {
	    hiredate = new java.sql.Timestamp(System.currentTimeMillis());
   }
%>
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
	$(function() {  //將圖片預覽
	    $('input[type=file]').change(function() {
	      var input = $(this);
	      if(!!this.files && !!this.files[0]) {
	        var reader = new FileReader();
	         reader.onload = function(e) {
	          $('#pre' + input.prop('id').substr(4,2)).prop('src', e.target.result);
	         }
	         reader.readAsDataURL(this.files[0]);
	       }
	     });
	   });




		$.datetimepicker.setLocale('zh'); // kr ko ja en
		$('#m_date1').datetimepicker({
		theme: '',          //theme: 'dark',
		timepicker: true,   //timepicker: false,
		step: 1,            //step: 60 (這是timepicker的預設間隔60分鐘)
		format: 'Y-m-d H:i:s',
		 value: '<%=hiredate%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        
		</script>
</html>