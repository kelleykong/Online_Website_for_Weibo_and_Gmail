<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>错误页面</title>
		<style>
			.err{width:150px;height:150px;margin:100px auto}
				.err .word{font-size:20px;font-family:Comic Sans MS;}
		</style>
	</head>
	<body >
		<div class=err>
			<img src="res/err.png" alt="error" />
			<%String errMsg=(String )request.getAttribute("errMsg");
	        if(errMsg!=null && errMsg.trim().length()>0){%>
		        <label class="word"><%=errMsg%></label>
	      	<%}else{ %>
	      		<label class="word"><center>未知错误!</center></label>
	      	<%}%>
			<a href="script.history.go(-1);"><center><img border=0 src="res/back.png" /></center></a>	       
		</div>
	</body>
</html>