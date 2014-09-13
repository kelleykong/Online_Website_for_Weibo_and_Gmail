<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@ page import="Register.UserService" %>
<%@ page import="Register.User" %>
<%@ page import="Message.MessageService" %>
<%@ page import="Message.Message" %>
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<title>վ����</title>
		<style type="text/css"> 
			/* վ����   */
			body{line-height:1.666;background-color:#fff}
			body,input{font-size:14px}
			body,input{font-family:verdana}
			body,ul,li{margin:0;padding:0;border:0}
			input{margin:0;padding:0}
			input{line-height:normal}
			ul{list-style:none}
			/* ����Ԫ�� */
			.copy-item{display:inline-block;+display:inline;+zoom:1;vertical-align:middle}			
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
						.func .navi{width:387px;height:54px;margin:20px 40px 0}
						.func .mesList{width:600px;height:300px;margin:0 auto}
						.func .mesList .item{padding:3px 10px;width:500px;line-height:30px}
						.func .mesList .item .name{float:left;width:80px;line-height:30px;margin-right:10px}						
						.func .mesList .item .ipt-t{vertical-align:middle;font-size:14px;font-weight:bold;padding:6px 0px;width:330px}
						.func .mesList .con{padding:3px 10px;width:500px;height:150px;line-height:30px}
						.func .mesList .con .name{float:left;width:80px;line-height:30px;margin-right:10px}						
						.func .mesList .con .ipt-t{height:130px;vertical-align:middle;font-size:14px;font-weight:bold;padding:6px 0px;width:330px}
						.subBtn{background:url(res/del.png);background-repeat:no-repeat}			
						.backBtn{background:url(res/usrbackbtn.png);background-repeat:no-repeat}	
						.subBtn{width:119px;height:45px;border:none;cursor:pointer}			
						.backBtn{width:119px;height:45px;border:none;cursor:pointer}				
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
		<%String userUid = null;
   		userUid = (String)session.getAttribute("uid");
    	System.out.println(userUid);
    	UserService service = new UserService();
		User user = service.getUser(userUid);
		
		String messageName = request.getParameter("messageName");
		System.out.println(messageName);
		MessageService messageService = new MessageService();
		Message message = messageService.getMessage(messageName);%>

    	<div class="container"> 		
   			<div class="header">
   				<img class="logo" src="res/logo.png"/ width="325" height="255" />
   				<label class="welc"><%=userUid %>&nbsp;&nbsp;&nbsp;Messages</label>
   			</div>
   			<div class="content">
   				<div class="info">
   					<label class="userName">�ʺţ�&nbsp;<%=userUid %></label><br/>
   					 <%	String gender = "";
    					if ( user.getGender()==0 )
    						gender = "���";
    					else gender = "��Ů"; %>
    				<label class="userInfo">�Ա�&nbsp;<%=gender %></label><br/>
 					<label class="userInfo">���䣺&nbsp;<%=user.getEmail() %></label><br/>
 					<label class="userInfo">�˻���&nbsp;<%=user.getMoney() %></label><br/>
 					<%if (userUid.compareTo("kmj")==0){%>
 					<label class="userInfo">��ϲ���ǹ���ԱŶ~</label><br/>
 					<label class="userInfo">����ԱȨ�ޣ�&nbsp;<a href=<%="ViewUser.jsp?uid="+userUid%>>�鿴�û�</a></label> 					 					
					<%}%>  	
   				</div>
   				<div class="func">
   					<img class="navi" src="res/mesNavi.png" border="0" usemap="#mesNavi" />
   					<map name="mesNavi" id="mesNavi">
  						<area shape="rect" coords="8,8,140,40" href =<%="SendMessage.jsp?uid=\'"+userUid+"\'" %> alt="sendMessage" />
  						<area shape="rect" coords="160,8,330,40" href =<%="MessageInformation.jsp?uid=\'"+userUid+"\'" %> alt="receivedMessage" />					
					</map>
					<form class="mesList" name=ViewMessageForm method=post action="DeleteMessage" > 
   						<div class="item">
   							<label class="name">��&nbsp;&nbsp;&nbsp;�⣺</label>
   							<label class="ipt-t"><%=message.getMessageName() %> </label>  														
   						</div>
   						<div class="item">
   							<label class="name">�ռ��ˣ�</label>
   							<label class="ipt-t"><%=message.getSender() %></label>
   						</div>	
   						<div class="con">
   							<label class="name">��&nbsp;&nbsp;&nbsp;�ݣ�</label>
   							<label class="ipt-t"><%=message.getMessageContent() %></label>
   						</div>
						<div class="item">
							<input class="subBtn" type=submit name="Submit" value="" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input class="backBtn" type=button name="backBtn" value="" onclick="javascript:history.go(-1);" />						
						</div>
   						<div class="item">
   							<input name=messageName type=hidden id=uid value=<%=message.getMessageName() %> class="ipt-t" />
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