
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
<div id="tag" style="border: 1px solid #eee; height: 320px; width:525px;"></div>

<script>
//取得d3顏色
    var fill = d3.scaleOrdinal(d3.schemeCategory10);
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
data.push({text:"<%=i%>", size:<%=x*12%>});
<% }%>
    //取得呈現處的寬、高
    var w = parseInt(d3.select("#tag").style("width"), 10);
    var h = parseInt(d3.select("#tag").style("height"), 10);

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