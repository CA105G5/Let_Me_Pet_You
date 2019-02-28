package test;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class Test2 {

	public static void main(String[] args) {
		String[] names = {"Ace", "Kitty", "David", "Alice","Dobby"};
		ArrayList<String> result = reordered_name(names);
		for(int i = 0; i < result.size(); i ++) {
			System.out.println(result.get(i));
		}
	}
	
	public static ArrayList<String> reordered_name(String[] names) {
		ArrayList<String> result = new ArrayList<String>();
		
		// WRITE YOU CODE HERE -START-
		for (int i = 0 ;i<names.length;i++) {
			result.add(names[i]);
		}
		
		Collections.sort(result, new Comparator<String>() {

			@Override
			public int compare(String o1, String o2) {
				String s1_1=o1.substring(0, 1);
				String s2_1=o2.substring(0, 1);
				
				String s1_2=o1.substring(1, 2);
				String s2_2=o2.substring(1, 2);
				if(s1_1.compareTo(s2_1)!=0) {
					return s1_1.compareTo(s2_1);
				}else {
					return s2_2.compareTo(s1_2);
				}
				
			}
			
		});
		
		// WRITE YOU CODE HERE -END-
		return result;
	}

}
