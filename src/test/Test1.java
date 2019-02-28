package test;

public class Test1 {

	public static void main(String[] args) {
		int [] num = {56,24,32,16};
		System.out.println(Test1.gcd(num));
	}
	public static int gcd(int [] number) {
		int answer = -1;
		//WRITE YOU CODE HERE -START-
		Boolean check = true;
		for(int i = 1 ;i<number[0];i++) {
			check=true;
			for(int j=0 ; j<number.length;j++) {
				if(number[j]%i != 0) {
					check = false;
				}
			}
			if(check) {
				answer = i ;
			}
		}
		//WRITE YOU CODE HERE -END-
		return answer;
	}

}
