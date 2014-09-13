package Message;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;





public class MessageService {
	
	
	public void addMessage( Message message ){
			try{
				Class.forName( "com.mysql.jdbc.Driver");
			}catch ( ClassNotFoundException ex){
					ex.printStackTrace();
				}
			try{
				String urlString = "jdbc:mysql://localhost:3306/userdb";
				Connection connection = DriverManager.getConnection(urlString,"root","kmj968697");
				
				System.out.println("Database connected");
				
				Statement statement = connection.createStatement();
				
				statement.executeUpdate("insert into message " +
						"values('"+ message.getMessageName()+"','"+message.getMessageContent()+"','"+message.getSender()+"','"+message.getReceiver()+"')");
			
			}
			catch ( SQLException ex ){
				ex.printStackTrace();
			}
			System.out.println("addMessage");
	}
	
	public Message[] getMessageList( String receiver ){
		int num = 0;
		
		try{
			Class.forName( "com.mysql.jdbc.Driver");
		}catch ( ClassNotFoundException ex){
				ex.printStackTrace();
		}
		try{
			String urlStringTest = "jdbc:mysql://localhost:3306/userdb";
			Connection connectionTest = DriverManager.getConnection(urlStringTest,"root","kmj968697");
			
			System.out.println("Database connected");
			
			Statement statementTest = connectionTest.createStatement();
		
			
			System.out.println("Receiver = " + receiver );
			ResultSet resultSetTest = statementTest.executeQuery("select * from Message where receiver = '"+ receiver  + "' " );
		
			resultSetTest.last();
			 num = resultSetTest.getRow();
		}
		catch ( SQLException ex ){
			ex.printStackTrace();
		}
		
		
		
		Message[] messageList = new Message[num];
		System.out.println("MessageNum=" + num);
		try{
			String urlString = "jdbc:mysql://localhost:3306/userdb";
			Connection connection = DriverManager.getConnection(urlString,"root","kmj968697");
			
			System.out.println("Database connected");
			
			Statement statement = connection.createStatement();
		
			ResultSet resultSet = statement.executeQuery("select * from Message where receiver = '"+ receiver + "' " );
		

			
			int k = 0;
			
			while ( resultSet.next() ){

				System.out.println( resultSet.getString(4) );
				messageList[k] = new Message();
				messageList[k].setMessageName(resultSet.getString(1));
				messageList[k].setMessageContent( resultSet.getString(2));
				messageList[k].setSender(resultSet.getString(3));
				messageList[k].setReceiver(resultSet.getString(4));				
				
				k++;
			
			}
			
			for ( int i=0; i<num; i++ ){
				
				
			}
			

		}
		catch ( SQLException ex ){
			ex.printStackTrace();
		}

		System.out.println("getMessageLists");
		return messageList;
	}
	
	public Message getMessage( String messageName ){
		Message message = new Message();
		message.setMessageName(messageName);
		
		try{
			Class.forName( "com.mysql.jdbc.Driver");
		}catch ( ClassNotFoundException ex){
				ex.printStackTrace();
		}
		
		try{
			String urlString = "jdbc:mysql://localhost:3306/userdb";
			Connection connection = DriverManager.getConnection(urlString,"root","kmj968697");
			
			System.out.println("Database connected");
			
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery("select * from message where messageName = '" + messageName + "'");
			
			System.out.println("Database Selected");
			
			resultSet.next();
			

			    	message.setMessageContent(resultSet.getString(2));
			    	message.setSender(resultSet.getString(3));
			    	message.setReceiver(resultSet.getString(4));
			    	
			    	System.out.println(resultSet.getString(1) );
			    	
				
		}
		catch ( SQLException ex ){
			ex.printStackTrace();
		}
		
		
		return message;
	}
	
	public void deleteMessage( String messageName ){
		try{
			Class.forName( "com.mysql.jdbc.Driver");
		}catch ( ClassNotFoundException ex){
				ex.printStackTrace();
			}
		try{
			String urlString = "jdbc:mysql://localhost:3306/userdb";
			Connection connection = DriverManager.getConnection(urlString,"root","kmj968697");
			
			System.out.println("Database connected");
			
			Statement statement = connection.createStatement();
			
			statement.executeUpdate("delete from message where messageName = '"+ messageName +"' ");
		
		}
		catch ( SQLException ex ){
			ex.printStackTrace();
		}
		System.out.println("deleteMessage");
}
	
	public void deleteUserMessage( String uid ){
		try{
			Class.forName( "com.mysql.jdbc.Driver");
		}catch ( ClassNotFoundException ex){
				ex.printStackTrace();
			}
		try{
			String urlString = "jdbc:mysql://localhost:3306/userdb";
			Connection connection = DriverManager.getConnection(urlString,"root","kmj968697");
			
			System.out.println("Database connected");
			
			Statement statement = connection.createStatement();
			
			statement.executeUpdate("delete from message where sender = '"+ uid +"' ");
			statement.executeUpdate("delete from message where receiver = '"+ uid +"' ");
		
		}
		catch ( SQLException ex ){
			ex.printStackTrace();
		}
		System.out.println("deleteMessage");
}

}
