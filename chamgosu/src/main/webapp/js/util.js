//레이어 탑
var position_top = function(){
	var scroll_top = jQuery(window).scrollTop();
	scroll_top = scroll_top + 40;

	return scroll_top;
};

//레이어 가로 중앙
var position_left = function(v_width){
	var left = ((jQuery('body').width() - parseInt(v_width)) / 2);
	return left;
};

//-------------------------------------------------------------------------------
//정규식 특수문자 검증
var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
//정규식 띄어쓰기 검증
var regSpace = /\s/g;
var pwdCheck = /^.*(?=^.{7,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
//정규식 숫자 검증
var regNum_check = /^[0-9]*$/;
//정규식 핸드폰 숫자 검증
var regPhone_check = /^[0-9]{3,4}$/;
//정규식 사업자번호 검증
var regCpnNum1_check = /^[0-9]{3}$/;
var regCpnNum2_check = /^[0-9]{2}$/;
var regCpnNum3_check = /^[0-9]{5}$/;
//-------------------------------------------------------------------------------
function toNumber(str){
  str = str.toString();
  var len = str.length;
  var num = "";
  
  for(i=0; i<len; i++){
   int = parseInt(str.charAt(i)); 
   if(int >= 0 && int <= 9) num += str.charAt(i);
  }
  return parseInt(num);
}
	 
 function Number_Format(val){
  if(val){
   val = toNumber(val).toString();
   var len = val.length;
      var str = "";
   if(len > 3){
    var in_c = len % 3;
    if(!in_c) in_c = 3;
    
    for(n = 0; n < len; n++){
     if(n == in_c){
      str += ",";
      in_c = 3 + in_c;
     }
     str += val.charAt(n);
       }
    return str;
   }else{
    return val;
   }
  }
 } 