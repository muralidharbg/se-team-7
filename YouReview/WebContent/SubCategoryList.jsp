<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
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
</head>
<body style="background-color: #d3d3d3;">
	<jsp:include page="menu.jsp"></jsp:include>
	<%
		ArrayList<String> subCategories = (ArrayList) request.getAttribute("subCategories");
	%>
	<div class="container">
		<%
			if (subCategories != null) {
				for (int i = 0; i < subCategories.size(); i++) {
		%>
		<a href="ProductList?Sub_Category_Name=<%=subCategories.get(i)%>">
			<button type="button" class="btn btn-light btn-block col-lg-3"
				style="padding: 70px; margin: 0 5px 5px 0 !important; width: 25%;"><%=subCategories.get(i)%></button>
		</a>
		<%
			}
			}
		%>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
