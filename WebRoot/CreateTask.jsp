<%@ page language="java" contentType="text/html; charset=GBK" %>
<%@ page import="Register.UserService" %>
<%@ page import="Register.User" %>
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<title>�½�����</title>
		<style type="text/css"> 
			/* �½�����  */
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
						.func .tbl{width:650px;height:300px;margin:10px auto}
						.func .tbl .item{width:150px;height:90px}
						.func .button{width:387px;height:45px;margin-left:400px}												
						.nextBtn{background:url(res/next.png);background-repeat:no-repeat}	
						.nextBtn{width:119px;height:45px;border:none;cursor:pointer}						
						.backBtn{background:url(res/usrbackbtn.png);background-repeat:no-repeat}	
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
   				<label class="welc"><%=userUid %>&nbsp;&nbsp;Create&nbsp;&nbsp;Task</label>
   			</div>
   			<div class="content">
   				<div class="info">
   					<label class="userName">�ʺţ�&nbsp;<%=userUid %></label><br/>
   					 <%	String gender = "";
    					if ( user.getGender()==0 )
    						gender = "���" ;
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
   					<form name=userRegisterForm method=post action=CreateTaskContent.jsp >   				
   					<table class="tbl">
   					<tr>
   						<th><img src="res/this.png" width=180 height=120/></th>
   				   		<th>
   				   			<div class="item">
   				   				<input type="radio" name="thisTask" value="0" checked />
   				   				<img src="res/clock.jpg" width=120 height=120/>
   				   			</div>
    				   			<div class="item">
   				   				<input type="radio" name="thisTask" value="1" />
   				   				<img src="res/gmail.png" width=120 height=120/>
   				   			</div>  				   			
   				   			<div class="item">
   				   				<input type="radio" name="thisTask" value="2" />
   				   				<img src="res/weibo2.png" width=120 height=120/>
   				   			</div>
   				   		</th>
   				   		<th><img src="res/that.png" width=180 height=120/></a></th>
   				   		<th>
   				   			<div class="item">
   				   				<input type="radio" name="thatTask" value="0" checked />
   				   				<img src="res/gmail.png" width=120 height=120/>
   				   			</div>
    				   		<div class="item">
   				   				<input type="radio" name="thatTask" value="1" />
   				   				<img src="res/weibo2.png" width=120 height=120/>
   				   			</div>  				   			
   				   		</th>
   				   	</tr>
   				   	</table>
    				<div class="button">
    					<input class="nextBtn" type=submit name="Submit" value="" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     					<input class="backBtn" type=button name="backBtn" value="" onclick=<%="javascript:window.location=\'"+"UserIndex.jsp?uid="+userUid+"\'" %> />   				
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