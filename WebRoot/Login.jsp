<%@ page contentType="text/html;charset=GBK" %>
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
  <head>
	<title>IFTTT</title>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<link rel="shortcut icon" href="res/luck.jpg">
		<style type="text/css">
			/* 登陆页面   */
			/* reset */
			body{line-height:1.666;background-color:#fff}
			body,input{font-size:12px}
			body,input{font-family:verdana}
			body,ul,li,form,img{margin:0;padding:0;border:0}
			input{margin:0;padding:0}
			input,img{line-height:normal}
			ul{list-style:none}
			.footer{display:block}
			/* 背景 */
			.btn{background:url(res/btntest1.png);background-repeat:no-repeat}
			.content{background-image:url(res/background.png);background-repeat:no-repeat}
			/* 行内元素 */
			.btn,.copy-item{display:inline-block;+display:inline;+zoom:1;vertical-align:middle}
			/* 按钮 */
			.btn{margin-top:20px;margin-left:0px;width:60px;height:58px;border:none;cursor:pointer}
			.btn-submit{font-size:14px;color:#fff;font-weight:bold}
			/* 输入框 */
			.ipt-t{vertical-align:middle;margin-right:10px;border:1px solid #878787;font-size:14px;font-weight:bold;padding:6px 3px 6px;width:182px}
			/* 页面容器 */
			.container{width:750px;margin:0 auto}
			/* 主要内容 */
			.content{height:565px;position:relative;zoom:1}
				/* 登录框 */
				.login{position:absolute;left:180px;top:195px;width:300px}
					.login .bd{margin-left:42px;margin-top:10px}
					.login .item{padding:8px 0}
					.login .item .name{float:left;width:44px;line-height:30px;margin-right:5px}
					.login .submit{padding:6px 0 8px 48px;font-size:12px}
					.login .submit .btn-submit{vertical-align:text-bottom}
					.login .submit .txt-err{vertical-align:text-bottom;margin-left:30px}
			/* 底部 */
			.footer{margin-top:5px;position:relative;zoom:1}
				/* 版权 */
				.copyright{border-top:1px solid #eee;padding:20px 0;text-align:center}
				.copyright{color:#888!important;text-decoration:none}
				.copy-item{margin-right:10px}
				.copy-item .sptln{margin-right:10px}
		</style>
  </head>  
  <body>
  	<div class="container">
			<!-- 主要内容 -->
			<div class="content">
				<!-- login区 -->
				<div class="login">
					<form class="bd" name="loginForm" method="post" action="Login">
    					<!-- 用户名 -->
						<div class="item">
							<label class="name" for="uid">帐&nbsp;&nbsp; 号</label><input name="uid" type ="text" id="uid" maxlength = "20" class="ipt ipt-t" />
						</div>
						<!-- 密码 -->
						<div class="item">
							<label class="name" for="password">密&nbsp;&nbsp; 码</label><input name="password" type="password" id="password" maxlength="30" class="ipt ipt-t" />
						</div>
    					<!-- 提交按钮 -->
						<div class="item submit">
							<input type="submit" name="Submit" class="btn btn-submit" id="btnSubmit" value="登 录" />
							<span class="txt-err" id="divError"></span>     							
							<input type="button" name="Submit2" class="btn btn-submit" id="btnSubmit" value="注 册" onclick="javascript:window.location='userRegister.jsp'"/>
						</div>
   	 				</form>
				</div>
			</div>
			<!-- 底部 -->
			<div class="footer">
				<!-- 版权 -->
				<div class="copyright">
					<ul class="copy-list">
						<li class="copy-item">JAVA</li><li class="copy-item">神马玩意儿~</li><li class="copy-item"><span class="sptln">|</span>版权所有HH&nbsp;&amp;&nbsp;KMJ&nbsp;&amp;&nbsp;LLC&nbsp;&copy;&nbsp;2011</li>
					</ul>
				</div>
			</div>
		</div>
  </body>
</html>
