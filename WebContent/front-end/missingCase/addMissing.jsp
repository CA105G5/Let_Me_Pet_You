<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.missingCase.model.*"%>

<%
 missingCaseVO missingCaseVO = (missingCaseVO) request.getAttribute("missingCaseVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>���u��Ʒs�W - addEmp.jsp</title>

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
		 <h3>���ܮרҷs�W - addMissing.jsp</h3></td><td>
		 <h4><a href="select_missing_case.jsp"><img src="images/icons-return.png" width="32" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<h3>��Ʒs�W:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<FORM action="miss.do" method=post enctype="multipart/form-data">
<input type="file" name="upfile" id="file01">

<table>
<tr><td>�Ϥ��w��:</td><td><img id="pre01"></td></tr>
	<tr>
		<td>�|���s��:</td>
		<td><input type="TEXT" name="membno" size="45" 
			 value="<%= (missingCaseVO==null)? "ex.M000000001" :missingCaseVO.getMemb_id()%>" /></td>
	</tr>
	<tr>
		<td>�d���W��:</td>
		<td><input type="TEXT" name="missingName" size="45"
			 value="<%= (missingCaseVO==null)? "�A���d��" :missingCaseVO.getMissing_name()%>" /></td>
	</tr>
	<tr>
		<td>���ܤ��:</td>
		<td><input name="hiredate" id="m_date1" type="text"></td>
	</tr>
	<tr>
		<td>���e�y�z:</td>
		<td><input type="TEXT" size="45" name="missingDes"
			 value="<%= (missingCaseVO==null)? "���e�y�z" : missingCaseVO.getMissing_des()%>" /></td>
	</tr>
	<tr>
		<td>�a�I</td>
		<td><input type="TEXT" name="loc" size="45"
			 value="<%= (missingCaseVO==null)? "���ܦa�I" : missingCaseVO.getMissing_loc()%>" /></td>
	<%--</tr>

	<jsp:useBean id="deptSvc" scope="page" class="com.missingCase.model.*" /> --%>
	<tr>
	<%--	<td>����:<font color=red><b>*</b></font></td>
		<td><select size="1" name="deptno">
			<c:forEach var="deptVO" items="${deptSvc.all}">
				<option value="${deptVO.deptno}" ${(empVO.deptno==deptVO.deptno)? 'selected':'' } >${deptVO.dname}
			</c:forEach>
		</select></td>
	</tr> --%>

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>
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
	$(function() {  //�N�Ϥ��w��
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
		step: 1,            //step: 60 (�o�Otimepicker���w�]���j60����)
		format: 'Y-m-d H:i:s',
		 value: '<%=hiredate%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
           //startDate:	            '2017/07/10',  // �_�l��
           //minDate:               '-1970-01-01', // �h������(���t)���e
           //maxDate:               '+1970-01-01'  // �h������(���t)����
        });
        
		</script>
</html>