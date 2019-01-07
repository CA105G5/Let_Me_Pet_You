<%@page import="com.mem.model.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.prodimg.model.ProdImgService"%>
<%@ page import="com.prodimg.model.ProdImgVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.util.*"%>
<%@ page import="com.prod.model.ProdService"%>
<%@ page import="com.prod.model.ProdVO"%>

<%
	ProdVO prodVO  = (ProdVO) request.getAttribute("prodVO");
	List<ProdImgVO> prodImgList  = (List<ProdImgVO>) request.getAttribute("prodImgList");
	request.setAttribute("Test", "Test");
	
	MemVO memVO = (MemVO) session.getAttribute("memVO");
	String memb_id;
	if(memVO!=null)
		memb_id = memVO.getMemb_id();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Horse Club</title>

<script src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>

<style type="text/css">
p {
	font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}

div {
	font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}

</style>
</head>
<body>



	<jsp:include page="/index_Header.jsp" flush="true" />
	
	<div class="container">
		<div class="row">

			<!-- 左側邊list-group -->
			<div class="col-xs-12 col-sm-3">
				<div id="sider" class="n-browse-nav m-sticky-on" style="top: 150px; position: fixed; bottom: auto">
					<h3>愛心捐贈</h3>
					<hr>
					<h5><a href="<%=request.getContextPath()%>/front-end/donate/addProdDon.jsp">愛心捐款</a></h5>
					<hr>
					<h5><a href="<%=request.getContextPath()%>/front-end/donate/addProdDon.jsp">愛心商品捐贈</a></h5>
					<hr>
				</div>
			</div>
		</div>
	</div>
	
	<section class="training-area section-gap">
		<div class="container">
			<div id="sider" class="n-browse-nav m-sticky-on" style="top: 180px; bottom: auto;">
				<div class="row">
					<div class="col-lg-3 cl-md-3" style="top: 180px; bottom: auto;"></div> <!-- position: fixed -->
					<div class="col-xs-12 col-sm-9">
						<div class="row">
							<h1 class="pb-10">愛心商品捐贈</h1>
							<%-- 錯誤表列 --%>
							<c:if test="${not empty errorMsgs}">
								<div>
									<font style="color:red">請修正以下錯誤:</font>
									<ul>
									    <c:forEach var="message" items="${errorMsgs}">
											<li style="color:red">${message}</li>
										</c:forEach>
									</ul>
								</div>
							</c:if>
							<form METHOD="post" ACTION="<%=request.getContextPath()%>/product/product_upload.do" enctype="multipart/form-data">
								<div class="input-group">
									<label class="input-group-addon" style="width: 150px;">愛心商品名稱</label>
						  			<input type="text" class="form-control" placeholder="愛心商品名稱" 
						  				   value="<%= (prodVO==null)? "" : prodVO.getProd_name()%>" id="prod_name" name="prod_name" style="width: 500px;">
								</div>
								<br>
								<div class="input-group">
									<label class="input-group-addon" for="prod_qty" style="width: 150px;">捐贈數量</label>
								  	<input type="text" class="form-control" placeholder="捐贈數量" 
								  		   value="<%= (prodVO==null)? "" : prodVO.getProd_qty()%>" id="prod_qty" name="prod_qty" style="width: 500px;">
								</div>
								<br>
								<div class="input-group">
									<label class="input-group-addon" for="prod_price" style="width: 150px;">愛心商品價格</label>
								  	<input type="text" class="form-control" placeholder="愛心商品價格" 
								  		   value="<%= (prodVO==null)? "" : prodVO.getProd_price()%>" id="prod_price" name="prod_price" style="width: 500px;">
								</div>
								<br>
								<div class="input-group">
									<label class="input-group-addon" style="width: 150px;">愛心商品種類</label>
<!-- 						  			<input type="text" class="form-control" placeholder="愛心商品種類" id="prod_type_id" name="prod_type_id" style="width: 500px;"> -->
									<select class="form-control custom-control" id="prod_type_id" name="prod_type_id" style="width: 500px; height:32px;">
									
									    <option value="食" ${ prodVO.prod_type_id.equals("食")? "selected":""}>食</option>
									    <option value="衣" ${ prodVO.prod_type_id.equals("衣")? "selected":""}>衣</option>
									    <option value="住" ${ prodVO.prod_type_id.equals("住")? "selected":""}>住</option>
									    <option value="行" ${ prodVO.prod_type_id.equals("行")? "selected":""}>行</option>
									    <option value="育" ${ prodVO.prod_type_id.equals("育")? "selected":""}>育</option>
									    <option value="樂" ${ prodVO.prod_type_id.equals("樂")? "selected":""}>樂</option>
								  	</select>
								</div>
								<br>
								<div class="input-group">
									<label class="input-group-addon" style="width: 150px;">愛心商品使用對象</label>
<!-- 						  			<input type="text" class="form-control" placeholder="愛心商品使用對象" id="prod_ani_type_id" name="prod_ani_type_id" style="width: 500px;"> -->
									<select class="form-control custom-control" id="prod_ani_type_id" name="prod_ani_type_id" style="width: 500px; height:32px;">
									    <option value="貓" ${ prodVO.prod_ani_type_id.equals("貓")? "selected":""}>貓</option>
									    <option value="狗" ${ prodVO.prod_ani_type_id.equals("狗")? "selected":""}>狗</option>
									    <option value="飛禽" ${ prodVO.prod_ani_type_id.equals("飛禽")? "selected":""}>飛禽</option>
									    <option value="兔" ${ prodVO.prod_ani_type_id.equals("兔")? "selected":""}>兔</option>
									    <option value="其他" ${ prodVO.prod_ani_type_id.equals("其他")? "selected":""}>其他</option>
								  	</select>
								
								</div>
								<br>
								<div class="input-group">
									<label class="input-group-addon" style="width: 150px;">愛心商品資訊</label>
    								<textarea class="form-control custom-control" rows="5" style="resize:none; width: 500px;" id="prod_info" name="prod_info"><%= (prodVO==null)? "" : prodVO.getProd_info() %></textarea>     
								</div>
								<br>
								<div class="input-group">
									<label class="input-group-addon" style="width: 150px;">上傳照片</label>
						  			<input type="file" class="form-control" id="prod_img" name="prod_img" multiple style="width: 500px;">
						  			<br>
						  			<br>
						  			<br>
						  			<br>
						  			<br>
						  			<DIV id="preview"><img src="<%=request.getContextPath()%>/front-end/donate/noPic.png" width="100px" style="bottom-padding: 50px"></DIV>
<!-- 						  			<input type="file" class="form-control" id="prod_ani_type_id" name="prod_ani_type_id" style="margin-left:150px;"> -->
<!-- 									<label class="form-control" for="prod_ani_type_id" style="text-align:center; ">選擇檔案</label> -->
								</div>
								<br>
								<div class="input-group">
									<label class="input-group-addon" style="width: 150px;">愛心商品描述</label>
						  			<textarea name="prod_des" id="prod_des" rows="10" cols="80"><%= (prodVO==null)? "" : prodVO.getProd_des()%></textarea>
			            			<script> CKEDITOR.replace( 'prod_des', {}); </script> 
			            			<br>
								</div>
								<br>
									<input type="hidden" name="action" value="insert">
			            			<input type = "submit" value = "新增" style="text-align:center;">
								<br>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
	
	<script>
		var i;
		var files = $("#form :file"); //若只有單一表格要做動態樣式，則可以使用css選擇器
		$("#prod_img").change(function() {
			$("#preview").html("");
			console.log(this);
			readURL(this);
		});
	
		function readURL(input) {
			if (input.files && input.files.length>= 0) {
				for (var i = 0; i < input.files.length; i++) {
					var reader = new FileReader();
					reader.readAsDataURL(input.files[i]);
					reader.onload = function(e) {
					var img = $("<img width='300' height='200'>").attr('src', e.target.result);
						console.log(img);
						$("#preview").append(img).append("<br>").append("<br>");
					}
				}
			}
		}
	
	</script>
	
	<script>
		
		$("ul.nav-menu li").attr('class', "" );
		$("#donate").attr('class', 'menu-active menu-has-children' )
		 
		 
	</script>


	
</body>
</html>