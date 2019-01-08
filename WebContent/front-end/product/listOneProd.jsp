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
	System.out.println("listOneProd.jsp得到從ProdServlet.java傳過來的屬性"+request.getAttribute("Test"));
	System.out.println("listOneProd.jsp得到從ProdServlet.java傳過來的請求參數值"+request.getParameter("whichPage"));
	System.out.println("listOneProd.jsp得到從ProdServlet.java傳過來的請求參數值"+request.getParameter("prod_id"));
%>

<%

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



	MemVO memVO = (MemVO) session.getAttribute("memVO");
	System.out.println("111111111111111111111111111="+session.getId());
	System.out.println( "是否登入:"+ (memVO != null));
%>
<jsp:useBean id="prodSvc" scope="page" class="com.prod.model.ProdService" />

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>愛心商品</title>



<style type="text/css">
p {
	font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}

div {
	font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}


* {box-sizing:border-box}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 5s;
  animation-name: fade;
  animation-duration: 5s;
}

@-webkit-keyframes fade {
  from {opacity: .6} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .6} 
  to {opacity: 1}
}


/* button click動畫 */
.button {
  display: inline-block;
  padding: 15px 25px;
  font-size: 24px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 15px;
/*   box-shadow: 0 9px #999; */
}

.button:hover {background-color: #3e8e41}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

#btnTrigger
{
display:none;
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
			<div id="sider" class="n-browse-nav m-sticky-on" style="top: 150px; bottom: auto;">
				<div class="row">
					<div class="col-lg-3 cl-md-3" style="top: 180px; bottom: auto;"></div>
					<div class="col-xs-12 col-sm-9">
					<div class="row">
						<div class="col-xs-12 col-sm-6">
						
							<!-- Slideshow container -->
							<div class="slideshow-container">
									
								<!-- Full-width images with number and caption text -->
								<% int i =1;  %> 
								<c:forEach var="prodImgVO" items="${prodImgList}">
									<div class="mySlides" >
<!-- 							    <div class="mySlides fade"> -->
										<div class="numbertext"><%=i%>/<%=prodImgList.size()%></div>
										<img src="<%=request.getContextPath()%>/util/PicReader2?prod_img_id=${prodImgVO.prod_img_id}" style="width:100%">
										<div class="text"> </div>
									</div>
									<% i++; %> 
								</c:forEach>
										
								<!-- Next and previous buttons -->
								<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
								<a class="next" onclick="plusSlides(1)">&#10095;</a>
							</div>
							<br>
									
							<!-- The dots/circles -->
							<div style="text-align:center">
								<% int j =1; %> 
								<c:forEach var="prodImgVO" items="${prodImgList}">
									<span class="dot" onclick="currentSlide(<%=j%>)"></span> 
									<% j++; %> 
								</c:forEach>
							</div>
						</div>

						<div class="col-xs-12 col-sm-6">
							<h3>${prodVO.prod_name}
								<span style="font-size: 1em; color: Tomato; text-indent:300px;">
									<i class="fas fa-coins"></i>
									<b>${prodVO.prod_price}</b>
								</span>
							</h3>
							<p>${prodVO.prod_info}</p>
								
							<div class="input-group-icon mt-10" style="width: 120px; ">
								<div class="icon">
									<i class="fa fa-thumb-tack" aria-hidden="true"></i>
								</div>
								<div class="form-select" id="default-select" style="display:inline">
									<select style="width: 120px" id="prod_qty" name="prod_qty" onchange="qtyAlert()">
										<option value="0">數量</option>
									<% for(int s=1 ; s<= prodVO.getProd_stock() ; s++) { %>
										<option value=<%=s%>><%=s %></option>
									<% } %>
									</select>
								</div>
							</div> <span id="errorMsg" style="display:inline; text-align:center; color:red; padding-top: 25px;"></span>
<%-- 							</span>庫存: ${prodVO.prod_stock} --%>
									
							<div style="text-align:right;">
<!-- 								<input type="submit" value="加入購物車" class="genric-btn primary-border circle button" style="width: 120px;" id="cartBtn"> -->
								<a href="#" class="genric-btn primary-border circle button" style="width: 120px;" id="cartBtn">加入購物車</a>	
								<!-- modal屬性 data-toggle="modal" data-target="#staticModal" -->
							</div>
							<br>
							<div style="text-align:right;">
								<i class="glyphicon glyphicon-heart-empty" style="color: red; font-size:20px"  id="heart"></i>
								<input type="submit" value="收藏" class="button button genric-btn primary-border circle" id="favBtn" style="width: 120px;">
							</div> 
						</div>
					</div>

						<div class="container">
							<div id="sider" class="n-browse-nav m-sticky-on"
								style="top: 150px; bottom: auto;">
								<div class="row">
									<div class="col-lg-9 cl-md-9" style="top: 30px; bottom: auto;">
										<div class="">
												${prodVO.prod_des}
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	 <div class="modal" id="staticModal" tabindex="-1" role="dialog" aria-labelledby="staticModalLabel" aria-hidden="true">
     	<div class="modal-dialog modal-sm" role="document">
        	<div class="modal-content">
            	<div class="modal-header">
                    	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        	<span aria-hidden="true">&times;</span>
                    	</button>
                </div>
                <div class="modal-body">
                	<p>
                    	商品已加入購物車!
                	</p>
            	</div>
         	<div class="modal-footer">
            	<button type="button" class="btn btn-primary" data-dismiss="modal">確認</button>
            </div>
        </div>
     </div>
	
	
	

<script type="text/javascript">
	var slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1} 
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none"; 
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block"; 
  dots[slideIndex-1].className += " active";
}


var t = 0;

//剛開始進來顯示是否已追蹤
$.ajax({
	url: '<%=request.getContextPath()%>/prodtrack.do',
	type: "get",
	data: { 'action': 'checkFav', 'prod_id': '${prodVO.prod_id}' },
	dataType: 'json',
	success: function(res){
		console.log(res);
		if (res=="1"){
			t=1;
			$("#heart").attr("class", "glyphicon glyphicon-heart");
		}
	},
	error: function(res){
		console.log(res);
	}

});



// 加入/取消追蹤 & 愛心切換
$("#favBtn").click(function(){
	console.log("favfavfav");
	console.log('${prodVO.prod_id}');
	++t;
	
<%-- 	if (<%= memVO == null%>){ --%>
// 		swal({
//             title: "請先登入",
//             html: "按下確定後前往登入畫面",
//             type: "warning", // type can be "success", "error", "warning", "info", "question"
//             showCancelButton: true,
//         	showCloseButton: true,
//         }).then(
//         	   function (result) {
//                 if (result) {
<%--                 	window.location.href = "<%=request.getContextPath()%>/front-end/members/login.jsp"; --%>
//                 }
//         }, function(dismiss) { // dismiss can be "cancel" | "overlay" | "esc" | "cancel" | "timer"
//         		swal("取消", "取消登入", "error");
//         }).catch(swal.noop);
// 	} else{
		if (t%2==1){
			
			$.ajax({
				url: '<%=request.getContextPath()%>/prodtrack.do',
				type: "get",
				data: { 'action': 'addFav', 'prod_id': '${prodVO.prod_id}' },
				dataType: 'json',
				success: function(res){
					console.log("success="+res);
					if (res==0){
						alert("請登入");
					} else {
						$("#heart").attr("class", "glyphicon glyphicon-heart");
						console.log("11111");
//	 					alert("商品已加入追蹤");
						swal("完成", "商品已加入追蹤", "success").catch(swal.noop);
					}
				},
				error: function(res){
					console.log("error="+res);
				}
			
			});
		} else {
			
			$.ajax({
				url: '<%=request.getContextPath()%>/prodtrack.do',
				type: "get",
				data: { 'action': 'cancelFav', 'prod_id': '${prodVO.prod_id}' },
				dataType: 'json',
				success: function(res){
					console.log("success="+res);
					if (res==0){
						alert("請登入");
					} else {
						$("#heart").attr("class", "glyphicon glyphicon-heart-empty");
						console.log("22222");
//	 					alert("商品已取消追蹤");
						swal("完成", "商品已取消追蹤", "warning").catch(swal.noop);
					}
				},
				error: function(res){
					console.log("error="+res);
				}
			
			});
		}
// 	}
	
	
});

  

//加入購物車
var c=0;
	$("#cartBtn").click(function(){
		$('#errorMsg').text('');
		console.log("33333");
		console.log('${prodVO.prod_id}');
		var prod_qty = $("#prod_qty").val();
		console.log("prod_qty=" + prod_qty);
		if(prod_qty == 0){
			$('#errorMsg').text('　　請選擇數量');
			return;
		} else {
			c++;
			console.log("ajax");
			console.log("c= " + c);
			if(c<2){
				$.ajax({
					url: '<%=request.getContextPath()%>/prodcart.do?action=addCart',
					type: "get",
					data: { 'action': 'addCart', 'prod_qty': prod_qty, 'prod_id': '${prodVO.prod_id}' },
					dataType: 'json',
					success: function(res){
						console.log("success="+res);
						if (parseInt(res) > 0){
							$('#itemCount').html(res).css('display', 'block');
						}
					},
					error: function(res){
						console.log("error="+res);
					}
				
				});
// 				alert("商品已加入購物車");
				swal("完成", "商品已加入購物車", "success").catch(swal.noop);
				$("#cartBtn").attr("class", "genric-btn info-border circle button");
				$("#cartBtn").html("前往結帳");
			}
			if(c>=2){
				$("#cartBtn").attr('href', '<%=request.getContextPath()%>/prodcart.do?action=check_Cart');
			}
			
		}
	});

  
	//sweet alert自訂預設值
	swal.setDefaults({
	    confirmButtonText: "確定",
	    cancelButtonText: "取消"
	});

	
	function qtyAlert(){
		$('#errorMsg').text('');
		var prod_qty = $("#prod_qty").val();
		if (prod_qty==0){
			$('#errorMsg').text('　　請選擇數量');
		}
	}
	
	$("ul.nav-menu li").attr('class', "" );
	$("#shop").attr('class', 'menu-active menu-has-children' )

</script>


	
</body>
</html>