package org.YouReview.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.YouReview.Connector.DatabaseConnector;
import org.YouReview.dto.SubCategory;


public class SubCategoryDAO {
	
	private Connection connection;
	
	public SubCategoryDAO() {
	connection = DatabaseConnector.getConnection();
	if(connection == null){
		System.out.println("sadsd");
	} else{
		System.out.println("rtrtrt");
	}
	}

	
	public void addSubCategory(SubCategory subcategory) {
		try {
			System.out.println("from dao"+subcategory);
			PreparedStatement preparedStatement = connection.prepareStatement
			("insert into users(Sub_Category_Name, Category_Name, Question1, Question2, Question3, Question4, Question5) values (?, ?, ?, ?, ?, ? ,?)");
			preparedStatement.setString(1, subcategory.getSubCategoryName());
			preparedStatement.setString(2, subcategory.getCategoryName());
			preparedStatement.setString(3, subcategory.getQuestion1());
			preparedStatement.setString(4, subcategory.getQuestion2());
			preparedStatement.setString(5, subcategory.getQuestion3());
			preparedStatement.setString(6, subcategory.getQuestion4());
			preparedStatement.setString(7, subcategory.getQuestion5());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			}
		}



}
