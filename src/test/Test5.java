package test;

import java.util.ArrayList;

public class Test5 {

	public static void main(String[] args) {
		int number = 9;
		System.out.println(execute(number));

	}
	public static String execute(int number) {
		String answer="";
		// WRITE YOU CODE HERE -START-
		int min = 0;
		int max = 0;
		for(int i=1;i<=number;i++) {
			int sum=0;
			int count=i;
			while(sum<number) {
				sum+=count;
				count++;
			}
			System.out.println(count);
			if(sum==number) {
				min= i;
				break;
			}
			
		}
		
		int minus=0;
		minus = min-1;
		do {
			minus+=1;
			number-=minus;
//			System.out.println(minus);
		}while(number!=0);
		max=minus;
		answer = min+"+...+"+max;
		// WRITE YOU CODE HERE -END-
		return answer;
	}
}
