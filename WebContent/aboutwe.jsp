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
				<!--  -->                  
				<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>
				 
                <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
                <!--[if lt IE 9]>
                    <script src="js/html5.js"></script>
                <![endif]-->
				<%@include file="common/common_js.jsp" %>
<body onload="loand();">			
				<!-- Starting Website Wrapper -->
                <div id="wrapper">
                		
                        <%@include file="common/session_header.jsp" %>
                        <div class="copyrights"><a href="#" title="北京市计算中心">北京市计算中心</a></div> 
                        
                        <div id="container" style="padding-left:200px;">
<p>地址：北京市朝阳区安贞路2号     <br>
 邮政编码：100029<br>
安贞医院北站：380路, 409路, 515路, 620路, 653路, 694路, 特2路<br>
安贞西里—公交站：21路, 82路, 90内, 90外, 113路, 380路, 407路, 409路, 607路, 694路, 特2路, 特8外快<br>
安贞桥西—公交站：300快内, 300快外, 300内, 300外, 302路, 361路, 367路, 387路, 407路, 601路, 607路, 641路, 671路, 718路, 731路, 847路, 848路<br>
安贞桥北—公交站：18路; 207路夜班车; 207夜班车; 328路; 387路; 422路; 558路; 758路; 985路; 快速公交3线; 快速公交3线区; 快速公交3线支<br>
地铁：10号线安贞门站<br>
停车场位置：医院内部及门诊楼对面150个车位的对外停车场<br></p>
<div id="container3" style="width:500px;height:400px;"></div>
<br/>
<p>中心地址：北京市海淀区丰贤中路7号北科产业3号楼     <br>
 邮政编码：100094<br>
E-mail：jszx@bcc.ac.cn<br>
 总机：010-59341997 / 59341998<br>
所在位置:永丰产业基地 丰贤中路7号北科产业3号楼<br></p>
<div id="container2" style="width:500px;height:400px;"></div>
<input id="lng" type="hidden" runat="server" />
<input id="lat" type="hidden" runat="server" />
<script type="text/javascript">
        function loand() {
            var map = new BMap.Map("container2");
            var point = new BMap.Point(116.241172,40.084857); //默认中心点
            var marker = new BMap.Marker(point,15);
            var opts = {
                width: 200,     // 信息窗口宽度  
                height: 70,     // 信息窗口高度  
                title: "北京市计算中心"  // 信息窗口标题  
            }
            var infoWindow = new BMap.InfoWindow("您好，欢迎来到生物事业部", opts);  // 创建信息窗口对象


            marker.enableDragging(); //启用拖拽
            marker.addEventListener("dragend", function (e) {
                point = new BMap.Point(e.point.lng, e.point.lat); //标记坐标（拖拽以后的坐标）
                marker = new BMap.Marker(point);

                document.getElementByIdx_x("lng").value = e.point.lng;
                document.getElementByIdx_x("lat").value = e.point.lat;
                infoWindow = new BMap.InfoWindow("当前位置<br />经度：" + e.point.lng + "<br />纬度：" + e.point.lat, opts);

                map.openInfoWindow(infoWindow, point);
            })

            map.addControl(new BMap.NavigationControl()); //左上角控件
            map.enableScrollWheelZoom(); //滚动放大
            map.enableKeyboard(); //键盘放大

            map.centerAndZoom(point, 13); //绘制地图
            map.addOverlay(marker); //标记地图

            map.openInfoWindow(infoWindow, map.getCenter());      // 打开信息窗口      
            
            //--------------------
            var map2 = new BMap.Map("container3");
            var point2 = new BMap.Point(116.408707,39.979339); //默认中心点
            var marker2 = new BMap.Marker(point2,15);
            var opts2 = {
                width: 200,     // 信息窗口宽度  
                height: 70,     // 信息窗口高度  
                title: "首都医科大学附属北京安贞医院"  // 信息窗口标题  
            }
            var infoWindow2 = new BMap.InfoWindow("您好，欢迎来到安贞医院", opts2);  // 创建信息窗口对象


            marker2.enableDragging(); //启用拖拽
            marker2.addEventListener("dragend", function (e) {
                point2 = new BMap.Point(e.point.lng, e.point.lat); //标记坐标（拖拽以后的坐标）
                marker2 = new BMap.Marker(point2);

                document.getElementByIdx_x("lng").value = e.point.lng;
                document.getElementByIdx_x("lat").value = e.point.lat;
                infoWindow2 = new BMap.InfoWindow("当前位置<br />经度：" + e.point.lng + "<br />纬度：" + e.point.lat, opts2);

                map2.openInfoWindow(infoWindow2, point2);
            })

            map2.addControl(new BMap.NavigationControl()); //左上角控件
            map2.enableScrollWheelZoom(); //滚动放大
            map2.enableKeyboard(); //键盘放大

            map2.centerAndZoom(point2, 13); //绘制地图
            map2.addOverlay(marker2); //标记地图

            map2.openInfoWindow(infoWindow2, map2.getCenter());      // 打开信息窗口      
            //--------------------
        }
         
    </script>
                        </div><!-- end of container -->
                        

				<%@include file="common/footer_wrap.jsp" %>
                        
                </div><!-- End of Wrapper Div -->
				
				

		
</body></html>