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
th {
	padding: 5px
}

td {
	padding: 5px
}
</style>
</head>
<body style="background-color: #d3d3d3;">
	<jsp:include page="menu.jsp"></jsp:include>
	<%
		String userRole = (String) session.getAttribute("userRole");
		if (userRole != null && userRole.equals("User")) {
			response.sendRedirect("MyAccount.jsp");
		} else if (userRole == null) {
			response.sendRedirect("Login.jsp");
		}
	%>
	<div class="container">
		<div class="alert hide" role="alert">
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<button type="button" class="btn btn-primary" style="margin: 10px 0;">Add
			Products</button>
		<table>
			<thead>
				<tr>
					<th>Product Name</th>
					<th>Category</th>
					<th>Sub-category</th>
					<th>Username</th>
					<th>Brand</th>
					<th>Model</th>
					<th>Approve</th>
					<!-- <th>Disapprove</th>  -->
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < productList.size(); i++) {
						Products product = productList.get(i);
				%>
				<tr>
					<td><%=product.getProduct_Name()%></td>
					<td><%=product.getSub_Category_Name()%></td>
					<td><%=product.getCategory_name()%></td>
					<td><%=product.getUser_Name()%></td>
					<td><%=product.getBrand()%></td>
					<td><%=product.getModel()%></td>
					<td><button type="button" class="btn btn-primary">Approve</button></td>
					<!-- <td><button type="button" class="btn btn-danger">Disapprove</button></td>  -->
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script>
		$(document).ready(function() {
			$("button.btn-primary").click(function() {
				var product_listing_dom = $(this).parent().parent();
				var product_name_dom = $(this).parent().parent().children()[0];
				var product_name = $(product_name_dom).text();
				$.post("ApproveProduct", {
					name : product_name,
					status : 'approve'
				}, function(response) {
					if (response != "") {
						if (response.updateStatus == true) {
							$(".alert").removeClass("hide");
							$(".alert").addClass("alert-success");
							$(".alert").addClass("alert-dismissible");
							$(".alert").append("Product approved!");
							setTimeout(function() {
								$(".alert").alert('close');
								$(product_listing_dom).remove();
							}, 2000);
						} else {
							$(".alert").removeClass("hide");
							$(".alert").addClass("alert-warning");
							$(".alert").addClass("alert-dismissible");
							$(".alert").append("Something went wrong!");
							setTimeout(function() {
								$(".alert").alert('close');
							}, 2000);
						}
					} else {
						$(".alert").removeClass("hide");
						$(".alert").addClass("alert-warning");
						$(".alert").addClass("alert-dismissible");
						$(".alert").append("Something went wrong!");
						setTimeout(function() {
							$(".alert").alert('close');
						}, 2000);
					}
				});
			});
		});
	</script>
</body>
</html>
