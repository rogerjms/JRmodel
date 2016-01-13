<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%@include file="../common/common_css.jsp" %>     

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">            
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">            
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/measure.css">            

<%@include file="../common/common_js.jsp" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
				
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/jquery.mytimepicker.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/shs.common.js"></script>

</head>
<body>
	<div class="measure_div" style="width: 900px;">
		<ul class="nav nav-tabs" id="measure_tab">
			<li id="tab1" class="measure_active"><span>血压</span></li>
			<li id="tab2"><span>血糖</span></li>
			<li id="tab3"><span>运动</span></li>
		</ul>
	</div>
	<script>
		$(function(){
			$('#measure_tab').tab('show');
			
			var cur_id = "tab1";
			$('#measure_tab li').live('click',function(){
				//alert($(this).attr('id'));
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
	
	<div id="tab1content" class="measure_box" style="display: block;width:100%">
		tab1
	</div>
	<div id="tab2content" class="measure_box" style="display: none;">
		tab2
	</div>
	<div id="tab3content" class="measure_box" style="display: none;">
		tab3
	</div>
</body>
</html>