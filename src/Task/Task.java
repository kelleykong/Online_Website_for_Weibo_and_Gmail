package Task;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.Date;
import java.util.List;

import javax.swing.Timer;

import weibo4j.Status;
import weibo4j.Weibo;
import weibo4j.WeiboException;
import weibo4j.http.AccessToken;
import weibo4j.http.RequestToken;

public class Task {
	public static String CONSUMER_KEY = "2051895210";
	public static String CONSUMER_SECRET = "5d27f8ecafb01f9089c21e70f1ce3d3d";
	
	private String name = "";
	private String uid;
	private int thisTask;
	private int thatTask;
	
	private int year;
	private int month;
	private int day;
	private int hour;
	private int minute;
	private int second;
	
	
	private String gmailID;
	private String gmailPassword;
	
	private String weiboID;
	private String weiboPassword;
	private String weiboContent;
	private int weiboTime;
	
	private String gmailIDThat;
	private String gmailPasswordThat;
	private String gmailTitleThat;
	private String gmailContentThat;
	
	private String weiboIDThat;
	private String weiboPasswordThat;
	private String weiboContentThat;
	
	private JavaMail mail = new JavaMail();
	public Task(){
		
	}
	
	public String getName(){
		return name;
	}
	
	public void setName( String name ){
		this.name = name;
	}
	
	
	public String getUid(){
		return uid;
	}
	
	public void setUid( String uid ){
		this.uid = uid;
	}
	
	
	public int getThisTask(){
		return thisTask;
	}
	
	public void setThisTask( int thisTask){
		this.thisTask = thisTask;
	}
	
	public int getThatTask(){
		return thatTask;
	}
	
	public void setThatTask( int thatTask ){
		this.thatTask = thatTask;
	}
	
	public int getYear(){
		return year;
	}
	
	public void setYear( int year ){
		this.year = year;
	}
	
	public int getMonth(){
		return month;
	}
	
	public void setMonth( int month ){
		this.month = month;
	}
	
	public int getDay(){
		return day;
	}
	
	public void setDay( int day ){
		this.day = day;
	}
	
	public int getHour(){
		return hour;
	}
	
	public void setHour( int hour ){
		this.hour = hour;
	}
	
	public int getMinute(){
		return minute;
	}
	
	public void setMinute( int minute ){
		this.minute = minute;
	}
	
	public int getSecond(){
		return second;
	}
	
	public void setSecond( int second ){
		this.second = second;
	}
	
	
	public String getGmailID(){
		return gmailID;
	}
	
	public void setGmailID( String gmailID ){
		this.gmailID = gmailID;
	}
	
	public String getGmailPassword(){
		return gmailPassword;
	}
	
	public void setGmailPassword( String gmailPassword ){
		this.gmailPassword = gmailPassword;
	}
	
	public String getWeiboID(){
		return weiboID;
	}
	
	public void setWeiboID( String weiboID){
		this.weiboID = weiboID;
	}
	
	public String getWeiboPassword(){
		return weiboPassword;
	}
	
	public void setWeiboPassword( String weiboPassword ){
		this.weiboPassword = weiboPassword;
	}
	
	public String getWeiboContent(){
		return weiboContent;
	}
	
	public void setWeiboContent( String weiboContent ){
		this.weiboContent = weiboContent;
	}
	
	public int getWeiboTime(){
		return weiboTime;
	}
	
	public void setWeiboTime( int weiboTime ){
		this.weiboTime = weiboTime;
	}
	
	public String getGmailIDThat(){
		return gmailIDThat;
	}
	
	public void setGmailIDThat( String gmailIDThat ){
		this.gmailIDThat = gmailIDThat;
	}
	
	public String getGmailPasswordThat(){
		return gmailPasswordThat;
	}
	
	public void setGmailPasswordThat( String gmailPasswordThat ){
		this.gmailPasswordThat = gmailPasswordThat;
	}
	
	public String getGmailTitleThat(){
		return gmailTitleThat;
	}
	
	public void setGmailTitleThat( String gmailTitleThat ){
		this.gmailTitleThat = gmailTitleThat;
	}
	
	public String getGmailContentThat(){
		return gmailContentThat;
	}
	
	public void setGmailContentThat( String gmailContentThat ){
		this.gmailContentThat  = gmailContentThat;
	}
	
	public String getWeiboIDThat(){
		return weiboIDThat;
	}
	
	public void setWeiboIDThat( String weiboIDThat ){
		this.weiboIDThat = weiboIDThat;
	}
	
	public String getWeiboPasswordThat(){
		return weiboPasswordThat;
	}
	
	public void setWeiboPasswordThat( String weiboPasswordThat ){
		this.weiboPasswordThat = weiboPasswordThat;
	}
	
	public String getWeiboContentThat(){
		return weiboContentThat;
	}
	
	public void setWeiboContentThat( String weiboContentThat ){
		this.weiboContentThat = weiboContentThat;
	}
	
	public void sendmail(String username,String passwd,String message,String toAddress) throws Exception{
		mail.defaultSendMail(username, passwd, message,toAddress);
	}
	
	public Date[] ReceiveMail(String username,String passwd) throws Exception{
		Date[] date = mail.defaultReceiveMail(username, passwd);
		return date;
	}
	
	public void updateStatus(String username,String passwd,String message){
		try {
			System.setProperty("weibo4j.oauth.consumerKey", CONSUMER_KEY);
			System.setProperty("weibo4j.oauth.consumerSecret", CONSUMER_SECRET);
			Weibo weibo = new Weibo();
			RequestToken requestToken = weibo.getOAuthRequestToken();

			System.out.println("Got request token.");
			System.out.println("Request token: "+ requestToken.getToken());
			System.out.println("Request token secret: "+ requestToken.getTokenSecret());
			String urlString = requestToken.getAuthorizationURL()+"&oauth_callback=xml&userId="+username+"&passwd="+passwd;
			URL url=new URL(urlString);
			AccessToken accessToken = null;

			BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
			while (null == accessToken) {
				System.out.println("Open the following URL and grant access to your account:");
				System.out.println(requestToken.getAuthorizationURL());
				//BareBonesBrowserLaunch.openURL(urlString);
				System.out.print("Hit enter when it's done.[Enter]:");
				
				String s=""; 
				StringBuffer sb=new StringBuffer(""); 
				while((s=br.readLine())!=null) 
				{     
					sb.append(s);    
				} 
				br.close(); 
				String a = sb.toString();
				String pin = "";
				int i=a.indexOf("<oauth_verifier>");
				pin = a.substring(i+16, i+22);
				
				System.out.println("pin: " + pin);
				try{
					accessToken = requestToken.getAccessToken(pin);
				} catch (WeiboException te) {
					if(401 == te.getStatusCode()){
						System.out.println("Unable to get the access token.");
					}else{
						te.printStackTrace();
					}
				}
			}
			System.out.println("Got access token.");
			System.out.println("Access token: "+ accessToken.getToken());
			System.out.println("Access token secret: "+ accessToken.getTokenSecret());
			System.out.println(accessToken.getToken()+" "+accessToken.getTokenSecret());
			weibo.setToken(accessToken.getToken(),accessToken.getTokenSecret());
        	Status status = weibo.updateStatus(message);
        	System.out.println(status.getId() + " : "+ status.getText()+"  "+status.getCreatedAt());
		} catch (WeiboException te) {
			System.out.println("Failed to get timeline: " + te.getMessage());
		} catch (IOException ioe) {
			System.out.println("Failed to read the system input.");
		}
	}
	
	public Date[] getStatusDate(String username,String passwd){
		try {
			System.setProperty("weibo4j.oauth.consumerKey", CONSUMER_KEY);
			System.setProperty("weibo4j.oauth.consumerSecret", CONSUMER_SECRET);
			Weibo weibo = new Weibo();
			RequestToken requestToken = weibo.getOAuthRequestToken();

			System.out.println("Got request token.");
			System.out.println("Request token: "+ requestToken.getToken());
			System.out.println("Request token secret: "+ requestToken.getTokenSecret());
			String urlString = requestToken.getAuthorizationURL()+"&oauth_callback=xml&userId="+username+"&passwd="+passwd;
			URL url=new URL(urlString);
			AccessToken accessToken = null;

			BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
			while (null == accessToken) {
				System.out.println("Open the following URL and grant access to your account:");
				System.out.println(requestToken.getAuthorizationURL());
				//BareBonesBrowserLaunch.openURL(urlString);
				System.out.print("Hit enter when it's done.[Enter]:");
				
				String s=""; 
				StringBuffer sb=new StringBuffer(""); 
				while((s=br.readLine())!=null) 
				{     
					sb.append(s);    
				} 
				br.close(); 
				String a = sb.toString();
				String pin = "";
				int i=a.indexOf("<oauth_verifier>");
				pin = a.substring(i+16, i+22);
				
				System.out.println("pin: " + pin);
				try{
					accessToken = requestToken.getAccessToken(pin);
				} catch (WeiboException te) {
					if(401 == te.getStatusCode()){
						System.out.println("Unable to get the access token.");
					}else{
						te.printStackTrace();
					}
				}
			}
			System.out.println("Got access token.");
			System.out.println("Access token: "+ accessToken.getToken());
			System.out.println("Access token secret: "+ accessToken.getTokenSecret());
			System.out.println(accessToken.getToken()+" "+accessToken.getTokenSecret());
			weibo.setToken(accessToken.getToken(),accessToken.getTokenSecret());
			List<Status> list = weibo.getUserTimeline("2513998684");
        	//List<Status> list = weibo.getUserTimeline(args[2], new Paging(1).count(4));
        	int n=list.size();
        	Date[] dates=new Date[n];
        	while(n > 0) {
        		Status status = weibo.showStatus(list.get(n-1).getId());
        		dates[n-1] = status.getCreatedAt();
        		//Status status = weibo.showStatus("3343071916370000");
            	System.out.println(status.getCreatedAt());
            	System.out.println(status.getText());
            	n--;
        	}
        	return dates;
		} catch (WeiboException te) {
			System.out.println("Failed to get timeline: " + te.getMessage());
			return null;
		} catch (IOException ioe) {
			System.out.println("Failed to read the system input.");
			return null;
		}
	}
	
	public String[] getStatusText(String username,String passwd){
		try {
			System.setProperty("weibo4j.oauth.consumerKey", CONSUMER_KEY);
			System.setProperty("weibo4j.oauth.consumerSecret", CONSUMER_SECRET);
			Weibo weibo = new Weibo();
			RequestToken requestToken = weibo.getOAuthRequestToken();

			System.out.println("Got request token.");
			System.out.println("Request token: "+ requestToken.getToken());
			System.out.println("Request token secret: "+ requestToken.getTokenSecret());
			String urlString = requestToken.getAuthorizationURL()+"&oauth_callback=xml&userId="+username+"&passwd="+passwd;
			URL url=new URL(urlString);
			AccessToken accessToken = null;

			BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
			while (null == accessToken) {
				System.out.println("Open the following URL and grant access to your account:");
				System.out.println(requestToken.getAuthorizationURL());
				//BareBonesBrowserLaunch.openURL(urlString);
				System.out.print("Hit enter when it's done.[Enter]:");
				
				String s=""; 
				StringBuffer sb=new StringBuffer(""); 
				while((s=br.readLine())!=null) 
				{     
					sb.append(s);    
				} 
				br.close(); 
				String a = sb.toString();
				String pin = "";
				int i=a.indexOf("<oauth_verifier>");
				pin = a.substring(i+16, i+22);
				
				System.out.println("pin: " + pin);
				try{
					accessToken = requestToken.getAccessToken(pin);
				} catch (WeiboException te) {
					if(401 == te.getStatusCode()){
						System.out.println("Unable to get the access token.");
					}else{
						te.printStackTrace();
					}
				}
			}
			System.out.println("Got access token.");
			System.out.println("Access token: "+ accessToken.getToken());
			System.out.println("Access token secret: "+ accessToken.getTokenSecret());
			System.out.println(accessToken.getToken()+" "+accessToken.getTokenSecret());
			weibo.setToken(accessToken.getToken(),accessToken.getTokenSecret());
			List<Status> list = weibo.getUserTimeline("2513998684");
        	//List<Status> list = weibo.getUserTimeline(args[2], new Paging(1).count(4));
        	int n=list.size();
        	String[] strings = new String[n];
        	while(n > 0) {
        		Status status = weibo.showStatus(list.get(n-1).getId());
        		strings[n-1] = status.getText();
        		//Status status = weibo.showStatus("3343071916370000");
            	System.out.println(status.getCreatedAt());
            	System.out.println(status.getText());
            	n--;
        	}
        	return strings;
		} catch (WeiboException te) {
			System.out.println("Failed to get timeline: " + te.getMessage());
			return null;
		} catch (IOException ioe) {
			System.out.println("Failed to read the system input.");
			return null;
		}
	}
}
