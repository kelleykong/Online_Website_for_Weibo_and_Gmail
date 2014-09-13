package Register;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Task.TaskLists;

public class Money extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        response.setContentType("text/html;charset=GBK");
        //System.out.println("DeleteUser");

        int  money = Integer.parseInt(request.getParameter("money" ) );
        System.out.println("money=" + money );
        
        
        String uid = request.getParameter("uid");
        System.out.println(uid);
        
        UserService userService = new UserService();
        
        userService.addMoney(uid, money);
        
       

        
        System.out.println("Already add Money Usser");
        

	    this.getServletContext().getRequestDispatcher("/UserIndex.jsp").forward(request,response);  
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}
	
	
}

