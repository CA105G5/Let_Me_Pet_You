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
		 <h4><a href="index.jsp"><img src="images/tomcat.png" width="100" height="100" border="0">回首頁</a></h4>
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
		<td><input type="RADIO" name="memb_gender" size="45" 
			 value="M" ${(memVO.memb_gender=='M')? 'checked':'' }/>男
				 
			 
		<input type="RADIO" name="memb_gender" size="45" 
			 value="F" ${(memVO.memb_gender=='F')? 'checked':'' }/>女</td>
			 
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