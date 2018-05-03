<!------ Include the above in your HEAD tag ---------->

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

</head>
<body style="background-color: #d3d3d3;">
	<jsp:include page="menu.jsp" />
	<div class="container">
		<h1>
			Hello,
			<%=session.getAttribute("userName")%></h1>
		<a href="ProductsAdded">
			<button type="button" class="btn btn-light btn-block col-lg-3"
				style="padding: 70px; margin: 0 5px 5px 0 !important; width: 25%;">Products
				Added By Me</button>
		</a> <a href="AddProductServlet">
			<button type="button" class="btn btn-light btn-block col-lg-3"
				style="padding: 70px; margin: 0 5px 5px 0 !important; width: 25%;">Add
				Product</button>
		</a> <a href="AddSubCategory.jsp">
			<button type="button" class="btn btn-light btn-block col-lg-3"
				style="padding: 70px; margin: 0 5px 5px 0 !important; width: 25%;">Add
				Subcategory</button>
		</a> <a href="AccountDetails.jsp">
			<button type="button" class="btn btn-light btn-block col-lg-3"
				style="padding: 70px; margin: 0 5px 5px 0 !important; width: 25%;">Account
				Details</button>
		</a> <a href="ApproveProduct">
			<button type="button" class="btn btn-light btn-block col-lg-3"
				style="padding: 70px; margin: 0 5px 5px 0 !important; width: 25%;">Approve
				Products</button>
		</a> </a> <a href="ChangePassword.jsp">
			<button type="button" class="btn btn-light btn-block col-lg-3"
				style="padding: 70px; margin: 0 5px 5px 0 !important; width: 25%;">Change
				Password</button>
		</a>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
