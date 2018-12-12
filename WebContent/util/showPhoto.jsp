<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>

<%  List<String> imgIdList = (Vector<String>) request.getAttribute("imgIdList"); %>
<%  for (int i=0; i<imgIdList.size(); i++){
        String imgId = imgIdList.get(i); 
%>        
   <img src="<%= request.getContextPath() %>/util/PhotoReader?wish_img_id=<%=imgId %>" width="500">
<%--    <img src="PhotoReader?wish_img_id=<%=imgId %>" width="500"> --%>
<%--    <img src="/CA105G5/util/PhotoReader?wish_img_id=<%=imgId %>" width="500"> --%>
	
	
<% } %>  
	
	

</body>
</html>