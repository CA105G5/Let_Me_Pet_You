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
		String [] player= {"A","B","C","D","E","F","G"};
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
					
				}else {
					following = player[number];
					System.out.println(following);
					System.out.println(following+"的聖誕禮物來自: ");
					timeout = sc.nextLine();
				}
				set.remove(number);
			}
		}
		System.out.println(firstone);
		sc.close();
	}
}
