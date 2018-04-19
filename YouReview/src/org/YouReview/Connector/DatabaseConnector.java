package org.YouReview.Connector;
//import java.io.FileNotFoundException;
//import java.io.IOException;
//import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
//import java.util.Properties;
 
public class DatabaseConnector {
	
	private static Connection connection;
	
	public static Connection getConnection() {
		if (connection != null)
			return connection;
		
		else {
			try {
				//Properties prop = new Properties();
				//InputStream inputStream = DatabaseConnector.class.getClassLoader().getResourceAsStream("/db.properties");
				//prop.load(inputStream);
				
				String driver = "com.mysql.jdbc.Driver";
				//String url = "jdbc:mysql://localhost:3307/youreview_db";
				String url = "jdbc:mysql://localhost:3306/YouReview_DB?useSSL=false";
				String user = "root";
				String password = "12345678";
				
				Class.forName(driver);
				connection = DriverManager.getConnection(url, user, password);
				} 
			catch (ClassNotFoundException e) {
				e.printStackTrace();
				} 
			catch (SQLException e) {
				e.printStackTrace();
				} 
			/*
			catch (FileNotFoundException e) {
				e.printStackTrace();
				} 
			catch (IOException e) {
				e.printStackTrace();
				}*/
			return connection;
			}
		}
	}