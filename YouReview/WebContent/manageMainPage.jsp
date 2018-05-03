<%@page import="java.sql.ResultSet"%>
<%@page import="org.YouReview.Service.getReviewsService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</br></br></br>
<form action ="manageMainPageServlet" method="post">
<table align ="center">
<tr>
<% 
String product1=null;
if(request.getAttribute("product_1")!=null)
{
	product1= request.getAttribute("product_1").toString();
	}
%>
<td><input type="text" name="product1" value="<%=product1%>"></td>

<td><input type="submit" name="fetch_reviews1" value="fetch reviews"></td>
<td><select name="reviews1">
<%
if(request.getAttribute("product_1")!=null)
{
	getReviewsService get_rs= new getReviewsService();
	ResultSet rst= get_rs.getReviewsForProducts(request.getAttribute("product_1").toString());
	
	while(rst.next()){
	%>
	<option value="<%=rst.getString("User_UserName")%>"><%=rst.getString("User_UserName") %></option>
	<%
	}
}
//============================================================================================
%>
</select>
</td>
</tr>

<tr>
<% 
String product2=null;
if(request.getAttribute("product_2")!=null)
{
	product2= request.getAttribute("product_2").toString();
	}
%>
<td><input type="text" name="product2" value="<%=product2%>"></td>

<td><input type="submit" name="fetch_reviews2" value="fetch reviews"></td>
<td><select name="reviews2">
<%
if(request.getAttribute("product_2")!=null)
{
	getReviewsService get_rs= new getReviewsService();
	ResultSet rst= get_rs.getReviewsForProducts(request.getAttribute("product_2").toString());
	
	while(rst.next()){
	%>
	<option value="<%=rst.getString("User_UserName")%>"><%=rst.getString("User_UserName") %></option>
	<%
	}
}
//================================================================================
%>
</select>
</td>
</tr>

<tr>
<% 
String product3=null;
if(request.getAttribute("product_3")!=null)
{
	product3= request.getAttribute("product_3").toString();
	}
%>
<td><input type="text" name="product3" value="<%=product3%>"></td>

<td><input type="submit" name="fetch_reviews3" value="fetch reviews"></td>
<td><select name="reviews3">
<%
if(request.getAttribute("product_3")!=null)
{
	getReviewsService get_rs= new getReviewsService();
	ResultSet rst= get_rs.getReviewsForProducts(request.getAttribute("product_3").toString());
	
	while(rst.next()){
	%>
	<option value="<%=rst.getString("User_UserName")%>"><%=rst.getString("User_UserName") %></option>
	<%
	}
}
%>
</select>
</td>
</tr>

<tr>
<td colspan="3" align ="center"><input type="submit" name="commit_changes" value="COMMIT"></td>
</tr>
</table>
</form>
</body>
</html>