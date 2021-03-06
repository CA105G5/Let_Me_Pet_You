<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.prodimg.model.ProdImgService"%>
<%@ page import="com.prodimg.model.ProdImgVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.util.*"%>
<%@ page import="com.prod.model.ProdService"%>
<%@ page import="com.prod.model.ProdVO"%>

<%
	ProdVO prodVO  = (ProdVO) session.getAttribute("updateprodVO");
	List<ProdImgVO> prodImgList  = (List<ProdImgVO>) session.getAttribute("updateprodImgList");
	System.out.println("updateProdDon.jsp得到從ProdServlet.java傳過來的屬性"+request.getAttribute("Test"));
	System.out.println("updateProdDon.jsp得到從ProdServlet.java傳過來的請求參數值"+request.getParameter("whichPage"));
	System.out.println("updateProdDon.jsp得到從ProdServlet.java傳過來的請求參數值"+request.getParameter("prod_id"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>愛心商品捐贈</title>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/logo3.png">

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



	<jsp:include page="/front-end/donate/don_Header.jsp" flush="true" />
	
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
	
	<section class="training-area" style="padding-top:20px">
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
									
									    <option value="食" ${ updateprodVO.prod_type_id.equals("食")? "selected":""}>食</option>
									    <option value="衣" ${ updateprodVO.prod_type_id.equals("衣")? "selected":""}>衣</option>
									    <option value="住" ${ updateprodVO.prod_type_id.equals("住")? "selected":""}>住</option>
									    <option value="行" ${ updateprodVO.prod_type_id.equals("行")? "selected":""}>行</option>
									    <option value="育" ${ updateprodVO.prod_type_id.equals("育")? "selected":""}>育</option>
									    <option value="樂" ${ updateprodVO.prod_type_id.equals("樂")? "selected":""}>樂</option>
								  	</select>
								</div>
								<br>
								<div class="input-group">
									<label class="input-group-addon" style="width: 150px;">愛心商品使用對象</label>
<!-- 						  			<input type="text" class="form-control" placeholder="愛心商品使用對象" id="prod_ani_type_id" name="prod_ani_type_id" style="width: 500px;"> -->
									<select class="form-control custom-control" id="prod_ani_type_id" name="prod_ani_type_id" style="width: 500px; height:32px;">
									    <option value="貓" ${ updateprodVO.prod_ani_type_id.equals("貓")? "selected":""}>貓</option>
									    <option value="狗" ${ updateprodVO.prod_ani_type_id.equals("狗")? "selected":""}>狗</option>
									    <option value="飛禽" ${ updateprodVO.prod_ani_type_id.equals("飛禽")? "selected":""}>飛禽</option>
									    <option value="兔" ${ updateprodVO.prod_ani_type_id.equals("兔")? "selected":""}>兔</option>
									    <option value="其他" ${ updateprodVO.prod_ani_type_id.equals("其他")? "selected":""}>其他</option>
								  	</select>
								
								</div>
								<br>
								<div class="input-group">
									<label class="input-group-addon" style="width: 150px;">愛心商品資訊</label>
    								<textarea class="form-control custom-control" rows="5" style="resize:none; width: 500px;" id="prod_info" name="prod_info"><%= (prodVO==null)? "" : prodVO.getProd_info() %></textarea>     
								</div>
								<br>
								<div class="input-group">
									<label class="input-group-addon" style="width: 150px;">照片</label>
									<div class="form-control custom-control" style="resize:none; width: 500px; height:225px" id="prod_img_show" name="prod_img_show">
										<c:forEach var="prodImgVO" items="${updateprodImgList}">
		<%-- 								<c:if test="${'上架'.equals(prodVO.prod_status)}" var="condition" scope="page"> --%>
<!-- 											<div class="col-lg-3 cl-md-3"> -->
<!-- 												<div class="single-training"> -->
<!-- 													<div class="thumb relative"> -->
<!-- 														<div class="overlay-bg"></div> -->
														<img class="img-fluid" width="100px"
															src="<%=request.getContextPath()%>/util/PicReader2?prod_img_id=${prodImgVO.prod_img_id}"
															alt="">
														<input type="checkbox" name="delete" value="${prodImgVO.prod_img_id}">刪除
<!-- 													<a class="admission-btn" href="#">Admission	Going on</a> -->
<!-- 													</div> -->
<!-- 													<div class="details"> -->
<!-- 														<div class="title justify-content-between d-flex"> -->
<%-- 															<a href="<%=request.getContextPath()%>/product/product_upload.do?action=getOne_For_Display&prod_id=${prodVO.prod_id}"><h5>${prodVO.prod_name}</h5></a> --%>
<!-- 															<p class="price">$${prodVO.prod_price}</p> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
		<%-- 								</c:if> --%>
										</c:forEach>
    								</div>     
								</div>
								<br>
								<div class="input-group">
									<label class="input-group-addon" style="width: 150px;">上傳照片</label>
						  			<input type="file" class="form-control" id="prod_img" name="prod_img" multiple style="width: 500px;">
						  			<DIV id="preview"></DIV>
<!-- 						  			<input type="file" class="form-control" id="prod_ani_type_id" name="prod_ani_type_id" style="margin-left:150px;"> -->
<!-- 									<label class="form-control" for="prod_ani_type_id" style="text-align:center; ">選擇檔案</label> -->
								</div>
								<br>
								<div class="input-group">
									<label class="input-group-addon" style="width: 150px;">愛心商品描述</label>
						  			<textarea name="prod_des" id="prod_des" rows="10" cols="80"><%= (prodVO==null)? "" : prodVO.getProd_des()%></textarea>
			            			<script> CKEDITOR.replace( 'prod_des', {
			            				extraPlugins: 'easyimage',
			            			    cloudServices_tokenUrl: 'https://36758.cke-cs.com/token/dev/g529dLeMZwwIpbMNAdeiRdeIbIjTrMw6aq0ncGUTnfbb08SqLh6Z2I87wBM3',
			            			    cloudServices_uploadUrl: 'https://36758.cke-cs.com/easyimage/upload/',
			            			}); </script> 
			            			<br>
								</div>
								<br>
									<input type="hidden" name="action" value="update">
			            			<input type = "submit" value = "確認" style="text-align:center;">
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
		$("#member").attr('class', 'menu-active menu-has-children' )
		 
		 
	</script>
	
	
</body>
</html>