package Task;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Date;
import java.util.Timer;

public class TaskClass implements Runnable{
	private Task task;
	private Date cDate=new Date();
	private int j=0;
	
	public TaskClass(){
		
	}
	public TaskClass(Task inputtask){
		task = inputtask;
	}
	
	public void run(){
		if( task.getThisTask() == 0  && task.getThatTask() == 0){
			try {
				while(true){
					System.out.println("time gmail");
					Date currentDate = new Date();
					Date deadline = new Date();
					deadline.setYear(task.getYear()-1900);
					deadline.setMonth(task.getMonth()-1);
					deadline.setDate(task.getDay());
					deadline.setHours(task.getHour());
					deadline.setMinutes(task.getMinute());
					deadline.setSeconds(task.getSecond());
					System.out.println(currentDate.toString());
					System.out.println(deadline.toString());
					if(deadline.getTime()-currentDate.getTime() < 1000 && deadline.getTime()-currentDate.getTime() > -1000){
						try {
							task.sendmail(task.getGmailIDThat(),task.getGmailPasswordThat(),task.getGmailContentThat(),task.getGmailTitleThat());
							break;
						} catch (Exception e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						}
					}
					else if(deadline.getTime()-currentDate.getTime() < -1000){
						System.out.println("you have missed the deadline");
						break;
					}
					Thread.sleep(1000);
				}
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if( task.getThisTask() == 0 && task.getThatTask() == 1){
			try {
				while(true){
					System.out.println("time weibo");
					Date currentDate = new Date();
					Date deadline = new Date();
					deadline.setYear(task.getYear()-1900);
					deadline.setMonth(task.getMonth()-1);
					deadline.setDate(task.getDay());
					deadline.setHours(task.getHour());
					deadline.setMinutes(task.getMinute());
					deadline.setSeconds(task.getSecond());
					System.out.println(currentDate.toString());
					System.out.println(deadline.toString());
					if(deadline.getTime()-currentDate.getTime() < 1000 && deadline.getTime()-currentDate.getTime() > -1000){
						try {
							task.updateStatus(task.getWeiboIDThat(),task.getWeiboPasswordThat(),task.getWeiboContentThat());
							break;
						} catch (Exception e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						}
					}
					else if(deadline.getTime()-currentDate.getTime() < -1000){
						System.out.println("you have missed the deadline");
						break;
					}
					Thread.sleep(1000);
				}
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if( task.getThisTask() == 1 && task.getThatTask() == 0){
			try {
				while(true){
					System.out.println("receive gmail");
					try {
						Date[] dates=task.ReceiveMail(task.getGmailID(), task.getGmailPassword());
						for(j=0;j<dates.length;j++){
							if(dates[j].after(cDate)){
								task.sendmail(task.getGmailIDThat(),task.getGmailPasswordThat(),task.getGmailContentThat(),task.getGmailTitleThat());
								break;
							}
						}
						if(j!=dates.length)
							break;
					} catch (Exception e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					Thread.sleep(60000);
				}
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if( task.getThisTask() == 1 && task.getThatTask() == 1){
			try {
				while(true){
					System.out.println("receive weibo");
					try {
						Date[] dates=task.ReceiveMail(task.getGmailID(), task.getGmailPassword());
						for(j=0;j<dates.length;j++){
							if(dates[j].after(cDate)){
								task.updateStatus(task.getWeiboIDThat(),task.getWeiboPasswordThat(),task.getWeiboContentThat());
								break;
							}
						}
						if(j!=dates.length)
							break;
					} catch (Exception e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					Thread.sleep(60000);
				}
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if( task.getThisTask() == 2 && task.getThatTask() == 0){
			try {
				while(true){
					System.out.println("getweibo gmail");
					if(task.getWeiboTime()>0){
						try {
							long times = (long)task.getWeiboTime()*1000;
							long millionsecond = cDate.getTime();
							long millionseconddeadline = millionsecond + times;
							Date dDate = new Date();
							dDate.setTime(millionseconddeadline);
							System.out.println(cDate.toString());
							System.out.println(dDate.toString());
							Thread.sleep(task.getWeiboTime()*1000);
							Date[] dates=task.getStatusDate(task.getWeiboID(), task.getWeiboPassword());
							for(j=0;j<dates.length;j++){
								if(dates[j].after(cDate) && dates[j].before(dDate)){
									break;
								}
							}
							if(j!=dates.length){
								System.out.println("Sorry,you have update status");
								break;
							}
							else{
								task.sendmail(task.getGmailIDThat(),task.getGmailPasswordThat(),task.getGmailContentThat(),task.getGmailTitleThat());
								System.out.println("Success");
								break;
							}
						} catch (Exception e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
						}
					}
					else{
						try {
							String[] strings = task.getStatusText(task.getWeiboID(), task.getWeiboPassword());
							for(j=0;j<strings.length;j++){
								if(strings[j].equals(task.getWeiboContent())){
									task.sendmail(task.getGmailIDThat(),task.getGmailPasswordThat(),task.getGmailContentThat(),task.getGmailTitleThat());
									break;
								}
							}
							if(j!=strings.length)
								break;
						} catch (Exception e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
							}
							Thread.sleep(60000);
					}
				}
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if( task.getThisTask() == 2 && task.getThatTask() == 1){
			try {
				while(true){
					System.out.println("getweibo weibo");
					if(task.getWeiboTime()>0){
						try {
							long times = (long)task.getWeiboTime()*1000;
							long millionsecond = cDate.getTime();
							long millionseconddeadline = millionsecond + times;
							Date dDate = new Date();
							dDate.setTime(millionseconddeadline);
							System.out.println(cDate.toString());
							System.out.println(dDate.toString());
							Thread.sleep(task.getWeiboTime()*1000);
							Date[] dates=task.getStatusDate(task.getWeiboID(), task.getWeiboPassword());
							for(j=0;j<dates.length;j++){
								if(dates[j].after(cDate) && dates[j].before(dDate)){
									break;
								}
							}
							if(j!=dates.length){
								System.out.println("Sorry,you have update status");
								break;
							}
							else{
								task.updateStatus(task.getWeiboIDThat(),task.getWeiboPasswordThat(),task.getWeiboContentThat());
								System.out.println("Success");
								break;
							}
						} catch (Exception e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
						}
					}
					else{
						try {
							String[] strings = task.getStatusText(task.getWeiboID(), task.getWeiboPassword());
							for(j=0;j<strings.length;j++){
								if(strings[j].equals(task.getWeiboContent())){
									task.updateStatus(task.getWeiboIDThat(),task.getWeiboPasswordThat(),task.getWeiboContentThat());
									break;
								}
							}
							if(j!=strings.length)
								break;
						} catch (Exception e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
							}
							Thread.sleep(60000);
					}
				}
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
