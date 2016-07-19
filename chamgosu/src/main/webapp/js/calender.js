/* 달력 레이어 */
$(document).ready(function(){
	// 달력에 날짜 값들을 셋팅 [ID , 날짜 숫자(연도 or 월 or 일)];
	Calendar_setYear('startYear','');
	Calendar_setMonth('startMonth','');
	Calendar_setDay('startDay','');
	Calendar_setYear('startYear1','');
	Calendar_setMonth('startMonth1','');
	Calendar_setDay('startDay1','');
	Calendar_setYear('startYear2','');
	Calendar_setMonth('startMonth2','');
	Calendar_setDay('startDay2','');
	Calendar_setYear('startYear3','');
	Calendar_setMonth('startMonth3','');
	Calendar_setDay('startDay3','');
	Calendar_setYear('endYear','');
	Calendar_setMonth('endMonth','');
	Calendar_setDay('endDay','');
	Calendar_setYear('endYear1','');
	Calendar_setMonth('endMonth1','');
	Calendar_setDay('endDay1','');
	Calendar_setYear('endYear2','');
	Calendar_setMonth('endMonth2','');
	Calendar_setDay('endDay2','');
	Calendar_setYear('endYear3','');
	Calendar_setMonth('endMonth3','');
	Calendar_setDay('endDay3','');
});

var calendar_ObjYear, calendar_ObjMonth, calendar_ObjDay;
var calendar_ThisYear, calendar_ThisMonth, calendar_ThisDay;
var calendar_PrevYear, Calendar_NextYear;
var calendar_PrevMonth, Calendar_NextMonth;

function Calendar(yearId, monthId, dayId){
	var varYear, varMonth, varDay;
	calendar_ObjYear = "";
	calendar_ObjMonth = "";
	calendar_ObjDay = "";

	if(monthId && dayId){

		if(yearId!=""){ varYear = $("#"+yearId).val(); }
		if(monthId!=""){ varMonth = $("#"+monthId).val(); }
		if(dayId!=""){ varDay = $("#"+dayId).val(); }
		
		calendar_ObjYear = yearId;
		calendar_ObjMonth = monthId;
		calendar_ObjDay = dayId;
	}else{

		varYear = ''; 
		varMonth = ''; 
		varDay = ''; 

		calendar_ObjYear = yearId;
	}
	
	if(varYear=="" || varMonth=="" || varDay=="") { 
		var DateToday = new Date();
		varYear = DateToday.getFullYear();
		varMonth = DateToday.getMonth()+1;
		varDay = DateToday.getDate(); 
	}

	calendar_ThisYear = varYear;
	calendar_ThisMonth = varMonth;
	calendar_ThisDay = varDay;

	
	Calendar_Show();
}



function Calendar_Show(){
	$("#CalendarObj").remove();
	Cal_HTML = "";
	Cal_HTML+= '<div id="CalendarObj" class="calendarLayer" style="display:none;">';
	Cal_HTML+= '<a href="javascript:void(0);" onclick="Calendar_Hidden();" class="pop_close" title="닫기">닫기</a>';
	Cal_HTML+= '	<div class="calMove">';
	Cal_HTML+= '	<button type="button" style="cursor:pointer" class="calendar_prev" onclick="Calendar_prevMonth();">이전</button>';
	Cal_HTML+= '	<select id="Calendar_MonthSelect" title="월 선택" class="selbox" style="width:60px;" onchange="Calendar_selMove();">';	
	Cal_HTML+= '		<option value="1">1월</option>';
	Cal_HTML+= '		<option value="2">2월</option>';
	Cal_HTML+= '		<option value="3">3월</option>';
	Cal_HTML+= '		<option value="4">4월</option>';
	Cal_HTML+= '		<option value="5">5월</option>';
	Cal_HTML+= '		<option value="6">6월</option>';
	Cal_HTML+= '		<option value="7">7월</option>';
	Cal_HTML+= '		<option value="8">8월</option>';
	Cal_HTML+= '		<option value="9">9월</option>';
	Cal_HTML+= '		<option value="10">10월</option>';
	Cal_HTML+= '		<option value="11">11월</option>';
	Cal_HTML+= '		<option value="12">12월</option>';
	Cal_HTML+= '	</select>';
	Cal_HTML+= '	<select id="Calendar_YearSelect" title="년 선택" class="selbox" style="width:75px;" onchange="Calendar_selMove();"> ';
	Cal_HTML+= '	</select>';
	Cal_HTML+= '	<button type="button" style="cursor:pointer" class="calendar_next" onclick="Calendar_nextMonth();">다음</button>';
	Cal_HTML+= '</div>';
	Cal_HTML+= '<table class="calendar" summary="달력 기간설정">';
	Cal_HTML+= '<caption>달력</caption>';
	Cal_HTML+= '<colgroup>';
	Cal_HTML+= '<col>';
	Cal_HTML+= '</colgroup>';
	Cal_HTML+= '<thead>';
	Cal_HTML+= '<tr>';
	Cal_HTML+= '    <th class="sun" scope="col">일</th>';
	Cal_HTML+= '    <th scope="col">월</th>';
	Cal_HTML+= '    <th scope="col">화</th>';
	Cal_HTML+= '    <th scope="col">수</th>';
	Cal_HTML+= '	<th scope="col">목</th>';
	Cal_HTML+= '	<th scope="col">금</th>';
	Cal_HTML+= '	<th class="sat" scope="col">토</th>';
	Cal_HTML+= '</tr>';
	Cal_HTML+= '</thead>';
	Cal_HTML+= '<tbody>';
	Cal_HTML+= Calendar_Design(calendar_ThisYear, calendar_ThisMonth, calendar_ThisDay);
	Cal_HTML+= '</tbody>';
	Cal_HTML+= '</table>';
	Cal_HTML+= '</div>';	
	$("#"+calendar_ObjYear).parent().append(Cal_HTML);
	$("#CalendarObj").css({"left" : $("#"+calendar_ObjYear).position().left});
	$("#CalendarObj").css({"top" : $("#"+calendar_ObjYear).position().top + 30});
	$("#CalendarObj").fadeIn(500);

	$("#Calendar_MonthSelect").val(calendar_ThisMonth);
	Calendar_yearSelectBox();
}


function Calendar_Hidden(){
	$("#CalendarObj").remove();
}

function Calendar_Select(SelectDate){
	var selectYear = parseInt(SelectDate.substring(0,4),10);
	var selectMonth = parseInt(SelectDate.substring(5,7),10);
	var selectDay = parseInt(SelectDate.substring(8,10),10);	
	$("#"+calendar_ObjYear).children().remove();

	if(calendar_ObjMonth && calendar_ObjDay){

		for(i=parseInt(calendar_ThisYear,10)-5; i<parseInt(calendar_ThisYear,10)+5;i++){
			$("#"+calendar_ObjYear).append('<option value="'+i+'">'+i+'년</option>');
		}	
		$("#"+calendar_ObjYear).val(selectYear);
		$("#"+calendar_ObjMonth).val(selectMonth);
		$("#"+calendar_ObjDay).val(selectDay);
	}else{

		$("#"+calendar_ObjYear).val(SelectDate);
	}

	Calendar_Hidden();
}

function Calendar_prevYear(){
	$("#CalendarObj table tbody").children().remove();
	$("#CalendarObj table tbody").append(Calendar_Design(calendar_ThisYear-1, calendar_ThisMonth, calendar_ThisDay));
	Calendar_yearSelectBox();
}
function Calendar_nextYear(){
	$("#CalendarObj table tbody").children().remove();
	$("#CalendarObj table tbody").append(Calendar_Design(calendar_ThisYear+1, calendar_ThisMonth, calendar_ThisDay));
	Calendar_yearSelectBox();
}
function Calendar_prevMonth(){
	$("#CalendarObj table tbody").children().remove();
	$("#CalendarObj table tbody").append(Calendar_Design(calendar_PrevYear, calendar_PrevMonth, calendar_ThisDay));
	Calendar_yearSelectBox();
	$("#Calendar_YearSelect").val(calendar_ThisYear);
	$("#Calendar_MonthSelect").val(calendar_ThisMonth);
}
function Calendar_nextMonth(){
	$("#CalendarObj table tbody").children().remove();
	$("#CalendarObj table tbody").append(Calendar_Design(calendar_NextYear, calendar_NextMonth, calendar_ThisDay));
	Calendar_yearSelectBox();
	$("#Calendar_YearSelect").val(calendar_ThisYear);
	$("#Calendar_MonthSelect").val(calendar_ThisMonth);
}
function Calendar_selMove(){
	$("#CalendarObj table tbody").children().remove();
	$("#CalendarObj table tbody").append(Calendar_Design($("#Calendar_YearSelect").val(), $("#Calendar_MonthSelect").val(), calendar_ThisDay));
	Calendar_yearSelectBox();
	$("#Calendar_YearSelect").val(calendar_ThisYear);
	$("#Calendar_MonthSelect").val(calendar_ThisMonth);
}
function Calendar_yearSelectBox(ID){
	$("#Calendar_YearSelect").children().remove();
	for(i=parseInt(calendar_ThisYear,10)-5; i<parseInt(calendar_ThisYear,10)+5;i++){
		$("#Calendar_YearSelect").append('<option value="'+i+'">'+i+'년</option>');
	}
	$("#Calendar_YearSelect").val(calendar_ThisYear);
}

function Calendar_change(vYear, vMonth, vDay){
	var Months_day = new Array(0,31,28,31,30,31,30,31,31,30,31,30,31);
	var ThisYear = parseInt($("#"+vYear).val(),10);
	var ThisMonth = parseInt($("#"+vMonth).val(),10);
	var ThisDay = parseInt($("#"+vDay).val(),10);

	if ((ThisYear % 4)==0) {
		if ((ThisYear % 100) == 0) {
			if ((ThisYear % 400) == 0) {
				Months_day[2] = 29;
			}
		} else {
			Months_day[2] = 29;
		}
	}

	if(ThisDay > Months_day[ThisMonth]){ ThisDay = Months_day[ThisMonth]; }

	$("#"+vYear).children().remove();
	for(i=ThisYear-5; i<ThisYear+5;i++){
		$("#"+vYear).append('<option value="'+i+'">'+i+'년</option>');
	}	

	$("#"+vDay).children().remove();
	for(i=1; i<Months_day[ThisMonth]+1;i++){
		$("#"+vDay).append('<option value="'+i+'">'+i+'일</option>');
	}
	$("#"+vYear).val(ThisYear);
	$("#"+vMonth).val(ThisMonth);
	$("#"+vDay).val(ThisDay);
}

function Calendar_setYear(ID, DATE){
	var datToday = new Date();
	var todayYear = datToday.getFullYear().toString();
	if(DATE==""){ DATE = todayYear; }
	$("#"+ID).children().remove();
	for(i=parseInt(DATE,10)-5; i<parseInt(DATE,10)+5;i++){
		$("#"+ID).append('<option value="'+i+'">'+i+'년</option>');
	}
	$("#"+ID).val(DATE);
}
function Calendar_setMonth(ID, DATE){
	var datToday = new Date();
	var todayMonth = (datToday.getMonth()+1).toString();
	if(DATE==""){ DATE = todayMonth; }
	$("#"+ID).children().remove();
	for(i=1; i<=12;i++){
		$("#"+ID).append('<option value="'+i+'">'+i+'월</option>');
	}
	$("#"+ID).val(DATE);
}

function Calendar_setDay(ID, DATE){
	var datToday = new Date();
	var todayDay = datToday.getDate().toString();
	if(DATE==""){ DATE = todayDay; }
	$("#"+ID).children().remove();
	for(i=1; i<=31;i++){
		$("#"+ID).append('<option value="'+i+'">'+i+'일</option>');
	}
	$("#"+ID).val(DATE);
}

function Calendar_setTermToday(sYear,sMonth,sDay,eYear,eMonth,eDay){
	var datToday = new Date();
	var todayYear = datToday.getFullYear().toString();
	var todayMonth = (datToday.getMonth()+1).toString();
	var todayDay = datToday.getDate().toString();
	$("#"+sYear).val(todayYear);
	$("#"+sMonth).val(todayMonth);
	$("#"+sDay).val(Calendar_TLS(todayDay));
	$("#"+eYear).val(todayYear);
	$("#"+eMonth).val(todayMonth);
	$("#"+eDay).val(Calendar_TLS(todayDay));
}
function Calendar_setTerm1w(sYear,sMonth,sDay,eYear,eMonth,eDay){
	var datToday = new Date();
	var todayYear = datToday.getFullYear().toString();
	var todayMonth = (datToday.getMonth()+1).toString();
	var todayDay = datToday.getDate().toString();
	var setDate = new Date(todayYear, todayMonth-1, todayDay-7);
	var setYear = setDate.getFullYear().toString();
	var setMonth = (setDate.getMonth()+1).toString();
	var setDay = setDate.getDate().toString();
	$("#"+sYear).val(setYear);
	$("#"+sMonth).val(setMonth);
	$("#"+sDay).val(setDay);
	$("#"+eYear).val(todayYear);
	$("#"+eMonth).val(todayMonth);
	$("#"+eDay).val(todayDay);
}
function Calendar_setTerm1m(sYear,sMonth,sDay,eYear,eMonth,eDay){
	var datToday = new Date();
	var todayYear = datToday.getFullYear().toString();
	var todayMonth = (datToday.getMonth()+1).toString();
	var todayDay = datToday.getDate().toString();
	var setDate = new Date(todayYear, todayMonth-2, todayDay);
	var setYear = setDate.getFullYear().toString();
	var setMonth = (setDate.getMonth()+1).toString();
	var setDay = setDate.getDate().toString();
	$("#"+sYear).val(setYear);
	$("#"+sMonth).val(setMonth);
	$("#"+sDay).val(setDay);
	$("#"+eYear).val(todayYear);
	$("#"+eMonth).val(todayMonth);
	$("#"+eDay).val(todayDay);
}
function Calendar_setTerm3m(sYear,sMonth,sDay,eYear,eMonth,eDay){
	var datToday = new Date();
	var todayYear = datToday.getFullYear().toString();
	var todayMonth = (datToday.getMonth()+1).toString();
	var todayDay = datToday.getDate().toString();
	var setDate = new Date(todayYear, todayMonth-4, todayDay);
	var setYear = setDate.getFullYear().toString();
	var setMonth = (setDate.getMonth()+1).toString();
	var setDay = setDate.getDate().toString();
	$("#"+sYear).val(setYear);
	$("#"+sMonth).val(setMonth);
	$("#"+sDay).val(setDay);
	$("#"+eYear).val(todayYear);
	$("#"+eMonth).val(todayMonth);
	$("#"+eDay).val(todayDay);
}
function Calendar_setTerm6m(sYear,sMonth,sDay,eYear,eMonth,eDay){
	var datToday = new Date();
	var todayYear = datToday.getFullYear().toString();
	var todayMonth = (datToday.getMonth()+1).toString();
	var todayDay = datToday.getDate().toString();
	var setDate = new Date(todayYear, todayMonth-7, todayDay);
	var setYear = setDate.getFullYear().toString();
	var setMonth = (setDate.getMonth()+1).toString();
	var setDay = setDate.getDate().toString();
	$("#"+sYear).val(setYear);
	$("#"+sMonth).val(setMonth);
	$("#"+sDay).val(setDay);
	$("#"+eYear).val(todayYear);
	$("#"+eMonth).val(todayMonth);
	$("#"+eDay).val(todayDay);
}
function Calendar_setTerm12m(sYear,sMonth,sDay,eYear,eMonth,eDay){
	var datToday = new Date();
	var todayYear = datToday.getFullYear().toString();
	var todayMonth = (datToday.getMonth()+1).toString();
	var todayDay = datToday.getDate().toString();
	var setDate = new Date(todayYear, todayMonth-13, todayDay);
	var setYear = setDate.getFullYear().toString();
	var setMonth = (setDate.getMonth()+1).toString();
	var setDay = setDate.getDate().toString();
	$("#"+sYear).val(setYear);
	$("#"+sMonth).val(setMonth);
	$("#"+sDay).val(setDay);
	$("#"+eYear).val(todayYear);
	$("#"+eMonth).val(todayMonth);
	$("#"+eDay).val(todayDay);
}
function Calendar_setTerm24m(sYear,sMonth,sDay,eYear,eMonth,eDay){
	var datToday = new Date();
	var todayYear = datToday.getFullYear().toString();
	var todayMonth = (datToday.getMonth()+1).toString();
	var todayDay = datToday.getDate().toString();
	var setDate = new Date(todayYear, todayMonth-25, todayDay);
	var setYear = setDate.getFullYear().toString();
	var setMonth = (setDate.getMonth()+1).toString();
	var setDay = setDate.getDate().toString();
	$("#"+sYear).val(setYear);
	$("#"+sMonth).val(setMonth);
	$("#"+sDay).val(setDay);
	$("#"+eYear).val(todayYear);
	$("#"+eMonth).val(todayMonth);
	$("#"+eDay).val(todayDay);
}
function Calendar_setTerm36m(sYear,sMonth,sDay,eYear,eMonth,eDay){
	var datToday = new Date();
	var todayYear = datToday.getFullYear().toString();
	var todayMonth = (datToday.getMonth()+1).toString();
	var todayDay = datToday.getDate().toString();
	var setDate = new Date(todayYear, todayMonth-37, todayDay);
	var setYear = setDate.getFullYear().toString();
	var setMonth = (setDate.getMonth()+1).toString();
	var setDay = setDate.getDate().toString();
	$("#"+sYear).val(setYear);
	$("#"+sMonth).val(setMonth);
	$("#"+sDay).val(setDay);
	$("#"+eYear).val(todayYear);
	$("#"+eMonth).val(todayMonth);
	$("#"+eDay).val(todayDay);
}

function Calendar_Design(sYear, sMonth, sDay){
	var Months_day = new Array(0,31,28,31,30,31,30,31,31,30,31,30,31);
	var Month_Val = new Array("01","02","03","04","05","06","07","08","09","10","11","12");
	var intThisYear = new Number(), intThisMonth = new Number(), intThisDay = new Number();
	datToday = new Date();
	var Cal_Last = false;
	
	intThisYear = parseInt(sYear,10);
	intThisMonth = parseInt(sMonth,10);
	intThisDay = parseInt(sDay,10);
	
	if (intThisYear == 0) intThisYear = datToday.getFullYear();
	if (intThisMonth == 0) intThisMonth = parseInt(datToday.getMonth(),10)+1;
	if (intThisDay == 0) intThisDay = datToday.getDate();
	
	switch(intThisMonth) {
		case 1:
				intPrevYear = intThisYear -1;
				intPrevMonth = 12;
				intNextYear = intThisYear;
				intNextMonth = 2;
				break;
		case 12:
				intPrevYear = intThisYear;
				intPrevMonth = 11;
				intNextYear = intThisYear + 1;
				intNextMonth = 1;
				break;
		default:
				intPrevYear = intThisYear;
				intPrevMonth = parseInt(intThisMonth,10) - 1;
				intNextYear = intThisYear;
				intNextMonth = parseInt(intThisMonth,10) + 1;
				break;
	}
	intPPyear = intThisYear-1;
	intNNyear = intThisYear+1;

	NowThisYear = datToday.getFullYear();
	NowThisMonth = datToday.getMonth()+1;
	NowThisDay = datToday.getDate();
	
	datFirstDay = new Date(intThisYear, intThisMonth-1, 1);
	intFirstWeekday = datFirstDay.getDay();
	intThirdWeekday = intFirstWeekday;
	datThisDay = new Date(intThisYear, intThisMonth, intThisDay);

	intPrintDay = 1;
	secondPrintDay = 1;
	thirdPrintDay = 1;

	Stop_Flag = 0;
	
	if ((intThisYear % 4)==0) {
		if ((intThisYear % 100) == 0) {
			if ((intThisYear % 400) == 0) {
				Months_day[2] = 29;
			}
		} else {
			Months_day[2] = 29;
		}
	}
	intLastDay = Months_day[intThisMonth];
	
	if(intPrevMonth == 12){ var varPrevYear = intThisYear - 1; }else{ var varPrevYear = intThisYear; };
	if(intNextMonth == 1){ var varNextYear = intThisYear + 1; }else{ var varNextYear = intThisYear; };

	calendar_ThisYear = sYear;
	calendar_ThisMonth = sMonth;
	calendar_ThisDay = sDay;	
	calendar_PrevYear = varPrevYear;
	calendar_PrevMonth = intPrevMonth;
	calendar_NextYear = varNextYear;
	calendar_NextMonth = intNextMonth;
	
	
	Cal_HTML = "";
	for (intLoopWeek=1; intLoopWeek < 7; intLoopWeek++) {
		Cal_HTML += "<tr>"
		for (intLoopDay=1; intLoopDay <= 7; intLoopDay++) {
			if (intThirdWeekday > 0) {
				var Cal_PrevMonthDay = (Months_day[intPrevMonth]+1)-intThirdWeekday;
				var PrevDate = varPrevYear+"-"+Calendar_TLS(intPrevMonth).toString()+"-"+Calendar_TLS(Cal_PrevMonthDay).toString();
				Cal_HTML += '<td>'
				Cal_HTML += '<a href="javascript:void(0);">';
				intThirdWeekday--;
			} else {
				if (thirdPrintDay > intLastDay) {
					var Cal_NextMonthDay = thirdPrintDay - intLastDay;
					var NextDate = varNextYear+"-"+Calendar_TLS(intNextMonth).toString()+"-"+Calendar_TLS(Cal_NextMonthDay).toString();
					Cal_HTML += '<td>'
					Cal_HTML += '<a href="javascript:void(0);">';
				} else {
					var ThisDate = intThisYear+"-"+Calendar_TLS(intThisMonth).toString()+"-"+Calendar_TLS(thirdPrintDay).toString();
					Cal_HTML += '<td title="'+ThisDate+'" class="'+Calendar_weekClass(intLoopDay);
					if (intThisYear.toString() == today_Year && intThisMonth.toString() == today_Month && thirdPrintDay.toString() == today_Day){
						Cal_HTML += " today";
					}
					Cal_HTML += '">'
					Cal_HTML += '<a href="javascript:void(0);" onclick="Calendar_Select(\''+ThisDate+'\');">';
					var today_Year = datToday.getFullYear().toString();
					var today_Month = (datToday.getMonth()+1).toString();
					var today_Day = datToday.getDate().toString();
					Cal_HTML += thirdPrintDay;
				}
				thirdPrintDay++;
				
				if (thirdPrintDay > intLastDay) {
					Stop_Flag = 1;
				}
			}
			Cal_HTML += "</a></td>";
		}
		Cal_HTML += "</tr>";
		if (Stop_Flag==1) break;
	}
	return Cal_HTML;
}

function Calendar_TLS(d) {	// Two Length String
	var str = new String();	
	if (parseInt(d,10) < 10) {
		str = "0" + parseInt(d,10);
	} else {
		str = "" + parseInt(d,10);
	}
	return str;
}

function Calendar_weekClass(VAL){
	switch(VAL) {
		case 1:
			return "sun"; break;
		case 7:
			return "sat"; break;
		default:
			return ""; break;
	}				
}