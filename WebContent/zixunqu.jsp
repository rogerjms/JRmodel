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
		
				<style type="text/css">
				.bitianxiang{text-align: right;}
				.xuantianxiang{text-align: right;}
				input[type='text']{width:150px;}
				.erjiwenti{background-color: lightblue;}
				</style>
				
				<%@include file="../common/common_js.jsp" %>

                <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
                <!--[if lt IE 9]>
                    <script src="js/html5.js"></script>
                <![endif]-->
				
<body >			
				<!-- Starting Website Wrapper -->
                <div id="wrapper">
                		<%@include file="common/session_header.jsp" %>

                        <div class="copyrights"><a href="#" title="北京市计算中心">北京市计算中心</a></div> 
                        
                        <br/>
                        <div id="container"  >
                        <!-- 专家1 -->
                        <%
                        	IDao dao = new DaoImpl();
                			List<Map<String,Object>> list = dao.executeQueryForList("select * from tb_expert order by expert_id ");
                			for(int i=0;i<list.size();i++){
                				Map<String,Object> map = list.get(i);
                				//System.out.println(map);
                        %>
							<div class="doctor_con">
			                    <img style="float: left;width:114px;height:150px;" class="doc_pic" src="<%=request.getContextPath() %>/images/zixunqu/<%=map.get("expert_image") %>"  />
			                    <dl style="line-height: 30px;">
			                        <dt><h1><%=map.get("expert_name") %></h1></dt>
			                        <dd style="float:left;width:390px;"><strong>行政职务:</strong><%=map.get("expert_xingzhengzhiwu") %></dd>
			                        <dd><strong>专业技术职称:</strong><%=map.get("expert_zhuyejishuzhicheng") %></dd>
			                        <dd style="float:left;width:390px;"><strong>出诊时间:</strong><span><%=map.get("expert_chuzhenshijian") %></span></dd>
			                        <dd><strong>所在医院:</strong><%=map.get("expert_suozaiyiyuan") %></dd>
			                        <dd style=" width:100%;">&nbsp;&nbsp;<strong>联系方式:</strong><%=map.get("expert_tel") %></dd>
									<dd style=" width:100%;">&nbsp;&nbsp;<strong>专业特长:</strong><%=map.get("expert_zhuanyetechang") %></dd>
			                    </dl>
							</div>
							<div>
								<p><%=map.get("expert_introduce") %></p>	
							</div>
							<%} %>                    		                      		
                        </div><!-- end of container -->
                        

				<%@include file="common/footer_wrap.jsp" %>
                        
                </div><!-- End of Wrapper Div -->	

</body></html>