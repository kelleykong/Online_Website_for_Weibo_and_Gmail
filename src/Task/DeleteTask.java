package Task;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteTask extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        response.setContentType("text/html;charset=GBK");
        //System.out.println("TaskNo="+TaskNo);
        String uid=request.getParameter("uid");
    	String viewUid=request.getParameter("viewUid");          
        String name = request.getParameter("taskName");
        System.out.println(name);
        TaskLists taskLists = new TaskLists();
        taskLists.deleteTask(name);
        
        if (viewUid.compareTo(uid) == 0) {
 	       this.getServletContext().getRequestDispatcher("/ViewTask.jsp").forward(request,response); 
         }
         else
  	       this.getServletContext().getRequestDispatcher("/ViewUser.jsp").forward(request,response); 
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}
	
	
}


