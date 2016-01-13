<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				
	<div class="measure_div">
		<ul class="nav nav-tabs" id="measure_tab">
			<li id="tab1" class="measure_active"><span>一般情况</span></li>
			<li id="tab2"><span>生活习惯</span></li>
			<li id="tab3"><span>个人病史</span></li>
			<li id="tab4"><span>家族史</span></li>
		</ul>
	</div>
	<div id="tab1content" class="measure_box" style="display: block;width:780px;">
		<table id="normalInfoTable" >
			<tr>
				<td class="bitianxiang" width="22%">记录日期：</td>
				<td ><input name="jiLuRiQi" type="text" editable="false" onClick="WdatePicker()" class="Wdate"/></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="bitianxiang">姓名：</td>
				<td ><input name="gene" type="text" /></td>
				<td class="bitianxiang" width="25%">性别：</td>
				<td ><input name="xingBie" type="radio" value="1" checked/>男
				<input name="xingBie" type="radio" value="2" />女</td>
			</tr>
			<tr>
				<td class="bitianxiang">出生日期：</td>
				<td ><input id="chuShengRiQi" name="chuShengRiQi" type="text" editable="false" onClick="WdatePicker()" class="Wdate"/></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="bitianxiang">身高：</td>
				<td ><input name="shenGao" type="text" />&nbsp;厘米</td>
				<td class="bitianxiang">体重：</td>
				<td ><input name="tiZhong" type="text" />&nbsp;千克</td>
			</tr>
			<tr>
				<td class="bitianxiang">腹围：</td>
				<td ><input name="yaoWei" type="text" />&nbsp;厘米</td>
				<td class="bitianxiang">臀围：</td>
				<td ><input name="tunWei" type="text" />&nbsp;厘米</td>
			</tr>
			<tr>
				<td colspan="4" ><strong>血压测量</strong></td>
			</tr>
			<tr>
				<td class="bitianxiang">最近一次收缩压值：</td>
				<td ><input name="bmi" type="text"/>&nbsp;mmHg</td>
				<td class="bitianxiang">最近一次舒张压值：</td>
				<td ><input type="text"/>&nbsp;mmHg</td>
			</tr>
			<tr>
				<td class="bitianxiang">民族：</td>
				<td ><input name="mingZu"  type="text"/></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="bitianxiang">您的出生地：</td>
				<td ><input  type="text"/></td>
				<td class="bitianxiang">您在北京居住时间<br/>是否超过15年：</td>
				<td ><input name="juZhuTime" type="radio" value="1" checked/>是
				<input name="juZhuTime" type="radio" value="0" />否</td>
			</tr>
			<tr>
				<td class="bitianxiang">婚姻状况：</td>
				<td ><input name="hunYin" type="radio" value="1" checked/>已婚
				<input name="hunYin" type="radio" value="0" />未婚</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="bitianxiang">职业：</td>
				<td colspan="3" >
				<select name="zhiYe">
					<option value="1">国家机关、党群组织，企业、事业单位负责人</option>
					<option value="2">专业技术人员</option>
					<option value="3">办事人员和有关人员</option>
					<option value="4">商业、服务业人员</option>
					<option value="5">农、林、牧、渔、水利业生产人员</option>
					<option value="6">生产、运输设备操作人员及有关人员</option>
					<option value="7">军人</option>
					<option value="8">不便分类的其他人员</option>
				</select>
				</td>
			</tr>
			<tr>
				<td class="bitianxiang">文化程度：</td>
				<td >
				<select name="wenHua">
					<option value="1">不识字或少识字</option>
					<option value="2">小学</option>
					<option value="3">初中</option>
					<option value="4">中学（高中、中专、技校、职高）</option>
					<option value="5">大专</option>
					<option value="6">大本及以上</option>
				</select>
				</td>
				<td class="bitianxiang">医药费报销方式：</td>
				<td >
				<select name="baoXiao">
					<option value="1">全部自费</option>
					<option value="2">公费医疗</option>
					<option value="3">城镇医疗保险</option>
					<option value="4">新农合</option>
					<option value="5">其他</option>
				</select>
				</td>
			</tr>
			<tr>
				<td class="xuantianxiang">联系电话：</td>
				<td><input type="text" /></td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
	<div id="tab2content" class="measure_box" style="display: none;width:900px;">
		<table id="habitInfoTable" >
			<tr>
				<td width="20%" class="bitianxiang">现在吸烟情况：</td>
				<td colspan="3" >
					<input name="xiyanqingkuang" type="radio" value="1" />
					吸烟（每天至少吸烟一支，连续吸烟一年以上，或长期吸烟但戒烟短于半年）<br/>
					<input name="xiyanqingkuang" type="radio" value="2"/>
					戒烟（戒烟6个月以上）<br/>
					<input name="xiyanqingkuang" type="radio" value="3"/>
					不吸烟
				</td>
			</tr>
			<tr id="xyqk01" class="erjiwenti">
				<td width="20%" class="xuantianxiang">现在平均每天吸烟量</td>
				<td colspan="3"><input name="xiYanLiang" type="text"/>&nbsp;支&nbsp;&nbsp;&nbsp;&nbsp;000=不足1支</td>
			</tr>
			<tr id="xyqk02" class="erjiwenti">
				<td width="20%" class="xuantianxiang">戒烟年限</td>
				<td colspan="3"><input type="text"/>&nbsp;年</td>
			</tr>
			<tr>
				<td width="20%" class="xuantianxiang">饮酒情况：</td>
				<td colspan="3" >
					<input name="yinjiuqingkuang" type="radio" value="1"/>
					从不喝酒
					<input name="yinjiuqingkuang" type="radio" value="2"/>
					过去饮酒
					<input name="yinjiuqingkuang" type="radio" value="3"/>
					偶尔饮酒
					<input name="yinjiuqingkuang" type="radio" value="4"/>
					经常饮酒
				</td>
			</tr>
			<tr id="yjqk01" class="erjiwenti">
				<td width="20%" class="xuantianxiang">最常饮酒的种类</td>
				<td colspan="3">
					白酒：<input name="baiJiu" type="radio" value="1"/>经常
					<input name="baiJiu" type="radio" value="2"/>偶尔
					<input name="baiJiu" type="radio" value="3"/>不饮<br/>
					啤酒：<input name="piJiu" type="radio" value="1"/>经常
					<input name="piJiu" type="radio" value="2"/>偶尔
					<input name="piJiu" type="radio" value="3"/>不饮<br/>
					红酒：<input name="hongJiu" type="radio" value="1"/>经常
					<input name="hongJiu" type="radio" value="2"/>偶尔
					<input name="hongJiu" type="radio" value="3"/>不饮<br/>
					饮酒量：<input name="yinJiuLiang" type="radio" value="1"/>少于2两/次
					<input name="yinJiuLiang" type="radio" value="2"/>2至5两/次
					<input name="yinJiuLiang" type="radio" value="3"/>5到10两/次
					<input name="yinJiuLiang" type="radio" value="4"/>大于1斤/次
				</td>
			</tr>
			<tr id="yjqk02" class="erjiwenti">
				<td width="20%" class="xuantianxiang">平均饮酒频率</td>
				<td colspan="3"><input name="yinJiuPinlv" type="text"/>&nbsp;次/周&nbsp;&nbsp;&nbsp;&nbsp;000=每周不足1次</td>
			</tr>
			<tr id="yjqk03" class="erjiwenti">
				<td class="xuantianxiang">戒酒年限</td>
				<td colspan="3"><input type="text"/>&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;
				（如不足1年，请填写）<input type="text"/>&nbsp;月
				</td>
			</tr>
			<!-- 运动情况 -->
			<tr >
				<td width="20%" class="xuantianxiang">是否经常做体育锻炼：</td>
				<td colspan="3" >
					<input name="tiyuduanlian" type="radio" value="1"/>从不做
					<input name="tiyuduanlian" type="radio" value="2"/>偶尔（1-3次/周）
					<input name="tiyuduanlian" type="radio" value="3"/>经常（>3次/周）
					<input name="tiyuduanlian" type="radio" value="4"/>每天
				</td>
			</tr>
			<tr id="tydl01" class="erjiwenti">
				<td class="xuantianxiang">做何种运动</td>
				<td></td>
				<td class="xuantianxiang">每次持续多长时间：</td>
				<td><input name="yunDongShiJian" type="text" />&nbsp;分钟</td>
			</tr>
			<tr id="tydl02" class="erjiwenti">
				<td colspan="4" ><span style="color:red; ">提示：体育锻炼包括：游泳、球类运动、自行车、健身馆的各种运动、20分钟以上的步行、慢跑等</span></td>
			</tr>
			<tr id="tydl03" class="erjiwenti">
				<td>每周大约有几次持续20分钟以上的运动（包括上下班路上）</td>
				<td colspan="3"><input name="yunDongCiShu" type="text" />&nbsp;次/周&nbsp;&nbsp;&nbsp;&nbsp;000=不足1次</td>
			</tr>
		</table>
	</div>
	<div id="tab3content" class="measure_box" style="display: none;width:900px;">
		<table id="medicalHistoryTable">
			<tr>
				<td width="25%" class="bitianxiang">医生告诉过您患有高血压吗？</td>
				<td colspan="3" >
					<input name="youwugaoxueya" type="radio" value="1"/>有高血压<br/>
					<input name="youwugaoxueya" type="radio" value="2"/>无高血压<br/>
					<input name="youwugaoxueya" type="radio" value="3"/>不记得<br/>
				</td>
			</tr>
			<tr id="gxyqk01" class="erjiwenti">
				<td >您患高血压的年限</td>
				<td colspan="3"><input name="gaoxyTime" type="text"/>&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;
				（如不足1年，请填写）<input name="gaoxyTimeYue" type="text"/>&nbsp;月
				</td>
			</tr>
			<tr id="gxyqk02" class="erjiwenti">
				<td >您的最高血压是多少：</td>
				<td colspan="3">收缩压（高压）<input type="text"/>&nbsp;mmHg<br/>
				舒张压（低压）<input type="text"/>&nbsp;mmHg
				</td>
			</tr>
			<tr id="gxyqk03" class="erjiwenti">
				<td >您患有高血压的并发症吗？<br/>(可多选)</td>
				<td colspan="3">
					<input name="gaoxyBingFa" type="checkbox" value="1"/>脑卒中
					<input name="gaoxyBingFa" type="checkbox" value="2"/>心肌梗死
					<input name="gaoxyBingFa" type="checkbox" value="3"/>心力衰竭
					<input name="gaoxyBingFa" type="checkbox" value="4"/>慢性肾脏疾病
					<input name="gaoxyBingFa" type="checkbox" value="5"/>眼底出血
				</td>
			</tr>
			<tr id="gxyqk04" class="erjiwenti">
				<td >您最近两周服降压药物的情况</td>
				<td colspan="3">
					<input name="fuYaoQingKuang" type="radio" value="1"/>经常服（按医嘱）<br/>
					<input name="fuYaoQingKuang" type="radio" value="2"/>有时服（自己根据情况）<br/>
					<input name="fuYaoQingKuang" type="radio" value="3"/>不服
				</td>
			</tr>
			<tr id="gxyqk05" class="erjiwenti">
				<td >您最近两周服降压药物<br/>(可多选)</td>
				<td colspan="3">
					<input type="checkbox" value="1"/>血管紧张素II受体拮抗剂/血管紧张素转换酶抑制剂<br/>
					<input type="checkbox" value="2"/>钙离子通道阻滞剂<br/>
					<input type="checkbox" value="3"/>受体阻滞剂<br/>
					<input type="checkbox" value="4"/>利尿剂<br/>
					<input type="checkbox" value="5"/>α受体阻滞剂<br/>
					<input type="checkbox" value="6"/>其它：<input type="text"/>
				</td>
			</tr>
			<tr id="gxyqk06" class="erjiwenti" >
				<td>您近期的心电图</td>
				<td colspan="3" valign="top">
					<label >诊断：</label><textarea rows="2" cols="78"></textarea><br/>
					心率：<input name="xinLv" type="text"/>次/分&nbsp;&nbsp;Sv1:<input name="xinDianTuSv1" type="text"/>mv &nbsp;&nbsp;Rv5:<input name="xinDianTuRv5" type="text"/>mv<br/>
				</td>
			</tr>
			
			<tr>
				<td width="20%" class="bitianxiang">医生告诉过您患有糖尿病吗？</td>
				<td colspan="3" >
					<input name="youwutangniaobing" type="radio" value="1"/>有糖尿病<br/>
					<input name="youwutangniaobing" type="radio" value="2"/>无糖尿病<br/>
					<input name="youwutangniaobing" type="radio" value="3"/>不记得<br/>
				</td>
			</tr>
			<tr id="tnbqk01" class="erjiwenti">
				<td >您患糖尿病的年限</td>
				<td colspan="3"><input type="text"/>&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;
				（如不足1年，请填写）<input type="text"/>&nbsp;月
				</td>
			</tr>
			<tr id="tnbqk02" class="erjiwenti">
				<td >您最近两周服降糖药物的情况</td>
				<td colspan="3">
					<input name="jiangtangyao" type="radio" value="1"/>经常服（按医嘱）<br/>
					<input name="jiangtangyao" type="radio" value="2"/>有时服（自己根据情况）<br/>
					<input name="jiangtangyao" type="radio" value="3"/>不服
				</td>
			</tr>
			
			<tr>
				<td width="20%" class="bitianxiang">医生告诉过您有血脂异常吗？</td>
				<td colspan="3" >
					<input name="xueZhiQingKuang" type="radio" value="1" checked />有血脂异常<br/>
					<input name="xueZhiQingKuang" type="radio" value="2"/>无血脂异常<br/>
					<input name="xueZhiQingKuang" type="radio" value="3"/>不记得<br/>
				</td>
			</tr>
			
			<tr>
				<td width="20%" class="bitianxiang">医生告诉过您有脂肪肝吗？</td>
				<td colspan="3">
					<input name="zhiFangGanQingKuang" type="radio" value="1" checked />有脂肪肝<br/>
					<input name="zhiFangGanQingKuang" type="radio" value="2"/>无脂肪肝<br/>
					<input name="zhiFangGanQingKuang" type="radio" value="3"/>不记得<br/>
				</td>
			</tr>
			
			<tr>
				<td width="20%" class="bitianxiang">您患过心肌梗塞吗？</td>
				<td colspan="3" >
					<input name="youwuxinjigengse" type="radio" value="1"/>有心肌梗塞<br/>
					<input name="youwuxinjigengse" type="radio" value="2"/>无心肌梗塞<br/>
					<input name="youwuxinjigengse" type="radio" value="3"/>不知道<br/>
				</td>
			</tr>
			<tr id="xjgsqk01" class="erjiwenti">
				<td class="bitianxiang">您第一次诊断心肌梗塞至今时间</td>
				<td colspan="3"><input type="text"/>&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;000=不足1年</td>
			</tr>
			
			<tr>
				<td width="20%" class="bitianxiang">您患过脑卒中吗（短暂性脑缺血发作除外）？</td>
				<td colspan="3" >
					<input name="youwunaocuzhong" type="radio" value="1"/>有脑卒中<br/>
					<input name="youwunaocuzhong" type="radio" value="2"/>无脑卒中<br/>
					<input name="youwunaocuzhong" type="radio" value="3"/>不知道<br/>
				</td>
			</tr>
			<tr id="nczqk01" class="erjiwenti">
				<td >您所患的脑卒中类型</td>
				<td colspan="3">
					<input name="ncztype" type="radio" value="1" checked />脑出血<br/>
					<input name="ncztype" type="radio" value="2"/>脑梗塞<br/>
					<input name="ncztype" type="radio" value="3"/>蛛网膜下腔出血<br/>
					<input name="ncztype" type="radio" value="4"/>无脑卒中<br/>
					<input name="ncztype" type="radio" value="5"/>不清楚
				</td>
			</tr>
			<tr id="nczqk02" class="erjiwenti">
				<td>是否因脑卒中住院治疗？</td>
				<td colspan="3">
					<input name="zhuyuan" type="radio" value="1" checked />住院<br/>
					<input name="zhuyuan" type="radio" value="2" />留观或输液<br/>
					<input name="zhuyuan" type="radio" value="3" />没住院
				</td>
			</tr>
			<tr id="nczqk03" class="erjiwenti">
				<td>诊断的医院：</td>
				<td colspan="3">
					<input name="yiyuan" type="radio" value="1" checked />一级医院（乡镇医院）<br/>
					<input name="yiyuan" type="radio" value="2" />二级医院（县、区级医院）<br/>
					<input name="yiyuan" type="radio" value="3" />三级医院（省市级及以上医院）
				</td>
			</tr>
			
		</table>
	</div>
	<div id="tab4content" class="measure_box" style="display: none;width:900px;">
		<table id="jiazushiTable" >
			<tr>
				<td width="25%" class="bitianxiang">父母(限亲生父母)<br/>有无以下疾病</td>
				<td colspan="3" >
					高血压：<input checked type="radio" name="gaoxyHistory" value="1"/>父母均有
					<input type="radio" name="gaoxyHistory" value="2"/>父或母有
					<input type="radio" name="gaoxyHistory" value="3"/>父母均无
					<input type="radio" name="gaoxyHistory" value="4"/>不详<br/>
					糖尿病：<input checked type="radio" name="tangnbHistory" value="1"/>父母均有
					<input type="radio" name="tangnbHistory" value="2"/>父或母有
					<input type="radio" name="tangnbHistory" value="3"/>父母均无
					<input type="radio" name="tangnbHistory" value="4"/>不详<br/>
					冠心病：<input checked type="radio" name="guanxinHistory" value="1"/>父母均有
					<input type="radio" name="guanxinHistory" value="2"/>父或母有
					<input type="radio" name="guanxinHistory" value="3"/>父母均无
					<input type="radio" name="guanxinHistory" value="4"/>不详<br/>
					急性心肌梗死：<input checked type="radio" name="xinJiHistory" value="1"/>父母均有
					<input type="radio" name="xinJiHistory" value="2"/>父或母有
					<input type="radio" name="xinJiHistory" value="3"/>父母均无
					<input type="radio" name="xinJiHistory" value="4"/>不详<br/>
					脑卒中：<input checked type="radio" name="naoCuHisroty" value="1"/>父母均有
					<input type="radio" name="naoCuHisroty" value="2"/>父或母有
					<input type="radio" name="naoCuHisroty" value="3"/>父母均无
					<input type="radio" name="naoCuHisroty" value="4"/>不详
				</td>
			</tr>
		</table>
	</div>									
<script type="text/javascript">
	$(function(){
		//初始化
		$(".bitianxiang").prepend("<span style='color:red;font-size: 20px;'>&nbsp;*&nbsp;</span>");
		
		$("input[name='xiyanqingkuang']").get(0).checked=true;
		$("#xyqk01").show();
		$("#xyqk02").hide();
		
		$("input[name='yinjiuqingkuang']").get(0).checked=true;
		$("#yjqk01").hide();
		$("#yjqk02").hide();
		$("#yjqk03").hide();
		
		$("input[name='tiyuduanlian']").get(0).checked=true;
		$("#tydl01").hide();
		$("#tydl02").hide();
		$("#tydl03").hide();
		
		$("input[name='youwugaoxueya']").get(0).checked=true;
		$("input[name='youwutangniaobing']").get(0).checked=true;
		$("input[name='youwuxinjigengse']").get(0).checked=true;
		$("input[name='youwunaocuzhong']").get(0).checked=true;
		
		$("#normalInfoBtn").toggle(
			function(){
				$("#normalInfoTable").show("slow");
				$("#normalInfoIcon").attr("src","images/plus.png");
			},
			function(){
				$("#normalInfoTable").hide("slow");
				$("#normalInfoIcon").attr("src","images/add.png");
			}
		);
		
		$("#habitInfoBtn").toggle(
			function(){
				$("#habitInfoTable").show("slow");
				$("#habitInfoIcon").attr("src","images/plus.png");
			},
			function(){
				$("#habitInfoTable").hide("slow");
				$("#habitInfoIcon").attr("src","images/add.png");
			}
		);
		
		$("#medicalHistoryBtn").toggle(
			function(){
				$("#medicalHistoryTable").show("slow");
				$("#medicalHistoryIcon").attr("src","images/plus.png");
			},
			function(){
				$("#medicalHistoryTable").hide("slow");
				$("#medicalHistoryIcon").attr("src","images/add.png");
			}
		);
		
		$("#jiazushiBtn").toggle(
			function(){
				$("#jiazushiTable").show("slow");
				$("#jiazushiIcon").attr("src","images/plus.png");
			},
			function(){
				$("#jiazushiTable").hide("slow");
				$("#jiazushiIcon").attr("src","images/add.png");
			}
		);
		
		//吸烟情况逻辑
		$("input[name='xiyanqingkuang']").on("change",function(){
			switch($(this).val()){
			case "1":
				$("#xyqk01").show();
				$("#xyqk02").hide();
				break;
			case "2":
				$("#xyqk01").hide();
				$("#xyqk02").show();
				break;
			case "3":
				$("#xyqk01").hide();
				$("#xyqk02").hide();
				break;
			}
		});
		
		//饮酒情况逻辑
		$("input[name='yinjiuqingkuang']").on("change",function(){
			switch($(this).val()){
			case "1":
				$("#yjqk01").hide();
				$("#yjqk02").hide();
				$("#yjqk03").hide();
				break;
			case "2":
				$("#yjqk01").hide();
				$("#yjqk02").hide();
				$("#yjqk03").show();
				break;
			case "3":
				$("#yjqk01").show();
				$("#yjqk02").hide();
				$("#yjqk03").hide();
				break;
			case "4":
				$("#yjqk01").show();
				$("#yjqk02").show();
				$("#yjqk03").hide();
				break;
			}
		});
		
		//运动情况逻辑
		$("input[name='tiyuduanlian']").on("change",function(){
			switch($(this).val()){
			case "1":
				$("#tydl01").hide();
				$("#tydl02").hide();
				$("#tydl03").hide();
				break;
			case "2":
			case "3":
			case "4":
				$("#tydl01").show();
				$("#tydl02").show();
				$("#tydl03").show();
				break;
			}
		});
		
		//高血压情况逻辑
		$("input[name='youwugaoxueya']").on("change",function(){
			switch($(this).val()){
			case "1":
				$("#gxyqk01").show();$("#gxyqk02").show();
				$("#gxyqk03").show();$("#gxyqk04").show();
				$("#gxyqk05").show();$("#gxyqk06").show();
				break;
			case "2":
			case "3":
				$("#gxyqk01").hide();$("#gxyqk02").hide();
				$("#gxyqk03").hide();$("#gxyqk04").hide();
				$("#gxyqk05").hide();$("#gxyqk06").hide();
				break;
			}
		});
		
		//糖尿病情况逻辑
		$("input[name='youwutangniaobing']").on("change",function(){
			switch($(this).val()){
			case "1":
				$("#tnbqk01").show();$("#tnbqk02").show();
				break;
			case "2":
			case "3":
				$("#tnbqk01").hide();$("#tnbqk02").hide();
				break;
			}
		});
		
		//心肌梗塞情况逻辑
		$("input[name='youwuxinjigengse']").on("change",function(){
			switch($(this).val()){
			case "1":
				$("#xjgsqk01").show();
				break;
			case "2":
			case "3":
				$("#xjgsqk01").hide();
				break;
			}
		});
		
		//脑卒中情况逻辑
		$("input[name='youwunaocuzhong']").on("change",function(){
			switch($(this).val()){
			case "1":
				$("#nczqk01").show();
				$("#nczqk02").show();
				$("#nczqk03").show();
				break;
			case "2":
			case "3":
				$("#nczqk01").hide();
				$("#nczqk02").hide();
				$("#nczqk03").hide();
				break;
			}
		});
	});
</script>