(function($, undefined) {
	function MyTimepicker() {
		this._mainDivId = '_mytimepicker_div';
		this._showSecond = false;
		this.dpDiv = $('<div id="' + this._mainDivId
				+ '" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" ></div>');
	}

	$
			.extend(
					MyTimepicker.prototype,
					{
						_select : function(target) {
							var inst = $.mytimepicker;
							inst.input.val(inst.dpDiv.find('select[name=_hour]').val() + ":"
									+ inst.dpDiv.find('select[name=_minute]').val()
									+ (inst._showSecond ? ':' + inst.dpDiv.find('select[name=_second]').val() : '')
							);
							$.mytimepicker._hideTimepicker();
						},
						_generateHTML : function(inst) {
							var html = '';
							html += '\u65f6<select name="_hour" style="width:55px;">';
							for ( var h = 0; h <= 9; h++) {
								html += '<option value="0' + h + '">0' + h + '</option>';
							}
							for ( var h = 10; h <= 23; h++) {
								html += '<option value="' + h + '">' + h + '</option>';
							}
							html += '</select> \u5206<select name="_minute" style="width:55px;">';
							for ( var m = 0; m <= 9; m++) {
								html += '<option value="0' + m + '">0' + m + '</option>';
							}
							for ( var m = 10; m <= 59; m++) {
								html += '<option value="' + m + '">' + m + '</option>';
							}
							html += '</select>';
							html += (inst._showSecond?' \u79d2':'');
							html += '<select name="_second" style="width:55px;'+(inst._showSecond?'':'display:none;')+'">';
							for ( var s = 0; s <= 9; s++) {
								html += '<option value="0' + s + '">0' + s + '</option>';
							}
							for ( var s = 10; s <= 59; s++) {
								html += '<option value="' + s + '">' + s + '</option>';
							}
							html += '</select>';
							
							html += '<div class="ui-datepicker-buttonpane ui-widget-content">';
							html += '<button class="ui-state-default ui-priority-primary ui-corner-all" type="button" data-event="click" data-handler="ok">确定</button></div>';

							return html;
						},
						_updateTimepicker : function(inst) {
							inst.dpDiv.empty().append(this._generateHTML(inst));
							this._attachHandlers(inst);
						},
						_showTimepicker : function() {
							var inst = $.mytimepicker;
							$.mytimepicker._updateTimepicker(inst);
						},
						_hideTimepicker : function() {
							var inst = $.mytimepicker;
							inst.dpDiv.hide();
						},
						_checkExternalClick : function(event) {
							var $target = $(event.target);

							if (($target[0].id != $.mytimepicker._mainDivId && $target.parents('#'
									+ $.mytimepicker._mainDivId).length == 0))
								$.mytimepicker._hideTimepicker();
						},
						_attachHandlers : function(inst) {
							inst.dpDiv.find('[data-handler]').map(function () {
								var handler = {
										ok: function() {
											$.mytimepicker._select(this);
										}
								};
								$(this).bind(this.getAttribute('data-event'), handler[this.getAttribute('data-handler')]);
							});
						}

					});

	$.fn.mytimepicker = function() {
		if (!this.length) {
			return this;
		}

		if (!$.mytimepicker.initialized) {
			$(document).mousedown($.mytimepicker._checkExternalClick).find(document.body).append($.mytimepicker.dpDiv);
			$.mytimepicker.initialized = true;
		}

		this.click(function() {
			var inst = $.mytimepicker;
			$.mytimepicker._updateTimepicker(inst);
			
			if ($(this).val()) {
				var arr = $(this).val().split(":");
				if (arr[0].length == 1) {
					arr[0] = '0' + arr[0];
				}
				if (arr[1].length == 1) {
					arr[1] = '0' + arr[1];
				}
				inst.dpDiv.find('select[name=_hour]').val(arr[0]);
				inst.dpDiv.find('select[name=_minute]').val(arr[1]);
				if (inst._showSecond) {
					if (arr[2].length == 1) {
						arr[2] = '0' + arr[2];
					}
					inst.dpDiv.find('select[name=_second]').val(arr[2]);
				}
			}			

			var pos_top = $(this).offset().top + $(this).outerHeight(true); // 1
			var pos_left = $(this).offset().left;
			inst.dpDiv.css({
				position : "absolute",
				display : 'block',
				top : pos_top + "px",
				left : pos_left + "px"
			});
			inst.dpDiv.zIndex($(this).zIndex() + 1);
			inst.input = $(this);
		});

		return this;

	};

	$.mytimepicker = new MyTimepicker(); // singleton instance
	$.mytimepicker.initialized = false;

})(jQuery);