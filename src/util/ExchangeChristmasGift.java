package util;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Scanner;
import java.util.Set;
public class ExchangeChristmasGift {
	String firstone,following,timeout;
	public static void main(String[] args) {
		ExchangeChristmasGift ecg = new ExchangeChristmasGift();
		ecg.exchange();
	}
	public void exchange() {
		String [] player= {"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19"};
		Set set = new HashSet();
		
		while(set.size()<player.length) {
			set.add(set.size());
			
		}
		Scanner sc = new Scanner(System.in); 
		
		while(set.size()>0) {
			int number =(int)(Math.random()*(player.length));
			if(set.contains(number)) {
				if(set.size() == player.length) {
					firstone = player[number];
					System.out.println(firstone+"的聖誕禮物來自: ");
					timeout = sc.nextLine();

				}else if(set.size()==1) {
					
					following = player[number];
					System.out.println(following);
					System.out.println(following+"的聖誕禮物來自: ");
					timeout = sc.nextLine();
					System.out.println(firstone);
				}else {
					following = player[number];
					System.out.println(following);
					System.out.println(following+"的聖誕禮物來自: ");
					timeout = sc.nextLine();
				}
				set.remove(number);
			}
		}
		
		sc.close();
	}
}
