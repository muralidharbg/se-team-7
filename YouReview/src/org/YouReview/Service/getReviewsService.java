package org.YouReview.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.YouReview.Connector.DatabaseConnector;

public class getReviewsService {
	public ResultSet getReviewsForProducts(String product_name)
	{
		ResultSet rs= null;
		
		Connection con= DatabaseConnector.getConnection();
		PreparedStatement pst;
		try {
			System.out.println("getting reviews");
			pst = con.prepareStatement("select * from reviews where Product_Name=?");
			pst.setString(1, product_name);
			rs= pst.executeQuery();
			System.out.println("got all reviews");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return rs;
	}

}
