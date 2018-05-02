package org.YouReview.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;


public class SearchService extends YourReviewService {
	public HashMap<String, ArrayList<String>> getSearchResults(String Query) throws Exception {
		ArrayList<String> productList = getProductsByQuery(Query);
		ArrayList<String> brandList = getBrandsByQuery(Query);
		ArrayList<String> subCategoryList = getSubCategoryByQuery(Query);
		ArrayList<String> categoryList = getCategoryByQuery(Query);
		
		HashMap<String, ArrayList<String>> searchResults = new HashMap<>();
		searchResults.put("Products", productList);
		searchResults.put("Brands", brandList);
		searchResults.put("Sub-Categories", subCategoryList);
		searchResults.put("Categories", categoryList);

		return searchResults;

	}

	public ArrayList<String> getProductsByQuery(String Query) throws Exception {
		Connection conn = null;
		
		ArrayList<String> productList = new ArrayList<String>();
		try {
			conn = getConnection();
			PreparedStatement pst = null;
			pst = conn.prepareStatement(
					"SELECT p.Product_Name FROM Products p WHERE p.Approved = 1 AND p.Product_Name LIKE '%" + Query + "%'");
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				productList.add(rs.getString("Product_Name"));
			}
		} catch (Exception e) {
			System.out.println("validateLogon: Error while validating password: " + e.getMessage());
			throw e;

		} finally {
			conn.close();
		}
		return productList;

	}
	
	public ArrayList<String> getBrandsByQuery(String Query) throws Exception {
		Connection conn = null;

		ArrayList<String> brandList = new ArrayList<String>();
		try {
			conn = getConnection();
			PreparedStatement pst = null;
			pst = conn.prepareStatement(
					"SELECT p.Brand FROM Products p WHERE p.Approved = 1 AND p.Brand LIKE '%" + Query + "%'");
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				brandList.add(rs.getString("Brand"));
			}
		} catch (Exception e) {
			System.out.println("validateLogon: Error while validating password: " + e.getMessage());
			throw e;

		} finally {
			conn.close();
		}
		return brandList;
	}
	
	public ArrayList<String> getSubCategoryByQuery(String Query) throws Exception {
		Connection conn = null;

		ArrayList<String> brandList = new ArrayList<String>();
		try {
			conn = getConnection();
			PreparedStatement pst = null;
			pst = conn.prepareStatement(
					"SELECT p.Sub_Category_Name FROM Products p WHERE p.Approved = 1 AND p.Sub_Category_Name LIKE '%" + Query + "%'");
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				brandList.add(rs.getString("Sub_Category_Name"));
			}
		} catch (Exception e) {
			System.out.println("validateLogon: Error while validating password: " + e.getMessage());
			throw e;

		} finally {
			conn.close();
		}
		return brandList;
	}
	
	public ArrayList<String> getCategoryByQuery(String Query) throws Exception {
		Connection conn = null;

		ArrayList<String> brandList = new ArrayList<String>();
		try {
			conn = getConnection();
			PreparedStatement pst = null;
			pst = conn.prepareStatement(
					"SELECT Category_Name FROM Category WHERE Category_Name LIKE '%" + Query + "%'");
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				brandList.add(rs.getString("Category_Name"));
			}
		} catch (Exception e) {
			System.out.println("validateLogon: Error while validating password: " + e.getMessage());
			throw e;

		} finally {
			conn.close();
		}
		return brandList;
	}
}
