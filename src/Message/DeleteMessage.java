package Message;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Task.TaskLists;

public class DeleteMessage extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        response.setContentType("text/html;charset=GBK");
        String messageNo =request.getParameter("messageNumber");
        //System.out.println("TaskNo="+TaskNo);
        String messageName = request.getParameter("messageName" + messageNo );
        
        MessageService messageService = new MessageService();
        messageService.deleteMessage( messageName );
        
        //System.out.println("Message Name:" + messageName );
        

	     this.getServletContext().getRequestDispatcher("/ReceiveMessage.jsp").forward(request,response);  
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}
	
	
}
