package Task;

import java.sql.*;

import DataAccessObject.DataAccessObject;


public class TaskLists {

	
	public TaskLists(){
		
	}
	
	public void updateTask( Task task ){
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
			
			if ( task.getThisTask() == 0 ){
				statement.executeUpdate("update taskThis_time set year = '"+task.getYear() + "'where name = '" + task.getName() + "'");
				statement.executeUpdate("update taskThis_time set month = '"+task.getMonth() + "'where name = '" + task.getName() + "'");
				statement.executeUpdate("update taskThis_time set day = '"+task.getDay() + "'where name = '" + task.getName() + "'");
				statement.executeUpdate("update taskThis_time set hour = '"+task.getHour() + "'where name = '" + task.getName() + "'");
				statement.executeUpdate("update taskThis_time set minute = '"+task.getMinute() + "'where name = '" + task.getName() + "'");
				statement.executeUpdate("update taskThis_time set second = '"+task.getSecond() + "'where name = '" + task.getName() + "'");
			}
			
			if ( task.getThisTask() == 1 ){
				statement.executeUpdate("update taskThis_gmail set gmailID = '"+task.getGmailID() + "'where name = '" + task.getName() + "'");
				statement.executeUpdate("update taskThis_gmail set gmailPassword = '"+task.getGmailPassword() + "'where name = '" + task.getName() + "'");
			}
			
			if ( task.getThisTask() == 2 ){
				statement.executeUpdate("update taskThis_weibo set weiboID = '"+task.getWeiboID() + "'where name = '" + task.getName() + "'");
				statement.executeUpdate("update taskThis_weibo set weiboPassword = '"+task.getWeiboPassword() + "'where name = '" + task.getName() + "'");
				statement.executeUpdate("update taskThis_weibo set weiboContent = '"+task.getWeiboContent() + "'where name = '" + task.getName() + "'");
				statement.executeUpdate("update taskThis_weibo set weiboTime = '"+task.getWeiboTime() + "'where name = '" + task.getName() + "'");
			}
			
			if ( task.getThatTask() == 0 ){
				statement.executeUpdate("update taskThat_gmail set gmailIDThat = '"+task.getGmailIDThat() + "'where name = '" + task.getName() + "'");
				statement.executeUpdate("update taskThat_gmail set gmailPasswordThat = '"+task.getGmailPasswordThat() + "'where name = '" + task.getName() + "'");
				statement.executeUpdate("update taskThat_gmail set gmailTitleThat = '"+task.getGmailTitleThat() + "'where name = '" + task.getName() + "'");
				statement.executeUpdate("update taskThat_gmail set gmailContentThat = '"+task.getGmailContentThat() + "'where name = '" + task.getName() + "'");
			}
			
			if ( task.getThatTask() == 1 ){
				statement.executeUpdate("update taskThat_weibo set weiboIDThat = '"+task.getWeiboIDThat() + "'where name = '" + task.getName() + "'");
				statement.executeUpdate("update taskThat_weibo set weiboPasswordThat = '"+task.getWeiboPasswordThat() + "'where name = '" + task.getName() + "'");
				statement.executeUpdate("update taskThat_weibo set weiboContentThat = '"+task.getWeiboContentThat() + "'where name = '" + task.getName() + "'");
			}
		}
		catch ( SQLException ex ){
			ex.printStackTrace();
		}
		

	}
	
	public void addTask( Task task){
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
//			DataAccessObject.increaseTask();
//			int taskNo = DataAccessObject.getNumofTask();
		
			task.setName(task.getUid()+"_" + task.getName());
			
			
			System.out.println("ADD " + task.getName()  );
			statement.executeUpdate("insert into task " +
					"values('"+task.getName()+"','"+task.getUid()+"','"+task.getThisTask()+"','"+task.getThatTask()+"')");
			if ( task.getThisTask() == 0 ){
				statement.executeUpdate("insert into taskThis_time " +
						"values('"+task.getName()+"','"+task.getUid()+"','"+task.getYear()+"','"+task.getMonth()+"','" +task.getDay()+ "','" +task.getHour()+ "','" +task.getMinute()+ "','" +task.getSecond()+ "')");
			}
			
			if ( task.getThisTask() == 1 ){
				statement.executeUpdate("insert into taskThis_gmail " +
						"values('"+task.getName()+"','"+task.getUid()+"','"+task.getGmailID()+"','"+task.getGmailPassword()+"')");
			}
			
			if ( task.getThisTask() == 2 ){
				statement.executeUpdate("insert into taskThis_weibo " +
						"values('"+task.getName()+"','"+task.getUid()+"','"+task.getWeiboID()+"','"+task.getWeiboPassword()+"','" +task.getWeiboContent()+ "','" +task.getWeiboTime() + "')");
			}
			
			if ( task.getThatTask() == 0 ){
				statement.executeUpdate("insert into taskThat_gmail " +
						"values('"+task.getName()+"','"+task.getUid()+"','"+task.getGmailIDThat()+"','"+task.getGmailPasswordThat()+"','" +task.getGmailTitleThat()+ "','" +task.getGmailContentThat() + "')");
			}
			
			if ( task.getThatTask() == 1 ){
				statement.executeUpdate("insert into taskThat_weibo " +
						"values('"+task.getName()+"','"+task.getUid()+"','"+task.getWeiboIDThat()+"','"+task.getWeiboPasswordThat()+"','"  +task.getWeiboContentThat() + "')");
			}
		}
		catch ( SQLException ex ){
			ex.printStackTrace();
		}
		

	}
	
	public void deleteTaskUid( String uid ){
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
				
			System.out.println("TaskUid = " + uid);
			
			statement.executeUpdate("delete from task where uid = '"+ uid +"' ");
			statement.executeUpdate("delete from taskThis_gmail where uid = '"+ uid +"' ");
			statement.executeUpdate("delete from taskThis_weibo where uid = '"+ uid +"' ");
			statement.executeUpdate("delete from taskThis_time where uid = '"+ uid +"' ");
			statement.executeUpdate("delete from taskThat_gmail where uid = '"+ uid +"' ");
			statement.executeUpdate("delete from taskThat_weibo where uid = '"+ uid +"' ");

		}
		catch ( SQLException ex ){
			ex.printStackTrace();
		}
		

	}
	
	public void startTask( Task task){
		int thistask = task.getThisTask();
		int thattask = task.getThatTask();
		
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
			
			
			System.out.println("TaskName = " + task.getName());
			if(thistask == 0){
				ResultSet resultSet = statement.executeQuery("select * from taskThis_time where name = '"+ task.getName() + "' " );
				resultSet.next();
				task.setYear(Integer.parseInt(resultSet.getString(3)));
				task.setMonth(Integer.parseInt(resultSet.getString(4)));
				task.setDay(Integer.parseInt(resultSet.getString(5)));
				task.setHour(Integer.parseInt(resultSet.getString(6)));
				task.setMinute(Integer.parseInt(resultSet.getString(7)));
				task.setSecond(Integer.parseInt(resultSet.getString(8)));
			}
			else if(thistask == 1){
				ResultSet resultSet = statement.executeQuery("select * from taskThis_gmail where name = '"+ task.getName() + "' " );
				resultSet.next();
				task.setGmailID(resultSet.getString(3));
				task.setGmailPassword(resultSet.getString(4));
			}
			else{
				ResultSet resultSet = statement.executeQuery("select * from taskThis_weibo where name = '"+ task.getName() + "' " );
				resultSet.next();
				task.setWeiboID(resultSet.getString(3));
				task.setWeiboPassword(resultSet.getString(4));
				task.setWeiboContent(resultSet.getString(5));
				task.setWeiboTime(Integer.parseInt(resultSet.getString(6)));
			}
			if(thattask == 0){
				ResultSet resultSet = statement.executeQuery("select * from taskThat_gmail where name = '"+ task.getName() + "' " );
				resultSet.next();
				task.setGmailIDThat(resultSet.getString(3));
				task.setGmailPasswordThat(resultSet.getString(4));
				task.setGmailTitleThat(resultSet.getString(5));
				task.setGmailContentThat(resultSet.getString(6));
			}
			else{
				ResultSet resultSet = statement.executeQuery("select * from taskThat_weibo where name = '"+ task.getName() + "' " );
				resultSet.next();
				task.setWeiboIDThat(resultSet.getString(3));
				task.setWeiboPasswordThat(resultSet.getString(4));
				task.setWeiboContentThat(resultSet.getString(5));
			}
		}
		catch ( SQLException ex ){
			ex.printStackTrace();
		}
		
		TaskClass taskthread = new TaskClass(task);
		Thread thread = new Thread(taskthread);
		thread.start();
	}
	
	public void deleteTask( String taskName ){
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
//			DataAccessObject.increaseTask();
//			int taskNo = DataAccessObject.getNumofTask();
		
			System.out.println("TaskName = " + taskName);
			
			statement.executeUpdate("delete from task where name = '"+ taskName +"' ");
			statement.executeUpdate("delete from taskThis_gmail where name = '"+ taskName +"' ");
			statement.executeUpdate("delete from taskThis_weibo where name = '"+ taskName +"' ");
			statement.executeUpdate("delete from taskThis_time where name = '"+ taskName +"' ");
			statement.executeUpdate("delete from taskThat_gmail where name = '"+ taskName +"' ");
			statement.executeUpdate("delete from taskThat_weibo where name = '"+ taskName +"' ");
			
			//			if ( task.getThisTask() == 0 ){
//				
//			}
//			
//			if ( task.getThisTask() == 1 ){
//				statement.executeUpdate("insert into taskThis_gmail " +
//						"values('"+task.getName()+"','"+task.getUid()+"','"+task.getGmailID()+"','"+task.getGmailPassword()+"')");
//			}
//			
//			if ( task.getThisTask() == 2 ){
//				statement.executeUpdate("insert into taskThis_weibo " +
//						"values('"+task.getName()+"','"+task.getUid()+"','"+task.getWeiboID()+"','"+task.getWeiboPassword()+"','" +task.getWeiboContent()+ "','" +task.getWeiboTime() + "')");
//			}
//			
//			if ( task.getThatTask() == 0 ){
//				statement.executeUpdate("insert into taskThat_gmail " +
//						"values('"+task.getName()+"','"+task.getUid()+"','"+task.getGmailIDThat()+"','"+task.getGmailPasswordThat()+"','" +task.getGmailTitleThat()+ "','" +task.getGmailContentThat() + "')");
//			}
//			
//			if ( task.getThatTask() == 1 ){
//				statement.executeUpdate("insert into taskThat_weibo " +
//						"values('"+task.getName()+"','"+task.getUid()+"','"+task.getWeiboIDThat()+"','"+task.getWeiboPasswordThat()+"','"  +task.getWeiboContentThat() + "')");
//			}
		}
		catch ( SQLException ex ){
			ex.printStackTrace();
		}
		

	}
	
	public Task getTask( String taskName ){
		Task task = new Task();
		task.setName(taskName);
		
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
		
			ResultSet resultSet = statement.executeQuery("select * from task where name = '"+ taskName + "' " );
		
			resultSet.next();
			task.setUid(resultSet.getString(2));
			task.setThisTask(Integer.parseInt(resultSet.getString(3)));
			task.setThatTask(Integer.parseInt(resultSet.getString(4)));
			
		}
		catch ( SQLException ex ){
			ex.printStackTrace();
		}

		return task;
	}
	
	
	
	public Task[] getTaskList( String uid ){
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
		
			ResultSet resultSetTest = statementTest.executeQuery("select * from task where uid = '"+ uid + "' " );
		
			resultSetTest.last();
			 num = resultSetTest.getRow();
			

		
		}
		catch ( SQLException ex ){
			ex.printStackTrace();
		}
		
		
		Task[] taskList = new Task[num];
		System.out.println("num=" + num);
		try{
			String urlString = "jdbc:mysql://localhost:3306/userdb";
			Connection connection = DriverManager.getConnection(urlString,"root","kmj968697");
			
			System.out.println("Database connected");
			
			Statement statement = connection.createStatement();
		
			ResultSet resultSet = statement.executeQuery("select * from task where uid = '"+ uid + "' " );
		

			
			int k = 0;
			
			while ( resultSet.next() ){

				System.out.println( resultSet.getString(1) );
				taskList[k] = new Task();
				taskList[k].setName(resultSet.getString(1));
				taskList[k].setUid( resultSet.getString(2));
				taskList[k].setThisTask(Integer.parseInt(resultSet.getString(3)));
				taskList[k].setThatTask(Integer.parseInt(resultSet.getString(4)));				
				
				k++;
			
			}
			
			for ( int i=0; i<num; i++ ){
				if ( taskList[i].getThisTask() == 0 ){
					
					resultSet = statement.executeQuery("select * from taskThis_time where name = '"+ taskList[i].getName() + "' " );
					resultSet.next();
					
					taskList[i].setYear(Integer.parseInt(resultSet.getString(3)));
					taskList[i].setMonth(Integer.parseInt(resultSet.getString(4)));
					taskList[i].setDay(Integer.parseInt(resultSet.getString(5)));
					taskList[i].setHour(Integer.parseInt(resultSet.getString(6)));
					taskList[i].setMinute(Integer.parseInt(resultSet.getString(7)));
					taskList[i].setSecond(Integer.parseInt(resultSet.getString(8)));
				}
				if ( taskList[i].getThisTask() == 1 ){

					System.out.println("TestGmail:"+taskList[i].getName());
					resultSet = statement.executeQuery("select * from taskThis_gmail where name = '"+ taskList[i].getName() + "' " );
					System.out.println("**");
					resultSet.next();
					System.out.println(resultSet.getString(3));
					taskList[i].setGmailID(resultSet.getString(3));
					taskList[i].setGmailPassword(resultSet.getString(4));
				}

				if ( taskList[i].getThisTask() == 2 ){
					
					resultSet = statement.executeQuery("select * from taskThis_weibo where name = '"+ taskList[i].getName() + "' " );
					resultSet.next();
					
					taskList[i].setWeiboID(resultSet.getString(3));
					taskList[i].setWeiboPassword(resultSet.getString(4));
					taskList[i].setWeiboContent(resultSet.getString(5));
					taskList[i].setWeiboTime(Integer.parseInt(resultSet.getString(6)));
				}
				if ( taskList[i].getThatTask() == 0 ){
					
					resultSet = statement.executeQuery("select * from taskThat_gmail where name = '"+ taskList[i].getName() + "' " );
					resultSet.next();
					
					taskList[i].setGmailIDThat(resultSet.getString(3));
					taskList[i].setGmailPasswordThat(resultSet.getString(4));
					taskList[i].setGmailTitleThat(resultSet.getString(5));
					taskList[i].setGmailContentThat(resultSet.getString(6));
				
				}
				if ( taskList[i].getThatTask() == 1 ){
					
					resultSet = statement.executeQuery("select * from taskThat_weibo where name = '"+ taskList[i].getName() + "' " );
					resultSet.next();
					
					taskList[i].setWeiboIDThat(resultSet.getString(3));
					taskList[i].setWeiboPasswordThat(resultSet.getString(4));
					taskList[i].setWeiboContentThat(resultSet.getString(5));
				}
				
			}
			

		}
		catch ( SQLException ex ){
			ex.printStackTrace();
		}

		System.out.println("getTaskLists");
		return taskList;
	}
}
