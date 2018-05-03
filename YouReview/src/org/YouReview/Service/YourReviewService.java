package org.YouReview.Service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class YourReviewService {
	protected Connection getConnection() throws Exception {
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/YouReview_DB?useSSL=false";
		String driver = "com.mysql.jdbc.Driver";
		try {
			Class.forName(driver).newInstance();
			conn = DriverManager.getConnection(url, "root", "12345678");
		} catch (SQLException sqle) {
			System.out.println("SQLException: Unable to open connection to db: " + sqle.getMessage());

			throw sqle;
		} catch (Exception e) {
			System.out.println("Exception: Unable to open connection to db: " + e.getMessage());
			throw e;
		}
		return conn;
	}
}
