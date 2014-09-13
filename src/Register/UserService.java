package Register;
/**
 * 
 */
//package ch2.service;





import java.sql.*;
import java.util.List;

import Task.TaskLists;
import Message.MessageService;

/*
import ch2.dao.UserDAO;
import ch2.dao.impl.UserDAOImpl;
import ch2.util.db.Database;
import ch2.util.mail.MailUtil;
import ch2.vo.User;*/

/**
 * @author Administrator
 *
 */
public class UserService {
	//private UserDAO userDAO=new UserDAOImpl();
	
	public UserService(){
		
	}
	
	public void addUser( User user ){
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
		
		//statement.executeUpdate("drop table userNew");
		//statement.executeUpdate("create table userNew(" +
		//		"uid char(20) )");
		//String str = "HH";
		statement.executeUpdate("insert into user " +
				"values('0','"+user.getUid()+"','"+user.getPassword()+"','"+user.getRealName()+"','"+user.getGender()+"'," +
						"'"+user.getEmail()+"','"+user.getTel()+"','"+user.getQuestion()+"','"+user.getValidateCode()+"'," +
						"'"+user.getAnswer()+"','100')");
	
	}
	catch ( SQLException ex ){
		ex.printStackTrace();
	}
	

	}
	
	public void updateUser( User user ){
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
			

			statement.executeUpdate("update user set password = '"+user.getPassword() + "'where uid = '" + user.getUid() + "'");
			statement.executeUpdate("update user set realName = '"+user.getRealName() + "'where uid = '" + user.getUid() + "'");
			statement.executeUpdate("update user set gender = '"+user.getGender() + "'where uid = '" + user.getUid() + "'");
			statement.executeUpdate("update user set email = '"+user.getEmail() + "'where uid = '" + user.getUid() + "'");
			statement.executeUpdate("update user set tel = '"+user.getTel() + "'where uid = '" + user.getUid() + "'");
			statement.executeUpdate("update user set question = '"+user.getQuestion() + "'where uid = '" + user.getUid() + "'");
			statement.executeUpdate("update user set answer = '"+user.getAnswer() + "'where uid = '" + user.getUid() + "'");
		}
		catch ( SQLException ex ){
			ex.printStackTrace();
		}
	}
	
	public void deleteUser( String uid ){
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
			
			statement.executeUpdate("delete from user where uid = '"+ uid +"' ");
			
			TaskLists taskList = new TaskLists();
			
			taskList.deleteTaskUid(uid);
			
			MessageService messageService = new MessageService();
			messageService.deleteUserMessage(uid);
			
			
			
		}
		catch ( SQLException ex ){
			ex.printStackTrace();
		}
	}
	
	public boolean login(String uid,String password){
		boolean result = false;
		
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
			
			ResultSet resultSet = statement.executeQuery("select * from user");
			
			System.out.println("Database Selected");
			

			
			while ( resultSet.next() ){
				if ( resultSet.getString(2).compareTo( uid ) == 0 && resultSet.getString(3).compareTo(password) == 0 )
					result = true;
			}
				//System.out.println(resultSet.getString(1) + " " + resultSet.getString(2) + " " + resultSet.getString(3) );
		}
		catch ( SQLException ex ){
			ex.printStackTrace();
		}
		   
		return result;
		   
	}
	
	public boolean checkUid( String uid ){
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
			
			ResultSet resultSet = statement.executeQuery("select * from user");
			
			System.out.println("Database Selected");
			
			while ( resultSet.next() ){
				if ( resultSet.getString(2).compareTo( uid ) == 0  )
					return true;
			}
				//System.out.println(resultSet.getString(1) + " " + resultSet.getString(2) + " " + resultSet.getString(3) );
		}
		catch ( SQLException ex ){
			ex.printStackTrace();
		}
		

		return false;
	}
	
	public User getUser( String uid){
		User user = new User();
		user.setUid(uid);
		
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
			
			ResultSet resultSet = statement.executeQuery("select * from user");
			
			System.out.println("Database Selected");
			
			while ( resultSet.next() ){
				if ( resultSet.getString(2).compareTo( uid ) == 0  ){
			    	user.setUid(resultSet.getString(2));
			    	user.setPassword(resultSet.getString(3));
			    	user.setRealName(resultSet.getString(4));
			    	user.setGender(Integer.parseInt(resultSet.getString(5)));
			    	user.setEmail(resultSet.getString(6));
			    	user.setTel(resultSet.getString(7));
			    	user.setQuestion(resultSet.getString(8));
			    	user.setAnswer(resultSet.getString(10));
			    	user.setMoney(Integer.parseInt(resultSet.getString(11)));
			    	System.out.println(resultSet.getString(4) );
			    	return user;
			    	
				}
			}
				
		}
		catch ( SQLException ex ){
			ex.printStackTrace();
		}
		
		
		return user;
	}
	
	public User[] getUserName(){

		int num = 0;
		
		
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
			
			ResultSet resultSet = statement.executeQuery("select * from user");
			
			resultSet.last();
			num = resultSet.getRow();
			
		}
		catch ( SQLException ex ){
			ex.printStackTrace();
		}
		
		System.out.println("UserNum=" + num);
		User[] user = new User[num];
		
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
			
			ResultSet resultSet = statement.executeQuery("select * from user");
			
			int k = 0;
			while ( resultSet.next() ){
				user[k] = new User();
				user[k].setUid(resultSet.getString(2));
		    	user[k].setPassword(resultSet.getString(3));
		    	user[k].setRealName(resultSet.getString(4));
		    	user[k].setGender(Integer.parseInt(resultSet.getString(5)));
		    	user[k].setEmail(resultSet.getString(6));
		    	user[k].setTel(resultSet.getString(7));
		    	user[k].setQuestion(resultSet.getString(8));
		    	user[k].setAnswer(resultSet.getString(10));
		    	user[k].setMoney(Integer.parseInt(resultSet.getString(11)));
				k++;
			}
			
		}
		catch ( SQLException ex ){
			ex.printStackTrace();
		}
		
		
		System.out.println("Get already user!");
		return user;
	}
	
	public void addMoney( String uid, int money ){
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
			
			
			System.out.println("Database Selected");
			
			statement.executeUpdate("update user set money = money +  '"+money + "'where uid = '" + uid + "'");

				
		}
		catch ( SQLException ex ){
			ex.printStackTrace();
		}
		

		
	}
	
	public boolean  runTask( String uid ){
		
		boolean flag = true;
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
			
			
			System.out.println("Database Selected");
			
			ResultSet resultSet = statement.executeQuery("select * from user where uid = '" + uid + "'");
			
			resultSet.next();
			
			int money = Integer.parseInt(resultSet.getString(11));
			
			System.out.println( "money:" + money );
			
			if ( money >= 50 ) {
				flag = true;
				
				statement.executeUpdate("update user set money = money - '50' where uid = '" + uid + "'");
				
			}
			else flag = false;
			
			//statement.executeUpdate("update user set money = money +  '"+money + "'where uid = '" + uid + "'");

				
		}
		catch ( SQLException ex ){
			ex.printStackTrace();
		}
		
		return flag;
		
	}
	
}
	
	
