<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="com.turing.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//str[1]高压，str[3]低压
%>

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
				<%@include file="common/common_css.jsp" %>                 

                <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
                <!--[if lt IE 9]>
                    <script src="js/html5.js"></script>
                <![endif]-->
				
<body>			
				<!-- Starting Website Wrapper -->
                <div id="wrapper">
                		
                        <%@include file="common/session_header.jsp" %>
                        
                        <div class="copyrights"><a href="#" title="北京市计算中心">北京市计算中心</a></div> 
                        
                        <div id="container" style="height: 300px;">
                        
                                <div id="form"><br/><h1>高血压早期预警结果</h1><br/>
									
									<table border="0"  style="width: 400px;">
										<tr>
											<td colspan="2">您的高压是：<%=request.getAttribute("gy")==null?"":request.getAttribute("gy") %></td>
										</tr>
										<tr>
											<td colspan="2">您的低压是：<%=request.getAttribute("dy")==null?"":request.getAttribute("dy") %></td>
										</tr>
										<tr>
											<td colspan="2" ><%=request.getAttribute("result")==null?"":request.getAttribute("result") %></td>
										</tr>
										
									</table>
									
								</div>
								
                        </div><!-- end of container -->
                        

				<%@include file="common/footer_wrap.jsp" %>
                        
                </div><!-- End of Wrapper Div -->
				
				<%@include file="common/common_js.jsp" %>

		
	</body></html>