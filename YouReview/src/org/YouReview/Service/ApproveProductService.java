package org.YouReview.Service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.YouReview.dto.Products;

public class ApproveProductService {
HashMap<String,String> users = new HashMap<String,String>();
	
	
	private Connection getConnection() throws Exception{
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/YouReview_DB?useSSL=false";
		String driver = "com.mysql.jdbc.Driver";
		try {
			Class.forName(driver).newInstance();
			conn = DriverManager.getConnection(url,"root","root");
		}
		catch(SQLException sqle) {
			System.out.println("SQLException: Unable to open connection to db: "+sqle.getMessage());
		
			throw sqle;
		}
		catch(Exception e) {
		      System.out.println("Exception: Unable to open connection to db: "+e.getMessage());
		      throw e;
		   }
		return conn;
	}
	
	
	public ArrayList<Products> getApprovalPendingProducts() throws Exception
	{
		Connection conn = null;
		
		ArrayList<Products> productList = new ArrayList<Products>();
		try {
			conn = getConnection();
			PreparedStatement pst = null;
			pst = conn.prepareStatement("SELECT p.*, s.Category_Name FROM Products p, Sub_Categories s WHERE s.Sub_Category_Name = p.Sub_Category_Name AND p.Approved = 0");
			ResultSet rs = pst.executeQuery();
			
			while(rs.next())
			{
				Products product = new Products();
				product.setProduct_Name(rs.getString("Product_Name"));
				product.setSub_Category_Name(rs.getString("Sub_Category_Name"));
				product.setUser_Name(rs.getString("User_Name"));
				product.setBrand(rs.getString("Brand"));
				product.setModel(rs.getString("Model"));
				product.setCategory_name(rs.getString("Category_Name"));
				productList.add(product);
			}
		}
		catch(Exception e) {
		    System.out.println("validateLogon: Error while validating password: "+e.getMessage());
			throw e;
		 
		  } finally {
		   	conn.close();
		  }
		
		return productList;
		
	}
	
}
