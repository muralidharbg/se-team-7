<%@page import="java.util.ArrayList"%>
<%@page import="org.YouReview.dto.Products"%>
<%
	ArrayList<Products> productList = (ArrayList<Products>) request.getAttribute("productList");
%>
<!DOCTYPE html>
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<style type="text/css">
.block2-img>img {
	width: 50%
}

.thumbnail>img {
	width: 100%
}
</style>
</head>
<body style="background-color: #d3d3d3;">
	<nav class="navbar navbar-default" role="navigation"
		style="background-color: black; color: white">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html" style="color: white">YouReview</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<div class="col-sm-8 col-md-8">
				<form class="navbar-form" role="search">
					<div class="input-group col-sm-8 col-md-8">
						<input type="text" class="form-control" placeholder="Search"
							name="q">
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#" style="color: white">Home</a></li>
				<li><a href="#" style="color: white">Categories</a></li>
				<li><a href="Register.jsp" style="color: white"><span
						class="glyphicon glyphicon-user"></span> My Account</a></li>

			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</nav>
	<div class="container">
		<div class="row">
			<%
				for (int i = 0; i < productList.size(); i++) {
					Products product = productList.get(i);
			%>

			<div class="col-sm-3 col-md-3">
				<div class="thumbnail">
					<a
						href="ProductDetails?Product_Name=<%=product.getProduct_Name()%>">
						<img src="images/item-02.jpg" alt="...">
					</a>
					<div class="caption">
						<h3><%=product.getProduct_Name()%>
							<%=product.getModel()%></h3>
						<p>
							by
							<%=product.getBrand()%></p>
						<p><%=product.getCategory_name()%>
							>
							<%=product.getSub_Category_Name()%></p>
						<p>
							Added by:
							<%=product.getUser_Name()%></p>
					</div>
				</div>
			</div>

			<%
				}
			%>
		</div>
	</div>
</body>
</html>
