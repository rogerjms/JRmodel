<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US" class="csstransforms csstransforms3d csstransitions"><!--<![endif]--><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><script src="./index_files/twitterlib.js"></script>				
				<!-- META TAGS -->
				<meta charset="UTF-8">
				<meta name="viewport" content="width=device-width">
				
				<!-- Title -->
				<title>自我检测（血糖）</title>
              
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
					<span><a href="/userweb/measure/bloodpressure">自我检测</a></span>
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
	
	var cur_id = "bloodglucose";
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
								<td width="100">血糖 <span class="required_red">*</span></td>
								<td width="240"><input class="input2" type="text" name="bgValue" id="bgValue" maxlength="10" tabindex="1" />
								<span class="add-on"> 毫摩尔/升</span>
								</td>
								<td width="100" align="right">测量日期&#160;&#160;</td>
								<td><input type="text" name="mDate" id="mDate" readonly="readonly" style="cursor: pointer;" /></td>
							</tr>
							<tr>
								<td></td>
								<td>
								<label class="radio inline" style="margin-right:10px;"> <input type="radio" name="mealType" value="limosis" checked="checked" />空腹血糖</label>
								<label class="radio inline"> <input type="radio" name="mealType" value="after_meal" />餐后血糖</label>
								 </td>
								<td align="right">测量时间&#160;&#160;</td>
								<td><input type="text" name="mTime" id="mTime" readonly="readonly" style="cursor: pointer;" /></td>
							</tr>
						</table>
						<div class="m_line clearfix"></div>
						<table>
							<tr>
								<td>不适症状</td>
								<td colspan="3">
									<div class="symptoms" id="symptoms">
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="19" mapVal="视力模糊" />
												视力模糊
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="22" mapVal="伤口不易愈合" />
												伤口不易愈合
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="17" mapVal="排尿增多" />
												排尿增多
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="23" mapVal="排尿不适或尿痛" />
												排尿不适或尿痛
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="18" mapVal="夜尿增多" />
												夜尿增多
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="24" mapVal="肢体疼痛针刺感" />
												肢体疼痛针刺感
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="15" mapVal="多食" />
												多食
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="25" mapVal="口腔溃疡或灼烧感" />
												口腔溃疡或灼烧感
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="16" mapVal="心悸心慌" />
												心悸心慌
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="13" mapVal="心慌出汗" />
												心慌出汗
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="14" mapVal="多饮" />
												多饮
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="11" mapVal="易饥饿" />
												易饥饿
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="12" mapVal="无力" />
												无力
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="21" mapVal="皮疹" />
												皮疹
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="20" mapVal="外阴瘙痒" />
												外阴瘙痒
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="1" mapVal="头晕" />
												头晕
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="10" mapVal="眩晕" />
												眩晕
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="7" mapVal="疲乏无力" />
												疲乏无力
											</label>
										
											<label class="checkbox inline" style='display:none;'> <input type="checkbox" name="symptom" value="6" mapVal="其它" />
												其它
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="5" mapVal="肢体麻木" />
												肢体麻木
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="4" mapVal="烦渴多尿" />
												烦渴多尿
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="9" mapVal="体重减轻" />
												体重减轻
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="symptom" value="8" mapVal="厌食" />
												厌食
											</label>
										
										<div class="clearfix">
										其他：<input type="text" name="otherSymptom" maxlength="400" />
										</div>
									</div>
								</td>
							</tr>							
						</table>
						<div class="m_line clearfix" style="margin-top:10px;"></div>
						<table>
							<tr>
								<td>可能原因</td>
								<td colspan="3">
									<div class="reasons" id="reasons">
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="reason" value="3" mapVal="没坚持运动" />
												没坚持运动
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="reason" value="1" mapVal="主食吃太多" />
												主食吃太多
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="reason" value="10" mapVal="甜食吃太多" />
												甜食吃太多
											</label>
										
											<label class="checkbox inline" style='display:none;'> <input type="checkbox" name="reason" value="7" mapVal="其它" />
												其它
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="reason" value="6" mapVal="过量服降糖药" />
												过量服降糖药
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="reason" value="5" mapVal="血糖一直较高" />
												血糖一直较高
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="reason" value="4" mapVal="漏服降糖药" />
												漏服降糖药
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="reason" value="9" mapVal="剧烈运动过" />
												剧烈运动过
											</label>
										
											<label class="checkbox inline" style=''> <input type="checkbox" name="reason" value="8" mapVal="长时间饥饿" />
												长时间饥饿
											</label>
										
										<div class="clearfix">
										其他：<input type="text" name="otherReason" maxlength="400" />
										</div>
									</div>
								</td>
							</tr>
						</table>
						<div style="text-align:center; margin:30px 20px;">
							<input type="submit" value="提交" class="btn123" style="margin-right:87px;" /> <input id="cancel" type="button" value="放弃" class="btn123" />
						</div>
						<p>&#160;</p>						
					</form>
				</div>
				<div class="m_line2"></div>
				
				<div class="measure_img">
					<h1>血糖趋势图</h1>
					<div class="img_box">
						<a href="/userweb//health/oneweektrend/10" target="_blank"> <img width="80%" height="80%" alt=""
							src="/userweb//health/oneweektrend/10" border="0" />
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

		
	<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div></body></html>