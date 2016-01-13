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
				<%@include file="common/common_css.jsp" %>                 

                <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
                <!--[if lt IE 9]>
                    <script src="js/html5.js"></script>
                <![endif]-->
				
<body>			
				<!-- Starting Website Wrapper -->
                <div id="wrapper">
                		
                        <!-- Starting Header of the website -->
                        <header id="header">

                                <!-- Website Logo Place -->
                                <div id="logo-container">
                                    <a href="<%=request.getContextPath() %>/index.jsp" class="logo" title="Site Logo">
                                        <img src="./index_files/logo.jpg" alt="Health Press">
                                        <span class="tagline">安贞医院，北京市计算中心</span>
                                    </a>
                                </div>
  
                        </header><!-- ending of header of the website -->
                        <div class="copyrights"><a href="#" title="北京市计算中心">北京市计算中心</a></div> 
                        
                        <div id="container">
                                <div class="official clearfix">
                                		
                                        <div class="home-left-side">                                        
                                            <section class="team clearfix">
                                                    <h2 class="smart-head">健康医生</h2>
                                                    <p></p>
                                                    
                                                    <ul class="doctors">
                                                        <li style="text-align: center;">
                                                           <h4><a href="#"></a></h4>
                                                           <figure class="doc-img">													
                                                               <a href="#" title=""><img src="./index_files/d6.jpg" alt="Slider Image"></a>
                                                               <span class="doc-type">Gyne</span>																																
                                                           </figure>
                                                           <p>Gyne</p>
                                                        </li> 
                                                        <li style="text-align: center;">
                                                           <h4><a href="#"></a></h4>
                                                           <figure class="doc-img">													
                                                               <a href="#" title=""><img src="./index_files/d4.jpg" alt="Slider Image"></a>
                                                               <span class="doc-type">Gyne</span>																																
                                                           </figure>
                                                           <p>Gyne</p>
                                                        </li>
                                                        <li style="text-align: center;">
                                                           <h4><a href="#"></a></h4>
                                                           <figure class="doc-img">													
                                                               <a href="#" title=""><img src="./index_files/d3.jpg" alt="Slider Image"></a>
                                                               <span class="doc-type">ENT</span>																																
                                                           </figure>
                                                           <p>ENT</p>
                                                        </li>                                                                                                     		
                                                    </ul>													
                                            </section>
                                            
                                                                             
                                        </div><!-- home left side -->                                        
                                        
                                        <aside id="sidebar">
                                                                                    
                                            <section class="widget">                   
                                                <div class="appointment">
                                                    <div class="header">
                                                            <h2>登录页</h2>
                                                    </div>
                                                    <form action="#" id="login-form" method="post" novalidate="novalidate">
                                                            <p style="padding-left:30px;">
                                                                <label class="display-ie8" for="apo_name">用户名</label>
                                                                <input type="text" name="username" class="required" id="apo_name" placeholder="用户名" title="* 请输入用户名">
                                                            </p>
                                                            <p style="padding-left:30px;">
                                                                <label class="display-ie8" for="apo_phone">密码</label>
                                                                <input type="password" name="password" class="required" id="apo_phone" placeholder="密码" title="* 请输入密码">
                                                            </p>
                                                            <p >
															<%-- 
                                                            <div style="padding-left:30px;" class="captcha-container">
                                                                <img src="./index_files/appointment_captcha.png" alt="">
                                                                <input type="text" class="captcha required" name="captcha" maxlength="5" title="* 请输入图片上的验证码">
                                                            </div>
                                                            --%>
                                                            <p style="padding-left:30px;">															
                                                                <input type="submit" value="登录" class="readmore">
                                                                <input type="hidden" name="action" value="request_appointment">
                                                                <input type="hidden" name="target" value="fahid@960development.com">
                                                                <img src="./index_files/loading.gif" id="apo-loader" alt="Loader">
                                                            </p>
                                                            <p id="apo-message-sent"></p>
                                                            <div class="error-container"></div>                            
                                                    </form>
                                                </div>                             
                                            </section>
                                            
								
                                        </aside>                                        
                                                                       
                                </div> <!-- end of official -->
					
                        </div><!-- end of container -->
                        

				<%@include file="common/footer_wrap.jsp" %>
                        
                </div><!-- End of Wrapper Div -->
				
				<%@include file="common/common_js.jsp" %>

				<script type="text/javascript" src="js/pages/login.js"></script>
		
	<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div></body></html>