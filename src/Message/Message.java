package Message;

public class Message {
	private String sender;
	private String receiver;
	private String messageName;
	private String messageContent;
	
	public String getSender(){
		return sender;
	}
	
	public void setSender( String sender ){
		this.sender = sender;
	}
	
	public String getReceiver(){
		return receiver;
	}
	
	public void setReceiver( String receiver ){
		this.receiver = receiver;
	}
	
	public String getMessageName(){
		return messageName;
	}
	
	public void setMessageName( String messageName ){
		this.messageName = messageName;
	}
	
	public String getMessageContent(){
		return messageContent;
	}
	
	public void setMessageContent( String messageContent ){
		this.messageContent = messageContent;
	}
}
