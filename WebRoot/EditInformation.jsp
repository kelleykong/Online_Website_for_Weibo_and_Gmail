<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@ page import="Register.UserService" %>
<%@ page import="Register.User" %>
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<title>�޸�����</title>
		<style type="text/css"> 
			/* �޸�����   */
			body{line-height:1.666;background-color:#fff}
			body,input{font-size:15px}
			body,input{font-family:verdana}
			body,ul,li{margin:0;padding:0;border:0}
			input{margin:0;padding:0}
			input{line-height:normal}
			ul{list-style:none}
			/* ���� */
			.subBtn{background:url(res/infoSubbtn.png);background-repeat:no-repeat}			
			.backBtn{background:url(res/usrbackbtn.png);background-repeat:no-repeat}
			/* ����Ԫ�� */
			.copy-item{display:inline-block;+display:inline;+zoom:1;vertical-align:middle}	
			/* ��ť */
			.subBtn{width:119px;height:45px;border:none;cursor:pointer}			
			.backBtn{width:119px;height:45px;border:none;cursor:pointer}		
			/* ҳ������   */
			.container{width:1000px;margin:0 auto}
			/* logo*/
			.logo{positon:relative;left:100px;top:100px}
				/* ͷ��   */
				.header{background:url(res/userHeader.png);background-repeat:no-repeat}
				.header{width:1000px;height:150px;margin:0 auto}
					.header .welc{color:white;font-size:30px;font-family:Comic Sans MS;font-weight:bold;position:absolute;top:80px}								
				/* ��Ҫ����   */
				.content{width:1000px;height:650px;margin:0 auto}
					/* �������� */
					.info{background:url(res/userInfo.png);background-repeat:no-repeat}
					.info{float:left;width:200px;height:650px;margin-left:14px}
						.info .userName{color:white;font-size:22px;font-family:Comic Sans MS;font-weight:bold;position:relative;top:40px;left:25px}
						.info .userInfo{color:white;font-size:16px;font-family:Comic Sans MS;position:relative;top:40px;left:25px}							
					/* �����б� */
					.func{background:url(res/userFunc2.png);background-repeat:no-repeat}
					.func{float:right;width:750px;height:650px;margin-right:14px}
						.func .detailInfo{width:600px;height:600px;margin:25px auto}
						.func .detailInfo .item{padding:3px 10px;width:500px;line-height:30px}
						.func .detailInfo .item .ipt-t{vertical-align:middle;border:1px solid #878787;font-size:14px;font-weight:bold;padding:6px 0px;width:330px}
						.func .detailInfo .item .note{width:300px;margin-left:120px;margin-right:50px;font-size:12px;color:#888!important}												
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
		<%String uid=request.getParameter("uid");
		//uid = (String)session.getAttribute("uid");
		//out.println(uid); 
		String editUid = request.getParameter("editUid");
		UserService service = new UserService();
		User user = service.getUser(uid);
		User editUser = service.getUser(editUid);%>

   		<div class="container"> 
			<!-- ͷ��-->		
   			<div class="header">
   				<img class="logo" src="res/logo.png"/ width="325" height="255" />
    			<label class="welc">&nbsp;Edit&nbsp;&nbsp;<%=uid %>&nbsp;&nbsp;Information</label>  				
   			</div>
			<!-- ��Ҫ���� -->
   			<div class="content">
   				<div class="info">
   					<label class="userName">�ʺţ�&nbsp;<%=uid %></label><br/>
   					 <%	String gender = "";
    					if (user.getGender()==0)
    						gender = "���";
    					else gender = "��Ů"; %>
    				<label class="userInfo">�Ա�&nbsp;<%=gender %></label><br/>
 					<label class="userInfo">���䣺&nbsp;<%=user.getEmail() %></label><br/>
 					<label class="userInfo">�˻���&nbsp;<%=user.getMoney() %></label><br/>
 					<%if (uid.compareTo("kmj")==0){%>
 					<label class="userInfo">����ԱȨ�ޣ�&nbsp;<a href=<%="ViewUser.jsp?uid="+uid%>>�鿴�û�</a></label> 					 					
					<%}%>  						   				
   				</div>
   				<div class="func">
   				   	<form class="detailInfo" name="userRegisterForm" method="post" action="UpdateUser" onsubmit="return checkForm(this)">
   				   		<input name=userUid type=hidden value=<%=uid %> /> 				
						<div class="item">
							<label>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��:&nbsp;</label>
							<input name=uid type=text id=uid size=20 maxlength=50 readonly=readonly value=<%=editUser.getUid() %> class="ipt-t" />*
						</div>
						<% if (uid.compareTo(editUid) == 0) {%>
						<div class="item">
							<label>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��:&nbsp;</label>
							<input name="password" type="password" id="password" size="20" maxlength="50" value=<%=editUser.getPassword() %> class="ipt-t"/>*
							<label class="note">6��16���ַ������ִ�Сд�����԰�����ĸ�����֡������ַ�</label>
						</div>	
						<div class="item">
							<label>��&nbsp;&nbsp;��&nbsp;&nbsp;ȷ&nbsp;&nbsp;��:&nbsp;</label>
							<input name="confirmPassword" type="password" id="comfirmPassword" size="20" maxlength="50" value=<%=editUser.getPassword() %> class="ipt-t"/>*
							<label class="note">���ٴ���������</label>
						</div>
						<%} 
						else {%>
						<div class="item">
							<label>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��:&nbsp;</label>
							<input name="password" type="text" id="password" size="20" maxlength="50" readonly=readonly value=<%=editUser.getPassword() %> class="ipt-t"/>*
							<label class="note">6��16���ַ������ִ�Сд�����԰�����ĸ�����֡������ַ�</label>
						</div>	
						<div class="item">
							<input name="confirmPassword" type="hidden" id="comfirmPassword" size="20" maxlength="50" value=<%=editUser.getPassword() %> class="ipt-t"/>
						</div>
						<%} %>															
						<div class="item">
							<label>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��:&nbsp;</label>
							<label class="name" for="gender">
								<%if (editUser.getGender() == 0) {%>
								<input name="gender" type="radio" id="gender" value="0" checked>���&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="1" >��Ů
								<%} else { %>
								<input name="gender" type="radio" id="gender" value="0">���&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="1" checked>��Ů
								<%} %>
							</label>							
						</div>
						<div class="item">
							<label>��&nbsp;&nbsp;��&nbsp;&nbsp;��&nbsp;&nbsp;��:&nbsp;</label>
							<input name="email" type="text" id="email" size="20" maxlength="50" value=<%=editUser.getEmail() %> class="ipt-t"/>*<br/>
							<label class="note">����������ȷ��E-mail��ַ��<FONT color=#cc0000>�������������ѯ</FONT>��</label>
						</div>							
						<div class="item">
							<label>������ʾ����:&nbsp;</label>
							<input name=question type=text size=20 maxlength=50 value=<%=editUser.getQuestion() %> class="ipt-t"/>*
							<label class="note">�ʺ���֤�Լ����ڰ������һ�����</label>
						</div>
						<div class="item">
							<label>������ʾ��:&nbsp;</label>
							<input name=answer type=text  size=20 maxlength=50 value=<%=editUser.getAnswer() %> class="ipt-t"/>*
							<label class="note">�������һ�����Ĵ�</label>
						</div>
						<div class="item">
							<label>��&nbsp;&nbsp;ʵ&nbsp;&nbsp;��&nbsp;&nbsp;��:&nbsp;</label>
							<input name=realName type=text id=realName size=20 maxlength=50 value="<%=editUser.getRealName() %>" class="ipt-t" />							
						</div>
						<div class="item">
							<label>��&nbsp;&nbsp;ϵ&nbsp;&nbsp;��&nbsp;&nbsp;��:&nbsp;</label>
							<input name=tel type=text id=telphone size=20 maxlength=50 value="<%=editUser.getTel() %>" class="ipt-t" />
						</div>
						<div class="item">
							<input class="subBtn" type=submit name="Submit" value="" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input class="backBtn" type=button name="backBtn" value="" onclick="javascript:history.go(-1);" />						
						</div>														
   					</form>  					 					
   				</div>
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