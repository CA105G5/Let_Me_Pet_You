<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>

<%
  MemVO memVO = (MemVO) request.getAttribute("memVO"); 
%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>會員資料修改 - client_update.jsp</title>

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
		 <h3>會員資料修改 - client_update.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料修改:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="mem.do" name="form1">
<table>
	<tr>
		<td>會員編號:<font color=red><b>*</b></font></td>
		<td><%=memVO.getMemb_id()%></td>
	</tr>
	<tr>
		<td>會員帳號:<font color=red><b>*</b></font></td>
		<td><%=memVO.getMemb_acc()%></td>
	</tr>
	<tr>
		<td>會員密碼:</td>
		<td><input type="TEXT" name="memb_psw" size="45" value="<%=memVO.getMemb_psw()%>" /></td>
	</tr>
	<tr>
		<td>會員姓名:</td>
		<td><input type="TEXT" name="memb_name" size="45" value="<%=memVO.getMemb_name()%>" /></td>
	</tr>
	<tr>
		<td>會員暱稱:</td>
		<td><input type="TEXT" name="memb_nick" size="45" value="<%=memVO.getMemb_nick()%>" /></td>
	</tr>
	<tr>
		<td>會員信箱:</td>
		<td><input type="TEXT" name="memb_email" size="45" value="<%=memVO.getMemb_email()%>" /></td>
	</tr>
	<tr>
		<td>會員手機:</td>
		<td><input type="TEXT" name="memb_cellphone" size="45" value="<%=(memVO.getMemb_cellphone()==null)? "" : memVO.getMemb_cellphone()%>" /></td>
	</tr>
	<tr>
		<td>會員性別:</td>
		<td><input type="TEXT" name="memb_gender" size="45" value="<%=(memVO.getMemb_gender()==null)? "" : memVO.getMemb_gender()%>" /></td>
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
		<td><input type="TEXT" name="memb_cre_year" size="45" value="<%=(memVO.getMemb_cre_year()==null)? "" : memVO.getMemb_cre_year()%>" /></td>
	</tr>
	<tr>
		<td>信用卡到期月:</td>
		<td><input type="TEXT" name="memb_cre_month" size="45" value="<%=(memVO.getMemb_cre_month()==null)? "" : memVO.getMemb_cre_month()%>" /></td>
	</tr>


</table>
<br>
<input type="hidden" name="action" value="client_update">
<input type="hidden" name="memb_id" value="<%=memVO.getMemb_id()%>">
<input type="hidden" name="memb_acc" value="<%=memVO.getMemb_acc()%>">
<input type="submit" value="送出修改"></FORM>
</body>




</html>