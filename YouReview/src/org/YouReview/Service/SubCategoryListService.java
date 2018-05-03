package org.YouReview.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class SubCategoryListService extends YourReviewService {
	public ArrayList<String> getSubCategory(String Category_Name) throws Exception {
		Connection conn = null;
		ArrayList<String> subCategories = new ArrayList<String>();

		try {
			conn = getConnection();
			PreparedStatement pst = null;
			pst = conn.prepareStatement("SELECT Sub_Category_Name FROM Sub_Categories WHERE Category_Name = ?");
			
			pst.setString(1, Category_Name);
			
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				subCategories.add(rs.getString("Sub_Category_Name"));
			}
		} catch (Exception e) {
			System.out.println("validateLogon: Error while validating password: " + e.getMessage());
			throw e;

		} finally {
			conn.close();
		}
		return subCategories;

	}
}
