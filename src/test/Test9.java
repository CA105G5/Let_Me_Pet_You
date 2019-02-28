package test;

import java.util.ArrayList;

public class Test9 {//暫時放棄

	public static void main(String[] args) {
		String call="3745";
		ArrayList<String> result = execute(call);
//		System.out.println(total(call));
		for(int i = 0; i < result.size(); i ++) {
			System.out.println(result.get(i));
		}
	}
	public static ArrayList<String> execute(String str){
		ArrayList<String> combination = new ArrayList<String>();
		String [] N2 = {"A","B","C"};
		String [] N3 = {"D","E","F"};
		String [] N4 = {"G","H","I"};
		String [] N5 = {"J","K","L"};
		String [] N6 = {"M","N","O"};
		String [] N7 = {"P","Q","R","S"};
		String [] N8 = {"T","U","V"};
		String [] N9 = {"W","X","Y","Z"};
		// WRITE YOU CODE HERE -START-
		int remainder=0,quotient=0,number=0;
		for(int i=0;i<total(str);i++) {
			number=i;
			String combine="";
			String answer="";
			for(int j =str.length()-1;j>=0;j--) {
				switch(Character.toString(str.charAt(j))) {
				case "2":
					remainder=number%N2.length;
					quotient=number/N2.length;
					number =quotient;
					combine = remainder+combine;
					break;
				case "3":
					remainder=number%N3.length;
					quotient=number/N3.length;
					number =quotient;
					combine = remainder+combine;
					break;
				case "4":
					remainder=number%N4.length;
					quotient=number/N4.length;
					number =quotient;
					combine = remainder+combine;
					break;
				case "5":
					remainder=number%N5.length;
					quotient=number/N5.length;
					number =quotient;
					combine = remainder+combine;
					break;
				case "6":
					remainder=number%N6.length;
					quotient=number/N6.length;
					number =quotient;
					combine = remainder+combine;
					break;
				case "7":
					remainder=number%N7.length;
					quotient=number/N7.length;
					number =quotient;
					combine = remainder+combine;
					break;
				case "8":
					remainder=number%N8.length;
					quotient=number/N8.length;
					number =quotient;
					combine = remainder+combine;
					break;
				case "9":
					remainder=number%N9.length;
					quotient=number/N9.length;
					number =quotient;
					combine = remainder+combine;
					break;
				}
			}
			for(int k=0;k<combine.length();k++) {
				switch(Character.toString(str.charAt(k))) {
				case "2":
					answer+=N2[combine.charAt(k)];
					break;
				case "3":
					answer+=N3[combine.charAt(k)];
					break;
				case "4":
					answer+=N4[combine.charAt(k)];
					break;
				case "5":
					answer+=N5[combine.charAt(k)];
					break;
				case "6":
					answer+=N6[combine.charAt(k)];
					break;
				case "7":
					answer+=N7[combine.charAt(k)];
					break;
				case "8":
					answer+=N8[combine.charAt(k)];
					break;
				case "9":
					answer+=N9[combine.charAt(k)];
					break;
				}
			}


			
		}
		// WRITE YOU CODE HERE -END-
		return combination;
	}
	public static int total(String str) {
		int number=1;
		String [] N2 = {"A","B","C"};
		String [] N3 = {"D","E","F"};
		String [] N4 = {"G","H","I"};
		String [] N5 = {"J","K","L"};
		String [] N6 = {"M","N","O"};
		String [] N7 = {"P","Q","R","S"};
		String [] N8 = {"T","U","V"};
		String [] N9 = {"W","X","Y","Z"};
		// WRITE YOU CODE HERE -START-
		for(int i =0;i<str.length();i++) {
			switch(Character.toString(str.charAt(i))) {
				case "2":
					number*=N2.length;
					break;
				case "3":
					number*=N3.length;
					break;
				case "4":
					number*=N4.length;
					break;
				case "5":
					number*=N5.length;
					break;
				case "6":
					number*=N6.length;
					break;
				case "7":
					number*=N7.length;
					break;
				case "8":
					number*=N8.length;
					break;
				case "9":
					number*=N9.length;
					break;
			}
			
		}
		// WRITE YOU CODE HERE -END-
		return number;
	}
}
