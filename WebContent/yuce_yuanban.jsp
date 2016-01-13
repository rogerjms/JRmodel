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
				.erjiwenti{background-color: lightblue;}
				</style>
				
				<%@include file="../common/common_js.jsp" %>
				
				<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
								
				<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/jquery.mytimepicker.js"></script>
				
				<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/shs.common.js"></script>             

                <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
                <!--[if lt IE 9]>
                    <script src="js/html5.js"></script>
                <![endif]-->
				
<body >			
				<!-- Starting Website Wrapper -->
                <div id="wrapper">
                		<%@include file="common/session_header.jsp" %>

                        <div class="copyrights"><a href="#" title="北京市计算中心">北京市计算中心</a></div> 
                        
                        <div id="container"  >
                        		
                                <div id="form"><br/><h1>高血压早期预警体系</h1><br/>
									<form   name="form1" action="yuce.do" method="post" onsubmit="check()">
									
	<div class="measure_div">
		<ul class="nav nav-tabs" id="measure_tab">
			<li id="tab1" class="measure_active"><span>普通指标</span></li>
			<li id="tab2"><span>生化指标</span></li>
			<li id="tab3"><span>基因指标</span></li>
		</ul>
	</div>
	<script>
		$(function(){
			$('#measure_tab').tab('show');
			
			var cur_id = "tab1";
			$('#measure_tab li').live('click',function(){
				$('#measure_tab li').addClass('measure_normal');
				$(this).removeClass('measure_normal');
				$(this).addClass('measure_active');
				$(".measure_box").hide();
				$("#"+$(this).attr('id')+"content").show();
			});
			$('#measure_tab li').each(function(){		
				if (cur_id == $(this).attr('id')) {
					$(this).addClass('measure_active');
				} else {
					$(this).addClass('measure_normal');
				}
			});
		});
	</script>
	
	<div id="tab1content" class="measure_box" style="display: block;width:900px;">
		<%@include file="yuce_jiben.jsp" %>
	</div>
	<div id="tab2content" class="measure_box" style="display: none;width:900px;">
		<%@include file="yuce_huayan.jsp" %>
	</div>
	<div id="tab3content" class="measure_box" style="display: none;width:900px;">
		<%@include file="yuce_jiyin.jsp" %>
	</div>
									

									<table>
										<tr>
											<td colspan="4" style="text-align: center;">
												<input style="width:140px; height:40px;" name="tijiao" type="submit" value="开始预测"/>
											</td>
										</tr>
									</table>
									</form>
									
								</div>
								
                        </div><!-- end of container -->
                        

				<%@include file="common/footer_wrap.jsp" %>
                        
                </div><!-- End of Wrapper Div -->	

<div id="zhiweihaokan" style="position: absolute;top:200px;right:200px;">
	<img src="<%=request.getContextPath() %>/images/xyj.jpg" width="300"/>
</div>
<script type="text/javascript">

</script>

</body></html>