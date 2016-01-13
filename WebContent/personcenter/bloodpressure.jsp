<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US" class="csstransforms csstransforms3d csstransitions"><!--<![endif]--><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><script src="./index_files/twitterlib.js"></script>				
				<!-- META TAGS -->
				<meta charset="UTF-8">
				<meta name="viewport" content="width=device-width">
				
				<!-- Title -->
				<title>自我检测（血压）</title>
              
                <!-- FAVICON -->
                <link rel="shortcut icon" href="<%=request.getContextPath() %>/index_files/images/favicon.png.png">
				
                <!-- Style Sheet-->
				<%@include file="../common/common_css.jsp" %>     
				
				<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">            
				<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">            
				<link rel="stylesheet" href="<%=request.getContextPath() %>/css/measure.css">            

				<%@include file="../common/common_js.jsp" %>
				
				<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
				
				<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/jquery.mytimepicker.js"></script>
				 
				<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/shs.common.js"></script>
				<script type="text/javascript" src="<%=request.getContextPath()%>/js/pages/measure/bloodpressure.js"></script>

                <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
                <!--[if lt IE 9]>
                    <script src="js/html5.js"></script>
                <![endif]-->
				
<body>			
				<!-- Starting Website Wrapper -->
                <div id="wrapper">
                        <div class="top">
				<div class="content">
			    	<div class="logo"></div>
			        <div class="menu">
			        	<ul>
			            	<li class="active"><span><a href="<%=request.getContextPath()%>/index.jsp">主页</a></span></li>
			            </ul>
			        </div>
			        <div class="logo_out"><a href="<%=request.getContextPath()%>/login.do?method=logout">退出</a></div>
			        <div class="setting"><a href="/userweb/personalsettings/personalinfo">个人设置</a></div>        
			        <div class="info">欢迎您，${sessionScope.userInfo.username }！</div>        
				</div>
			</div>

                        <div class="copyrights"><a href="#" title="北京市计算中心">北京市计算中心</a></div> 
                        
                        <div id="container">
<!-- 开始 -->		
	<div class="container">
		<div class="content">


<div class="left">
	<div id="avatar">
		<div class="avatar">
			<a href = '/userweb/showavatar?p=100000000003'><img src="<%=request.getContextPath()%>/images/head_portrait.jpg"/></a>
		</div>
		<div class="name">
			<a href = '/userweb/personalsettings/avatar' title='${sessionScope.userInfo.username }'>
				${sessionScope.userInfo.username }
			</a>
		</div>
	</div>
	<div>
		<ul>
			<li><div class="ico ico_test">
					<span>自我检测</span>
				</div></li>
<!-- 			<li><div class="ico ico_ask">
					<span>养生咨询</span>
				</div></li>
			<li><div class="ico ico_clinic">
					<span>预约就诊</span>
				</div></li>
			<li><div class="ico ico_plan">
					<span>健康计划</span>
				</div></li> -->
			<li><div class="ico ico_report">
					<span><a href="#">健康报告</a></span>
				</div></li>
 			<li><div>
					<span>普通指标</span>
				</div></li>
			<li><div>
					<span>生化指标</span>
				</div></li> 
			<li><div >
					<span>基因指标</span>
				</div></li>
<!-- 			<li><div class="ico ico_record">
					<span>消费记录</span>
				</div></li> -->
		</ul>
	</div>
</div>
<script>
	$(function() {
		LeftNav.setHover();
		LeftNav.NavActive('test');
	});
	var LeftNav = {};
	LeftNav.setHover = function() {
		$('.left ul li').hover(function() {
			if ($(this).attr('class') == 'active')
				return;
			$(this).addClass('hover');
		}, function() {
			$(this).removeClass('hover');
		});
	}
	LeftNav.NavActive = function(tag) {
		var obj = $('.left ul li div[class*="' + tag + '"]');
		if ($(obj).size() > 0) {
			var tmpObj = $('.left ul li[class="active"] div');
			var tmpCss = $(tmpObj).attr('class');
			if (tmpCss) {
				$(tmpObj).attr('class', tmpCss.replace(/_white/g, ""));
			}
			$('.left ul li').removeClass('active');
			$(obj).removeAttr('class').attr('class',
					'ico ico_' + tag + '_white');
			$(obj).parent().addClass('active');
		}
	}
</script>
			



<div class="right">
	<div class="title">
		<div class="ico"></div>
	</div>
	<div class="shadow shadow_a">
		<div class="shadow shadow_b">
			<div class="shadow shadow_c" style="padding-top: 15px;">
				
				<!-- my content -->


<div class="measure_div">
	<ul class="nav nav-tabs" id="measure_tab">
		<li id="bloodpressure" class="measure_active"><span>血压</span></li>
		<li id="bloodglucose"><span>血糖</span></li>
		<li id="pedometer"><span>运动</span></li>
		<li id="pulseoximeter"><span>血氧</span></li>
		<li id="bodytemperature"><span>体温</span></li>
		<li id="bodyweight"><span>体重</span></li>
		<li id="bodyfat"><span>体脂</span></li>
	</ul>
</div>
<script>
$(function(){
	$('#measure_tab').tab('show');
	
	var cur_id = "bloodpressure";
	$('#measure_tab li').live('click',function(){
		measurePage($(this).attr('id'));
	});
	$('#measure_tab li').each(function(){		
		if (cur_id == $(this).attr('id')) {
			$(this).addClass('measure_active');
		} else {
			$(this).addClass('measure_normal');
		}
	});
});
function measurePage(url) {
	window.location.href = "/bcc_gaoxy/personcenter/" + url+".jsp";
}
</script>
				<div class="measure_box">
					<form id="formAction" class="form-horizontal ">
						<table style="line-height: 55px;">
							<tr>
								<td width="100">收缩压（高压）  <span class="required_red">*</span></td>
								<td width="240"><input class="input2" type="text" name="systolic" id="systolic" maxlength="10" tabindex="1" />
								<span class="add-on"> 毫米汞柱</span>
								</td>
								<td width="100" align="right">测量日期&#160;&#160;</td>
								<td><input type="text" name="mDate" id="mDate" readonly="readonly" style="cursor: pointer;" /></td>
							</tr>
							<tr>
								<td>舒张压（低压） <span class="required_red">*</span></td>
								<td>
								<input class="input2" type="text" name="diastolic" id="diastolic" maxlength="10" tabindex="2" />
								<span class="add-on"> 毫米汞柱</span>
								</td>
								<td align="right">测量时间&#160;&#160;</td>
								<td><input type="text" name="mTime" id="mTime" readonly="readonly" style="cursor: pointer;" /></td>
							</tr>
							<tr>
								<td>心率 <span class="required_red">*</span></td>
								<td>
								<input class="input2" type="text" name="heartRate" id="heartRate" maxlength="10" tabindex="3" />
								<span class="add-on"> 次/分钟</span>
								</td>
								<td align="right"></td>
								<td></td>
							</tr>
						</table>
						<div class="m_line clearfix"></div>
						<table>
							<tr>
								<td>不适症状</td>
								<td colspan="3">
									<div class="symptoms" id="symptoms">
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="19"
												mapVal="视力模糊" /> 视力模糊
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="17"
												mapVal="失眠" /> 失眠
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="18"
												mapVal="头部沉重" /> 头部沉重
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="16"
												mapVal="烦躁" /> 烦躁
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="13"
												mapVal="胸闷" /> 胸闷
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="14"
												mapVal="气短" /> 气短
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="11"
												mapVal="心慌" /> 心慌
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="12"
												mapVal="心率加快" /> 心率加快
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="21"
												mapVal="心悸心慌" /> 心悸心慌
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="3"
												mapVal="耳鸣" /> 耳鸣
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="20"
												mapVal="肢体麻木" /> 肢体麻木
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="2"
												mapVal="头痛" /> 头痛
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="1"
												mapVal="头晕" /> 头晕
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="10"
												mapVal="口干舌燥" /> 口干舌燥
											</label>
										
											<label class="checkbox inline" style='display:none;'> <input type="checkbox" name="symptom" value="7"
												mapVal="其它" /> 其它
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="5"
												mapVal="出汗乏力" /> 出汗乏力
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="9"
												mapVal="烦躁易怒" /> 烦躁易怒
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="8"
												mapVal="疲乏无力" /> 疲乏无力
											</label>
										
										<div class="clearfix">
											其他：<input type="text" name="otherSymptom" maxlength="400" />
										</div>
									</div>
								</td>
							</tr>
						</table>
						<div class="m_line clearfix" style="margin-top: 10px;"></div>
						<table>
							<tr>
								<td>可能原因</td>
								<td colspan="3">
									<div class="reasons" id="reasons">
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="reason" value="13"
												mapVal="长期心率低" /> 长期心率低
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="reason" value="14"
												mapVal="动脉硬化" /> 动脉硬化
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="reason" value="11"
												mapVal="过量服降压药" /> 过量服降压药
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="reason" value="12"
												mapVal="疾病引起" /> 疾病引起
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="reason" value="3"
												mapVal="睡眠不足" /> 睡眠不足
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="reason" value="2"
												mapVal="刚运动过" /> 刚运动过
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="reason" value="1"
												mapVal="情绪波动" /> 情绪波动
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="reason" value="10"
												mapVal="长期血压低" /> 长期血压低
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="reason" value="7"
												mapVal="长时间平卧" /> 长时间平卧
											</label>
										
											<label class="checkbox inline" style='display:none;'> <input type="checkbox" name="reason" value="6"
												mapVal="其它" /> 其它
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="reason" value="5"
												mapVal="漏服降压药" /> 漏服降压药
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="reason" value="4"
												mapVal="长期高血压" /> 长期高血压
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="reason" value="9"
												mapVal="腹泻" /> 腹泻
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="reason" value="8"
												mapVal="大量出汗了" /> 大量出汗了
											</label>
										
										<div class="clearfix">
											其他：<input type="text" name="otherReason" maxlength="400" />
										</div>
									</div>
								</td>
							</tr>
						</table>
						<div style="text-align: center; margin: 30px 20px;">
							<input type="submit" value="提交" class="btn123" style="margin-right: 87px;" /> <input id="cancel" type="button"
								value="放弃" class="btn123" />
						</div>
						<p>&#160;</p>
					</form>
				</div>
				<div class="m_line2"></div>

				<div class="measure_img">
					<h1>血压趋势图</h1>
					<div class="img_box">
						<a href="/userweb/health/oneweektrend/1" target="_blank"> 
						<img  alt="" 
							src="<%=request.getContextPath() %>/images/xueyaochart.png" border="0" />
						<!-- <img width="80%" height="80%" alt=""
							src="/userweb/health/oneweektrend/1" border="0" /> -->
							
						</a>
					</div>
				</div>

				<!-- //my content -->
			
			</div>
		</div>
	</div>
</div>
<div class="clearfix"></div>

		</div>
		<div class="clearfix"></div>
	</div>
			
<!-- 结束 -->							
                        </div><!-- end of container -->
                        

				<%@include file="../common/footer_wrap.jsp" %>
                        
                </div><!-- End of Wrapper Div -->

	</body>

	</html>
