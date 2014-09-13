package Register;
/**
 * 
 */
//package ch2.servlet;



import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
import ch2.service.UserService;
import ch2.util.Generator;
import ch2.vo.User;
*/
/**
 * @author Administrator
 *
 */
public class Register extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        response.setContentType("text/html;charset=GBK");
    	String uid=request.getParameter("uid");
    	String password=request.getParameter("password");
    	String confirmPassword=request.getParameter("confirmPassword");
    	String email=request.getParameter("email");
    	int gender=Integer.parseInt(request.getParameter("gender"));
    	String question=request.getParameter("question");
    	String answer=request.getParameter("answer");
    	String realName=request.getParameter("realName");
    	String tel=request.getParameter("tel");
    	if(uid==null || password.trim().equals("") || 
    			 password.trim().equals("") ||confirmPassword==null || 
    			 confirmPassword.trim().equals("") || email==null || email.trim().equals("") ||
    			 question==null || question.equals("") || answer==null || answer.equals("")){
    			 	request.setAttribute("errMsg","请将必填的数据填写完整!");
    			 	this.getServletContext().getRequestDispatcher("/error.jsp").forward(request,response);
    			 	return;
    	}else if(!password.equals(confirmPassword)){
		 	request.setAttribute("errMsg","两次密码不匹配!");
		 	this.getServletContext().getRequestDispatcher("/error.jsp").forward(request,response);  
		 	return;
    	}
    	UserService service=new UserService();
    	try{
    		/*
	    	boolean isExist=service.checkUid(uid);
	    	if(isExist){
	    		request.setAttribute("errMsg","用户名已经存在！");
			 	this.getServletContext().getRequestDispatcher("/error.jsp").forward(request,response);
			 	return;
	    	}*/
	    	User user=new User();
	    	user.setUid(uid);
	    	user.setPassword(password);
	    	user.setEmail(email);
	    	user.setGender(gender);
	    	user.setQuestion(question);
	    	user.setAnswer(answer);
	    	user.setTel(tel);
	    	user.setRealName(realName);
	    	System.out.print("user is done");
	    	//String validateCode=Generator.getEmailCode();
	    	//user.setValidateCode(validateCode);
	    	String path = request.getContextPath();
	    	//String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	    	service.addUser(user);
	    	System.out.print("addUser");
	    	this.getServletContext().getRequestDispatcher("/Login.jsp").forward(request,response);
    	}catch(Exception e){
    		e.printStackTrace();  
    		request.setAttribute("errMsg","注册出错！");
		 	this.getServletContext().getRequestDispatcher("/error.jsp").forward(request,response);
    	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}
	
}
