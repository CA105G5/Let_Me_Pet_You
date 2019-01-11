
//我使用D3.js V5的版本
<%@page import="com.missingMsg.model.missingMsgVO"%>
<%@page import="java.util.List"%>
<%@page import="com.missingMsg.model.missingMsgService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://d3js.org/d3.v5.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3-cloud/1.2.5/d3.layout.cloud.min.js"></script>
<%
missingMsgService missingMsgSvc = new missingMsgService();
List<missingMsgVO> list = missingMsgSvc.findByCase("S000000002");
pageContext.setAttribute("list", list);


%>
<div id="tag" style="border: 1px solid #eee; height: 320px; width:525px;"></div>

<script></script>
<c:forEach var="missingMsgVO" items="${list}" varStatus="i">



</c:forEach>
<script>
    //取得d3顏色
    var fill = d3.scaleOrdinal(d3.schemeCategory10);

	function randomNumber(){
		return Math.random() * 100;
	}
    //文字雲/關鍵字，及字型大小（這邊只放三個）
    var data = [
        {text: "菲歐拉", size: randomNumber()},
        {text: "費德提克", size: randomNumber()},
		{text: "伊莉絲", size: randomNumber()},
		{text: "蒙多醫生", size: randomNumber()},
		{text: "黛安娜", size: randomNumber()},
		{text: "達瑞文", size: randomNumber()},
		{text: "庫奇", size: randomNumber()},
		{text: "科加斯", size: randomNumber()},
        {text: "卡莎碧雅", size: randomNumber()}
    ];
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