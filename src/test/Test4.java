package test;

import java.util.ArrayList;

public class Test4 {

	public static void main(String[] args) {
		String [] letters = {"A","D","F"};
		ArrayList<String> result = execute(letters);
		for(int i = 0; i < result.size(); i ++) {
			System.out.println(result.get(i));
		}
	}
	public static ArrayList<String> execute(String []letters) {
		ArrayList<String> result = new ArrayList<String>();
		// WRITE YOU CODE HERE -START-
		int remainder=0,quotient=0,number=0;
		for(int i=0;i<Math.pow(2, letters.length);i++) {
			
			number = i;
			String binary="";
			String answer="";
			for(int j=0;j<letters.length;j++) {
				remainder = number % 2;
				quotient = number/2;
				number = quotient;
				binary = remainder + binary;
			}
//			if(!binary.equals("000")) {//要ADF開始則此處改111，下兩行改0
				for(int k=0;k<letters.length;k++) {
					if(binary.charAt(k)=='1') {
						answer+=letters[k];
					}
				}
//			}
			if(answer.length()>0)
			result.add(answer);
		}
		// WRITE YOU CODE HERE -END-
		return result;
	}
}
