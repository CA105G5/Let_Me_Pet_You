package test;

import java.util.ArrayList;
import java.util.List;

public class Test8 {

	public static void main(String[] args) {
		String cal="-5+6-8 -9+1  2 3-33-45 -22-21+34 =";
		System.out.println(calculate(cal));
		
	}
	public static int calculate(String cal) {
		int sum =0;
		// WRITE YOU CODE HERE -START-
		cal = cal.replace(" ", "");
		cal = cal.replace("=", "");
//		System.out.println(cal);
		List<Integer> positive = new ArrayList<Integer>();
		List<Integer> negative = new ArrayList<Integer>();
		int begin=cal.length()-1;
		int end=cal.length();
		for(int i =cal.length()-1;i>=0;i--) {
			if(Character.toString(cal.charAt(i)).equals("+")) {
//				System.out.println("hello");
				begin=i+1;
				sum+=Integer.parseInt(cal.substring(begin, end));
				end=i;
			}else if (Character.toString(cal.charAt(i)).equals("-")) {
				begin=i+1;
				sum-=Integer.parseInt(cal.substring(begin, end));
				end=i;
			}
		}
		if(!(Character.toString(cal.charAt(0)).equals("+"))&&!(Character.toString(cal.charAt(0)).equals("-"))) {
//			System.out.println(end);
//			System.out.println(begin);
			sum+=Integer.parseInt(cal.substring(0, end));
		}
		// WRITE YOU CODE HERE -END-
		return sum;
	}
}
