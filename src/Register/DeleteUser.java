package Register;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Task.TaskLists;

public class DeleteUser extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        response.setContentType("text/html;charset=GBK");
        System.out.println("DeleteUser");
        System.out.println("UserNo=");
        String name = request.getParameter("userName");
        System.out.println(name);
        
        UserService userService = new UserService();
        
        userService.deleteUser( name );
        
        System.out.println("Already Delete Usser");
        

	    this.getServletContext().getRequestDispatcher("/ViewUser.jsp").forward(request,response);  
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}
	
	
}

