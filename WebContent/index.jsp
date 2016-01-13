<%@page import="java.util.*"%>
<%@page import="com.turing.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/turing.tld" prefix="t" %>


<%
	IDao dao = new DaoImpl();
	List<Map<String,Object>> list_news = dao.executeQueryForList(" select * from news order by news_date desc");
	List<Map<String,Object>> list_kepu = dao.executeQueryForList(" select * from kepu order by kepu_date desc");
	List<Map<String,Object>> list_tech = dao.executeQueryForList(" select * from tech order by tech_date desc");
	List<Map<String,Object>> list_software = dao.executeQueryForList(" select * from software order by soft_date desc");
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
                        <%@include file="common/session_header.jsp"%>
                        <div class="copyrights"><a href="#" title="北京市计算中心">北京市计算中心</a></div> 
						<div id="slider-wrap">
                        		<div class="flexslider">
                                    <ul class="slides">
                                    		<%//TODO:滑动图片s %>
                                            <li class="" style="width: 100%; float: left; margin-right: -100%; position: relative; display: none;display: list-item;">
                                                <a href="#" title="健康管理" class="img-hover"><img style="width:100%;height:100%" src="./index_files/images/001.jpg" alt="Slider Image"></a>
                                            </li>
                                            <li class="flex-active-slide" style="width: 100%; float: left; margin-right: -100%; position: relative; ">
                                                <a href="#" title="员工的健康" class="img-hover"><img style="width:100%;height:100%" src="./index_files/images/002.jpg" alt="Slider Image"></a>
                                            </li>
                                            <li class="" style="width: 100%; float: left; margin-right: -100%; position: relative; display: none;">
                                                <a href="#" title="健康管理" class="img-hover"><img style="width:100%;height:100%" src="./index_files/images/003.jpg" alt="Slider Image"></a>
                                            </li>
                                            <li class="" style="width: 100%; float: left; margin-right: -100%; position: relative; display: none;">
                                                <a href="#" title="健康管理4" class="img-hover"><img style="width:100%;height:100%" src="./index_files/images/004.jpg" alt="Slider Image"></a>
                                            </li>
                                            <li class="" style="width: 100%; float: left; margin-right: -100%; position: relative; display: none;">
                                                <a href="#" title="健康管理5" class="img-hover"><img style="width:100%;height:100%" src="./index_files/images/005.jpg" alt="Slider Image"></a>
                                            </li>
                                             
                                    </ul>
                                    <ul class="slide-nav slides-5">
                                            <li class="flex-active">
                                                <h4>健康管理</h4>
                                                <p>管理健康其实很简单</p>
                                            </li> 
                                            <li class="">
                                                <h4>员工的健康</h4>
                                                <p>企业的动力</p>
                                            </li> 
                                            <li class="">
                                                <h4>健康管理</h4>
                                                <p>健康体重轻松获得</p>
                                            </li> 
                                            <li class="">
                                                <h4>健康管理</h4>
                                                <p>有压力？</p>
                                            </li> 
                                            <li class="">
                                                <h4>健康管理</h4>
                                                <p>体验服务延伸之道</p>
                                            </li>                                            
                                    </ul><!-- end of slider nav -->
                        		</div>
                        </div><!-- end of slider-wrap -->
                        
                        <div id="container">
                        		
                                <section class="slogan">
                                    <h2>高血压健康管理平台主题</h2>
                                    <h3>健康从这里开始，还在等什么?</h3>
                                </section>
                                
                                <ul class="services">                                        
                                      
                                      <li class="service">
                                          <figure class="service-thumb"><a href="#"><img src="./index_files/serv2.png" alt="平台动态"></a></figure>
                                          <h4><a href="#">平台动态</a></h4><br/>
                                          <%//TODO: 平台动态
                                          for(int i=0;i<5;i++){
                                          	pageContext.setAttribute("metaStr", list_news.get(i).get("news_title"));
                                          	pageContext.setAttribute("url", list_news.get(i).get("news_title"));
                                          %>
                                          <t:substr metaStr="${metaStr }" ></t:substr>
                                          <%} %>
                                      </li>
                                      <li class="service">
                                          <figure class="service-thumb"><a href="#"><img src="./index_files/serv1.png" alt="健康小知识"></a></figure>
                                          <h4><a href="#">健康小知识</a></h4><br/>
                                          <%//TODO: 科普知识
                                          for(int i=0;i<5;i++){
                                        	  pageContext.setAttribute("metaStr", list_kepu.get(i).get("kepu_title"));
                                          %>
                                          
                                          <t:substr metaStr="${metaStr }"></t:substr>
                                          <%} %>
                                     </li>
                                      <li class="service">
                                          <figure class="service-thumb"><a href="#"><img src="./index_files/serv3.png" alt="科技前沿"></a></figure>
                                          <h4><a href="#">科技前沿</a></h4><br/>
                                          <%//TODO: 科技前沿
                                          for(int i=0;i<5;i++){
                                        	  pageContext.setAttribute("metaStr", list_tech.get(i).get("tech_title"));
                                          %>
                                          <t:substr metaStr="${metaStr }"></t:substr>
                                          <%} %>
                                      </li>
                                      <li class="service">
                                          <figure class="service-thumb"><a href="#"><img src="./index_files/serv4.png" alt="软件下载"></a></figure>
                                          <h4><a href="#">网站公告</a></h4><br/>
                                          <t:substr metaStr="${'慢性病及健康管理平台' }"></t:substr>
                                          <t:substr metaStr="${'护心甲心电图监控测试平台' }"></t:substr>
                                          <t:substr metaStr="${'CYP450基因检测用药查询系统' }"></t:substr>
                                          <t:substr metaStr="${'全基因组关联分析(GWAS)解决方案' }"></t:substr>
                                          <t:substr metaStr="${'转录组测序解决方案' }"></t:substr>
                                      </li>                                               
                                </ul><!-- end of services -->                                                               
                                
                                <div id="content" class="full-width"></div>
                                
                                
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
                                                           <p>问卷表</p>
                                                        </li> 
                                                        <li style="text-align: center;">
                                                           <h4><a href="#"></a></h4>
                                                           <figure class="doc-img">													
                                                               <a href="#" title=""><img src="./index_files/d4.jpg" alt="Slider Image"></a>
                                                               <span class="doc-type">Gyne</span>																																
                                                           </figure>
                                                           <p>模型算法</p>
                                                        </li>
                                                        <li style="text-align: center;">
                                                           <h4><a href="#"></a></h4>
                                                           <figure class="doc-img">													
                                                               <a href="#" title=""><img src="./index_files/d3.jpg" alt="Slider Image"></a>
                                                               <span class="doc-type">ENT</span>																																
                                                           </figure>
                                                           <p>评估报告</p>
                                                        </li>                                                                                                     		
                                                    </ul>
                                                    <a href="#" class="readmore">更多服务</a>														
                                            </section>
                                            
                                                                             
                                        </div><!-- home left side -->                                        
                                        
                                        <aside id="sidebar">
                                                                                    
                                            <section class="widget">                   
                                                <div class="appointment">
                                                    <div class="header">
                                                            <h2>预约电话</h2>
                                                            <h3 class="number">010-12345678</h3>
                                                            <span class="or"></span>
                                                    </div>
                                                    <form action="#" id="appoint-form" method="post" novalidate="novalidate">
                                                            <p>
                                                                <label class="display-ie8" for="apo_name">姓名</label>
                                                                <input type="text" name="apo_name" class="required" id="apo_name" placeholder="姓名" title="* 请输入姓名">
                                                            </p>
                                                            <p>
                                                                <label class="display-ie8" for="apo_phone">电话</label>
                                                                <input type="text" name="apo_phone" class="required" id="apo_phone" placeholder="电话" title="* 请输入电话">
                                                            </p>
                                                            <p>
                                                                <label class="display-ie8" for="apo_email">电子邮件</label>
                                                                <input type="text" name="apo_email" class="email required" id="apo_email" placeholder="电子邮件" title="* 请输入电子邮件">
                                                            </p>
                                                            <p>
                                                                <label class="display-ie8" for="apo_date">预约时间</label>
                                                                <input type="text" name="apo_date" class="required hasDatepicker" id="apo_date" placeholder="预约时间" title="* 请选择预约时间">
                                                            </p>
                                                            <p>
                                                                <label class="display-ie8" for="apo_date">留言</label>
                                                                <textarea name="message" class="message required" cols="30" rows="5" placeholder="Message" title="* 请输入留言"></textarea>
                                                            </p>
                                                            
                                                            <div class="captcha-container">
                                                                <img src="./index_files/appointment_captcha.png" alt="">
                                                                <input type="text" class="captcha required" name="captcha" maxlength="5" title="* 请输入图片上的验证码">
                                                            </div>
                                                            
                                                            <p>															
                                                                <input type="submit" value="提交 请求" class="readmore">
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

		
	<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div></body></html>