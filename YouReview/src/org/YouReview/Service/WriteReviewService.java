package org.YouReview.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.YouReview.dto.SubCategory;

public class WriteReviewService extends YourReviewService{
	public SubCategory getSubCategory(String Product_Name) throws Exception
	{
		Connection conn = null;
		SubCategory subCategory = new SubCategory();
		
		try {
			conn = getConnection();			
			PreparedStatement pst = null;
			pst = conn.prepareStatement("select * from Sub_Categories join Products where Products.Sub_Category_Name = Sub_Categories.Sub_Category_Name and Products.Product_Name=?");
			pst.setString(1, Product_Name);
			ResultSet rs = pst.executeQuery();
			while(rs.next())
			{				
				subCategory.setCategoryName(rs.getString("Category_Name"));
				subCategory.setQuestion1(rs.getString("Question1"));
				subCategory.setQuestion2(rs.getString("Question2"));
				subCategory.setQuestion3(rs.getString("Question3"));
				subCategory.setQuestion4(rs.getString("Question4"));
				subCategory.setQuestion5(rs.getString("Question5"));
				subCategory.setSubCategoryName(rs.getString("Sub_Category_Name"));
			}
		}
		catch(Exception e) {
		    System.out.println("Something is wrong with Query getSubCategory: "+e.getMessage());
			throw e;
		 
		  }
		return subCategory;
	}
	public boolean writeReview(String Product_Name,String User_UserName,int Answer1,int Answer2,int Answer3,int Answer4,int Answer5,String comment)
	{
		Connection conn = null;
		boolean status = false;
		
		try {
			conn = getConnection();
			
			Statement st = conn.createStatement();
			String sql_statement ="insert into Reviews (Product_Name,User_UserName,Answer1,Answer2,Answer3,Answer4,Answer5,Comment) values (\'"+Product_Name+"\',\'"+User_UserName+"\', "+Answer1+","+Answer2+","+Answer3+","+Answer4+","+Answer5+",\'"+comment+"\')";
			System.out.println(sql_statement);	
			st.executeUpdate(sql_statement);
			status = true;
			conn.close();
		
		}
		catch(Exception e) {
		    System.out.println("Something is wrong with Query write Review: "+e.getMessage());
			try {
				throw e;
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		 
		  }
		return status;
	}

}
