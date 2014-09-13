package Task;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Register.User;
import Register.UserService;

public class CreateTask extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        response.setContentType("text/html;charset=GBK");
        int thisTask = Integer.parseInt(request.getParameter("thisTask") );
        int thatTask = Integer.parseInt(request.getParameter("thatTask") );
        String name = request.getParameter("name");
        System.out.println(thisTask);
        System.out.println(thatTask);
        
        String uid = request.getParameter("uid");

        
        
   	
    	
    	TaskLists taskList=new TaskLists();
    	try{

	    	Task task=new Task();
	    	task.setUid(uid);
	    	task.setName(name);
	    	task.setThisTask(thisTask);
	    	task.setThatTask(thatTask);
	    	
	    	
	    	if ( thisTask == 0 ){
	    		int year = Integer.parseInt(request.getParameter("year"));
	    		int month = Integer.parseInt(request.getParameter("month"));
	    		int day = Integer.parseInt(request.getParameter("day"));
	    		int hour = Integer.parseInt(request.getParameter("hour"));
	    		int minute = Integer.parseInt(request.getParameter("minute"));
	    		int second = Integer.parseInt(request.getParameter("second"));
	    	
	    		task.setYear(year);
	    		task.setMonth(month);
	    		task.setDay(day);
	    		task.setHour(hour);
	    		task.setMinute(minute);
	    		task.setSecond(second);
	    		
	    	}
	    	
	    	if ( thisTask == 1 ){
	    		String gmailID = request.getParameter("gmailID");
		        String gmailPassword=request.getParameter("gmailPassword");
		        task.setGmailID( gmailID );
		        task.setGmailPassword( gmailPassword );
	    	}
	    	
	    	if ( thisTask == 2 ){
	    		String weiboID = request.getParameter("weiboID");
	    		String weiboPassword = request.getParameter("weiboPassword");
	    		String weiboContent = request.getParameter("weiboContent");
	    		int weiboTime = Integer.parseInt( request.getParameter("weiboTime"));
	    	
	    		task.setWeiboID(weiboID);
	    		task.setWeiboPassword(weiboPassword);
	    		task.setWeiboContent(weiboContent);
	    		task.setWeiboTime(weiboTime);
	    	}
	    	
	    	if ( thatTask == 0 ){
	    		String gmailIDThat = request.getParameter("gmailIDThat");
	    		String gmailPasswordThat = request.getParameter("gmailPasswordThat");
	    		String gmailTitleThat = request.getParameter("gmailTitleThat");
	    		String gmailContentThat = request.getParameter("gmailContentThat");
	    	
	    		task.setGmailIDThat(gmailIDThat);
	    		task.setGmailPasswordThat(gmailPasswordThat);
	    		task.setGmailTitleThat(gmailTitleThat);
	    		task.setGmailContentThat(gmailContentThat);
	    	
	    	}
	    	
	    	if ( thatTask == 1 ){
	    		String weiboIDThat = request.getParameter("weiboIDThat");
	    		String weiboPasswordThat = request.getParameter("weiboPasswordThat");
	    		String weiboContentThat = request.getParameter("weiboContentThat");
	    	
	    		task.setWeiboIDThat(weiboIDThat);
	    		task.setWeiboPasswordThat(weiboPasswordThat);
	    		task.setWeiboContentThat(weiboContentThat);
	    		
	    		System.out.println("WeiboPasswordthat:" + task.getWeiboPasswordThat());
	    	}
	    	
	    	
	    	taskList.addTask(task);

	        PrintWriter out = response.getWriter();
	        //out.println("<center>AddTask£¡</center>");
	        //Thread.sleep(2000);
	        this.getServletContext().getRequestDispatcher("/UserIndex.jsp").forward(request,response);  
    	}catch(Exception e){
    		e.printStackTrace();  
    		request.setAttribute("errMsg","×¢²á³ö´í£¡");
		 	this.getServletContext().getRequestDispatcher("/error.jsp").forward(request,response);
    	}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}
	
	
}
