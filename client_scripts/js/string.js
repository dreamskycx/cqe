
function HTMLEncode(str){
	var sReturn="";
	sReturn=str.replace(/&/g,"&amp;");
	//sReturn=str.replace(/ /g,"&nbsp;");
	sReturn=sReturn.replace(/</g,"&lt;");
	sReturn=sReturn.replace(/</g,"&lt;");
	sReturn=sReturn.replace(/>/g,"&gt;");
	sReturn=sReturn.replace(/\"/g,"&quot;");
	sReturn=sReturn.replace(/\*/g,"");
	
	return sReturn;
}

function trim(str){
	if(str==null) return "";
    return str.replace(/(^\s*)|(\s*$)/g, "");
}

function isEmpty(str) {
   if(str==null) return true;
   return trim(str).length==0
}

function getStrLen(str){
	var iLen=0;
	var oldLen=str.length;
	for(var i=0;i<oldLen;i++){
		if(str.charCodeAt(i)>128){
			iLen++;
		}	
		iLen++;
	}
	return iLen;
}

function isNumeric(str,bInt){
	var nDotCount=0;
	if(isEmpty(str)) return false;
	for(var i=0;i<str.length;i++){
		if(str.charCodeAt(i)<48||str.charCodeAt(i)>57){
			if(str.charAt(i)=="."){
				nDotCount++;
				if(nDotCount<=1){
					continue;
				}
			}
			return false;
		}
	}
	if(bInt){
		return (nDotCount==0);
	}
	else{
		return true;
	}
}

function isInt(str){
	return isNumeric(str,true);
}

function isFloat(sCheck) {
    if (isEmpty(sCheck)) {
        return false;
    }
    if (sCheck.indexOf(".") != -1) {
        var dotPos = sCheck.indexOf(".");
        sCheck = sCheck.substring(0, dotPos) + sCheck.substring(dotPos + 1);
    }
    if (!isNumeric(sCheck)) return false;
    return true;
}

function isDate(str){
	str=trim(str);
	if(str==""){
		return false;
	}
	var pos=str.indexOf(" ");
	var sDate="",sTime="";
	if(pos!=-1){
		sDate=str.substring(0,pos);
		sTime=str.substring(pos+1);
	}
	else{
		sDate=str;
	}
	if(sDate.length>0){
		sDate=sDate.replace(/\\/g,"-");
		var aD=sDate.split("-");
		if(aD.length!=3){
			return false;
		}
		if(aD[0].length==2){
			aD[0]="20"+aD[0];
		}
		if(!isInt(aD[0])||!isInt(aD[1])||!isInt(aD[2])){
			return false;
		}
		if(parseInt(aD[1])>12||parseInt(aD[2])>31){
			return false;
		}
	}
	if(sTime.length>0){
		var pos1=sTime.indexOf(":");
		var pos2=-1;
		if(pos1!=-1){
			pos2=sTime.indexOf(":",pos1+1);	
			if(pos2==-1){
				sTime+=":00";
			}
		}
		else{
			sTime+=":00:00";
		}
		var aT=sTime.split(":");
		if(aT.length>3){
			return false;
		}
		if(!isInt(aT[0])||!isInt(aT[1])){
			return false;
		}
		if(parseInt(aT[0])>=60||parseInt(aT[1])>=60){
			return false;
		}
		if(!isNumeric(aT[2])){
			return false;
		}
		if(parseFloat(aT[2])>=60){
			return false
		}
	}
	return true;
}

function getDate(str){
	if(typeof(str)=="object"){
		try{
			str=str.getYear()+"-"+str.getMonth()+"-"+str.getDate();	
		}
		catch(e){
			return null;
		}
	}
	str=trim(str);
	if(str==""){
		return null;
	}
	var pos=str.indexOf(" ");
	var sDate="",sTime="";
	if(pos!=-1){
		sDate=str.substring(0,pos);
		sTime=str.substring(pos+1);
	}
	else{
		sDate=str;
	}
	if(sDate.length>0){
		sDate=sDate.replace(/\\/g,"-");
		var aD=sDate.split("-");
		if(aD.length!=3){
			return null;
		}
		if(aD[0].length==2){
			aD[0]="20"+aD[0];
		}
		if(!isInt(aD[0])||!isInt(aD[1])||!isInt(aD[2])){
			return null;
		}
		if(parseInt(aD[1])>12||parseInt(aD[2])>31){
			return null;
		}
	}
	else {
	    return null;
	}
	if(sTime.length>0){
		var pos1=sTime.indexOf(":");
		var pos2=-1;
		if(pos1!=-1){
			pos2=sTime.indexOf(":",pos1+1);	
			if(pos2==-1){
				sTime+=":00";
			}
		}
		else{
			sTime+=":00:00";
		}
		var aT=sTime.split(":");
		if(aT.length>3){
			return null;
		}
		if(!isInt(aT[0])||!isInt(aT[1])){
			return null;
		}
		if(parseInt(aT[0])>=60||parseInt(aT[1])>=60){
			return null;
		}
		if(!isNumeric(aT[2])){
			return null;
		}
		if(parseFloat(aT[2])>=60){
			return null
		}
	}
	else {
		aT = "00:00:00".split(":");
	}
	return new Date(aD[0],aD[1]-1,aD[2],aT[0],aT[1],aT[2]);
}

function  isHttpAddress(str){
	var sTemp=trim(str).toUpperCase();
	return((sTemp.indexOf("HTTP://")==0&&sTemp.length>7)||(sTemp.indexOf("FTP://")==0&&sTemp.length>6));
}

function isEmail(str) {
	var posAt=str.indexOf("@");
	var posDot=str.indexOf(".");
	return !(posAt==-1 || posDot==-1 || posAt==0 || posDot==0 || posAt==str.length-1 || posDot==str.length-1 || (posAt<=posDot+1 && posAt>=posDot-1) || (posDot<=posAt+1 && posDot>=posAt-1));
}

//判断用户名等输入的合法性
function isValidate(str) {
	var sInValidate=" !@#$%^&*+={}[]<>:;'\",./\\?`~";
	for(var index=0;index<str.length;index++) {
		if(sInValidate.indexOf(str.substring(index,index+1))!=-1){
			return false;
		}
	}
	return true;
}

function isValidate1(str) {
	var sInValidate=" !@#$%^&*()+-={}[]<>'\"./\\?`~";
	for(var index=0;index<str.length;index++) {
		if(sInValidate.indexOf(str.substring(index,index+1))!=-1){
			return false;
		}
	}
	return true;
}

//取得文件的扩展名
function getFileExtName(sPath){
	var nPosDot=sPath.lastIndexOf(".");
	var nPosSep=sPath.replace(/\\/g,"/").lastIndexOf("/");
	if(nPosDot<=0){
		return "";
	}
	if(nPosSep>nPosDot){
		return "";
	}
	return sPath.substring(nPosDot+1);
}
 //获取文件类型
function getFileType(filename){
    var sRet = "";
    for(var i=filename.length-1; i>=0; i--){
        if(filename.substring(i,i+1)!="."){
            sRet = filename.substring(i,i+1)+sRet;
        }else{
            return(sRet);
        }
    }
    return "unknown!!!";
}

//取得文件名
function getFileBaseName(sPath){
	var nPosDot=-1;
	var nPosSep=sPath.replace(/\\/g,"/").lastIndexOf("/");
	if(nPosSep==-1){
		nPosSep=0;
	}
	for(var i=sPath.length;i>nPosSep;i--){
		if(sPath.substring(i-1,i)=="."){
			nPosDot=i-1;
			break;
		}
	}
	if(nPosDot==-1){
		nPosDot=sPath.length;
	}
	return sPath.substring(nPosSep+1,nPosDot);
}

//取得完整文件名
function getFileFullName(sPath){
	var nPosSep=sPath.replace(/\\/g,"/").lastIndexOf("/");
	if(nPosSep==-1){
		nPosSep=0;
	}
	return sPath.substring(nPosSep+1);
}

//格式化文件名
function formatFileName(sFileName,delimiter){
	if(delimiter!="/"&&delimiter!="\\"){
		delimiter="\\";
	}
	sFileName=sFileName.replace(new RegExp("/","g"),"\\");
	while(sFileName.indexOf("\\\\")!=-1){
		sFileName=sFileName.replace(/\\\\/g,"\\");
	}
	sFileName=sFileName.replace(/\\/g,delimiter);
	return sFileName;
}

//判断颜色值是否正确 颜色格式#a0a0a0
function isColor(sClr) {
    var incheckStr="FEDCBA9876543210";
    if(isEmpty(sClr)) return false;
    if(sClr.indexOf("#")!=0||sClr.length!=7) return false;
    sClr = sClr.substring(1,7).toUpperCase();
	for(var index=0;index<sClr.length;index++) {
		if(incheckStr.indexOf(sClr.substring(index,index+1))==-1){
			return false;
		}
	}
	return true;
}
//获取选取颜色的反色 颜色格式#a0a0a0
function getReverseColor(sColor){
	var checkStr="0123456789ABCDEF";
	var incheckStr="FEDCBA9876543210";
	if(!isColor(sColor)) return "";
	sColor=sColor.substring(1,7).toUpperCase();
	var i;
	var sColorValue=sColor;
	sColor="#";
	for (i=0;i<sColorValue.length;i++)
		sColor+=incheckStr.charAt(checkStr.indexOf(sColorValue.substring(i,i+1)));	
	return sColor;
}

function checkInput(checkMethod) {
	if (typeof(checkMethod)=="undefined") checkMethod=10;
	var checkRule=false;
	var inputKey=event.keyCode;
	switch (checkMethod)
	{
		case 10:
			checkRule=(inputKey<48 || inputKey>57);
			break;
		case 12:
			checkRule=(inputKey<48 || inputKey>57);
			if(inputKey==37) {
			    if(!isEmpty(trim(event.srcElement.value))) {
					if(event.srcElement.value.indexOf("%")==-1) {
						checkRule=false;
					}
				}
			}
			//"-"
			if(inputKey==45) {
				if(isEmpty(trim(event.srcElement.value))) {
					checkRule=false;
				}
				else checkRule=true;
			}
			
			if(event.srcElement.value.indexOf("%")!=-1) {checkRule=true;}
			
			break;
		case 16:
			checkRule=(inputKey<48 || (inputKey>57 && inputKey<65) || (inputKey>70 && inputKey<90) || inputKey>102);

			//"#"
			if(inputKey==35) {
				if(isEmpty(trim(event.srcElement.value))) {
					checkRule=false;
				}
			}
			else {
				if(isEmpty(trim(event.srcElement.value))||event.srcElement.value.indexOf("#")==-1) {
					checkRule=true;
				}
			}
			break;
		default://字母和数字
			checkRule=(inputKey<48|| (inputKey>57 && inputKey<65) || (inputKey>90 && inputKey<97)|| inputKey>102 );
			break;
	}
	if (checkRule)
	{
		event.returnValue=false;
		return;
	}
}