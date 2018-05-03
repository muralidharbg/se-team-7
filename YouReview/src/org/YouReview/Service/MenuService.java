package org.YouReview.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class MenuService extends YourReviewService {
	public HashMap<String, ArrayList<String>> getMenuTree() throws Exception {
		Connection conn = null;
		HashMap<String, ArrayList<String>> menuTree = new HashMap<String, ArrayList<String>>();

		try {
			conn = getConnection();
			PreparedStatement pst = null;
			pst = conn.prepareStatement("SELECT Sub_Category_Name, Category_Name FROM Sub_Categories");
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				String key = rs.getString("Category_Name");
				if (!menuTree.containsKey(key)) {
					menuTree.put(key, new ArrayList<String>());
				}
				menuTree.get(key).add(rs.getString("Sub_Category_Name"));
			}
		} catch (Exception e) {
			System.out.println("validateLogon: Error while validating password: " + e.getMessage());
			throw e;

		} finally {
			conn.close();
		}
		return menuTree;

	}
}
