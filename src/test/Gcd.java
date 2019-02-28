package test;

public class Gcd {
	
public static void main(String[] args) {
		
		
		//陣列求最大因數
		//demo1

		  int[] x = new int[] {18,12,30};  

		  System.out.println(getgcd(x));  
		  
		  //demo2 

		  int[] y = new int[] {15,18,30,42,9};

		  System.out.println(getgcd(y));
		  
		 }
	
		//必須是static
		 public static int getgcd(int[] intarray) {
			 //陣列中有幾個就跑減1次
			 for(int i = 0; i < intarray.length - 1; i++) {
				//每次用兩個做運算 兩個做完運算後把算出來的放在後面 
				 //這樣後面就會是前面所有的最大公因數 
				 intarray[i + 1] = getgcd2(intarray[i],intarray[i+1]);
			 }
			 //回傳最後一個 (最後一次做出來的最大公因數)
			 int result = intarray[intarray.length-1];

			 return result;
		 }
		 
		 //實現最大公因數的計算 輾轉相除法
		 public static int getgcd2(int a,int b) {
			 
			 //預設為1
			 int res = 1;
			 
			 //若相差夠大 則可以開始做輾轉相除(跑迴圈)
			 while(a % b != 0) {
				 //開始輾轉相除 調換順序 b為兩者之餘數 當餘數可除時就為因數 且是最大的因數
				 res = b;
				 
				 b = a % b;
				 
				 a = res;
			 }
			 
			 return b;
		 }
		 
}
