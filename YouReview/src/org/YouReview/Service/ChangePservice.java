package org.YouReview.Service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ChangePservice extends YourReviewService {
	
	public boolean changePassword(String newpassWord, String userName) throws Exception{
		
		Connection conn = null;
		boolean status = false;
		try
		{
			conn = getConnection();
			PreparedStatement pst = null;
			Statement st = conn.createStatement();
//			String sql_statement ="insert into Users (User_PassWord) values (\'"+newpassWord+"\')";
			String sql_statement  ="update Users set User_PassWord = '"+newpassWord+"' where User_UserName = '"+userName+"'";
			st.executeUpdate(sql_statement);
			status = true;
		}
		
		catch(Exception e)
		{
			 System.out.println("validateLogon: Error while changing password: "+e.getMessage());
				throw e;
		}
		
		finally {
		   	conn.close();
		  }

		return status;
	}
	
	
	public boolean authenticate(String userName,String oldpassWord) throws Exception
	{
		Connection conn = null;
		boolean status = false;
		
		try {
			conn = getConnection();
			PreparedStatement pst = null;
			pst = conn.prepareStatement("select * from Users where User_UserName=? and User_PassWord=?");
			pst.setString(1, userName);
			pst.setString(2, oldpassWord);
			ResultSet rs = pst.executeQuery();
			if(rs.next())
			{
				status = true;
			}
		}
		catch(Exception e) {
		    System.out.println("validateLogon: Error while validating authentication for chaning password: "+e.getMessage());
			throw e;
		 
		  } 
		finally {
		   	conn.close();
		  }
		
		return status;
		
	}

}
