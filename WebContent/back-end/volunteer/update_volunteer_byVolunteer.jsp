<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.volunteer.model.*"%>

<%
  VolunteerVO volunteerVO = (VolunteerVO) request.getAttribute("volunteerVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>

<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>志工資料修改</title>

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
		 <h3>志工資料修改</h3>
		 <h4><a href="index_Volunteer.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
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

<FORM METHOD="post" ACTION="volunteer.do" name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>志工編號:</td>
		<td><%=volunteerVO.getVlt_id()%></td>
	</tr>
	<tr>
		<td>志工姓名:</td>
		<td><%=volunteerVO.getVlt_name()%></td>
	</tr>
	<tr>
		<td>照片:<font color=red><b>*</b></font></td>
		<td>
		<img class="preview" src="<%=request.getContextPath()%>/back-end/volunteer/volunteerImg.do?vlt_id=${volunteerVO.vlt_id}"/>
		 <div class="size"></div>
		<input type="file" class="upl" name="upfile" id="file01">
		</td>
	</tr>
	<tr>
		<td>e-mail(帳號):</td>
		<td><%=volunteerVO.getVlt_mail()%></td>
	</tr>
	<tr>
		<td>密碼:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="vlt_pw" size="45"
			 value="<%=volunteerVO.getVlt_pw()%>" /></td>
	</tr>

	<tr>
		<td>性別:</td>
		<td><%=volunteerVO.getVlt_gender()%></td>
	</tr>
	<tr>
		<td>手機號碼:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="vlt_tel" size="45"
			 value="<%=volunteerVO.getVlt_tel()%>" /></td>
	</tr>
	<tr>
		<td>加入日期:</td>
		<td><%=volunteerVO.getVlt_registerdate()%></td>
	</tr>

	<tr>
		<td>可值勤日:<font color=red><b>*</b></font></td>
		<td><select size="1" name="vlt_duty_day">
				<option value="平日" ${(volunteerVO.vlt_duty_day=='平日')? 'selected':'' }>平日
				<option value="假日" ${(volunteerVO.vlt_duty_day=='假日')? 'selected':'' }>假日
				<option value="每日" ${(volunteerVO.vlt_duty_day=='每日')? 'selected':'' }>每日
			
		</select></td>
	</tr>

	<tr>
		<td>服務區域:</td>
		<td><%=volunteerVO.getVlt_reg()%></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="updatebyvolunteer">
<input type="hidden" name="vlt_id" value="<%=volunteerVO.getVlt_id()%>">
<input type="submit" value="送出修改"></FORM>
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