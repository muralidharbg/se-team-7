package org.YouReview.Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.YouReview.Service.SearchService;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String query = request.getParameter("q");
		SearchService ss = new SearchService();

		HashMap<String, ArrayList<String>> searchResults = new HashMap<>();
		try {
			searchResults = ss.getSearchResults(query);

			request.setCharacterEncoding("utf8");
			response.setContentType("application/json");

			JSONArray responseData = new JSONArray();
			searchResults.forEach((key, list) -> {
				System.out.println("list.size: " + list.size());
				if (list.size() > 0) {
					list.forEach(item -> {
						JSONObject entry = new JSONObject();
						try {
							entry.put("label", item);
							entry.put("category", key);
							responseData.put(entry);
						} catch (JSONException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					});
				}
			});
			
			PrintWriter out;
			out = response.getWriter();
			out.print(responseData);
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JSONException e) {
			// TODO: handle exception
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
