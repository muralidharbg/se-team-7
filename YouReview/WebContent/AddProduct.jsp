<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<title>AddProduct</title>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>

	<div class="container">
		<div class="row main">
			<div class="panel-heading">
				<div class="panel-title text-center">
					<h1 class="title">AddProduct</h1>
					<hr />
				</div>
			</div>
			<div class="main-login main-center" style="max-width: 830px;">
				<form class="form-horizontal" method="post"
					enctype='multipart/form-data' action="AddProductServlet">

					<div class="form-group">


						<label for="category" class="cols-sm-2 control-label">Category
							Name:</label> <select class="form-control" id="category" name="category"
							onchange="this.form.submit();">
							<option>Select Category</option>
							<%
								try {
									String Query = "select * from Category";

									Connection conn = null;
									String url = "jdbc:mysql://localhost:3306/YouReview_DB?useSSL=false";
									String driver = "com.mysql.jdbc.Driver";
									try {
										Class.forName(driver).newInstance();
										conn = DriverManager.getConnection(url, "root", "12345678");
									} catch (SQLException sqle) {
										System.out.println("SQLException: Unable to open connection to db: " + sqle.getMessage());

										throw sqle;
									}
									PreparedStatement psmt = conn.prepareStatement(Query);

									ResultSet rs = psmt.executeQuery();
									while (rs.next()) {
							%>

							<option value="<%=rs.getString("Category_Name")%>"
								<%if (request.getParameter("category") != null) {
						if (request.getParameter("category").equals(rs.getString("Category_Name"))) {
							out.print("selected");
						}
					}%>><%=rs.getString("Category_Name")%></option>
							<%
								}
								} catch (Exception e) {
									e.printStackTrace();
								}
							%>
						</select> <label for="subCategory" class="cols-sm-2 control-label">Sub
							Category Name:</label> <select id="subCategory" name="subCategory"
							class="form-control">
							<option value="one">Select Sub-Category</option>
							<%
								try {
									String Query = "select * from Sub_Categories where Category_Name=?";

									Connection conn = null;
									String url = "jdbc:mysql://localhost:3306/YouReview_DB?useSSL=false";
									String driver = "com.mysql.jdbc.Driver";
									try {
										Class.forName(driver).newInstance();
										conn = DriverManager.getConnection(url, "root", "12345678");
									} catch (SQLException sqle) {
										System.out.println("SQLException: Unable to open connection to db: " + sqle.getMessage());

										throw sqle;
									}
									PreparedStatement psmt = conn.prepareStatement(Query);
									psmt.setString(1, request.getParameter("category"));

									ResultSet rs = psmt.executeQuery();
									while (rs.next()) {
										//System.out.print(rs.getString("Sub_Category_Name"));
							%>

							<option value="<%=rs.getString("Sub_Category_Name")%>"><%=rs.getString("Sub_Category_Name")%></option>
							<%
								}

								} catch (Exception e) {
									e.printStackTrace();
								}
							%>
						</select> <label for="productName" class="cols-sm-2 control-label">Product
							Name</label>
						<div class="cols-sm-5">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-book"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="productName" id="productName"
									placeholder="Enter Product Name" />
							</div>
						</div>
						<label for="productBrand" class="cols-sm-2 control-label">Product
							Brand</label>
						<div class="cols-sm-5">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-book"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="productBrand" id="productBrand"
									placeholder="Enter Product Brand" />
							</div>
						</div>
						<label for="productModel" class="cols-sm-2 control-label">Product
							Model</label>
						<div class="cols-sm-5">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-book"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="productModel" id="productModel"
									placeholder="Enter Product Model" />
							</div>
						</div>

						<label for="productImage" class="cols-sm-2 control-label">Product
							Image</label>
						<div class="cols-sm-5">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-book"
									aria-hidden="true"></i></span> <input type="file" accept="image/*"
									class="form-control" name="productImage" id="productImage" />
							</div>
						</div>

						<label for="productDescription" class="cols-sm-2 control-label">Product
							Description</label>
						<div class="cols-sm-5">
							<div class="input-group">
								<textarea class="form-control" id="productDescription"
									name="productDescription" rows="3"
									placeholder="Enter Product Description"
									style="margin: 0px; width: 780px; height: 126px;"></textarea>
							</div>
						</div>
						<div class="form-group ">
							<input type="submit"
								class="btn btn-primary btn-lg btn-block login-button" />
						</div>

					</div>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>