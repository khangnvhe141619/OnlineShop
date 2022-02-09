package com.shop.utils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Validation {
	public static LocalDateTime getLocalDateTime(String s) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		LocalDateTime dateTime = LocalDateTime.parse(s, formatter);
		return dateTime;
	}
}
