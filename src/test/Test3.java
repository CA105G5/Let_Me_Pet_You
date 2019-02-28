package test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class Test3 {
	public static void main(String[] args) {
		/*
		 * 給定一段短文，印出在短文中出現第一多與第二多的文字 ex: I have a pen, I have a apple，但不包含特殊符號以及數字
		 * 大小寫視為相同
		 * 印出
		 * i(2)
		 * have(2)
		 * a(2)
		 * pen(1)
		 * apple(1)
		*/
		
		String paragraph = "Wikileaks began on Sunday November 28th publishing 251,287 leaked United States embassy cables, the largest set of confidential documents ever to be released into the public domain. The documents will give people around the world an unprecedented insight into US Government foreign activities."
				  + "The cables, which date from 1966 up until the end of February this year, contain confidential communications between 274 embassies in countries throughout the world and the State Department in Washington DC. 15,652 of the cables are classified Secret."
				  + "The embassy cables will be released in stages over the next few months. The subject matter of these cables is of such importance, and the geographical spread so broad, that to do otherwise would not do this material justice.";
		ArrayList<String> result = execute(paragraph);
		for(int i = 0; i < result.size(); i ++) {
			System.out.println(result.get(i));
		}
	}
	static ArrayList<String> execute(String paragraph) {
		ArrayList<String> result = new ArrayList<String>();
		
		// WRITE YOU CODE HERE -START-
		HashMap<String,Integer> hm = new HashMap<String,Integer>();
		String[] words = paragraph.toLowerCase().split("[^a-z]");
		for(String str:words) {
			if(str!=null&&str.length()>0) {
				if(!hm.containsKey(str)) {
					hm.put(str, 1);
				}else {
					int count = hm.get(str)+1;
					hm.put(str, count);
				}
			}
		}
		
		int max=0;
		for(Object obj:hm.keySet()) {
			if(hm.get(obj)>max) {
				max=hm.get(obj);
			}
		}
		
		int second_max=0;
		for(Object obj:hm.keySet()) {
			if(hm.get(obj)>second_max&&hm.get(obj)<max) {
				second_max=hm.get(obj);
			}
		}
		
		for(Object obj:hm.keySet()) {
			if(hm.get(obj)==max) {
				String max_key =(String)obj;
				result.add(max_key+"出現"+max+"次");
			}
		}
		for(Object obj:hm.keySet()) {
			if(hm.get(obj)==second_max) {
				String second_max_key =(String)obj;
				result.add(second_max_key+"出現"+second_max+"次");
			}
		}
		
		// WRITE YOU CODE HERE -END-
		return result;
	}
}
