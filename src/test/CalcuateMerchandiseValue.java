package test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
//給予一字串依序是＂品牌名稱 數量 產品單價＂使用空白區隔屬性，
//使用分號區隔項目（但有重複項目出現），
//請輸出＂品牌名稱 產品總價 平均售價＂之字串。
class Merchandise {
	public int amount;
	public int totalPrice;
	public Merchandise(int amount, int totalPrice) {
		this.amount = amount;
		this.totalPrice = totalPrice;
	}
}

public class CalcuateMerchandiseValue {
	public static void main(String[] args) {
		/* 名字	數量 單價
		 * "COMPUTER 2 1000; MEMORY 3 5000"
		 * 
		 * 輸出: 名字 總價 均價
		 * "COMPUTER 2000 1000"
		 * "MEMORY 15000 5000"
		 */
		String str = "COMPUTER 2 1000;MEMORY 3 5000";
		
		
		ArrayList<String> result = execute(str);
		for(int i = 0; i < result.size(); i ++) {
			System.out.println(result.get(i));
		}
	}
	
	static ArrayList<String> execute(String str) {
		ArrayList<String> result = new ArrayList<String>();
		// WRITE YOU CODE HERE -START-
		
		// 讀取全部商品信息
		Map<String, Merchandise> map = new HashMap<String, Merchandise>(); //準備map key = 商品名, value = 數量與總價
		String[] split_1 = str.split(";"); //以;拆開存到陣列內 每個陣列元素存放 "商品 數量 價格"
		for(int i = 0; i < split_1.length; i++) {
			String[] split_2 = split_1[i].trim().split(" "); //去頭尾空格後 以中間空格拆成陣列 分別存放"商品 數量 價格"
			String name = split_2[0]; //存放商品名稱
			int amount = Integer.parseInt(split_2[1]);
			int price = Integer.parseInt(split_2[2]);

			if(map.containsKey(name) == true) { //若同名 則更新商品資訊
				Merchandise m = map.get(name);
				m.totalPrice += price * amount;
				m.amount += amount;
				map.put(name, m);
			} else { //不然就存放新商品
				Merchandise m = new Merchandise(amount, price);
				map.put(name, m);
			}
		}
		
		// 印出來
		Set<String> set = map.keySet();
		for(String mapName:set) {
			Merchandise m = map.get(mapName);
			String res = mapName + " " + m.totalPrice + " " + m.totalPrice/m.amount;
			result.add(res);
		}
		
		// WRITE YOU CODE HERE -END-
		return result;
	}
}
