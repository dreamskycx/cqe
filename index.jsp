









<!DOCTYPE html>
<html>
<head>

	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
    <meta http-equiv="content-type" content="text/html;charset=gbk">
    <title>江苏省普通高中学生综合素质评价管理平台</title>
    <script type="text/javascript" src="/uids/client_scripts/js/jquery.min.js"></script>
<script type="text/javascript" src="/uids/client_scripts/js/bootstrap3.min.js"></script>
<script type="text/javascript" src="/uids/client_scripts/js/string.js"></script>
<script type="text/javascript" src="/uids/client_scripts/js/encode.js"></script>
<script type="text/javascript" src="/uids/client_scripts/js/des.js"></script>

    <link rel="stylesheet" type="text/css" href="/uids/skin/css/light/bootstrap3.min.css"/>
<link rel="stylesheet" type="text/css" href="/uids/skin/css/light/font-awesome.min.css"/>

    <!--[if lt IE 8]>
    <script type='text/javascript'>
        document.location.href="ie6.html";
    </script>
    <![endif]-->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="/uids/client_scripts/js/html5shiv.js"></script>
<script type="text/javascript" src="/uids/client_scripts/js/respond.min.js"></script>
<script type="text/javascript" src="/uids/client_scripts/js/excanvas.js"></script>

    <![endif]-->


    <script type="text/javascript">

 var s=document.location.host ;
           if(s.indexOf(".cn")>=0){
               if(document.location.protocol!="https:"){
                   //document.write("重新跳转到安全链接页面......");
                   document.location.href="https://zhsz.jse.edu.cn/uids/index.jsp";
               }
           }


        function doOk(frm) {

            var el = frm.elements["loginName"];
            var loginName = el.value.replace(/ /g, "");
            el.value = loginName;
            if (isEmpty(loginName)) {
                alert("请输入登录名");
                el.focus();
                return false;
            }


            el = frm.elements["pwd"];
            el.value = el.value.replace(/ /g, "");
            var pwd = el.value;
            if (isEmpty(el.value)) {
                alert("请输入登录密码");
                el.focus();
                return false;
            }

            var d = new Date();

            pwd = encode(loginName, pwd);
            frm.elements["encrypt"].value = "1";

            var validCode = "";
            el = frm.elements["randomCode"];
            if (el) {
                el.value = el.value.replace(/ /g, "");
                if (isEmpty(el.value)) {
                    alert("请输入登录密码");
                    el.focus();
                    return false;
                }
                validCode = el.value;
            }
            loginName = encodeURI(loginName);//避免中文问题
            var reqId = (new Date()).getTime() + "";
            var str = strEnc(loginName + "\n" + pwd, reqId, validCode);

            frm.elements["loginName"].disabled = "true";
            frm.elements["pwd"].value = pwd;
            frm.elements["pwd"].disabled = "true";
            frm.elements["req"].value = str;
            frm.elements["reqId"].value = reqId;
            return true;
        }
        function refreshCode() {
            $("#imgCode")[0].src = "genImageCode?rnd=" + new Date().getTime();
            //var newdate = new Date();
            //document.getElementById("loadDateTime").value=newdate.getTime();
            //alert($("#imgCode")[0].src);
        }


        $(document).ready(function () {

            if (!navigator["cookieEnabled"]) {
                var htm = "<span style=\"display:inline-block;color:red;font-size:16px;font-weight:bold\">您的浏览器未启用cookie，会导致登录失败，" +
                        "请设置您的浏览器启用cookie功能，再重新登录！</span>" +
                        "<br/><span style=\"display:inline-block;margin-top:5px;margin-bottom:5px;\"><a class=\"noscriptLink\" href=\"files_upload/help/nocookie.htm\" target=\"_blank\">如何启用cookie</a></span>";
                document.getElementById("nocookies").innerHTML = htm;
//                alert("您好！您的浏览器未启用cookie，会导致登录失败，请设置您的浏览器启用cookie功能，再重新登录！");
            } else {
                document.getElementById("nocookies").innerHTML = "";
            }
        });



        $(function(){
            //显示登录时的出错提示
            var tip=trim($('.login-form-tip').text());
            if(tip.length>17){
                //console.log(tip);
                $('.login-form-bigtip .bigtip-text').html('<p>'+tip+'</p>');
                $('.login-form-content').hide();
                $('.login-form-bigtip').show();
            } else{
                $('.login-form-tip ul').show();
            }
        });


        /**
        * 出现出错提示后的返回操作
        */
        function doRetry(){
            $('.login-form-bigtip .bigtip-text').html('');
            $('.login-form-bigtip').hide();
            $('.login-form-content').show();
        }

    </script>

	<style type="text/css">
	body{margin:0px}
	body,p,td,div,a,input{font-size:14px;font-family:'microsoft yahei'}

.big-title{margin-top:80px;height: 55px}
.tit-img{margin:0px 0px 0px 20px}
.tit-text{display: none;font-size:16px;margin: 0px 12px 0px 12px;text-align: center;font-weight: bold;letter-spacing: 2px;color:#304522}
.banner{width: 100%;height: 450px;margin-top:6px;background: #8aab02;background:#8aab02 url(images/login/banner-bg.jpg);background-position:right center;background-repeat: no-repeat}
.banner-block{width: 800px;height: 450px;b-ackground-color: #cccccc;margin:auto;overflow:auto;
    /*
    background: inherit;
    -webkit-filter: blur(5px); -moz-filter: blur(5px); filter: blur(5px);
    */
}
.login-form{width:310px;height:380px;float:right;margin:35px 10px 0px 0px;background: url(images/login/banner-block-bg.png);overflow:auto;box-shadow: 0 1px 15px rgba(0,0,0,0.14)
;border-radius:5px;backdrop-filter:blur(15px)
}
.login-form-content{width: 88%;margin: auto}
.login-form-bigtip{width: 88%;margin: auto;display: none}
.bigtip-logo{height: 100px;overflow: auto;}
.bigtip-logo p{text-align: center;color:#d44950;margin-top: 30px;margin-bottom: 0px}
.bigtip-text{min-height: 150px;overflow: auto;}
.bigtip-text p{font-size:16px;line-height: 160%;color:#d44950;margin: 0px;font-weight: bold}
.bigtip-button{text-align: center}
.bigtip-button button{width: 55%}
/*.login-form input,.login-form img{vertical-align:middle;}*/
.login-form-header{width: 100%;height: 46px;border-bottom:0px solid #8ca815;margin:10px auto 0px auto}
.login-form-header div{font-weight: bold;height: 46px;line-height: 46px;}
.student{float: left;color:#48632f;font-size:19px}
.student span{margin-left:3px;margin-right:3px}
.teacher{float: right;}
.teacher span{color:#5e813d;font-size:18px;font-weight:bold;margin-right:12px}
.teacher a{font-size:17px;color:#5e813d}

.login-form-tip{height: 30px;}
.login-form-tip ul{margin: 0px;padding:0px;display: none}
.login-form-tip li{list-style:none;margin: 0px;padding:0px;color:#d44950;line-height: 30px;font-weight:bold}

.input-group-addon{font-size:17px;padding:0px;width: 37px}
.fc1{width:233px!important;}
.fc2{width:140px!important;float: left}
#imgCode{height:36px;width:80px;float: right;}

.item {width:100%;margin:0px auto 10px auto;}
/*
.item .label{display:block;float:left;width:56px;height:35px;line-height:35px;background-color0:#ff0000;font-size:16px;font-weight: bold;color:#374c24}
.item .ipt{display:block;float:right;width:220px;height:35px;background-color0:#ff0000}
*/
    .item .label{display: none}
    .item .ipt{width: 100%}
    .ipt button{width: 100%}

    .bottom-link {text-align: right}
    .bottom-link a{color:#48632f;font-size:15px;font-weight:bold}

    .footer{margin-top:30px}
    .footer p{color:#999999;line-height: 180%;text-align: center;margin-left: 20px;margin-right: 20px}


@media screen and (max-width: 800px) {
    .big-title{margin-top:16px;height:33px}
    .tit-img{display: none}
    .tit-text{display: block}
    .banner-block{width: 100%}
    .login-form{float:none;margin:35px auto 0px auto}
}


span.jsetip{
       position: absolute;
    width: 200px;
    top: 150px;
    right: 360px;
    background-color: rgb(233 233 233 / 0.8);
    padding: 15px;
    border: 1px solid darkgray;
    border-radius: 5px;
}

.jsetip::after {
    content: "";
    position: absolute;
    right: -20px;
    top: 26px;
    border-top: 13px solid transparent;
    border-left: 26px solid #ddddddab;
    border-bottom: 13px solid transparent;
}


	</style>
</head>
<body style="">
<div class="big-title"><p class="tit-img"><img src="images/login/big-title.gif" width="616" height="55"></p><p class="tit-text">江苏省普通高中学生综合素质评价平台</p></div>
<div class="banner">
    <div class="banner-block" style="position:relative">
        <form AUTOCOMPLETE="false" action="login.jsp" method="post" target="_self" name="frm" onsubmit="return doOk(this)" style="display: inline">

			<div class="login-form">
                <div class="login-form-bigtip">
                    <div class="bigtip-logo"><p><i class="fa fa-exclamation-triangle fa-3x" aria-hidden="true"></i></p></div>
                    <div class="bigtip-text"></div>
                    <div class="bigtip-button"><button type="button" class="btn btn-primary" onclick="doRetry()">返回重试</button></div>
                </div>
                <div class="login-form-content">
                    <div class="login-form-header">
                        <div class="student"><span>用户登录</span></div>
                        <!--div class="teacher"><span>|</span><a href="http://www.jste.net.cn" target="_blank">教师登录</a></div-->
                    </div>
                      
                    <div class="login-form-tip">
                      
                        	<ul class="errorMessage">
            <li><span>非法的访问!请重新登录!</span></li>	</ul>

                        
                    </div>
                    <div class=item>
                        <div class=label>用户名</div>
                        <div class=ipt>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></div>
                                <input  id="loginName" name="loginName" maxlength="30" class="form-control fc1" placeholder="用户名" value=""/>
                            </div>
                        </div>
                    </div>
                    <div class=item>
                        <div class=label>密码</div>
                        <div class=ipt>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="fa fa-lock" aria-hidden="true"></i></div>
                                <input name="pwd" type="password" id="pwd" maxlength="30"  class="form-control fc1" placeholder="密码"/>
                            </div>
                        </div>
                    </div>
                    
                    <div class=item>
                        <div class=label>验证码</div>
                        <div class=ipt>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="fa fa-pencil" aria-hidden="true"></i></div>
                                <input name="randomCode" onclick="refreshCode()" type="text" id="randomCode" maxlength="10" class="form-control fc2" placeholder="验证码">
                                &nbsp;<img id="imgCode" border="0" src="genImageCode" align="middle" title="验证码看不清请点击刷新" onclick="refreshCode()">
                            </div>                        </div>
                    </div>
                    
                    <div style="height: 0px"></div>
                    <div class=item>
                   
                        <div class=ipt><button type="submit" class="btn btn-primary" >登录</button></div>
                         <div class=ipt><a style="width:100%;margin-top:5px;display0:none" href="/uids/api/oauth2/client/client.jsp" class="btn btn-info" >使用江苏智慧教育云平台帐户登录</a></div>
                    </div>

                    <p class="bottom-link"><a href="/fms/jsoqa/active_stud_login.jsp">学生账号激活</a><span style="font-weight: bold;margin-left:8px;margin-right:8px">|</span><a href="/uids/mail/findPwd.jsp">忘记密码</a></p>



                </div>
			</div>

            <input type="hidden" name="returnURL" value=""/>
            <input type="hidden" name="appId" value="uids"/>
            <input type="hidden" name="site" value=""/>
            <input type="hidden" name="encrypt" value=""/>
            <input type="hidden" name="reqId" value=""/>
            <input type="hidden" name="req" value=""/>
        </form>
    </div>
</div>
<span id="nocookies"></span>
<div class="footer">
<p>主办：江苏省教育厅　承办：江苏省教育信息化中心　技术支持：江苏科建教育软件有限责任公司
<br>苏ICP备09031036号-2</p>
</div>



</body>
</html>
