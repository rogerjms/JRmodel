package com.turing.test;

public class TestJiCheng {
	
	public static void main(String[] args) {
		//m>0,n>0,m<=n
		int m = 4;
		int n = 5;
		System.out.println(jc(n)/(jc(n-m)*jc(m)));
		
	}

	private static int jc(int m) {
		return m==1?1:m*jc(m-1);
	}

}
