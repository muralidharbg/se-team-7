<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">  -->

<!-- Website CSS style -->
<!--  <link rel="stylesheet" type="text/css" href="assets/css/main.css">  -->

<!-- Website Font style -->
<link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css">

<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Passion+One'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Oxygen'
	rel='stylesheet' type='text/css'>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/jquery-ui.min.css" rel="stylesheet">
<link href="css/master.css" rel="stylesheet">
<script>
	function change() {
		var text = $('#category').val();
	}
</script>
<title>Add Sub Category</title>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="container">
		<div class="row main">
			<div class="panel-heading">
				<div class="panel-title text-center">
					<h1 class="title">Add Sub Category</h1>
					<hr />
				</div>
			</div>
			<div class="main-login main-center" style="max-width: 830px;">
				<form class="form-horizontal" method="post" action="AddSubCategoryServlet">
						
						<div class="form-group">
							
						
									<label for="category" class="cols-sm-2 control-label">Category Name:</label>
									
									<select class="form-control" id="category" name="category">
										<option>Select Category</option>
										<%
											try{
												String Query="select * from Category";
					
												Connection conn = null;
												String url = "jdbc:mysql://localhost:3306/YouReview_DB?useSSL=false";
												String driver = "com.mysql.jdbc.Driver";
												try {
													Class.forName(driver).newInstance();
													conn = DriverManager.getConnection(url,"root","12345678");
												}
												catch(SQLException sqle) {
													System.out.println("SQLException: Unable to open connection to db: "+sqle.getMessage());
												
													throw sqle;
												}
												PreparedStatement psmt = conn.prepareStatement(Query);
												
												
												ResultSet rs = psmt.executeQuery();
												while(rs.next()){
												
												%>
										
										<option value="<%=rs.getString("Category_Name")%>"
										<%
											if(request.getParameter("category") != null)
											{
												if(request.getParameter("category").equals(rs.getString("Category_Name")))
												{
													out.print("selected");
												}
											}
										%>
																				
										><%=rs.getString("Category_Name")%></option>
										<%} 
											}
											catch(Exception e)
											{
												e.printStackTrace();
											}%>					
									</select>
									
													
									<label for="Sub_Category_Name" class="cols-sm-2 control-label">Sub-Category Name</label>
									<div class="cols-sm-5">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-book" aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="Sub_Category_Name" id="Sub_Category_Name"  placeholder="Enter Sub-Category Name"/>
										</div>
									</div>
									<label for="Question1" class="cols-sm-2 control-label">Question1</label>
									<div class="cols-sm-5">
										<div class="input-group">
											<span class="input-group-addon"><b>How is </b></span>
											<input type="text" class="form-control" name="Question1" id="Question1"  placeholder="Enter Question Keyword"/>
											<span class="input-group-addon"><b>?</b></span>											
										</div>
									</div>
									<label for="Question2" class="cols-sm-2 control-label">Question2</label>
									<div class="cols-sm-5">
										<div class="input-group">
											<span class="input-group-addon"><b>How is </b></span>
											<input type="text" class="form-control" name="Question2" id="Question2"  placeholder="Enter Question Keyword"/>
											<span class="input-group-addon"><b>?</b></span>
										</div>		
									</div>
									<label for="Question3" class="cols-sm-2 control-label">Question3</label>
									<div class="cols-sm-5">
										<div class="input-group">
											<span class="input-group-addon"><b>How is </b></span>
											<input type="text" class="form-control" name="Question3" id="Question3"  placeholder="Enter Question Keyword"/>
											<span class="input-group-addon"><b>?</b></span>
										</div>
									</div>
									<label for="Question4" class="cols-sm-2 control-label">Question4</label>
									<div class="cols-sm-5">
										<div class="input-group">
											<span class="input-group-addon"><b>How is </b></span>
											<input type="text" class="form-control" name="Question4" id="Question4"  placeholder="Enter Question Keyword"/>
											<span class="input-group-addon"><b>?</b></span>
										</div>
									</div>
									<label for="Question5" class="cols-sm-2 control-label">Question5</label>
									<div class="cols-sm-5">
										<div class="input-group">
											<span class="input-group-addon"><b>How is </b></span>
											<input type="text" class="form-control" name="Question5" id="Question5"  placeholder="Enter Question Keyword"/>
											<span class="input-group-addon"><b>?</b></span>
										</div>
									</div>
									
									
									<div class="form-group ">
										<input type="submit" class="btn btn-primary btn-lg btn-block login-button"/>
									</div>  																
				</div>
				</form>	
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>