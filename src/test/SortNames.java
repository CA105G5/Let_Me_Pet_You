package test;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class SortNames {
	public static void main(String[] args) {
		/*
		 * 對給定的名字按照字母大小來排序，若第一個字母相同則排序第二個字母，以此類推
		*/
		
		String[] names = {"Ace", "Kitty", "David", "Alice"};
		
		ArrayList<String> result = execute(names);

		for(int i = 0; i < result.size(); i ++) {
			System.out.println(result.get(i));
		}
	}
	
	static ArrayList<String> execute(String[] names) {
		ArrayList<String> result = new ArrayList<String>();
		
		// WRITE YOU CODE HERE -START-
		for(int i = 0; i < names.length; i ++) {
			result.add(names[i]);//將每一個名字加入集合中
		}
		
		
		Collections.sort(result, new Comparator<String>() { //匿名類別???
			
			@Override
			public int compare(String o1, String o2) { //改寫比較方法
				String s1_1 = o1.substring(0, 1);//取出第一個字母等待比較
				String s2_1 = o2.substring(0, 1);//取出第一個字母等待比較
				
				 // s1.compareTo(s2)是比較兩個字符串的字典序 若>0 s1排後面，大於0 s1排前面
				if(s1_1.compareTo(s2_1) != 0) {
					return s1_1.compareTo(s2_1); //若第一個文字不同的話為集合元素做排序 
				}else { //若第一個文字相同比較第二個文字 
					String s1_2 = o1.substring(1, 2);//取出第二個字母等待比較
					String s2_2 = o2.substring(1, 2);//取出第二個字母等待比較
					
					return s2_2.compareTo(s1_2); //用第二個文字做比較
				}
			}
		});
		
		
		// WRITE YOU CODE HERE -END-
		return result;
	}
}
