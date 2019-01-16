
//我使用D3.js V5的版本
<%@page import="com.missingCase.model.missingCaseVO"%>
<%@page import="com.missingCase.model.missingCaseService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://d3js.org/d3.v5.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3-cloud/1.2.5/d3.layout.cloud.min.js"></script>
<%
missingCaseService missingCaseSvc = new missingCaseService();
List<missingCaseVO> list = missingCaseSvc.getCount();
pageContext.setAttribute("list", list);

%>
<html>
	<head>
		<title>文字雲</title>
		<meta charset="utf-8">

<style>

*, *:after, *:before {
	margin: 0;
	padding: 0;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

body, html {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}

body {
	background: #33CCFF;
}

main#box {
	background: white;
	width: 100%;
	height: 100%;
	position: relative;
	top: 50%;
	left: 50%;
	margin-top: -500px;
	margin-left: -1000px;
	-webkit-border-radius: 25px;
	-moz-border-radius: 25px;
	border-radius: 25px;
	-webkit-box-shadow: 2px 2px 25px 1px #000000;
	-moz-box-shadow: 2px 2px 25px 1px #000000;
	-o-box-shadow: 2px 2px 25px 1px #000000;
	box-shadow: 2px 2px 25px 1px #000000;
	/*overflow: hidden;*/
	z-index: 0;
}

.layer {
	position: absolute;
	display: block;
}

#sun {
	background: #ffcf37;
	-webkit-box-shadow: 0px 0px 18px 5px rgba(236, 236, 133, 0.75);
	-moz-box-shadow: 0px 0px 18px 5px rgba(236, 236, 133, 0.75);
	box-shadow: 0px 0px 18px 5px rgba(236, 236, 133, 0.75);
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	border-radius: 50%;
	width: 50px;
	height: 50px;
}

#clouds {
	position: relative;
	opacity: 0.5;
	width: 400px;
	height: 150px;
}

.cloud {
	border: 1px transparent;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	border-radius: 50%;
	display: block;
	position: absolute;
	background: #bababa;
}

.c1 {
	width: 100px;
	height: 50px;
	top: 0;
	left: 0;
}

.c2 {
	width: 100px;
	height: 50px;
	top: 15px;
	left: -20px;
}

.c3 {
	width: 100px;
	height: 50px;
	top: 20px;
	right: 40px;
}

.c4 {
	width: 100px;
	height: 50px;
	top: 10px;
	right: 90px;
}

.hill {
	background: #449944;
	position: absolute;
	width: 400px;
	height: 400px;
	display: block;
	border: 1px transparent;
	-webkit-box-shadow: -1px -1px 11px 1px rgba(0,0,0,0.75);
	-moz-box-shadow: -1px -1px 11px 1px rgba(0,0,0,0.75);
	box-shadow: -1px -1px 11px 1px rgba(0,0,0,0.75);
	margin-top: -60%;
}

.hill1 {
	-webkit-border-top-left-radius: 100%;
	-moz-border-radius-topleft: 100%;
	border-top-left-radius: 100%;
	-ms-transform: rotate(25deg);
	-webkit-transform: rotate(25deg);
	transform: rotate(25deg);
	top: 0;
	left: 250px;
}

.hill2 {
	-webkit-border-top-right-radius: 100%;
	-moz-border-radius-topright: 100%;
	border-top-right-radius: 100%;
	-ms-transform: rotate(-35deg);
	-webkit-transform: rotate(-35deg);
	transform: rotate(-35deg);
	top: 60px;
	left: 0;
}

.f1 {
	top: 0;
	left: 0;
}

.f2 {
	top: 25px;
	left: 100px;
}

.f3 {
	top: 0;
	left: 200px;
}

.f4 {
	top: 25px;
	left: 300px;
}

.flower {
	position: absolute;
}

.petal {
	width: 20px;
	height: 20px;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	border-radius: 50%;
	position: absolute;
	background: #fc6464;
}

.s {
	background: #835924;
	position: absolute;
	top:40px;
	left: 26px;
	width: 4px;
	height: 80px;
}

.petal1 {
	background: #645800;
	top:20px;
	left: 20px;
}

.petal2 {
	top: 3px;
	left: 20px;
}

.petal3 {
	top: 13px;
	left: 5px;
}

.petal4 {
	top: 30px;
	left: 9px;
}

.petal5 {
	top: 30px;
	left: 28px;
}

.petal6 {
	top: 13px;
	left: 34px;
}

#l1 {
	z-index: 1;
	top: 30px;
	left: 80px;
}

#l2 {
	z-index: 2;
	top: 50px;
	left: 60px;
}

#l3 {
	z-index: 3;
	top: 80px;
	left: 0px;
}

#l4 {
	z-index: 4;
	top: 250px;
	left: 70px;
}
	

</style>

	</head>
	<body>

		<main id="box">

			<div class="layer" id="l1">
			
			</div>
			<div class="layer" id="l2">
				
			</div>
			<div class="layer" id="l3">	
				<div id="tag" style="height: 600px; width:1800px; padding: 30px"></div>
			</div>
			<div class="layer" id="l4">
				
			</div>
		</main>


<script src="https://cdnjs.cloudflare.com/ajax/libs/d3-cloud/1.2.5/d3.layout.cloud.min.js"></script>
<script src="https://d3js.org/d3.v5.min.js"></script>


<script>
window.onload = function () {

	var parallaxBox = document.getElementById ( 'box' );
	var c1left = document.getElementById ( 'l1' ).offsetLeft,
	c1top = document.getElementById ( 'l1' ).offsetTop,
	c2left = document.getElementById ( 'l2' ).offsetLeft,
	c2top = document.getElementById ( 'l2' ).offsetTop,
	c3left = document.getElementById ( 'l3' ).offsetLeft,
	c3top = document.getElementById ( 'l3' ).offsetTop,
	c4left = document.getElementById ( 'l4' ).offsetLeft,
	c4top = document.getElementById ( 'l4' ).offsetTop;
	
	parallaxBox.onmousemove = function ( event ) {
		event = event || window.event;
		var x = event.clientX - parallaxBox.offsetLeft,
		y = event.clientY - parallaxBox.offsetTop;
		
		mouseParallax ( 'l1', c1left, c1top, x, y, 5 );
		mouseParallax ( 'l2', c2left, c2top, x, y, 15 );
		mouseParallax ( 'l3', c3left, c3top, x, y, 30 );
		mouseParallax ( 'l4', c4left, c4top, x, y, 65 );
	}
	
}

function mouseParallax ( id, left, top, mouseX, mouseY, speed ) {
	var obj = document.getElementById ( id );
	var parentObj = obj.parentNode,
	containerWidth = parseInt( parentObj.offsetWidth ),
	containerHeight = parseInt( parentObj.offsetHeight );
	obj.style.left = left - ( ( ( mouseX - ( parseInt( obj.offsetWidth ) / 2 + left ) ) / containerWidth ) * speed ) + 'px';
	obj.style.top = top - ( ( ( mouseY - ( parseInt( obj.offsetHeight ) / 2 + top ) ) / containerHeight ) * speed ) + 'px';
}
</script>


<script type="text/javascript">

//d3
var fill = d3.scaleOrdinal(d3.schemeCategory10);

function randomNumber(){
	return Math.random() * 270;
}
//文字雲/關鍵字，及字型大小（這邊只放三個）


var data = [];
function randomNumber(){
	return Math.random() * 100;
}
//文字雲/關鍵字，及字型大小（這邊只放三個）

<%for(missingCaseVO mm: list) {
String i = mm.getMissing_type();
int x = mm.getCount();
System.out.println(i);
System.out.println(x);%>
data.push({text:"<%=i%>", size:<%=x*18%>});
<% }%>

//取得呈現處的寬、高
 
var h = parseInt(d3.select("#tag").style("height"), 10);
var w = parseInt(d3.select("#tag").style("width"), 10);

d3.layout.cloud().size([w, h])
        .words(data)
        .padding(2)
        .rotate(function () {
            return ~~(Math.random() * 2) * 90;
        })
        .rotate(function () {
            return 0;
        })
        .fontSize(function (d) {
            return d.size;
        })
        .on("end", draw)
        .start();
          

function draw(words) {
    d3.select("#tag").append("svg")
            .attr("width", w)
            .attr("height", h)
            .append("g")
            .attr("transform", "translate(" + w / 2 + "," + h / 2 + ")")
            .selectAll("text")
            .data(words)
            .enter().append("text")
            .style("font-size", function (d) {
                return d.size + "px";
            })
            .style("font-family", "Microsoft JhengHei")
            .style("cursor", 'pointer')
            .style("fill", function (d, i) {
                return fill(i);
            })
            .attr("text-anchor", "middle")
            .attr("transform", function (d) {
                return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
            })
            .text(function (d) {
                return d.text;
            })
            .on("click", function (d) {
                window.open("https://www.google.com/search?q=" + d.text, '_blank');
            });
}

</script>

	</body>
</html>

