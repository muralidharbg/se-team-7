package org.YouReview.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.YouReview.dto.Products;

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
				Products product = new Products();
				productDetails.setProduct_Name(rs.getString("Product_Name"));
				productDetails.setSub_Category_Name(rs.getString("Sub_Category_Name"));
				productDetails.setUser_Name(rs.getString("User_Name"));
				productDetails.setBrand(rs.getString("Brand"));
				productDetails.setModel(rs.getString("Model"));
				productDetails.setCategory_name(rs.getString("Category_Name"));
				productDetails.setDescription(rs.getString("Description"));
			}
		} catch (Exception e) {
			System.out.println("validateLogon: Error while validating password: " + e.getMessage());
			throw e;

		} finally {
			conn.close();
		}

		return productDetails;
	}
}
