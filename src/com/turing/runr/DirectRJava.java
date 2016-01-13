package com.turing.runr;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class DirectRJava {

	public static void main(String[] args) throws IOException {
		BufferedReader br = null;
		Process process = null;
		int gene = 0;
		int age = 67;
		int bmi = 23;
		int salt = 2;
		String cmds = "D:\\Program Files\\R\\R-3.2.3\\bin\\i386\\Rscript src\\com\\turing\\runr\\model.R " + gene + " " + age + " " + bmi
				+ " " + salt; // 注意：对字符串中路径\进行转义
		System.out.println(cmds);
		process = Runtime.getRuntime().exec(cmds);
		br = new BufferedReader(new InputStreamReader(process.getInputStream(),
				"utf-8"));
		String line = null;
		System.out.println("列出结果信息：");
		while ((line = br.readLine()) != null) {
			System.out.println(line);
		}
	}
}
