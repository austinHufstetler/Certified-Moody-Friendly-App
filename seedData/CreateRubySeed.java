import java.util.*;
import java.io.*;

public class CreateRubySeed{
	public static void main(String[] args){
		try{
			File addressFile = new File("Address.txt");
			File nameFile = new File("BusinessNames.txt");
			File cityFile = new File("City.txt");
			File emailFile = new File("Emails.txt");
			File stateFile = new File("States.txt");
			File zipFile = new File("Zip.txt");
			File businessSeed = new File("businessSeed.txt");
			File accountSeed = new File("accountSeed.txt");
			Scanner addressScan = new Scanner(addressFile);
			Scanner nameScan = new Scanner(nameFile);
			Scanner cityScan = new Scanner(cityFile);
			Scanner emailScan = new Scanner(emailFile);
			Scanner stateScan = new Scanner(stateFile);
			Scanner zipScan = new Scanner(zipFile);
			ArrayList<Business> list = new ArrayList<Business>();
			while(addressScan.hasNext()){
				Business newBusiness = new Business(addressScan.nextLine(),nameScan.nextLine(),cityScan.nextLine(),emailScan.nextLine(),stateScan.nextLine(),zipScan.nextLine());
				list.add(newBusiness);
			}
			PrintWriter writeSeed = new PrintWriter(businessSeed);
			PrintWriter writeSeedAccount = new PrintWriter(accountSeed);
			for(int i = 0; i < list.size(); i++){
				try{
					writeSeed.println(list.get(i).createBusiness());
					writeSeedAccount.println(list.get(i).createAccount());
				}
				catch(Exception e){
					e.printStackTrace();
				}
			}
			writeSeed.flush();
			writeSeedAccount.flush();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}