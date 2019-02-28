package test;

import java.util.ArrayList;

public class Test7 {

	public static void main(String[] args) {
		int points[]= {0,0,6,-8,6,4,6,0};
		ArrayList<String> result = execute(points);
		for(int i = 0; i < result.size(); i ++) {
			System.out.println(result.get(i));
		}
	}
	public static ArrayList<String> execute(int[] points) {
		ArrayList<String> p3 = new ArrayList<String>();
		// WRITE YOU CODE HERE -START-
		int x[] = new int[points.length/2];
		int y[] = new int[points.length/2];
		double max=0;
		for(int i=0;i<points.length;i++) {
			if(i%2==0) {
				x[i/2]=points[i];
			}else {
				y[(i-1)/2]=points[i];
			}
		}
		for(int i =0;i<points.length/2;i++) {
			for(int j=0;j<points.length/2;j++) {
				if(j<=i) {
					continue;
				}
				for(int k=0;k<points.length/2;k++) {
					if(k<=j) {
						continue;
					}
					if(perimeter(x[i],y[i],x[j],y[j],x[k],y[k])>max) {
						max=perimeter(x[i],y[i],x[j],y[j],x[k],y[k]);
					}
				}
			}
		}
		for(int i =0;i<points.length/2;i++) {
			for(int j=0;j<points.length/2;j++) {
				if(j<=i) {
					continue;
				}
				for(int k=0;k<points.length/2;k++) {
					if(k<=j) {
						continue;
					}
					if(perimeter(x[i],y[i],x[j],y[j],x[k],y[k])==max) {
						p3.add("("+x[i]+","+y[i]+")"+"("+x[j]+","+y[j]+")"+"("+x[k]+","+y[k]+")"+max);
					}
				}
			}
		}
		// WRITE YOU CODE HERE -END-
		return p3;
	}
	public static Double perimeter(int x1,int y1,int x2,int y2,int x3,int y3) {
		return Math.sqrt(Math.pow(x1-x2, 2)+Math.pow(y1-y2, 2))+Math.sqrt(Math.pow(x1-x3, 2)+Math.pow(y1-y3, 2))+Math.sqrt(Math.pow(x3-x2, 2)+Math.pow(y3-y2, 2));
	}
}
