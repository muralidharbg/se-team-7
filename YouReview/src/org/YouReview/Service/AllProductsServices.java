package org.YouReview.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.YouReview.dto.Products;

import com.mysql.jdbc.Blob;


public class AllProductsServices extends YourReviewService {
	public ArrayList<Products> getAllProducts() throws Exception {
		Connection conn = null;

		ArrayList<Products> productList = new ArrayList<Products>();
		try {
			conn = getConnection();
			PreparedStatement pst = null;
			pst = conn.prepareStatement(
					"SELECT p.*, s.Category_Name FROM Products p, Sub_Categories s WHERE s.Sub_Category_Name = p.Sub_Category_Name and p.Approved = 1");
			ResultSet rs = pst.executeQuery();
			Blob image = null;
			while (rs.next()) {
				Products product = new Products();
				product.setProduct_Name(rs.getString("Product_Name"));
				product.setSub_Category_Name(rs.getString("Sub_Category_Name"));
				product.setUser_Name(rs.getString("User_Name"));
				product.setBrand(rs.getString("Brand"));
				product.setModel(rs.getString("Model"));
				product.setCategory_name(rs.getString("Category_Name"));
				image = (Blob) rs.getBlob("Image");
				if(image != null)
				{
					System.out.println("we got the image");
				}
				product.setImage(image);
				productList.add(product);
			}
		} catch (Exception e) {
			System.out.println("validateLogon: Error while validating password: " + e.getMessage());
			throw e;

		} finally {
			conn.close();
		}

		return productList;

	}
}

