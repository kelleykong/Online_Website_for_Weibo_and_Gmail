package Message;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SendMessage extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        response.setContentType("text/html;charset=GBK");

        String sender = request.getParameter("sender");
        String receiver = request.getParameter("receiver");
        String messageName = request.getParameter("messageName");
        String messageContent = request.getParameter("messageContent");
        System.out.println(sender);

        Message message = new Message();
        
        message.setSender(sender);
        message.setReceiver(receiver);
        message.setMessageName(messageName);
        message.setMessageContent(messageContent);
        
        MessageService messageService = new MessageService();
        
        messageService.addMessage(message);
        System.out.println("Already add  message ");

	       this.getServletContext().getRequestDispatcher("/MessageInformation.jsp").forward(request,response);  
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}
	
	
}
