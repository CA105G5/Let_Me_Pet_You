<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.volunteer.model.*"%>

<%
  VolunteerVO volunteerVO = (VolunteerVO) request.getAttribute("volunteerVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>志工資料新增 </title>

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
		 <h3>志工資料新增</h3></td><td>
		 <h4><a href="select_page.jsp"><img src="images/tomcat.png" width="100" height="100" border="0">回首頁</a></h4>
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

<FORM METHOD="post" ACTION="volunteer.do" name="form1">
<table>
	<tr>
		<td>志工姓名:</td>
		<td><input type="TEXT" name="vlt_name" size="45" 
			 value="<%= (volunteerVO==null)? "鳴鳴" : volunteerVO.getVlt_name()%>" /></td>
	</tr>
	<tr>
		<td>e-mail(帳號):</td>
		<td><input type="TEXT" name="vlt_mail" size="45"
			 value="<%= (volunteerVO==null)? "jjuies424@gmail.com" : volunteerVO.getVlt_mail()%>" /></td>
	</tr>

	<tr>
		<td>性別:</td>
		<td><input type="RADIO" name="vlt_gender" value="M" ${(volunteerVO.vlt_reg=='M')? 'checked':'' }/>男
			<input type="RADIO" name="vlt_gender" value="F" ${(volunteerVO.vlt_reg=='F')? 'checked':'' }/>女</td>
	</tr>
	<tr>
		<td>手機號碼:</td>
		<td><input type="TEXT" name="vlt_tel" size="45"
			 value="<%= (volunteerVO==null)? "0939-393570" : volunteerVO.getVlt_tel()%>" /></td>
	</tr>

	<tr>
		<td>可值勤日:<font color=red><b>*</b></font></td>
		<td><select size="1" name="vlt_duty_day">
				<option value="平日" ${(volunteerVO.vlt_duty_day=='平日')? 'selected':'' }>平日
				<option value="假日" ${(volunteerVO.vlt_duty_day=='假日')? 'selected':'' }>假日
				<option value="每日" ${(volunteerVO.vlt_duty_day=='每日')? 'selected':'' }>每日
			
		</select></td>
	</tr>

	<jsp:useBean id="regionSvc" scope="page" class="com.region.model.RegionService" />
	<tr>
		<td>服務區域:<font color=red><b>*</b></font></td>
		<td><select size="1" name="reg_id">
			<c:forEach var="regionVO" items="${regionSvc.all}">
				<option value="${regionVO.reg_id}" ${(volunteerVO.vlt_reg==regionVO.reg_id)? 'selected':'' } >${regionVO.reg_name}
			</c:forEach>
		</select></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>
</body>