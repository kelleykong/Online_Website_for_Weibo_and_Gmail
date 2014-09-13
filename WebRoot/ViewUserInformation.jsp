<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@ page import="Register.UserService" %>
<%@ page import="Register.User" %>
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<title>个人资料</title>
		<style type="text/css"> 
			/* 个人资料   */
			body{line-height:1.666;background-color:#fff}
			body,input{font-size:15px}
			body,input{font-family:verdana}
			body,ul,li{margin:0;padding:0;border:0}
			input{margin:0;padding:0}
			input{line-height:normal}
			ul{list-style:none}
			/* 背景 */
			.editBtn{background:url(res/infoEditbtn.png);background-repeat:no-repeat}			
			.backBtn{background:url(res/usrbackbtn.png);background-repeat:no-repeat}
			/* 行内元素 */
			.copy-item{display:inline-block;+display:inline;+zoom:1;vertical-align:middle}	
			/* 按钮 */
			.editBtn{width:119px;height:45px;border:none;cursor:pointer}			
			.backBtn{width:119px;height:45px;border:none;cursor:pointer}			
			/* 页面容器   */
			.container{width:1000px;margin:0 auto}
			/* logo*/
			.logo{positon:relative;left:100px;top:100px}
				/* 头部   */
				.header{background:url(res/userHeader.png);background-repeat:no-repeat}
				.header{width:1000px;height:150px;margin:0 auto}
					.header .welc{color:white;font-size:30px;font-family:Comic Sans MS;font-weight:bold;position:absolute;top:80px}								
				/* 主要内容   */
				.content{width:1000px;height:400px;margin:0 auto}
					/* 个人资料 */
					.info{background:url(res/userInfo.png);background-repeat:no-repeat}
					.info{float:left;width:200px;height:400px;margin-left:14px}
						.info .userName{color:white;font-size:22px;font-family:Comic Sans MS;font-weight:bold;position:relative;top:40px;left:25px}
						.info .userInfo{color:white;font-size:16px;font-family:Comic Sans MS;position:relative;top:40px;left:25px}							
					/* 功能列表 */
					.func{background:url(res/userFunc.png);background-repeat:no-repeat}
					.func{float:right;width:750px;height:400px;margin-right:14px}
						.func .detailInfo{width:600px;height:350px;margin:25px auto}
						.func .detailInfo .item{padding:3px 10px;width:500px;line-height:30px}
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
		<%String uid=request.getParameter("uid");
		//uid = (String)session.getAttribute("uid");
		//out.println(uid); 
		String viewUid = request.getParameter("viewUser");
		UserService service = new UserService();
		User user = service.getUser(uid);
		User viewUser = service.getUser(viewUid);%>

   		<div class="container"> 
			<!-- 头部-->		
   			<div class="header">
   				<img class="logo" src="res/logo.png"/ width="325" height="255" />
    			<label class="welc">&nbsp;View&nbsp;&nbsp;<%=uid %>&nbsp;&nbsp;Information</label>  				
   			</div>
			<!-- 主要内容 -->
   			<div class="content">
   				<div class="info">
   					<label class="userName">帐号：&nbsp;<%=uid %></label><br/>
   					 <%	String gender = "";
    					if (user.getGender()==0)
    						gender = "酷哥";
    					else gender = "靓女"; %>
    				<label class="userInfo">性别：&nbsp;<%=gender %></label><br/>
 					<label class="userInfo">邮箱：&nbsp;<%=user.getEmail() %></label><br/>
 					<label class="userInfo">账户余额：&nbsp;<%=user.getMoney() %></label><br/>
 					<%if (uid.compareTo("kmj")==0){%>
 					<label class="userInfo">管理员权限：&nbsp;<a href=<%="ViewUser.jsp?uid="+uid%>>查看用户</a></label> 					 					
					<%}%>  						   				
   				</div>
   				<div class="func">
   					<div class="detailInfo">
						<div class="item"><label>帐&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:&nbsp;<%=viewUser.getUid() %></label></div>
						<%	String viewGender = "";
    					if (viewUser.getGender()==0)
    						viewGender = "酷哥";
    					else viewGender = "靓女"; %>
						<div class="item"><label>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:&nbsp;<%=viewGender %></label></div>
						<div class="item"><label>电&nbsp;&nbsp;子&nbsp;&nbsp;邮&nbsp;&nbsp;箱:&nbsp;<%=viewUser.getEmail() %></label></div>
						<div class="item"><label>密码提示问题:&nbsp;<%=viewUser.getQuestion() %></label></div>
						<div class="item"><label>密码提示答案:&nbsp;<%=viewUser.getAnswer() %></label></div>
						<div class="item"><label>真&nbsp;&nbsp;实&nbsp;&nbsp;姓&nbsp;&nbsp;名:&nbsp;<%=viewUser.getRealName() %></label></div>
						<div class="item"><label>联&nbsp;&nbsp;系&nbsp;&nbsp;电&nbsp;&nbsp;话:&nbsp;<%=viewUser.getTel() %></label></div>
						<div class="item"><label>账&nbsp;&nbsp;户&nbsp;&nbsp;余&nbsp;&nbsp;额:&nbsp;<%=viewUser.getMoney() %></label></div>
						<div class="item">
						<%String path="EditInformation.jsp?uid="+uid+"&editUid="+viewUid; %>
							<input class="editBtn" type=button name="editBtn" value="" onclick=<%="javascript:window.location=\'"+path+"\'"%> />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input class="backBtn" type=button name="backBtn" value="" onclick=<%="javascript:history.go(-1);" %> />
						</div>														
   					</div>  					 					
   				</div>
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