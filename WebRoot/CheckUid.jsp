<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="Register.UserService" %>
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>����û���</title>
		<style>
			.check{width:250px;height:150px;margin:100px auto}
				.check .word{font-size:20px;font-family:Comic Sans MS;}
		</style>
	</head>
	<body>
		<%String uid=request.getParameter("uid");
		UserService service=new UserService();
		System.out.println(uid);
		boolean isExist=service.checkUid(uid);%>

		<div class="check">
			<%if(isExist){%>
				<label class="word">���û����Ѿ����ڣ���ѡ��һ�����û�����</label>
			<%}else{%>
				<label class="word">���û�����δ��ʹ�ã�</label>
			<%}%>
			<p align="center"> <a href="javascript:window.close()" ><img boredr=0 src="res/close.png"/></a><br>
		</div>
	</body>
</html>