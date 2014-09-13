package Register;
/**
 * 
 */


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




/**
 * @author Administrator
 *
 */
public class Login extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        response.setContentType("text/html;charset=GBK");
        try{
	      	String uid=request.getParameter("uid");
	      	String password=request.getParameter("password");
	      	UserService userService=new UserService();
	      	HttpSession session=request.getSession();

	        PrintWriter out = response.getWriter();
	      	if(userService.login(uid,password)){
		      	session.setAttribute("uid",uid);
	    	  	request.setAttribute("uid",uid);
	    	  	//out.println("<center><font color='blue'>你已登录成功！</font><a href='#' onclick='/error.jsp'>进入界面</a></center>");
	    	  	System.out.println(uid);
	    	  	//Thread.sleep(2000);
			 	this.getServletContext().getRequestDispatcher("/UserIndex.jsp").forward(request,response);  
	    	  	
	      	}else{
		        out.println("<center><font color='red'>用户名或密码错误!</font><a href='#' onclick='history.back();'>返回</a></center>");
	      	}
        }catch(Exception e){
        	e.printStackTrace();
    		request.setAttribute("errMsg","登录出错！");
		 	this.getServletContext().getRequestDispatcher("/error.jsp").forward(request,response);  
		 	return;
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}
}
