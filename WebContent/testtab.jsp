<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../common/common_css.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">            
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">            
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/measure.css">
<style type="text/css">
p{width:800px;margin: 10px auto;}
::selection{background: #f00;color: #fff;}
span{cursor: pointer;text-decoration: underline;color: blue;}
.wrapper{max-width: 800px;height: 400px;margin: 10px auto;background: #fff;box-shadow: 0 2px 2px #f2f2f2;position: relative;}
#tab{width: 200px;height:400px;}
#tab_left,#tab_con{margin: 10px;background: #fff;} #tab,#tab_con{float: left;}
#tab_left{width:180px;height:380px;}
#tab_left li{list-style-type: none;font-size: 20px;text-align: center;border-top: 1px solid #ccc;}
#tab_left li a{color: #000;text-decoration: none;line-height: 94px;width: 180px;height: 94px;display: block;background: #fff;text-shadow:1px 1px 2px #ccc;border-left: 1px solid #ccc;}
#tab_left li a:hover{background: #f1f1f1;text-decoration: none;border-left: 1px solid #f00;opacity: 0.4;color: #f00;text-shadow:1px 1px 2px #ccc;}
#tab_con{width: 580px;height: 380px;overflow: hidden;}
</style>
<style type="text/css">
.bitianxiang{text-align: right;}
.xuantianxiang{text-align: right;}
input[type='text']{width:150px;}
.erjiwenti{background-color: lightblue;}
</style>
<%@include file="../common/common_js.jsp" %>
<script type="text/javascript">
	$(function(){
		$("#tab_left_1").click(function(){
			$("#tab_con_1").fadeIn(600);
		});
		$("#tab_left_2").click(function(){
			$("#tab_con_1").hide();
			$("#tab_con_3").hide();
			$("#tab_con_2").fadeIn(600);
		});
		$("#tab_left_3").click(function(){
			$("#tab_con_2").hide();
			$("#tab_con_1").hide();
			$("#tab_con_3").fadeIn(600);
		});
	});
</script>
</head>
<body>
	<div class="wrapper">
		<div id="tab">
			<ul id="tab_left">
				<li id="tab_left_1"><a href="#">普通指标</a></li>
				<li id="tab_left_2"><a href="#">生化指标</a></li>
				<li id="tab_left_3"><a href="#">基因指标</a></li>
			</ul>
		</div>
		<div id="tab_con">
			<div id="tab_con_1"><%@include file="yuce_jiben.jsp" %></div>
			<div id="tab_con_2"><%@include file="yuce_huayan.jsp" %></div>
			<div id="tab_con_3"><%@include file="yuce_jiyin.jsp" %></div>
		</div>
	</div>
</body>
</html>