package Register;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateUser extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        response.setContentType("text/html;charset=GBK");
        String userUid=request.getParameter("userUid");        
    	String uid=request.getParameter("uid");
    	String password=request.getParameter("password");
    	String confirmPassword=request.getParameter("confirmPassword");
    	String email=request.getParameter("email");
    	int gender=Integer.parseInt(request.getParameter("gender"));
    	System.out.println("Gender = " + request.getParameter("gender"));
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
	    	//String validateCode=Generator.getEmailCode();
	    	//user.setValidateCode(validateCode);
	    	String path = request.getContextPath();
	    	//String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	    	service.updateUser(user);
	        PrintWriter out = response.getWriter();
	        if (uid.compareTo(userUid) == 0) {
	        	this.getServletContext().getRequestDispatcher("/ViewInformation.jsp").forward(request,response);
	        }
	        else {
	        	this.getServletContext().getRequestDispatcher("/ViewUser.jsp").forward(request,response);
	        }    	}catch(Exception e){
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
