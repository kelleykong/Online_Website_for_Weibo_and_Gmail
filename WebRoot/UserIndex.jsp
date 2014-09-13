<%@ page language="java" contentType="text/html; charset=GBK" %>
<%@ page import="Register.UserService" %>
<%@ page import="Register.User" %>
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<title>Welcome to SIFTTT</title>
		<style type="text/css"> 
			/* ����ҳ��   */
			body{line-height:1.666;background-color:#fff}
			body,input{font-size:12px}
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
						.func .tbl{width:650px;height:325px;margin:40px auto}
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
    	if(request.getAttribute("uid") != null){
     		userUid = (String)request.getAttribute("uid");
    	}
    	userUid = (String)session.getAttribute("uid");
    	System.out.println(userUid);
    	UserService service = new UserService();
		User user = service.getUser(userUid);%>
   		<div class="container"> 		
   			<div class="header">
   				<img class="logo" src="res/logo.png"/ width="325" height="255" />
   				<label class="welc">&nbsp;Welcome&nbsp;&nbsp;<%=userUid %></label>
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
   					<table class="tbl">
   					<tr>
   						<th><a href=<%="ViewInformation.jsp?uid="+userUid%>><img border=0 src="res/mlogo1.png" width=150 height=150/></a></th>
   				   		<th><a href=<%="EditInformation.jsp?uid="+userUid+"&editUid="+userUid%>><img border=0 src="res/mlogo2.png" width=150 height=150/></a></th>
   				   		<th><a href=<%="MessageInformation.jsp?uid="+userUid%>><img border=0 src="res/mlogo3.png" width=150 height=150/></a></th>
   				   		<th><a href="index.jsp?uid="><img border=0 src="res/mlogo4.png" width=150 height=150/></a></th>  				   		
   				   	</tr>
   				   	<tr>
   						<th><a href=<%="CreateTask.jsp?uid="+userUid%>><img border=0 src="res/mlogo5.png" width=150 height=150/></a></th>
   				   		<th><a href=<%="ViewTask.jsp?uid="+userUid+"&viewUid="+userUid%>><img border=0 src="res/mlogo6.png" width=150 height=150/></a></th>
   				   		<th><a href=<%="EditTask.jsp?uid="+userUid%>><img border=0 src="res/mlogo7.png" width=150 height=150/></a></th>
   				   		<th><a href=<%="money.jsp?uid="+userUid%>><img border=0 src="res/mlogo8.png" width=150 height=150/></a></th>  				   		
   				   	</tr>
   				   	</table>
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