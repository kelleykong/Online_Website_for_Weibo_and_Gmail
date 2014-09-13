<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@ page import="Register.UserService" %>
<%@ page import="Register.User" %>
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<title>��������</title>
		<style type="text/css"> 
			/* ��������   */
			body{line-height:1.666;background-color:#fff}
			body,input{font-size:15px}
			body,input{font-family:verdana}
			body,ul,li{margin:0;padding:0;border:0}
			input{margin:0;padding:0}
			input{line-height:normal}
			ul{list-style:none}
			/* ���� */
			.editBtn{background:url(res/infoEditbtn.png);background-repeat:no-repeat}			
			.backBtn{background:url(res/usrbackbtn.png);background-repeat:no-repeat}
			/* ����Ԫ�� */
			.copy-item{display:inline-block;+display:inline;+zoom:1;vertical-align:middle}	
			/* ��ť */
			.editBtn{width:119px;height:45px;border:none;cursor:pointer}			
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
				.content{width:1000px;height:400px;margin:0 auto}
					/* �������� */
					.info{background:url(res/userInfo.png);background-repeat:no-repeat}
					.info{float:left;width:200px;height:400px;margin-left:14px}
						.info .userName{color:white;font-size:22px;font-family:Comic Sans MS;font-weight:bold;position:relative;top:40px;left:25px}
						.info .userInfo{color:white;font-size:16px;font-family:Comic Sans MS;position:relative;top:40px;left:25px}							
					/* �����б� */
					.func{background:url(res/userFunc.png);background-repeat:no-repeat}
					.func{float:right;width:750px;height:400px;margin-right:14px}
						.func .detailInfo{width:600px;height:350px;margin:25px auto}
						.func .detailInfo .item{padding:3px 10px;width:500px;line-height:30px}
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
		String viewUid = request.getParameter("viewUser");
		UserService service = new UserService();
		User user = service.getUser(uid);
		User viewUser = service.getUser(viewUid);%>

   		<div class="container"> 
			<!-- ͷ��-->		
   			<div class="header">
   				<img class="logo" src="res/logo.png"/ width="325" height="255" />
    			<label class="welc">&nbsp;View&nbsp;&nbsp;<%=uid %>&nbsp;&nbsp;Information</label>  				
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
   					<div class="detailInfo">
						<div class="item"><label>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��:&nbsp;<%=viewUser.getUid() %></label></div>
						<%	String viewGender = "";
    					if (viewUser.getGender()==0)
    						viewGender = "���";
    					else viewGender = "��Ů"; %>
						<div class="item"><label>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��:&nbsp;<%=viewGender %></label></div>
						<div class="item"><label>��&nbsp;&nbsp;��&nbsp;&nbsp;��&nbsp;&nbsp;��:&nbsp;<%=viewUser.getEmail() %></label></div>
						<div class="item"><label>������ʾ����:&nbsp;<%=viewUser.getQuestion() %></label></div>
						<div class="item"><label>������ʾ��:&nbsp;<%=viewUser.getAnswer() %></label></div>
						<div class="item"><label>��&nbsp;&nbsp;ʵ&nbsp;&nbsp;��&nbsp;&nbsp;��:&nbsp;<%=viewUser.getRealName() %></label></div>
						<div class="item"><label>��&nbsp;&nbsp;ϵ&nbsp;&nbsp;��&nbsp;&nbsp;��:&nbsp;<%=viewUser.getTel() %></label></div>
						<div class="item"><label>��&nbsp;&nbsp;��&nbsp;&nbsp;��&nbsp;&nbsp;��:&nbsp;<%=viewUser.getMoney() %></label></div>
						<div class="item">
						<%String path="EditInformation.jsp?uid="+uid+"&editUid="+viewUid; %>
							<input class="editBtn" type=button name="editBtn" value="" onclick=<%="javascript:window.location=\'"+path+"\'"%> />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input class="backBtn" type=button name="backBtn" value="" onclick=<%="javascript:history.go(-1);" %> />
						</div>														
   					</div>  					 					
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