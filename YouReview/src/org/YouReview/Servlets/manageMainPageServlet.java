package org.YouReview.Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import org.YouReview.Connector.DatabaseConnector;


/**
 * Servlet implementation class manageMainPageServlet
 */
@WebServlet("/manageMainPageServlet")
public class manageMainPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public manageMainPageServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String product1= (String)request.getParameter("product1");
		String product2= (String)request.getParameter("product2");
		String product3= (String)request.getParameter("product3");
		
		
		if(request.getParameter("fetch_reviews1")!= null)
		{
			
			request.setAttribute("product_1",product1);
			//request.setAttribute("product_1", arg1);
		}
		else if(request.getParameter("fetch_reviews2")!= null)
		{
			request.setAttribute("product_1",product1);
			request.setAttribute("product_2",product2);
			//request.setAttribute("product_1", arg1);
		}
		else if(request.getParameter("fetch_reviews3")!= null)
		{
			request.setAttribute("product_1",product1);
			request.setAttribute("product_2",product2);
			request.setAttribute("product_3",product3);
			//request.setAttribute("product_1", arg1);
		}
		if(request.getParameter("commit")!= null)
		{
			String pro1, pro2, pro3, user1, user2, user3;
			pro1= (String)request.getParameter("product1");
			pro2= (String)request.getParameter("product2");
			pro3=(String)request.getParameter("product3");
			
			user1=(String)request.getParameter("reviews1");
			user2=(String)request.getParameter("reviews2");
			user3=(String)request.getParameter("reviews3");
			
			Connection con= DatabaseConnector.getConnection();
			try {
				Statement stmt = con.createStatement();
				stmt.executeUpdate("delete from mainpage_reviews");
				
				PreparedStatement stmt1= con.prepareStatement("insert into mainpage_reviews values (?,?)");
				stmt1.setString(1, pro1);
				stmt1.setString(2, user1);
				stmt1.executeUpdate();
				
				PreparedStatement stmt2= con.prepareStatement("insert into mainpage_reviews values (?,?)");
				stmt2.setString(1, pro2);
				stmt2.setString(2, user2);
				stmt2.executeUpdate();
				
				PreparedStatement stmt3= con.prepareStatement("insert into mainpage_reviews values (?,?)");
				stmt3.setString(1, pro3);
				stmt3.setString(2, user3);
				stmt3.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			//commit changes
			//request.setAttribute("product_1",product1);
			//request.setAttribute("product_1", arg1);
		}
		
		
		request.getRequestDispatcher("manageMainPage.jsp").forward(request, response);
	}

}
