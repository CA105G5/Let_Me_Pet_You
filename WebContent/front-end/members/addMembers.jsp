<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>


<%
  MemVO memVO = (MemVO) request.getAttribute("memVO");
%>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>會員資料新增 - addMembers.jsp</title>

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

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>會員資料新增 - addMembers.jsp</h3></td><td>
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

<FORM METHOD="post" ACTION="mem.do" name="form1" enctype="multipart/form-data">
<img class="preview" src=""/>
		 <div class="size"></div>
		 選擇照片
		<input type="file" class="upl" name="upfile" id="file01">
<table>
	<tr>
		<td>會員帳號:</td>
		<td><input type="TEXT" name="memb_acc" size="45" 
			 value="<%= (memVO==null)? "" : memVO.getMemb_acc()%>" /></td>
	</tr>
	<tr>
		<td>會員密碼:</td>
		<td><input type="TEXT" name="memb_psw" size="45" 
			 value="<%= (memVO==null)? "" : memVO.getMemb_psw()%>" /></td>
	</tr>
	<tr>
		<td>會員姓名:</td>
		<td><input type="TEXT" name="memb_name" size="45" 
			 value="<%= (memVO==null)? "" : memVO.getMemb_name()%>" /></td>
	</tr>
	<tr>
		<td>會員暱稱:</td>
		<td><input type="TEXT" name="memb_nick" size="45" 
			 value="<%= (memVO==null)? "" : memVO.getMemb_nick()%>" /></td>
	</tr>
	<tr>
		<td>會員信箱:</td>
		<td><input type="TEXT" name="memb_email" size="45" 
			 value="<%= (memVO==null)? "" : memVO.getMemb_email()%>" /></td>
	</tr>
	<tr>
		<td>會員手機:</td>
		<td><input type="TEXT" name="memb_cellphone" size="45" 
			 value="<%= (memVO==null)? "" : memVO.getMemb_cellphone()%>" /></td>
	</tr>
	<tr>
		<td>會員性別:</td>
		<td><input type="TEXT" name="memb_gender" size="45" 
			 value="<%= (memVO==null)? "" : memVO.getMemb_gender()%>" /></td>
	</tr>
	<tr>
		<td>信用卡類型:</td>
		<td><input type="TEXT" name="memb_cre_type" size="45" 
			 value="<%= (memVO==null)? "" : memVO.getMemb_cre_type()%>" /></td>
	</tr>
	<tr>
		<td>持卡人:</td>
		<td><input type="TEXT" name="memb_cre_name" size="45" 
			 value="<%= (memVO==null)? "" : memVO.getMemb_cre_name()%>" /></td>
	</tr>
	<tr>
		<td>信用卡到期年:</td>
		<td><input type="TEXT" name="memb_cre_year" size="45" 
			 value="<%= (memVO==null)? "" : memVO.getMemb_cre_year()%>" /></td>
	</tr>
	<tr>
		<td>信用卡到期月:</td>
		<td><input type="TEXT" name="memb_cre_month" size="45" 
			 value="<%= (memVO==null)? "" : memVO.getMemb_cre_month()%>" /></td>
	</tr>



</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>
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