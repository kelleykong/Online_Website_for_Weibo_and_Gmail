<%@ page contentType="text/html; charset=GBK" language="java"  errorPage="" %>
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>ע��</title>
		<link rel="shortcut icon" href="res/luck.jpg">
		<style type="text/css"> 
			/* ע��ҳ�� */
			/* reset */
			body{line-height:1.666;background-color:#fff}
			body,input{font-size:14px}
			body,input{font-family:verdana}			
			body,ul,li,form{margin:0;padding:0;border:0}
			input{margin:0;padding:0}
			ul{list-style:none}
			.footer{display:block}		
			/* ���� */
			.btn1{background:url(res/regbtn.png);background-repeat:no-repeat}			
			.btn2{background:url(res/backbtn.png);background-repeat:no-repeat}						
			.content{background-image:url(res/reg1.jpg);background-repeat:no-repeat}
			/* ����Ԫ�� */
			.copy-item{display:inline-block;+display:inline;+zoom:1;vertical-align:middle}
			/* ��ť */
			.btn1{width:153px;height:61px;border:none;cursor:pointer}			
			.btn2{width:153px;height:61px;border:none;cursor:pointer}						
			/* ����� */
			.ipt-t{vertical-align:middle;border:1px solid #878787;font-size:14px;font-weight:bold;padding:6px 0px;width:330px;margin:0 30px}
			/* ҳ������ */
			.container{width:900px;margin:0 auto}
			/* ��Ҫ���� */
			.content{width:900px;height:900px;margin:60px auto 0}
				/* ���� */
				.namelogo{float:top;margin:0 auto;width:350px;height:180px}
				/* ע��� */		
				.register{margin:0 auto;width:800px;height:700px}
					.register .item{padding:10px 10px}
					.register .item .name{float:left;width:180px;line-height:30px;margin-right:10px;text-align:right}
					.register .item .note{width:300px;margin-left:220px;margin-right:100px;font-size:12px;color:#888!important}
					.register .submit{padding:0 200px;}
					.register .submit .txt-err{vertical-align:text-bottom;margin-left:50px}					
			/* �ײ� */
			.footer{margin-top:5px;position:relative;zoom:1}
				/* ��Ȩ */
				.copyright{border-top:1px solid #eee;padding:20px 0;text-align:center}
				.copyright{color:#888!important;text-decoration:none}
				.copy-item{margin-right:10px}
				.copy-item .sptln{margin-right:10px}
		</style>
	</head>
	<body>
		<div class="container">
			<!-- ��Ҫ���� -->
			<div class="content">
				<div class="namelogo">
					<img src="res/logo.png" alt="SIFTTT" width="325" height="280">
				</div>
				<!-- ע����� -->			
				<form class = "register" name="userRegisterForm" method="post" action="Register" onsubmit="return checkForm(this)">
					<!-- �û��� -->
					<div class="item">
						<label class="name" for="uid">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��:</label>
						<input name="uid" type ="text" id="uid" size="20" maxlength = "50" class="ipt-t" />*
						<input name="checkUser" type="button" value="�鿴�Ƿ�ռ��" onclick="checkUid();">
						<label class="note">3~18���ַ���������ĸ�����֡��㡢���Ż��»��ߣ�����ĸ��ͷ����ĸ�����ֽ�β</label>
					</div>
					<!-- ����  -->
					<div class="item">
						<label class="name" for="password">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��:</label>
						<input name="password" type="password" id="password" size="20" maxlength="50" class="ipt-t"/>*
						<label class="note">6��16���ַ������ִ�Сд�����԰�����ĸ�����֡������ַ�</label>
					</div>	
					<!-- ����ȷ��  -->
					<div class="item">
						<label class="name" for="confirmPassword">����ȷ��:</label>					
						<input name="confirmPassword" type="password" id="confirmPassword" size="20" maxlength="50" class="ipt-t"/>*
						<label class="note">���ٴ���������</label>
					</div>	
					<!-- �����ʼ�  -->
					<div class="item">
						<label class="name" for="email">�����ʼ�:</label>					
						<input name="email" type="text" id="email" size="20" maxlength="50" class="ipt-t"/>*
						<label class="note">����������ȷ��E-mail��ַ��<FONT color=#cc0000>�������������ѯ</FONT>��</label>
					</div>	
					<!-- �Ա�  -->
					<div class="item">
						<label class="name" for="gender">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��:</label>	
						<label class="name" for="gender">			
						<input name="gender" type="radio" id="gender" value="0">���&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="1" >��Ů</label>
					</div>	
					<br/>
					<!-- ������ʾ����  -->
					<div class="item">
						<label class="name" for="question">������ʾ����:</label>					
						<input name="question" type="text" id="question" size="20" maxlength="50" class="ipt-t"/>*
						<label class="note">�ʺ���֤�Լ����ڰ������һ�����</label>
					</div>
					<!-- ��ʾ�� ��  -->
					<div class="item">
						<label class="name" for="answer">��ʾ�����:</label>					
						<input name="answer" type="text" id="answer" size="20" maxlength="50" class="ipt-t"/>*
						<label class="note">�������һ�����Ĵ�</label>
					</div>	
					<!-- ��ʵ����  -->
					<div class="item">
						<label class="name" for="realName">��ʵ����:</label>					
						<input name="realName" type="text" id="realName" size="20" maxlength="50" class="ipt-t"/>
						<label class="note"> &nbsp; </label>
					</div>		
					<!-- ��ϵ�绰 -->
					<div class="item">
						<label class="name" for="telphone">��ϵ�绰:</label>					
						<input name="tel" type="text" id="telphone" size="20" maxlength="50" class="ipt-t"/>
					</div>	
					<!-- �ύ��ť -->
					<div class="item submit">
						<input type="submit" name="Submit" class="btn1" value=""/>
						<span class="txt-err" id="divError"></span> 
						<input type="button" name="Back" class="btn2" value="" onclick="javascript:window.location='index.jsp'"/>						
					</div>													
				</form>
			</div>
			<!-- �ײ� -->
			<div class="footer">
				<!-- ��Ȩ -->
				<div class="copyright">
					<ul class="copy-list">
						<li class="copy-item">JAVA</li><li class="copy-item">����ҵ������ҵ3~</li><li class="copy-item"><span class="sptln">|</span>��Ȩ����HH&nbsp;&amp;&nbsp;KMJ&nbsp;&amp;&nbsp;LLC&nbsp;&copy;&nbsp;2011</li>
					</ul>
				</div>
			</div>	
		</div>
	</body>
</html>
<script language="javascript">
	function checkForm(form){
		if(isEmpty(form.uid.value) || isEmpty(form.password.value) || isEmpty(form.confirmPassword.value) || isEmpty(form.email.value) || isEmpty(form.question.value) || isEmpty(form.answer.value) ){
			alert("�뽫��������д����!");
			return false;
		}
		if(form.password.value!=form.confirmPassword.value){
			alert("�������벻ƥ��!");
			return false;
		}
		if(form.password.value.length<6 || form.password.value.length>16){
			alert("���볤�Ȳ�������6���ַ������ö���16���ַ���");
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
			window.open("CheckUid.jsp?uid=" +name ,"����û���","toolbar=no, location=no,status=no,menubar=no, scrollbars=no,resizable=no,width=300,height=200");
		}
	}	
</script>
