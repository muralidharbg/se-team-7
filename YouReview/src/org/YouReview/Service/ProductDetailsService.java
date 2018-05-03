package org.YouReview.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.YouReview.dto.Products;
import org.YouReview.dto.Reviews;
import org.YouReview.dto.SubCategory;

public class ProductDetailsService extends YourReviewService {
	public Products getProductByName(String Product_Name) throws Exception {
		Connection conn = null;

		Products productDetails = new Products();
		try {
			conn = getConnection();
			PreparedStatement pst = null;
			pst = conn.prepareStatement(
					"SELECT p.*, s.Category_Name FROM Products p, Sub_Categories s WHERE s.Sub_Category_Name = p.Sub_Category_Name AND p.Product_Name = ?");
			pst.setString(1, Product_Name);
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()) {
				productDetails.setProduct_Name(rs.getString("Product_Name"));
				productDetails.setSub_Category_Name(rs.getString("Sub_Category_Name"));
				productDetails.setUser_Name(rs.getString("User_Name"));
				productDetails.setBrand(rs.getString("Brand"));
				productDetails.setModel(rs.getString("Model"));
				productDetails.setCategory_name(rs.getString("Category_Name"));
				productDetails.setDescription(rs.getString("Description"));
				productDetails.setImagePath(rs.getString("ImagePath"));
				productDetails.setReviews(getReviewsByProductName(productDetails.getProduct_Name()));
				productDetails.setAnswer1Avg(getAnswer1Avg(Product_Name));
				productDetails.setAnswer2Avg(getAnswer2Avg(Product_Name));
				productDetails.setAnswer3Avg(getAnswer3Avg(Product_Name));
				productDetails.setAnswer4Avg(getAnswer4Avg(Product_Name));
				productDetails.setAnswer5Avg(getAnswer5Avg(Product_Name));
				productDetails.setSubCategory(getSubCategory(productDetails.getSub_Category_Name()));
			}
		} catch (Exception e) {
			System.out.println("validateLogon: Error while validating password: " + e.getMessage());
			throw e;

		} finally {
			conn.close();
		}

		return productDetails;
	}
	
	public ArrayList<Reviews> getReviewsByProductName(String Product_Name) throws Exception {
		Connection conn = null;

		ArrayList<Reviews> reviewList = new ArrayList<>();
		try {
			conn = getConnection();
			PreparedStatement pst = null;
			pst = conn.prepareStatement(
					"SELECT r.* FROM Reviews r WHERE r.Product_Name = ?");
			pst.setString(1, Product_Name);
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()) {
				Reviews review = new Reviews();
				review.setProduct_Name(rs.getString("Product_Name"));
				review.setUser_UserName(rs.getString("User_UserName"));
				review.setAnswer1(rs.getInt("Answer1"));
				review.setAnswer2(rs.getInt("Answer2"));
				review.setAnswer3(rs.getInt("Answer3"));
				review.setAnswer4(rs.getInt("Answer4"));
				review.setAnswer5(rs.getInt("Answer5"));
				review.setComment(rs.getString("Comment"));
				reviewList.add(review);
			}
		} catch (Exception e) {
			System.out.println("validateLogon: Error while validating password: " + e.getMessage());
			throw e;

		} finally {
			conn.close();
		}
		return reviewList;
	}
	
	public int getAnswer1Avg(String Product_Name) throws Exception {
		Connection conn = null;

		int Answer1Avg = 0;
		try {
			conn = getConnection();
			PreparedStatement pst = null;
			pst = conn.prepareStatement(
					"SELECT avg(Answer1) as Answer1Avg FROM Reviews r WHERE r.Product_Name = ?");
			pst.setString(1, Product_Name);
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()) {
				Answer1Avg = rs.getInt("Answer1Avg");
			}
			
		} catch (Exception e) {
			System.out.println("validateLogon: Error while validating password: " + e.getMessage());
			throw e;

		} finally {
			conn.close();
		}

		return Answer1Avg;
	}
	
	public int getAnswer2Avg(String Product_Name) throws Exception {
		Connection conn = null;

		int Answer2Avg = 0;
		try {
			conn = getConnection();
			PreparedStatement pst = null;
			pst = conn.prepareStatement(
					"SELECT avg(Answer2) as Answer2Avg FROM Reviews r WHERE r.Product_Name = ?");
			pst.setString(1, Product_Name);
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()) {
				Answer2Avg = rs.getInt("Answer2Avg");
			}
			
		} catch (Exception e) {
			System.out.println("validateLogon: Error while validating password: " + e.getMessage());
			throw e;

		} finally {
			conn.close();
		}

		return Answer2Avg;
	}
	
	public int getAnswer3Avg(String Product_Name) throws Exception {
		Connection conn = null;

		int Answer3Avg = 0;
		try {
			conn = getConnection();
			PreparedStatement pst = null;
			pst = conn.prepareStatement(
					"SELECT avg(Answer3) as Answer3Avg FROM Reviews r WHERE r.Product_Name = ?");
			pst.setString(1, Product_Name);
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()) {
				Answer3Avg = rs.getInt("Answer3Avg");
			}
			
		} catch (Exception e) {
			System.out.println("validateLogon: Error while validating password: " + e.getMessage());
			throw e;

		} finally {
			conn.close();
		}

		return Answer3Avg;
	}
	
	public int getAnswer4Avg(String Product_Name) throws Exception {
		Connection conn = null;

		int Answer4Avg = 0;
		try {
			conn = getConnection();
			PreparedStatement pst = null;
			pst = conn.prepareStatement(
					"SELECT avg(Answer4) as Answer4Avg FROM Reviews r WHERE r.Product_Name = ?");
			pst.setString(1, Product_Name);
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()) {
				Answer4Avg = rs.getInt("Answer4Avg");
			}
			
		} catch (Exception e) {
			System.out.println("validateLogon: Error while validating password: " + e.getMessage());
			throw e;

		} finally {
			conn.close();
		}

		return Answer4Avg;
	}
	
	public int getAnswer5Avg(String Product_Name) throws Exception {
		Connection conn = null;

		int Answer5Avg = 0;
		try {
			conn = getConnection();
			PreparedStatement pst = null;
			pst = conn.prepareStatement(
					"SELECT avg(Answer5) as Answer5Avg FROM Reviews r WHERE r.Product_Name = ?");
			pst.setString(1, Product_Name);
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()) {
				Answer5Avg = rs.getInt("Answer5Avg");
			}
			
		} catch (Exception e) {
			System.out.println("validateLogon: Error while validating password: " + e.getMessage());
			throw e;

		} finally {
			conn.close();
		}

		return Answer5Avg;
	}
	
	public SubCategory getSubCategory(String Sub_Category_Name) throws Exception {
		Connection conn = null;

		SubCategory subCategory = new SubCategory();
		try {
			conn = getConnection();
			PreparedStatement pst = null;
			pst = conn.prepareStatement(
					"SELECT * FROM Sub_Categories WHERE Sub_Category_Name = ?");
			pst.setString(1, Sub_Category_Name);
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()) {
				subCategory.setSubCategoryName(rs.getString("Sub_Category_Name"));
				subCategory.setCategoryName(rs.getString("Category_Name"));
				subCategory.setQuestion1(rs.getString("Question1"));
				subCategory.setQuestion2(rs.getString("Question2"));
				subCategory.setQuestion3(rs.getString("Question3"));
				subCategory.setQuestion4(rs.getString("Question4"));
				subCategory.setQuestion5(rs.getString("Question5"));
			}
			
		} catch (Exception e) {
			System.out.println("validateLogon: Error while validating password: " + e.getMessage());
			throw e;

		} finally {
			conn.close();
		}

		return subCategory;
	}
}
