package test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

class Product {
	public int amount;
	public int totalPrice;
	public Product(int amount,int totalPrice) {
		this.amount=amount;
		this.totalPrice=totalPrice;
	}
}
public class TestTen {

	public static void main(String[] args) {
		/* 名字	數量 單價
		 * "COMPUTER 2 1000; MEMORY 3 5000"
		 * 
		 * 輸出: 名字 總價 均價
		 * "COMPUTER 2000 1000"
		 * "MEMORY 15000 5000"
		 */
		String str = "COMPUTER 2 1000;MEMORY 3 5000;MEMORY 2 2500";
		
		
		ArrayList<String> result = execute(str);
		for(int i = 0; i < result.size(); i ++) {
			System.out.println(result.get(i));
		}

	}
	static ArrayList<String> execute(String str) {
		ArrayList<String> result = new ArrayList<String>();
		// WRITE YOU CODE HERE -START-
		HashMap<String,Product> hm = new HashMap<String,Product>();
		String[] product_detail=str.split(";");
		for(int i =0 ;i<product_detail.length;i++) {
			String pd[]=product_detail[i].trim().split(" ");
			String name = pd[0];
			int amount = Integer.parseInt(pd[1]);
			int price = Integer.parseInt(pd[2]);
			if(hm.containsKey(name)) {
				Product p =hm.get(name);
				hm.remove(name);
				p.amount+=amount;
				p.totalPrice+=price*amount;
				hm.put(name,p);
			}else {
				Product p = new Product(amount,price*amount);
				hm.put(name, p);
			}
		}
		Set<String> set = hm.keySet();
		for(String mapName:set) {
			Product m = hm.get(mapName);
			String res = mapName + " " + m.totalPrice + " " + m.totalPrice/m.amount;
			result.add(res);
		}
		// WRITE YOU CODE HERE -END-
		return result;
	}
}
