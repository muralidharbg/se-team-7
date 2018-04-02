package org.YouReview.Service;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Statement;

public class AddProductService {
	
	private Connection getConnection() throws Exception{
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/YouReview_DB?useSSL=false";
		String driver = "com.mysql.jdbc.Driver";
		try {
			Class.forName(driver).newInstance();
			conn = DriverManager.getConnection(url,"root","12345678");
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
	
	public ResultSet getCategory() throws Exception{
		String Query="select * from Category";
		
		Connection conn = getConnection();
		Statement stm = (Statement) conn.createStatement();
		ResultSet rs = stm.executeQuery(Query);
		
		return rs;
	}
	
	public ResultSet getSubCategory(String Category) throws Exception{
		String Query="select * from Sub_Categories where Category_Name='"+Category+"'";
		
		System.out.println(Query);
		
		Connection conn = getConnection();
		Statement stm = (Statement) conn.createStatement();
		ResultSet rs = stm.executeQuery(Query);
		
		return rs;
	}
	
	public boolean AddProduct(String Product_Name, String Sub_Category_Name,String User_Name,String Brand,String Model,InputStream image,String Description) throws Exception
	{
		Connection conn = null;
		boolean status = false;
		
		try {
			conn = getConnection();
			
			PreparedStatement pst = null;
			pst = conn.prepareStatement("select * from Products where Product_Name=?");
			pst.setString(1, Product_Name);
			ResultSet rs = pst.executeQuery();
			if(rs.next())
			{
				status = false;
			}
			else
			{
				java.sql.Statement st = conn.createStatement();
				String sql_statement ="insert into Products (Product_Name,Sub_Category_Name,User_Name,Brand,Model,Image,Description) values (\'"+Product_Name+"\',\'"+Sub_Category_Name+"\', \'"+User_Name+"\',\'"+Brand+"\',\'"+Model+"\',\'"+image+"\',\'"+Description+"\')";
					
				st.executeUpdate(sql_statement);
				status = true;
				conn.close();
			}
		}
		catch(Exception e) {
		    System.out.println("validateLogon: Error while validating password: "+e.getMessage());
			throw e;
		 
		  }
		return status;
	}
		
	public boolean AddSubCategory(String category, String Sub_Category_Name,String Question1,String Question2,String Question3,String Question4,String Question5) throws Exception
	{
		Connection conn = null;
		boolean status = false;
		
		try {
			conn = getConnection();
			
			PreparedStatement pst = null;
			pst = conn.prepareStatement("select * from Sub_Categories where Sub_Category_Name=?");
			pst.setString(1, Sub_Category_Name);
			ResultSet rs = pst.executeQuery();
			if(rs.next())
			{
				status = false;
			}
			else
			{
				java.sql.Statement st = conn.createStatement();
				String sql_statement ="insert into Sub_Categories (Sub_Category_Name,Category_Name,Question1,Question2,Question3,Question4,Question5) values (\'"+Sub_Category_Name+"\',\'"+category+"\', \'"+Question1+"\',\'"+Question2+"\',\'"+Question3+"\',\'"+Question4+"\',\'"+Question5+"\')";
					
				st.executeUpdate(sql_statement);
				status = true;
				conn.close();
			}
		}
		catch(Exception e) {
		    System.out.println("validateLogon: Error while validating password: "+e.getMessage());
			throw e;
		 
		  }
		return status;
	}
	
}
