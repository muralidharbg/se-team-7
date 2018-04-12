package org.YouReview.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
}
