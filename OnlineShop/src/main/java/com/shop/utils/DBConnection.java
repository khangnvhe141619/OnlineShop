package com.shop.utils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnection {
	private static DBConnection instance;
	private static Connection connection;

	public static DBConnection getInstance() {
		if (instance == null || connection == null) {
			instance = new DBConnection();
		}
		return instance;
	}

	public Connection getConnection() throws IOException {
		Properties properties = new Properties();
		try {
			properties.load(DBConnection.class.getResourceAsStream("/dbConfig.properties"));

			String driver = properties.getProperty("driver");
			String url = properties.getProperty("url");
			String userName = properties.getProperty("userName");
			String password = properties.getProperty("password");

			Class.forName(driver);

			connection = DriverManager.getConnection(url, userName, password);
			return connection;
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
		System.out.println(new DBConnection());
	}
}