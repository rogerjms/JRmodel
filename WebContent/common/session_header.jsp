<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   <!-- Starting Header of the website -->
   <header id="header">

           <!-- Website Logo Place -->
           <div id="logo-container">
               <a href="<%=request.getContextPath() %>/index.jsp" class="logo" title="Site Logo">
                   <img src="./index_files/logo.jpg" alt="中国高血压健康管理平台">
                   <span class="tagline">首都医科大学附属北京安贞医院，北京市计算中心</span>
               </a>
           </div>
            
           <%Map<String,Object> userInfo = (Map<String,Object>)session.getAttribute("userInfo");
if(userInfo==null){%>
	<ul class="social-nav">
                 <li class="phone"><span style="text-align: center;"><a href="register.jsp" >注&nbsp;&nbsp;&nbsp;&nbsp;册</a></span></li>
                 <li class="phone"><span style="text-align: center;"><a href="login.jsp" >登&nbsp;&nbsp;&nbsp;&nbsp;录</a></span></li>
             </ul>
<% }else{%>
		<ul class="social-nav">
		<li class="phone"><span style="text-align: center;">欢迎您，<%=userInfo.get("username") %></span></li>
		<li class="phone"><span style="text-align: center;"><a href="login.do?method=logout">[退出]</a></span></li>
		</ul>
<%}%>
                                        
          

           
           <nav class="main-nav clearfix">

           		<!-- MAIN NAVIGATION -->
                   <div class="menu-div">
                   	<ul>
                       	<li>
                           	<a href="<%=request.getContextPath()%>/index.jsp">主页</a>
                           </li>
                           <li>
                           	<a href="personcenter/bloodpressure.jsp">个人中心</a>
                           </li>
                           <li>
                           	<a href="#">健康管理</a>
                               <ul style="display: none;">
                                   <li><a href="http://116.213.144.69:8080/holter/">心电管理</a></li>
                                   <li><a href="<%=request.getContextPath()%>/questionnaire.html">健康问卷</a></li>                                                        
                               </ul>
                           </li>
                           <li>
                           	<a href="yuce.jsp">高血压早期预警</a>
                           </li>
                          <li><a href="<%=request.getContextPath()%>/zixunqu.jsp">咨询区</a></li>
                          <li><a href="<%=request.getContextPath()%>/gaoxyapp.jsp">移动医疗</a></li>
                          <li><a href="<%=request.getContextPath()%>/aboutwe.jsp">联系我们</a></li>
                       </ul>
                   </div>
                   
                   <!-- GLOBAL SEARCH -->
                   <form method="get" action="#" id="topsearch">
                   		<p>
                               <input type="text" placeholder="Search" name="s" id="tsearch">
                               <input type="submit" id="topsubmit" value="">
                           </p>
                   </form>
           </nav>
           
   </header><!-- ending of header of the website -->