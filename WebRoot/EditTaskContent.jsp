<%@ page language="java" contentType="text/html; charset=GBK" %>
<%@ page import="Register.UserService" %>
<%@ page import="Register.User" %>
<%@ page import="Task.TaskLists" %>
<%@ page import="Task.Task"  %>
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<title>修改任务</title>
		<style type="text/css"> 
			/* 新建任务  */
			body{line-height:1.666;background-color:#fff}
			body,input{font-size:14px}
			body,input{font-family:verdana}
			body,ul,li{margin:0;padding:0;border:0}
			input{margin:0;padding:0}
			input{line-height:normal}
			ul{list-style:none}
			/* 行内元素 */
			.copy-item{display:inline-block;+display:inline;+zoom:1;vertical-align:middle}
			.ipt-t{vertical-align:middle;font-size:20px;font-weight:bold;padding:6px 0px;width:330px}											
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
						.func .taskName{width:650px;height:40px;margin:15px auto 0;font-size:20px}
						.func .tbl{width:650px;height:220px;margin:0 auto}
						.func .tbl .item{width:150px;height:46px}	
						.func .tbl .item .name{width:130px;line-height:30px}						
						.func .tbl .item .ipt-t{vertical-align:middle;font-size:14px;font-weight:bold;width:200px}											
						.func .button{width:387px;height:45px;margin-left:400px}												
						.editBtn{background:url(res/infoEditbtn.png);background-repeat:no-repeat}	
						.editBtn{width:119px;height:45px;border:none;cursor:pointer}						
						.backBtn{background:url(res/usrbackbtn.png);background-repeat:no-repeat}	
						.backBtn{width:119px;height:45px;border:none;cursor:pointer}						
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
		<%String userUid = null;
    	if(request.getAttribute("uid") != null){
     		userUid = (String)request.getAttribute("uid");
    	}
    	userUid = (String)session.getAttribute("uid");
    	System.out.println(userUid);
    	UserService service = new UserService();
		User user = service.getUser(userUid);

		String name = request.getParameter("name");

		TaskLists taskLists = new TaskLists();
		Task[] taskl = taskLists.getTaskList(userUid);
		int i = 0;
		for (i = 0; i < taskl.length; i++) {
			String names = taskl[i].getName();
			if (names.compareTo(name) == 0)
				break;
		}	
		Task task = taskl[i];
		%>		
		
   		<div class="container"> 		
   			<div class="header">
   				<img class="logo" src="res/logo.png"/ width="325" height="255" />
   				<label class="welc"><%=userUid %>&nbsp;&nbsp;Edit&nbsp;&nbsp;Task</label>
   			</div>
   			<div class="content">
   				<div class="info">
   					<label class="userName">帐号：&nbsp;<%=userUid %></label><br/>
   					 <%	String gender = "";
    					if (user.getGender()==0)
    						gender = "酷哥" ;
    					else gender = "靓女"; %>
    				<label class="userInfo">性别：&nbsp;<%=gender %></label><br/>
 					<label class="userInfo">邮箱：&nbsp;<%=user.getEmail() %></label><br/>
 					<label class="userInfo">账户余额：&nbsp;<%=user.getMoney() %></label><br/>
 					<%if (userUid.compareTo("kmj")==0){%>
 					<label class="userInfo">恭喜你是管理员哦~</label><br/>
 					<label class="userInfo">管理员权限：&nbsp;<a href=<%="ViewUser.jsp?uid="+userUid%>>查看用户</a></label> 					 					
					<%}%>  	
   				</div>
   				<div class="func">
   					<form name="EditTask" method="post" action="EditTask" >
  						<div class="taskName">
   							<label>任务名称：</label>
   							<label class="ipt-t">  <%=task.getName() %> </label>
						<input type=hidden name=taskName value=<%=task.getName() %>>														
   						</div>
   						<table class="tbl">
   							<tr>
   								<th><img src="res/this.png" width=180 height=120/></th>
   				   				<th>
   				   					<% if (task.getThisTask() == 1) {%>
   				   					<div class="item">
   				   						<label class="name">Gmail ID:</label>
   				   						<input type="text" name="gmailID" size="20" maxlength="50" value=<%=task.getGmailID() %> />
   				   					</div>
    				   				<div class="item">
    				   					<label class="name">Gmail 密码:</label>
   				   						<input type="password" name="gmailPassword" size="20" maxlength="50" value=<%=task.getGmailPassword() %> />   				   					</div> 
   				   					<%} 	
  									if (task.getThisTask() == 2) {%> 
   				   					<div class="item">
   				   						<label class="name">Weibo ID:</label>
   				   						<input type="text" name="weiboID" size="20" maxlength="50" value=<%=task.getWeiboID() %> />
   				   					</div>
    				   				<div class="item">
    				   					<label class="name">Weibo 密码:</label>
   				   						<input type="password" name="weiboPassword" size="20" maxlength="50" value=<%=task.getWeiboPassword() %> />
   				   					</div> 
    				   				<div class="item">
   				   						<label class="name">Weibo 内容:</label>
   				   						<input type="text" name="weiboContent" size="20" maxlength="50" value=<%=task.getWeiboContent() %> />
   				   					</div>
    				   				<div class="item">
    				   					<label class="name">Weibo 时间:</label>
   				   						<input type="text" name="weiboTime" size="20" maxlength="50" value=<%=task.getWeiboTime() %> />
   				   					</div>
   				   					<%}    				   					  									
			   						if(task.getThisTask() == 0) {%>	
   				   					<div class="item">
   				   						<label class="name">年:</label>
   				   						<input type="text" name="year" size="20" maxlength="50" value=<%=task.getYear() %> />
   				   					</div>
    				   				<div class="item">
    				   					<label class="name">月:</label>
   				   						<input type="text" name="month" size="20" maxlength="50" value=<%=task.getMonth() %> />
   				   					</div> 
    				   				<div class="item">
   				   						<label class="name">日:</label>
   				   						<input type="text" name="day" size="20" maxlength="50" value=<%=task.getDay() %> />
   				   					</div>
    				   				<div class="item">
    				   					<label class="name">时:</label>
   				   						<input type="text" name="hour" size="20" maxlength="50" value=<%=task.getHour() %> />
   				   					</div>	
    				   				<div class="item">
    				   					<label class="name">分:</label>
   				   						<input type="text" name="minute" size="20" maxlength="50" value=<%=task.getMinute() %> />
   				   					</div>	  		
     				   				<div class="item">
    				   					<label cl}ass="name">秒:</label>
   				   						<input type="text" name="second" size="20" maxlength="50" value=<%=task.getSecond() %> />
   				   					</div>
   				   					<%} %>	 			 		   			
   				   				</th>
   				   				<th><img src="res/that.png" width=180 height=120/></a></th>
   				   				<th>
 									<% if (task.getThatTask() == 0) {%>
    				   				<div class="item">
   				   						<label class="name">Gmail ID:</label>
   				   						<input type="text" name="gmailIDThat" size="20" maxlength="50" value=<%=task.getGmailIDThat() %> />
   				   					</div>
    				   				<div class="item">
    				   					<label class="name">Gmail 密码:</label>
   				   						<input type="text" name="gmailPasswordThat" size="20" maxlength="50" value=<%=task.getGmailPasswordThat() %> />
   				   					</div> 									
    				   				<div class="item">
   				   						<label class="name">收件人地址:</label>
   				   						<input type="text" name="gmailTitleThat" size="20" maxlength="50" value=<%=task.getGmailTitleThat() %> />
   				   					</div>
    				   				<div class="item">
    				   					<label class="name">邮件内容:</label>
   				   						<input type="text" name="gmailContentThat" size="20" maxlength="50" value=<%=task.getGmailContentThat() %> />
   				   					</div>
   				   					<%}
   				   					if (task.getThatTask() == 1) {%>
   				   					<div class="item">
   				   						<label class="name">Weibo ID:</label>
   				   						<input type="text" name="weiboIDThat" size="20" maxlength="50" value=<%=task.getWeiboIDThat() %> />
   				   					</div>
    				   				<div class="item">
    				   					<label class="name">Weibo 密码:</label>
   				   						<input type="text" name="weiboPasswordThat" size="20" maxlength="50" value=<%=task.getWeiboPasswordThat() %> />
   				   					</div> 
    				   				<div class="item">
   				   						<label class="name">Weibo 内容:</label>
   				   						<input type="text" name="weiboContentThat" size="20" maxlength="50" value=<%=task.getWeiboContentThat() %> />
   				   					</div>
   				   					<%} %>				   			
   				   				</th>
   				   			</tr>
   				   		</table>  													 					
    						<div class="button">
    							<input class="editBtn" type=submit name="Submit" value="" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     							<input class="backBtn" type=button name="backBtn" value="" onclick="javascript:history.go(-1);" />   				
    						</div>    				   	
    				</form> 				   	
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