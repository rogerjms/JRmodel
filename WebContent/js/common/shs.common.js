$.ajaxSetup({
    contentType : "application/x-www-form-urlencoded; charset=utf-8",
    cache : false // close AJAX cache
    
});

var ShsCommon = {};

// constant defined
ShsCommon.RootUrl = "/userweb";

/**
 * id with # or .
 */
ShsCommon.datepicker = function(id, minDate, maxDate) {
	$(id).datepicker({
		changeMonth : true,
		changeYear : true
	});
	if (minDate instanceof Date) {
		$(id).datepicker("option", "minDate", minDate);
	}
	if (maxDate instanceof Date) {
		$(id).datepicker("option", "maxDate", maxDate);
	}
};

ShsCommon.datepickerRange = function(from, to) {
	$(from).datepicker({
		defaultDate : "+1w",
		changeMonth : true,
		numberOfMonths : 3,
		onSelect : function(selectedDate) {
			$(to).datepicker("option", "minDate", selectedDate);
		}
	});
	$(to).datepicker({
		defaultDate : "+1w",
		changeMonth : true,
		numberOfMonths : 3,
		onSelect : function(selectedDate) {
			$(from).datepicker("option", "maxDate", selectedDate);
		}
	});
};

ShsCommon.isEmpty = function(str) {
	if (str == undefined || str == null || str == '') {
		return true;
	}
	return false;
};

ShsCommon.isInt = function(str) {
	var patrn = /^[0-9]{1,20}$/;
	if (!patrn.exec(str))
		return false;
	return true;
};

ShsCommon.isFloat = function(str) {
	var patrn = /^([0]|[1-9]\d*|(0|[1-9]\d*)\.\d*[0-9])$/;
	return patrn.test(str);
};

ShsCommon.trim = function(s) {
	try {
		return s.replace(/(^\s*)|(\s*$)/g, "");
	} catch (e) {
		return s;
	}
};

/**
 * 消息对话框
 * 
 * @param title
 *            标题
 * @param text
 *            内容
 * @param funcOK
 *            回调函数
 * @param options
 *            参数
 */
ShsCommon.showMessageBox = function(title, text, funcOK, options) {
	if ($("#dialog-message").length == 0) {
		$(document.body)
				.append(
						'<div id="dialog-message" title="提示信息" style="display: none;">信息内容</div>');
	}

	var arrHtml = [];
	arrHtml[arrHtml.length] = '<p><span class="ui-icon ui-icon-info" style="float:left; margin:0 7px 20px 0;"></span>';
	arrHtml[arrHtml.length] = text;
	arrHtml[arrHtml.length] = '</p>';

	$("#dialog-message").html(arrHtml.join(''));
	$("#dialog-message").dialog(
			{
				title : title,
				modal : true,
				buttons : {
					'关闭' : function() {
						$(this).dialog("close");
					}
				},
				close : function() {
					if (typeof funcOK == "function") {
						if (options) {
							funcOK(options);
						} else {
							funcOK();
						}
					}
				},
				open : function(event, ui) {
					$('div[aria-labelledby="ui-dialog-title-dialog-message"]')
							.find('.ui-dialog-buttonpane button').button({
								disabled : false
							});
				}
			});

};

/*
 * 确认对话框 @title 标题 @text 内容 @funOK 确定回调函数 @funcCancel 取消回调函数 @options传入的参数对象
 */
ShsCommon.confirm = function(title, text, funcOK, funcCancel, options) {

	var obj = $("#dialog-confirm");
	if (obj.length == 0) {
		$(document.body)
				.append(
						'<div id="dialog-confirm" style="display: none;" title="dialog-confirm"><!--1--></div>');
	}

	var arrHtml = [];
	arrHtml[arrHtml.length] = '<p style="margin:15px 0;"><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>';
	arrHtml[arrHtml.length] = text;
	arrHtml[arrHtml.length] = '</p>';

	$("#dialog-confirm").html(arrHtml.join(''));
	$("#dialog-confirm").dialog({
		title : title,
		modal : true,
		buttons : {
			'确定' : function() {
				if (typeof funcOK == "function") {
					if (options) {
						funcOK(options);
					} else {
						funcOK();
					}
				}
				$(this).dialog("close");
			},
			'取消' : function() {
				if (typeof funcCancel == "function") {
					if (options) {
						funcCancel(options);
					} else {
						funcCancel();
					}
				}
				$(this).dialog("close");
			}
		}
	});
};

/**
 * 分页控件
 */
ShsCommon.initPagination = function(obj, callBack) {
	$(obj).pagination(parseInt($(obj).attr("totalcount")), {
		items_per_page : parseInt($(obj).attr("pagesize")),
		num_edge_entries : 2,
		num_display_entries : 5,
		prev_text : "上一页",
		next_text : "下一页",
		current_page : parseInt($(obj).attr("currentpage")),
		link_to : "javascript:void(0);",
		callback : callBack
	});
	try {
		parent.scrollTo();
	} catch (e) {
		// TODO: handle exception
	}
};

/**
 * @obj { valueFieldId 文本域ID fileDataId 文件域ID fileDataName 文件域name type 类型：food
 *      ,doctor jsessionid java后台session id callback 回调函数 function(data){} }
 */
ShsCommon.upload = function(obj) {
	var scriptData = {
		type : (typeof obj.type != undefined && obj.type != '' ? obj.type : ''),
		form_filedataname : (typeof obj.fileDataName != undefined
				&& obj.fileDataName != '' ? obj.fileDataName : ''),
		width : (typeof obj.width != undefined ? obj.width : '0'),
		height : (typeof obj.height != undefined ? obj.height : '0')
	};
	var sizeLimit = 102400;
	if (typeof obj.sizeLimit != undefined && obj.sizeLimit != '') {
		sizeLimit = obj.sizeLimit;
	}
	$(obj.fileDataId).uploadify(
			{
				'method' : 'post',
				'uploader' : ShsCommon.RootUrl
						+ '/js/common/uploadify/uploadify.v2.1.4.swf',
				'script' : ShsCommon.RootUrl
						+ '/uploadify/img'
						+ (typeof obj.jsessionid != undefined
								&& obj.jsessionid != '' ? ';jsessionid='
								+ obj.jsessionid : ''),
				'cancelImg' : ShsCommon.RootUrl
						+ '/js/common/uploadify/cancel.png',
				'fileDataName' : obj.fileDataName,
				'scriptData' : scriptData,
				'folder' : '/uploads',
				'buttonImg' : ShsCommon.RootUrl
						+ '/js/common/uploadify/btn_upload.gif',
				'width' : 64,
				'height' : 36,
				'wmode' : 'transparent',
				'removeCompleted' : true,
				'multi' : false,
				'auto' : true,
				'fileExt' : '*.jpg;*.gif;*.png',
				'fileDesc' : '图片(.JPG, .GIF, .PNG) 大小('
						+ ShsCommon.formatSizeData(sizeLimit) + ')',
				'sizeLimit' : sizeLimit,

				'onSelectOnce' : function(event, data) {
					// alert(data.filesSelected + ' files have been
					// added to the queue.');
				},
				'onComplete' : function(event, ID, fileObj, response, data) {
					// response:
					// {"result":"success","fileUrl":"包含目录URL","fileSize":"大小","fileName":"文件名","msg":"出错消息"}
					var result = JSON.parse(response);
					result.valueFieldId = obj.valueFieldId;
					if (typeof obj.callback == "function") {
						obj.callback(result);
					}
				},
				'onAllComplete' : function(event, data) {
					// alert(data.filesUploaded + ' files uploaded,
					// ' + data.errors + ' errors.');
					/*
					 * var str = ""; for(var item in data) { str += ","+item +
					 * ":" + data[item]; }
					 */
				},
				'onError' : function(event, ID, fileObj, errorObj) {
					$('.uploadifyQueue').hide();
					var msg = errorObj.type;
					if (msg = "File Size") {
						msg = "文件太大！";
					}
					ShsCommon.showMessageBox('出错', '错误代码：' + errorObj.info
							+ '<br/>错误类型：' + msg);
				}
			});

	$('.uploadifyQueue').hide();
};
ShsCommon.formatSizeData = function(sizeLimit) {
	var kb = "";
	try {
		sizeLimit = parseInt(sizeLimit, 10);
	} catch (e) {
		sizeLimit = 0;
	}
	if (sizeLimit > 1024) {
		sizeLimit = sizeLimit / 1024;
		kb = "KB";
	}
	if (sizeLimit > 1024) {
		sizeLimit = sizeLimit / 1024;
		kb = "MB";
	}
	if (sizeLimit > 1024) {
		sizeLimit = sizeLimit / 1024;
		kb = "GB";
	}
	return sizeLimit + kb;
};

ShsCommon.scrollTo = function(selector) {
	$(selector).ScrollTo(800);
};

ShsCommon.WeiboShare = function(url, title, pic) {
	var _w = 24, _h = 24;
	var param = {
		url : url,
		type : '2',
		count : '',
		appkey : '',
		title : title,
		pic : pic,
		ralateUid : '2688949441',
		language : 'zh_cn',
		rnd : new Date().valueOf()
	}
	var temp = [];
	for ( var p in param) {
		temp.push(p + '=' + encodeURIComponent(param[p] || ''))
	}
	document
			.write('<iframe allowTransparency="true" frameborder="0" scrolling="no" src="http://hits.sinajs.cn/A1/weiboshare.html?'
					+ temp.join('&')
					+ '" width="'
					+ _w
					+ '" height="'
					+ _h
					+ '"></iframe>');
}

/**
 * 
 * @param strFormat
 *            yyyy-MM-dd HH:mm:ss
 * @param date
 * @return
 */
function formatDate(strFormat, date) {

	try {
		if (!(date instanceof Date)) {
			if (typeof (date) == 'number') {
				date = new Date(date);
			} else {
				return "";
			}
		}

		var tempFormat = strFormat == undefined ? 'yyyy-MM-dd HH:mm:ss'
				: strFormat;
		var dates = {
			'M+' : date.getMonth() + 1,
			'd+' : date.getDate(),
			'H+' : date.getHours(),
			'm+' : date.getMinutes(),
			's+' : date.getSeconds()
		};
		if (/(y+)/.test(tempFormat)) {
			var fullYear = date.getFullYear() + '';
			var year = RegExp.$1.length == 4 ? fullYear : fullYear
					.substr(4 - RegExp.$1.length);
			tempFormat = tempFormat.replace(RegExp.$1, year);
		}
		for ( var i in dates) {
			if (new RegExp('(' + i + ')').test(tempFormat)) {
				var target = RegExp.$1.length == 1 ? dates[i]
						: ('0' + dates[i]).substr(('' + dates[i]).length - 1);
				tempFormat = tempFormat.replace(RegExp.$1, target);
			}
		}
		return tempFormat === strFormat ? date.toLocaleString() : tempFormat;
	} catch (e) {
		return "";
	}
}