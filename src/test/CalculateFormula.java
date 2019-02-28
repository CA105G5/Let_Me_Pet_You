package test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.Queue;
import java.util.concurrent.LinkedBlockingQueue;

public class CalculateFormula {
	public static void main(String[] args) {
		/*
		 * 計算一行算式，只有加減乘除，計算等號左邊的算式，但算是中間有空白
		 * 因為沒有其他運算符號的關係，故這題不用將中綴表達式轉換為後綴表達式，直接利用Queue計算即可
		 * input "2 3 + 1 + 2 - 3 =" output 23
		*/
		
		ArrayList<String> formulas = new ArrayList<String>();
		formulas.add("2 3 + 6+ 122 - 5 6 =");
		
		ArrayList<Integer> result = execute(formulas);
		for(int i = 0; i < result.size(); i ++) {
			System.out.println(result.get(i));
		}
	}
	
	static ArrayList<Integer> execute(ArrayList<String> formulas) {
		ArrayList<Integer> result = new ArrayList<Integer>();
		
		// WRITE YOU CODE HERE -START-
		for(int i = 0; i < formulas.size(); i ++) {//若不只一個算式則跑迴圈
			String formula = formulas.get(i);//取得當前算式
			formula = formula.replaceAll(" ", ""); //去空白
			formula = formula.replaceAll("=", ""); //去等號
			//到此為止 formula 內存放的是只有運算符號和數字的字串
			
			String _num = "";//存放數字字串的容器
			
			Queue<String> queue = new LinkedList<String>(); //利用隊列來對運算符進行建模
			for(int j = 0; j < formula.length(); j ++) {
				String next = formula.substring(j, j + 1);//比較字串內的每一個字元
				if(!next.equals("+")&& !next.equals("-")) {
					_num += next;//若是數字就繼續串接
				} else {
					queue.add(_num);//不是數字就把next內的數字以字串加入集合
					queue.add(next);//並把符號加入集合

					_num = "";//把容器清空準備存放下一次的數字
				}
			}
			
			queue.add(_num);//把最後的數字加入集合
			
			
			//實作Queue介面的類別擁有 poll方法 
			//poll()會將佇列中第一個元素從集合中取出 
			//若集合中沒有元素了回傳null
			int res = Integer.parseInt(queue.poll()); //先取出集合中的第一個元素並轉為數字
			while(queue.isEmpty() == false) { //若集合為空集合則停止
				String next = queue.poll(); //取出符號
				
				if(next.equals("+")) { //判斷符號為何種運算符號
					res += Integer.parseInt(queue.poll()); //計算
				} else if (next.equals("-")) {
					res -= Integer.parseInt(queue.poll());
				}
			}
			
			result.add(res);//將最後計算完的答案加入
		}
		
		// WRITE YOU CODE HERE -END-
		return result;
	}
}
