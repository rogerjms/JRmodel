<%@page import="java.util.*"%>
<%@page import="com.turing.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!-- saved from url=(0067)http://demo1.cssmoban.com/cssthemes3/mstp_88_healthpress/index.html -->
<html lang="en-US" class="csstransforms csstransforms3d csstransitions"><!--<![endif]--><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><script src="./index_files/twitterlib.js"></script>				
				<!-- META TAGS -->
				<meta charset="UTF-8">
				<meta name="viewport" content="width=device-width">
				
				<!-- Title -->
				<title>北京市计算中心高血压健康管理平台</title>
              
                <!-- FAVICON -->
                <link rel="shortcut icon" href="index_files/images/favicon.png.png">
				
                <!-- Style Sheet-->
				<%@include file="../common/common_css.jsp" %>     

				<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">            
				<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">            
				<link rel="stylesheet" href="<%=request.getContextPath() %>/css/measure.css">            
				
				<style type="text/css">
				.bitianxiang{text-align: right;}
				.xuantianxiang{text-align: right;}
				input[type='text']{width:150px;}
				.erjiwenti{background-color: lightskyblue;}
				table{background-color: lightblue;}
				</style>
				
				<%@include file="../common/common_js.jsp" %>
				
				<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
								
				<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/jquery.mytimepicker.js"></script>
				
				<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/shs.common.js"></script>             

				<style type="text/css">
				.wrapper{margin: 10px auto;background: #fff;box-shadow: 0 2px 2px #f2f2f2;position: relative;}
				#tab{width: 160px;}
				#tab_left,#tab_con{margin: 10px;background: #fff;} #tab,#tab_con{float: left;}
				#tab_left{width:150px;}
				#tab_left li{list-style-type: none;font-size: 20px;text-align: center;border-top: 1px solid #ccc;height: 40px;border-left: 1px #ccc solid;padding-top:20px;border-bottom: 1px #ccc solid;}
				#tab_left li a:hover{background: #f1f1f1;text-decoration: none;border-left: 1px solid #f00;opacity: 0.4;color: #f00;text-shadow:1px 1px 2px #ccc;}
				#tab_con{width: 800px;overflow: hidden;}
				.tab_active{background:lightblue;color:red;}
				.tab_normal{background:white;}
				</style>
				
				<script type="text/javascript" src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>

                <script type="text/javascript">
					$(function(){
						$("#tab_con_2").hide();
						$("#tab_con_3").hide();
						$("#tab_left_1").click(function(){
							$("#tab_con_2").hide();
							$("#tab_con_3").hide();
							$("#tab_con_1").fadeIn(600);
							
							$("#tab_left_1").addClass("tab_normal");
							$("#tab_left_2").addClass("tab_normal");
							$("#tab_left_3").addClass("tab_normal");
							
							$("#tab_left_1").removeClass("tab_normal").addClass("tab_active");
							
						});
						$("#tab_left_2").click(function(){
							$("#tab_con_1").hide();
							$("#tab_con_3").hide();
							$("#tab_con_2").fadeIn(600);
							
							$("#tab_left_1").addClass("tab_normal");
							$("#tab_left_2").addClass("tab_normal");
							$("#tab_left_3").addClass("tab_normal");
							
							$("#tab_left_2").removeClass("tab_normal").addClass("tab_active");
						});
						$("#tab_left_3").click(function(){
							$("#tab_con_2").hide();
							$("#tab_con_1").hide();
							$("#tab_con_3").fadeIn(600);
							
							$("#tab_left_1").addClass("tab_normal");
							$("#tab_left_2").addClass("tab_normal");
							$("#tab_left_3").addClass("tab_normal");
							
							$("#tab_left_3").removeClass("tab_normal").addClass("tab_active");
						});
					});
				</script>
                
                <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
                <!--[if lt IE 9]>
                    <script src="js/html5.js"></script>
                <![endif]-->
				
<body >			
				<!-- Starting Website Wrapper -->
                <div id="wrapper" class="wrapper">
                		<%@include file="common/session_header.jsp" %>

                        <div class="copyrights"><a href="#" title="北京市计算中心">北京市计算中心</a></div> 
                        
                        <div id="container"  >
                        		
                                <%Map<String,Object> userInfo2 = (Map<String,Object>)session.getAttribute("userInfo");
									if(userInfo2==null){%>
                                <div id="form"><br/><h1>高血压早期预警体系</h1><span style="color:red;">此功能需登录后才可使用。</span><br/>
									<% }else{%>
                                <div id="form"><br/><h1>高血压早期预警体系</h1><br/>
									<%} %>
									<form   name="form1" action="yuce.do" method="post" onsubmit="check()">
	 
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
	 
									<table style="background-color: white;">
										<tr>
											<td colspan="4" style="text-align: center;">
											<%

if(userInfo2==null){%>
												<input onclick="alert('请先注册，并登录，谢谢合作！');" style="width:140px; height:40px;" name="tijiao" type="button" value="开始预测"/>
<% }else{%>
												<input style="width:140px; height:40px;" name="tijiao" type="submit" value="开始预测"/>
<% }%>
											
											</td>
										</tr>
									</table>
									</form>
									
								</div>
								
                        </div><!-- end of container -->
                        

				<%@include file="common/footer_wrap.jsp" %>
                        
                </div><!-- End of Wrapper Div -->	
<%-- 
<div id="zhiweihaokan" style="position: absolute;top:200px;right:200px;">
	<img src="<%=request.getContextPath() %>/images/xyj.jpg" width="300"/>
</div>
 --%>
<script type="text/javascript">

</script>

</body></html>