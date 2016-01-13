var BloodPressure = {};
var symptomsMap = new Map();
var reasonsMap = new Map();

$(function(){
	BloodPressure.initForm();
	BloodPressure.init();
	
});

BloodPressure.initForm = function() {
	$('#formAction').resetForm();
	var defaultDate = new Date();
	$('#mDate').val(defaultDate.getFullYear() + "-" + (defaultDate.getMonth()+1) + "-" + defaultDate.getDate());
	$('#mTime').val((defaultDate.getHours() < 10 ? "0" + defaultDate.getHours() : defaultDate.getHours())
			+ ":" + (defaultDate.getMinutes() < 10 ? "0" + defaultDate.getMinutes() : defaultDate.getMinutes() ));
	
	$('#symptoms input:checkbox').removeAttr('checked');
	$('#reasons input:checkbox').removeAttr('checked');
};

BloodPressure.init = function() {
	ShsCommon.datepicker('#mDate', null, new Date());
	$('#mTime').mytimepicker();
	
	$('#formAction').validate();	
	$('#formAction').attr('action', ShsCommon.RootUrl + '/measure/bloodpressure/save');
	$('#formAction').submit(function() {
		if (!$(this).valid()) {
			return;
		}
		
		if (!ShsCommon.isInt($('#systolic').val()) || parseInt($('#systolic').val()) < 60 ||
				parseInt($('#systolic').val()) > 240) {
			ShsCommon.showMessageBox('提示', '请正确填写收缩压（高压），范围60-240', function(){$('#systolic').focus();});			
			return false;
		}		
		
		if (!ShsCommon.isInt($('#diastolic').val())  || parseInt($('#diastolic').val()) < 20 ||
				parseInt($('#diastolic').val()) > 200) {
			ShsCommon.showMessageBox('提示', '请正确填写舒张压（低压），范围20-200', function(){$('#diastolic').focus();});
			return false;
		}		
		
		if (!ShsCommon.isInt($('#heartRate').val())  || parseInt($('#heartRate').val()) < 20 ||
				parseInt($('#heartRate').val()) > 200) {
			ShsCommon.showMessageBox('提示', '请正确填写心率，范围20-200', function(){$('#heartRate').focus();});
			return false;
		}
		
		if ($('#mTime').val() && $('#mTime').val().length == 5) {
			$('#mTime').val($('#mTime').val()+':00');
		}
		
		$(this).ajaxSubmit({
			success:BloodPressure.actionCallback,
	        type:'POST',   
	        dataType:'text', 
	        resetForm: false
		});
        return false; 
	});
	
	// bind other checkbox click event
	$('#symptoms input[name=otherSymptom]').blur(function(){
		if (ShsCommon.isEmpty($(this).val())) {
			$('#symptoms input:checkbox[value=7]').removeAttr('checked');
		} else {
			$('#symptoms input:checkbox[value=7]').attr('checked', 'checked');
		}
	});
	
	$('#reasons input[name=otherReason]').blur(function(){
		if (ShsCommon.isEmpty($(this).val())) {
			$('#reasons input:checkbox[value=6]').removeAttr('checked');
		} else {
			$('#reasons input:checkbox[value=6]').attr('checked', 'checked');
		}
	});
	
	$('#cancel').live('click', function(){
		ShsCommon.confirm('提示', '你确定要放弃当前操作码？', function(){
			BloodPressure.initForm();
		});
	});
	
	//BloodPressure.initCheckbox();
};

BloodPressure.tmp_v1 = 0;
BloodPressure.tmp_v2 = 0;
BloodPressure.initCheckbox = function() {
	// load to map
	$('#symptoms input:checkbox').each(function(){
		symptomsMap.put($(this).val(), $(this).attr('mapVal'));
	});
	$('#reasons input:checkbox').each(function(){
		reasonsMap.put($(this).val(), $(this).attr('mapVal'));
	});
	
	// symptom and reason select event	
	$('#systolic, #diastolic').focus(function(){
		var v1 = $('#systolic').val();
		var v2 = $('#diastolic').val();
		if (ShsCommon.isNumeric(v1) && ShsCommon.isNumeric(v2)) {
			BloodPressure.tmp_v1=v1;
			BloodPressure.tmp_v2=v2;
		} else {
			BloodPressure.tmp_v1=0;
			BloodPressure.tmp_v2=0;
		}
	}).blur(function(){
		var v1 = $('#systolic').val();
		var v2 = $('#diastolic').val();
		if (ShsCommon.isNumeric(v1) && ShsCommon.isNumeric(v2)) {
			if (BloodPressure.tmp_v1 == v1 && BloodPressure.tmp_v2 == v2) {
				return;
			}
			
			$('#reasons').html('');// 原因			
			$('#symptoms').html('');// 症状
			var systolic = parseInt(v1);
			var diastolic = parseInt(v2);
			var arr_symptom = [];
			var arr_reason = [];
			var flag = true;
			
			if (systolic >= 90 && systolic <= 139 && diastolic >= 60 && diastolic <= 89) {
				$('#symptoms').html('血压正常！');
				$('#reasons').html('血压正常！');
				flag = false;
			} else if (systolic > 139 || diastolic > 89) {
				// 血压高
				// 症状： 2.头痛 1.头晕 8.疲乏无力 9. 烦躁易怒  15.心悸心慌 3.耳鸣 17.失眠 7.其它
				// 原因： 1.情绪波动2.刚运动过3.睡眠不足4.长期高血压5.漏服降压药6.其它
				arr_symptom = [1, 2, 3, 8, 9, 15, 17, 7];
				arr_reason = [1, 2, 3, 4, 5, 6];
				
			} else if (systolic < 90 || diastolic < 60) {
				// 血压低
				// 症状： 1.头晕 5.出汗乏力 10. 口干舌燥 7.其它
				// 原因：7.长时间平卧 8.大量出汗了9 .腹泻 10.长期血压低11.过量服降压药6.其它
				arr_symptom = [1, 5, 10, 7];
				arr_reason = [7, 8, 9, 11, 11, 6];
			}
			
			if (flag) {
				for(var i in arr_symptom) {
					var key = arr_symptom[i]+"";
					if (symptomsMap.containsKey(key)) {
						$('#symptoms').append('<label class="checkbox inline"> <input type="checkbox" name="symptom" value="'+arr_symptom[i]+'" mapVal="'+symptomsMap.get(key)+'" /> '+symptomsMap.get(key)+'</label>');
					}
				}
				for(var i in arr_reason) {
					var key = arr_reason[i]+"";
					if (reasonsMap.containsKey(key)) {
						$('#reasons').append('<label class="checkbox inline"> <input type="checkbox" name="reason" value="'+arr_reason[i]+'" mapVal="'+reasonsMap.get(key)+'" /> '+reasonsMap.get(key)+'</label>');
					}
				}
				$('#symptoms').append('<div class="clearfix">其他：<input type="text" name="otherSymptom" disabled="disabled" /></div>');
				$('#reasons').append('<div class="clearfix">其他：<input type="text" name="otherReason" disabled="disabled" /></div>');
				$('#symptoms input:checkbox[value=7]').live('click', function(){
					if ($(this).attr('checked')) {
						$('#symptoms input[name=otherSymptom]').removeAttr('disabled');
					} else {
						$('#symptoms input[name=otherSymptom]').attr('disabled', 'disabled');
					}
				});
				$('#reasons input:checkbox[value=6]').live('click', function(){
					if ($(this).attr('checked')) {
						$('#reasons input[name=otherReason]').removeAttr('disabled');
					} else {
						$('#reasons input[name=otherReason]').attr('disabled', 'disabled');
					}
				});
			}
			
		}
	});
};

BloodPressure.actionCallback = function(data) {
	if (data && data == 0) {
		ShsCommon.showMessageBox('提示', '提交成功！');
		BloodPressure.initForm();
		$('.img_box img').each(function(){
			$(this).attr('src', $(this).parent('a').attr('href') + '?' + (new Date().getTime()));
		}); 
	} else {
		ShsCommon.showMessageBox('提示', '提交失败，请重试！');
	}
};