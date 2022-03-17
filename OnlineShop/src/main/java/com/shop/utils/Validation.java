package com.shop.utils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Validation {
	public static LocalDateTime getLocalDateTime(String s) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime dateTime = LocalDateTime.parse(s, formatter);
		return dateTime;
	}

	public static String getStringFromLocalDateTime(LocalDateTime s) {
		DateTimeFormatter formatter = DateTimeFormatter.ISO_DATE_TIME;
		String dateTime = formatter.format(s);
		return dateTime;
	}
//Check Valid
	public static int convertStringToInt(String n) {
		int number = 0;
		try {
			number = Integer.parseInt(n);
		} catch (Exception e) {
			System.out.println(e);
		}
		return number;
	}

	public static void main(String[] args) {
		String s = "2022-01-25 00:00:00";
		LocalDateTime ld = Validation.getLocalDateTime(s);
		System.out.println(ld);
		String sd = Validation.getStringFromLocalDateTime(ld);
		System.out.println(sd);
	}
}
