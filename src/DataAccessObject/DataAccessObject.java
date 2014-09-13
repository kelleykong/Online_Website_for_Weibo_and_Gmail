package DataAccessObject;

public class DataAccessObject {
	private static int numofTask = 3;
	
	public static void increaseTask(){
		numofTask++;
	}
	
	public static int getNumofTask(){
		return numofTask;
	}
}
