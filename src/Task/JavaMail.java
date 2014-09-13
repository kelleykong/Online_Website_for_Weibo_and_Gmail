package Task;

import java.net.URL;  
import java.util.Date;
import java.util.Properties;  
  
import javax.activation.DataHandler;  
import javax.activation.FileDataSource;  
import javax.mail.Authenticator;  
import javax.mail.BodyPart;  
import javax.mail.Folder;
import javax.mail.Message;  
import javax.mail.MessagingException;  
import javax.mail.Multipart;  
import javax.mail.PasswordAuthentication;  
import javax.mail.Session;  
import javax.mail.Store;
import javax.mail.Transport;  
import javax.mail.internet.InternetAddress;  
import javax.mail.internet.MimeBodyPart;  
import javax.mail.internet.MimeMessage;  
import javax.mail.internet.MimeMultipart;  

  
public class JavaMail { 
	
    public Date[] defaultReceiveMail(String username,String pwdname) throws Exception{
    	String host = "smtp.gmail.com";// "smtp.gmail.com"   
//      String port = "465"; //"465"  
       Properties props1 = new Properties();  
       props1.setProperty("mail.smtp.host", host);   
//       props.setProperty("mail.smtp.port", port);  
       props1.setProperty("mail.smtp.auth", "true");  
       props1.setProperty("mail.pop3.ssl.enable","true");//"true"
//       props.setProperty("mail.smtp.connectiontimeout", "5000");  
       
       final String user = username;  //"***@gmail.com"  
       final String pwd = pwdname;  
       Session session1 = Session.getInstance(props1, new Authenticator() {  
           @Override  
           protected PasswordAuthentication getPasswordAuthentication() {  
               //��¼�û�������  
               return new PasswordAuthentication(user,pwd);  
           }  
       });  
       session1.setDebug(true);  
       Store store = session1.getStore("pop3");
       store.connect(host,user,pwd);
       //Transport transport = session.getTransport("smtps");//"smtps"  
       //transport.connect(host,user,pwd);   
       
       Folder defaultFolder = store.getFolder("INBOX");
       defaultFolder.open(Folder.READ_ONLY);
       Message [] messages = defaultFolder.getMessages();
       Date[] date = new Date[messages.length];
       for(int i=0;i<messages.length;i++){
    	   date[i]=messages[i].getSentDate();
       }
       store.close();
       return date;
    }
	
	
	//@Test  
    public void defaultSendMail(String username,String pwdname,String text,String toAddress) throws Exception {  
        String host = "smtp.gmail.com";// "smtp.gmail.com"   
        String port = "465"; //"465"  
        Properties props = new Properties();  
        props.setProperty("mail.smtp.host", host);   
        props.setProperty("mail.smtp.port", port);  
        props.setProperty("mail.smtp.auth", "true");  
        props.setProperty("mail.smtp.ssl.enable", "true");//"true"  
        props.setProperty("mail.smtp.connectiontimeout", "5000");  
          
        final String user = username;  //"***@gmail.com"  
        final String pwd = pwdname;  
        Session session = Session.getInstance(props, new Authenticator() {  
            @Override  
            protected PasswordAuthentication getPasswordAuthentication() {  
                //��¼�û�������  
                return new PasswordAuthentication(user,pwd);  
            }  
        });  
        session.setDebug(true);  
        Transport transport = session.getTransport("smtps");//"smtps"  
        transport.connect(host,user,pwd);   
        //��Ϣ  
        MimeMessage message = new MimeMessage(session);  
          
        setMailContent(message,text);//������������������������������������  
          
        message.setSubject("�ʼ�");  
        //��Ϣ�����߽���������  
        //message.setFrom(new InternetAddress(user,"����������"));   
        message.addRecipients(Message.RecipientType.TO,new InternetAddress[]{  
                new InternetAddress(toAddress,"������")
        });  
        message.saveChanges();  
          
        //����  
        transport.send(message);  
        //Transport.send(message);  
          
        transport.close();    
          
    }  
      
    //�趨�ʼ�����  
    private void setMailContent(MimeMessage message,String text) throws MessagingException {  
        //����һ��ֻ���ı��ʼ�  
        //message.setContent("�ʼ�����..", "text/plain");//���ı�����  
        //����������Ӹ������ʼ�  
        Multipart part = new MimeMultipart();  
          
        BodyPart bodypart1 = new MimeBodyPart();  
        bodypart1.setText(text);        
        part.addBodyPart(bodypart1 );  
          
        /*BodyPart bodypart2 = new MimeBodyPart();  
        bodypart2.setFileName("fileName");  
        bodypart2.setDataHandler(new DataHandler(new FileDataSource("f:\\ok.txt")));  
        part.addBodyPart(bodypart2);  */
          
        message.setContent(part);  
    }
}