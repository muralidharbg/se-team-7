package org.YouReview.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.YouReview.dto.subCategory;

public class subcategoryService {
	public ResultSet getAllsubCategories()
	{
		//ArrayList<Category> cat_list = new ArrayList<Category>();
		ResultSet rs= null;
		LoginService ls = new LoginService();
		Connection con= null;
		try {
		con = ls.getConnection();
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println("Exception: "+ e.getMessage());
		}
		PreparedStatement pst = null;
		try {
			pst= con.prepareStatement("select * from sub_categories");
			
			rs= pst.executeQuery();
			//while(rs.next())
			//{
			//	Category cat= new Category();
			//	cat.setCategory(rs.getString("Category_Name"));
			//	cat_list.add(cat);
			//}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
				
	}
	public String updatesubCategory(String oldCategory, String NewCategory)
	{
		String ret= "no";
		try {
		LoginService ls= new LoginService();
		Connection con= ls.getConnection();
		PreparedStatement pst = null;
		String sql= "update sub_categories set Sub_Category_Name= ? where Sub_Category_Name = ?";
		pst= con.prepareStatement(sql);
		pst.setString(1, NewCategory);
		pst.setString(2, oldCategory);
		pst.executeUpdate();
		ret= "YES";
		
		
		}catch(Exception e)
		{
			e.printStackTrace();
			ret="no";
		}
		
		return ret;
		
	}
	
	public subCategory getsubCategory(String category, String sub_category) {
		
		subCategory sc= new subCategory();
		ResultSet rs= null;
		LoginService ls = new LoginService();
		Connection con= null;
		try {
		con = ls.getConnection();
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println("Exception: "+ e.getMessage());
		}
		PreparedStatement pst = null;
		try {
			pst= con.prepareStatement("select * from sub_categories where Category_name= ? and Sub_Category_name= ?");
			pst.setString(1, category);
			pst.setString(2, sub_category);
			
			rs= pst.executeQuery();
			//while(rs.next())
			//{
			//	Category cat= new Category();
			//	cat.setCategory(rs.getString("Category_Name"));
			//	cat_list.add(cat);
			//}
			sc.setCategory_name(rs.getString("Category_Name"));
			sc.setSub_category_name(rs.getString("Sub_Category_Name"));
			sc.setQ1(rs.getString("Question1"));
			sc.setQ2(rs.getString("Question2"));
			sc.setQ3(rs.getString("Question3"));
			sc.setQ4(rs.getString("Question4"));
			sc.setQ5(rs.getString("Question5"));
			
			System.out.println("q1 in subcatservice >>>  "+sc.getQ1());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sc;
	}
}
