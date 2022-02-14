package com.shop.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static DBConnection instance;
	private static Connection connection;

	public static DBConnection getInstance() {
		if (instance == null || connection == null) {
			instance = new DBConnection();
		}
		return instance;
	}

	public Connection getConnection() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String url = "jdbc:sqlserver://localhost:1433; databaseName = OnlineShopDB";
			String user = "sa";
			String pass = "123";
			connection = DriverManager.getConnection(url, user, pass);
			return connection;
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}