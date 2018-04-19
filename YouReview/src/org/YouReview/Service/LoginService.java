package org.YouReview.Service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import org.YouReview.dto.User;

public class LoginService {
	HashMap<String,String> users = new HashMap<String,String>();
	
	public LoginService(){
		users.put("karan", "karan Upadhyay");
		users.put("jinesh", "jinesh Shah");
	}
	
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
	
	
	public User authenticate(String userName,String passWord) throws Exception
	{
		Connection conn = null;
		boolean status = false;
		User user = new User();
		try {
			
			conn = getConnection();
			PreparedStatement pst = null;
			pst = conn.prepareStatement("select * from Users where User_UserName=? and User_PassWord=?");
			pst.setString(1, userName);
			pst.setString(2, passWord);
			ResultSet rs = pst.executeQuery();
			if(rs.next())
			{
				user.setFullName(rs.getString("User_FullName"));
				user.setUserName(rs.getString("User_UserName"));
				user.setUser_Role(rs.getString("User_Role"));
				status = true;
			}
		}
		catch(Exception e) {
		    System.out.println("validateLogon: Error while validating password: "+e.getMessage());
			throw e;
		 
		  } finally {
		   	conn.close();
		  }
		System.out.println(user);
		return user;
		
	}
	
	public boolean register(String fullName, String email,String userName,String passWord) throws Exception
	{
		Connection conn = null;
		boolean status = false;
		
		try {
			conn = getConnection();
			
			PreparedStatement pst = null;
			pst = conn.prepareStatement("select * from Users where User_UserName=?");
			pst.setString(1, userName);
			ResultSet rs = pst.executeQuery();
			if(rs.next())
			{
				status = false;
			}
			else
			{
				Statement st = conn.createStatement();
				String sql_statement ="insert into Users (User_Email,User_FullName,User_UserName,User_PassWord) values (\'"+email+"\',\'"+fullName+"\', \'"+userName+"\',\'"+passWord+"\')";
					
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
	
	
	
	public User getuserDetails(String userName) {
		User user = new User();
		user.setUserName(userName);
		user.setFullName(users.get(userName));
		return user;
		
	}
}
