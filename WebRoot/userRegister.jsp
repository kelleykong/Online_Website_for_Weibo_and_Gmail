<%@ page contentType="text/html; charset=GBK" language="java"  errorPage="" %>
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>注册</title>
		<link rel="shortcut icon" href="res/luck.jpg">
		<style type="text/css"> 
			/* 注册页面 */
			/* reset */
			body{line-height:1.666;background-color:#fff}
			body,input{font-size:14px}
			body,input{font-family:verdana}			
			body,ul,li,form{margin:0;padding:0;border:0}
			input{margin:0;padding:0}
			ul{list-style:none}
			.footer{display:block}		
			/* 背景 */
			.btn1{background:url(res/regbtn.png);background-repeat:no-repeat}			
			.btn2{background:url(res/backbtn.png);background-repeat:no-repeat}						
			.content{background-image:url(res/reg1.jpg);background-repeat:no-repeat}
			/* 行内元素 */
			.copy-item{display:inline-block;+display:inline;+zoom:1;vertical-align:middle}
			/* 按钮 */
			.btn1{width:153px;height:61px;border:none;cursor:pointer}			
			.btn2{width:153px;height:61px;border:none;cursor:pointer}						
			/* 输入框 */
			.ipt-t{vertical-align:middle;border:1px solid #878787;font-size:14px;font-weight:bold;padding:6px 0px;width:330px;margin:0 30px}
			/* 页面容器 */
			.container{width:900px;margin:0 auto}
			/* 主要内容 */
			.content{width:900px;height:900px;margin:60px auto 0}
				/* 名称 */
				.namelogo{float:top;margin:0 auto;width:350px;height:180px}
				/* 注册框 */		
				.register{margin:0 auto;width:800px;height:700px}
					.register .item{padding:10px 10px}
					.register .item .name{float:left;width:180px;line-height:30px;margin-right:10px;text-align:right}
					.register .item .note{width:300px;margin-left:220px;margin-right:100px;font-size:12px;color:#888!important}
					.register .submit{padding:0 200px;}
					.register .submit .txt-err{vertical-align:text-bottom;margin-left:50px}					
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
				<div class="namelogo">
					<img src="res/logo.png" alt="SIFTTT" width="325" height="280">
				</div>
				<!-- 注册界面 -->			
				<form class = "register" name="userRegisterForm" method="post" action="Register" onsubmit="return checkForm(this)">
					<!-- 用户名 -->
					<div class="item">
						<label class="name" for="uid">帐&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:</label>
						<input name="uid" type ="text" id="uid" size="20" maxlength = "50" class="ipt-t" />*
						<input name="checkUser" type="button" value="查看是否被占用" onclick="checkUid();">
						<label class="note">3~18个字符，包括字母、数字、点、减号或下划线，以字母开头，字母或数字结尾</label>
					</div>
					<!-- 密码  -->
					<div class="item">
						<label class="name" for="password">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</label>
						<input name="password" type="password" id="password" size="20" maxlength="50" class="ipt-t"/>*
						<label class="note">6～16个字符，区分大小写，可以包括字母、数字、特殊字符</label>
					</div>	
					<!-- 密码确认  -->
					<div class="item">
						<label class="name" for="confirmPassword">密码确认:</label>					
						<input name="confirmPassword" type="password" id="confirmPassword" size="20" maxlength="50" class="ipt-t"/>*
						<label class="note">请再次输入密码</label>
					</div>	
					<!-- 电子邮件  -->
					<div class="item">
						<label class="name" for="email">电子邮件:</label>					
						<input name="email" type="text" id="email" size="20" maxlength="50" class="ipt-t"/>*
						<label class="note">请您输入正确的E-mail地址！<FONT color=#cc0000>方便您的密码查询</FONT>！</label>
					</div>	
					<!-- 性别  -->
					<div class="item">
						<label class="name" for="gender">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</label>	
						<label class="name" for="gender">			
						<input name="gender" type="radio" id="gender" value="0">酷哥&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="1" >靓女</label>
					</div>	
					<br/>
					<!-- 密码提示问题  -->
					<div class="item">
						<label class="name" for="question">密码提示问题:</label>					
						<input name="question" type="text" id="question" size="20" maxlength="50" class="ipt-t"/>*
						<label class="note">帐号验证以及用于帮助您找回密码</label>
					</div>
					<!-- 提示问 答案  -->
					<div class="item">
						<label class="name" for="answer">提示问题答案:</label>					
						<input name="answer" type="text" id="answer" size="20" maxlength="50" class="ipt-t"/>*
						<label class="note">帮助您找回密码的答案</label>
					</div>	
					<!-- 真实姓名  -->
					<div class="item">
						<label class="name" for="realName">真实姓名:</label>					
						<input name="realName" type="text" id="realName" size="20" maxlength="50" class="ipt-t"/>
						<label class="note"> &nbsp; </label>
					</div>		
					<!-- 联系电话 -->
					<div class="item">
						<label class="name" for="telphone">联系电话:</label>					
						<input name="tel" type="text" id="telphone" size="20" maxlength="50" class="ipt-t"/>
					</div>	
					<!-- 提交按钮 -->
					<div class="item submit">
						<input type="submit" name="Submit" class="btn1" value=""/>
						<span class="txt-err" id="divError"></span> 
						<input type="button" name="Back" class="btn2" value="" onclick="javascript:window.location='index.jsp'"/>						
					</div>													
				</form>
			</div>
			<!-- 底部 -->
			<div class="footer">
				<!-- 版权 -->
				<div class="copyright">
					<ul class="copy-list">
						<li class="copy-item">JAVA</li><li class="copy-item">大作业啊大作业3~</li><li class="copy-item"><span class="sptln">|</span>版权所有HH&nbsp;&amp;&nbsp;KMJ&nbsp;&amp;&nbsp;LLC&nbsp;&copy;&nbsp;2011</li>
					</ul>
				</div>
			</div>	
		</div>
	</body>
</html>
<script language="javascript">
	function checkForm(form){
		if(isEmpty(form.uid.value) || isEmpty(form.password.value) || isEmpty(form.confirmPassword.value) || isEmpty(form.email.value) || isEmpty(form.question.value) || isEmpty(form.answer.value) ){
			alert("请将必填项填写完整!");
			return false;
		}
		if(form.password.value!=form.confirmPassword.value){
			alert("两次密码不匹配!");
			return false;
		}
		if(form.password.value.length<6 || form.password.value.length>16){
			alert("密码长度不得少于6个字符，不得多于16个字符！");
			return false;
		}
		return true;
	}
	function isEmpty(str){
		if(str==null || str.length==0)
			return true;
		else 
			return false;
	}
	function checkUid(){
		var name=document.userRegisterForm.uid.value;
		if(name.length>0){
			window.open("CheckUid.jsp?uid=" +name ,"检查用户名","toolbar=no, location=no,status=no,menubar=no, scrollbars=no,resizable=no,width=300,height=200");
		}
	}	
</script>
