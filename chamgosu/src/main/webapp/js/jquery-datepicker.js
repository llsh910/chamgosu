/**
 * datepicker 사용하려면 이 js파일 import 시키면 됨
 * 
 * 
 * 사용법 - 해당 input의 id or class명을 적어놓음
 *  $('#search_date1').datepicker({
	  showOn: 'both',
	  buttonImage: '<%=request.getContextPath()%>/img/calendar.gif',
	  buttonImageOnly: true,
	  buttonText: "달력",
	  changeMonth: true,
	  changeYear: true,
	  showButtonPanel: true,
	  yearRange: '1990:c+3',
	  maxDate: ''
	  ,beforeShow: function (input) {addClearButton(input);}
	});
				 
 */

jQuery(function($){
		 jQuery.datepicker.regional['ko'] = {
		  closeText: '닫기',
		  prevText: '이전달',
		  nextText: '다음달',
		  currentText: '오늘',
		  monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
		  '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
		  monthNamesShort: ['1월','2월','3월','4월','5월','6월',
		  '7월','8월','9월','10월','11월','12월'],
		  dayNames: ['일','월','화','수','목','금','토'],
		  dayNamesShort: ['일','월','화','수','목','금','토'],
		  dayNamesMin: ['일','월','화','수','목','금','토'],
		  weekHeader: 'Wk',
		  dateFormat: 'yy-mm-dd',
		  firstDay: 0,
		  isRTL: false,
		  showMonthAfterYear: true,
		  yearSuffix: ''};
		  jQuery.datepicker.setDefaults($.datepicker.regional['ko']);

		//today select value org overrid fun
		jQuery.datepicker._gotoToday = function(id) {
				var today = new Date();
				var dateRef = jQuery("<td><a>" + today.getDate() + "</a></td>");
				this._selectDay(id, today.getMonth(), today.getFullYear(), dateRef);
		};

		
	});
	//add clear button
	function addClearButton (input) {
	    setTimeout(function () {
	        var buttonPane = $(input)
	        .datepicker("widget")
	        .find(".ui-datepicker-buttonpane");
	
	        jQuery("<button>", {
	            text: "지우기",
	            click: function () { jQuery.datepicker._clearDate(input); }
	        }).appendTo(buttonPane).addClass("ui-datepicker-clear ui-state-default ui-priority-primary ui-corner-all");
	    }, 1);
	}