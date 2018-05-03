<%@page import="java.util.ArrayList"%>
<%@page import="org.YouReview.dto.Products"%>
<%
	ArrayList<Products> productList = (ArrayList<Products>) request.getAttribute("productList");
%>
<!DOCTYPE html>
<html>
<head>
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
	<jsp:include page="menu.jsp"></jsp:include>
	<%
		String userName = (String) session.getAttribute("userRole");
		if(userName == null){
			response.sendRedirect("Login.jsp");	
		}
	%>
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
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
