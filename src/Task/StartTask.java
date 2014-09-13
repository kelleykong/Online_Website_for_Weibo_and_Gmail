package Task;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Register.UserService;

public class StartTask extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        response.setContentType("text/html;charset=GBK");
        String TaskNo =request.getParameter("taskNumber");
        //System.out.println("TaskNo="+TaskNo);
        String name = request.getParameter("taskName");
        
        TaskLists taskLists = new TaskLists();
        Task task = taskLists.getTask(name);
        
        UserService userService = new UserService();
        String uid = task.getUid();
        
        if ( userService.runTask(uid) ) {
 
		taskLists.startTask(task);
		
        
        this.getServletContext().getRequestDispatcher("/UserIndex.jsp").forward(request,response); 
        }
        else
        {
        	PrintWriter out = response.getWriter();
        	 out.println("<center><font color='red'>«Î≥‰÷µ!</font><a href='#' onclick='history.back();'>∑µªÿ</a></center>");
        }
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}
}
