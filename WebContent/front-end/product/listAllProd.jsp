<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.prodimg.model.ProdImgService"%>
<%@ page import="com.prodimg.model.ProdImgVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.util.*"%>
<%@ page import="com.prod.model.ProdService"%>
<%@ page import="com.prod.model.ProdVO"%>

<%
	List<ProdVO> list;
	list = (List) request.getAttribute("list");
	System.out.println("list="+list);
	if (list==null){
		ProdService prodSvc = new ProdService(); 
		list = prodSvc.getAll_Front();
		pageContext.setAttribute("list", list);
	}
	
	
	Map<String, String[]> map = (Map<String, String[]>) request.getAttribute("map");
	String[] prod_ani_type_id = null;
	String[] prod_type_id = null;
	String prod_price = null;
	
	if (map!=null){
		Set<String> keys = map.keySet();
		if (keys.contains("prod_ani_type_id")){
			prod_ani_type_id = map.get("prod_ani_type_id");
			System.out.println("prod_ani_type_id:");
		}
		if (keys.contains("prod_type_id")){
			prod_type_id = map.get("prod_type_id");
		}
		if (keys.contains("prod_price")){
			prod_price = map.get("prod_price")[0];
		}
	}
	
%>

<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="img/fav.png">
<!-- Author Meta -->
<meta name="author" content="codepixer">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>愛心商城</title>


<style type="text/css">
p {
	font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}

div {
	font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}

#scroll {
    position:fixed;
    right:10px;
    bottom:10px;
    cursor:pointer;
    width:40px;
    height:40px;
    background-color:#3498db;
    text-indent:-9999px;
    display:none;
    -webkit-border-radius:20px;
    -moz-border-radius:20px;
    border-radius:20px;
}
#scroll span {
    position:absolute;
    top:50%;
    left:50%;
    margin-left:-8px;
    margin-top:-12px;
    height:0;
    width:0;
    border:8px solid transparent;
    border-bottom-color:#ffffff
}
#scroll:hover {
    background-color:#e74c3c;
    opacity:1;
    filter:"alpha(opacity=100)";
    -ms-filter:"alpha(opacity=100)";
}

</style>
</head>
<body>

	<jsp:include page="/index_Header.jsp" flush="true" />
	
	<!-- BackToTop Button -->
	<a href="javascript:void(0);" id="scroll" title="Scroll to Top" style="display: none;">Top<span></span></a>

	<!-- ++++++++++++ Page Content Goes Here ++++++++++++ -->
	
	
	<div class="container">
			<div class="row">

			
			<!-- 左側邊list-group -->
			<div class="col-xs-12 col-sm-3">
				<div id="sider" class="n-browse-nav m-sticky-on" style="top: 150px; position: fixed; bottom: auto">
					<h3>商品分類</h3>
					<hr>
					    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product_upload.do" name="form1">
					        <h5><b>選擇動物:</b></h5>
						        <label><input type="checkbox" name="prod_ani_type_id" value="貓"> 貓</label>　　
								<label><input type="checkbox" name="prod_ani_type_id" value="狗"> 狗</label>　<br>
								<label><input type="checkbox" name="prod_ani_type_id" value="兔"> 兔</label>　　
								<label><input type="checkbox" name="prod_ani_type_id" value="飛禽"> 飛禽</label>　<br>
								<label><input type="checkbox" name="prod_ani_type_id" value="其他"> 其他</label>　<br>
					        <hr>
					       	<h5><b>選擇商品種類:</b></h5>
					       		<label><input type="checkbox" name="prod_type_id" value="食" > 食</label>　　
								<label><input type="checkbox" name="prod_type_id" value="衣" > 衣</label>　<br>
								<label><input type="checkbox" name="prod_type_id" value="住" > 住</label>　　
								<label><input type="checkbox" name="prod_type_id" value="行" > 行</label>　<br>
								<label><input type="checkbox" name="prod_type_id" value="育" > 育</label>　　
								<label><input type="checkbox" name="prod_type_id" value="樂" > 樂</label>　<br>
<%-- 					        <%= Arrays.asList(prod_type_id).contains("樂")? "checked":"" %> --%>
					        
					        <hr>
					       	<h5><b>選擇價格區間:</b></h5>
					       		<label><input type="radio" name="prod_price" value="0 and 50" <%= "0 and 50".equals(prod_price)? "checked":"" %> > $ 50以下</label>　<br>
								<label><input type="radio" name="prod_price" value="50 and 100" <%= "50 and 100".equals(prod_price)? "checked":"" %>> $ 50~100</label>　<br>
								<label><input type="radio" name="prod_price" value="101 and 200" <%= "101 and 200".equals(prod_price)? "checked":"" %>> $ 101~200</label>　<br>
								<label><input type="radio" name="prod_price" value="200" <%= "200".equals(prod_price)? "checked":"" %>> $ 200以上</label>　<br>
							<br>
							<input type="submit" value="查詢">
        					<input type="hidden" name="action" value="listAll_ByCompositeQuery">
					    
					     </FORM>

				</div>
			</div>
			
			
			
		</div>
	</div>
	

	<section class="training-area section-gap">
		<div class="container">
			<div id="sider" class="n-browse-nav m-sticky-on" style="top: 180px; bottom: auto;">
				<div class="row">
					<div class="col-lg-2 cl-md-2" style="top: 180px; bottom: auto;"></div> <!-- position: fixed -->
					<div class="col-xs-12 col-sm-10" >
						<div class="row">
						<%@ include file="/front-end/product/pages/page1.file" %> 
							<c:forEach var="prodVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
<%-- 								<c:if test="${prodVO.prod_status.equals('上架')}" var="condition" scope="page"> --%>
									<div class="col-lg-3 cl-md-3">
										<div class="single-training">
											<div class="thumb relative">
												<div class="overlay-bg"></div>
												<img class="img-fluid"
													src="<%=request.getContextPath()%>/util/PicReader?prod_id=${prodVO.prod_id}" alt="">
												<!-- 												<a class="admission-btn" href="#">Admission	Going on</a> -->
											</div>
											<div class="details">
												<div class="title justify-content-between d-flex">
													<a href="<%=request.getContextPath()%>/product/product_upload.do?action=getOne_For_Display&prod_id=${prodVO.prod_id}"><h5>${prodVO.prod_name}</h5></a>
													<p class="price">$${prodVO.prod_price}</p>
												</div>
											</div>
										</div>
									</div>
<%-- 								</c:if> --%>
							</c:forEach>
							<br>
							<br>
							
							
						</div>
						<div style="float:center"><%@ include file="/front-end/product/pages/page2.file" %></div>
					</div>

				</div>
			</div>
		</div>
	</section>
	

	<script type="text/javascript">
		$(document).ready(function(){
		    $(window).scroll(function(){
		        if($(this).scrollTop() > 100){
		            $('#scroll').fadeIn();
		        }else{
		            $('#scroll').fadeOut();
		        }
		    });
		    $('#scroll').click(function(){
		        $("html, body").animate({ scrollTop: 0 }, 600);
		        return false;
		    });
		});
	</script>
	
<!-- 	分頁點擊 -->
	<script type="text/javascript">
		$(document).ready(function(){
		    $(".pagination").click(function(e){
		        $("ul.pagination li").attr("class", "");
		        $(e.target).attr("class", "active");
		    });
		});
		
		
		$("ul.nav-menu li").attr('class', "" );
		$("#shop").attr('class', 'menu-active menu-has-children' );
	</script>
	
	
</body>
</html>



