package test;

import java.util.ArrayList;

public class Test6 {

	public static void main(String[] args) {
		int limit=200;
		int total=10;
		ArrayList<Integer> result = execute(limit,total);
		for(int i = 0; i < result.size(); i ++) {
			System.out.println(result.get(i));
		}

	}
	public static ArrayList<Integer> execute(Integer limit,Integer total) {
		ArrayList<Integer> all_integer = new ArrayList<Integer>();
		// WRITE YOU CODE HERE -START-
		for(int i =0;i<=limit;i++) {
			int number = i;
			int sum = 0;
			int remainder = 0;
			while(number>=10) {
				remainder = number%10;
				sum+=remainder;
				number=number/10;
			}
			sum+=number;
			if(sum == total) {
				all_integer.add(i);
			}
		}
		// WRITE YOU CODE HERE -END-
		return all_integer;
	}
}
