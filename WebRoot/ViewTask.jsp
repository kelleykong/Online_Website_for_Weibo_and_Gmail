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
		<title>查看任务</title>
		<style type="text/css"> 
			/* 查看任务  */
			body{line-height:1.666;background-color:#fff}
			body,input{font-size:14px}
			body,input{font-family:verdana}
			body,ul,li{margin:0;padding:0;border:0}
			input{margin:0;padding:0}
			input{line-height:normal}
			ul{list-style:none}
			/* 行内元素 */
			.copy-item{display:inline-block;+display:inline;+zoom:1;vertical-align:middle}			
			/* 页面容器   */
			.container{width:1000px;margin:0 auto}
			/* logo*/
			.logo{positon:relative;left:100px;top:100px}
				/* 头部   */
				.header{background:url(res/userHeader.png);background-repeat:no-repeat}
				.header{width:1000px;height:150px;margin:0 auto}
					.header .welc{color:white;font-size:30px;font-family:Comic Sans MS;font-weight:bold;position:absolute;top:80px}				
				/* 主要内容   */
				.content{width:1000px;height:650px;margin:0 auto}
					/* 个人资料 */
					.info{background:url(res/userInfo.png);background-repeat:no-repeat}
					.info{float:left;width:200px;height:650px;margin-left:14px}
						.info .userName{color:white;font-size:22px;font-family:Comic Sans MS;font-weight:bold;position:relative;top:40px;left:25px}
						.info .userInfo{color:white;font-size:16px;font-family:Comic Sans MS;position:relative;top:40px;left:25px}						
					/* 功能列表 */
					.func{background:url(res/userFunc2.png);background-repeat:no-repeat}
					.func{float:right;width:750px;height:650px;margin-right:14px}
						.func .taskList{width:600px;height:510px;margin:30px auto}
						.func .taskList .item{padding:3px 10px;width:500px;line-height:30px}
						.func .taskList .item .name{float:left;width:80px;line-height:30px;margin-right:10px}						
						.func .taskList .item .ipt-t{vertical-align:middle;font-weight:bold;padding:6px 0px;width:400px;cursor:pointer}
						.func .taskList .item .start{background:url(res/start.png);background-repeat:no-repeat}
						.func .taskList .item .start{width:30px;height:30px;border:none;cursor:pointer;}
						.func .taskList .item .del{background:url(res/delete.png);background-repeat:no-repeat}
						.func .taskList .item .del{width:9px;height:9px;border:none;cursor:pointer;float:right}						
						.func .back{width:387px;height:45px;margin-left:100px}						
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
    	String viewUid = request.getParameter("viewUid");
    	System.out.println(userUid);
    	System.out.println(viewUid);    	
    	UserService service = new UserService();
		User user = service.getUser(userUid);
		User viewUser = service.getUser(viewUid);
		
		TaskLists taskLists = new TaskLists();
		Task[] task = taskLists.getTaskList(viewUid);
		boolean emptyFlag = false;
		if (task.length==0) emptyFlag = true;%>
		
   		<div class="container"> 		
   			<div class="header">
   				<img class="logo" src="res/logo.png"/ width="325" height="255" />
   				<label class="welc"><%=userUid %>&nbsp;&nbsp;View&nbsp;&nbsp;Task</label>
   			</div>
   			<div class="content">
   				<div class="info">
   					<label class="userName">帐号：&nbsp;<%=userUid %></label><br/>
   					 <%	String gender = "";
    					if ( user.getGender()==0 )
    						gender = "酷哥" ;
    					else gender = "靓女"; %>
    				<label class="userInfo">性别：&nbsp;<%=gender %></label><br/>
 					<label class="userInfo">邮箱：&nbsp;<%=user.getEmail() %></label><br/>
 					<label class="userInfo">账户余额：&nbsp;<%=user.getMoney() %></label><br/>
 					<%if (userUid.compareTo("kmj")==0){%>
 					<label class="userInfo">管理员权限：&nbsp;<a href=<%="ViewUser.jsp?uid="+userUid%>>查看用户</a></label> 					 					
					<%}%>  	
   				</div>
   				<div class="func">
   					<div class="taskList">
   						<div class="item">
   							<label class="name">账号</label>
   							<label class="ipt-t">任务名称</label>							
   						</div>				
    					<% for (int i=0; i<task.length; i++){  %>					
   						<form class="item" name=userTaskForm method=post action="DeleteTask">
   							<label class="name"><%=task[i].getUid() %></label>
   							<label class="ipt-t"><a href=<%="ViewTaskContent.jsp?uid="+userUid+"&viewUid="+viewUid+"&name="+task[i].getName()%>><%=task[i].getName() %></a></label>
   							<input type=hidden name=taskName value=<%=task[i].getName() %> />
    						<input type=hidden name=uid value=<%=userUid %> />
    						<input type=hidden name=viewUid value=<%=viewUid %> />  							
   							<input type=hidden name=Submit value="" onclick="javascript:document.userTaskForm.action='StartTask'" class="start"/>
							<input type=submit name=Submit value="" class="del" />   							
   						</form>
   						<%} %>   						
   					</div>
   					<div class="back"><input class="backBtn" type=button name="backBtn" value="" onclick=<%="javascript:history.go(-1);" %> /></div> 				   	
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
