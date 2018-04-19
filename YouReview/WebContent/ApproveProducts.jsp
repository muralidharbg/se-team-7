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
<script>

var __slice = [].slice;

(function($, window) {
  var Starrr;

  Starrr = (function() {
    Starrr.prototype.defaults = {
      rating: void 0,
      numStars: 5,
      change: function(e, value) {}
    };

    function Starrr($el, options) {
      var i, _, _ref,
        _this = this;

      this.options = $.extend({}, this.defaults, options);
      this.$el = $el;
      _ref = this.defaults;
      for (i in _ref) {
        _ = _ref[i];
        if (this.$el.data(i) != null) {
          this.options[i] = this.$el.data(i);
        }
      }
      this.createStars();
      this.syncRating();
      this.$el.on('mouseover.starrr', 'span', function(e) {
        return _this.syncRating(_this.$el.find('span').index(e.currentTarget) + 1);
      });
      this.$el.on('mouseout.starrr', function() {
        return _this.syncRating();
      });
      this.$el.on('click.starrr', 'span', function(e) {
        return _this.setRating(_this.$el.find('span').index(e.currentTarget) + 1);
      });
      this.$el.on('starrr:change', this.options.change);
    }

    Starrr.prototype.createStars = function() {
      var _i, _ref, _results;

      _results = [];
      for (_i = 1, _ref = this.options.numStars; 1 <= _ref ? _i <= _ref : _i >= _ref; 1 <= _ref ? _i++ : _i--) {
        _results.push(this.$el.append("<span class='glyphicon .glyphicon-star-empty'></span>"));
      }
      return _results;
    };

    Starrr.prototype.setRating = function(rating) {
      if (this.options.rating === rating) {
        rating = void 0;
      }
      this.options.rating = rating;
      this.syncRating();
      return this.$el.trigger('starrr:change', rating);
    };

    Starrr.prototype.syncRating = function(rating) {
      var i, _i, _j, _ref;

      rating || (rating = this.options.rating);
      if (rating) {
        for (i = _i = 0, _ref = rating - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
          this.$el.find('span').eq(i).removeClass('glyphicon-star-empty').addClass('glyphicon-star');
        }
      }
      if (rating && rating < 5) {
        for (i = _j = rating; rating <= 4 ? _j <= 4 : _j >= 4; i = rating <= 4 ? ++_j : --_j) {
          this.$el.find('span').eq(i).removeClass('glyphicon-star').addClass('glyphicon-star-empty');
        }
      }
      if (!rating) {
        return this.$el.find('span').removeClass('glyphicon-star').addClass('glyphicon-star-empty');
      }
    };

    return Starrr;

  })();
  return $.fn.extend({
    starrr: function() {
      var args, option;

      option = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
      return this.each(function() {
        var data;

        data = $(this).data('star-rating');
        if (!data) {
          $(this).data('star-rating', (data = new Starrr($(this), option)));
        }
        if (typeof option === 'string') {
          return data[option].apply(data, args);
        }
      });
    }
  });
})(window.jQuery, window);

$(function() {
  return $(".starrr").starrr();
});


</script>
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
				<li><a href="MyAccount.jsp" style="color: white"><span
						class="glyphicon glyphicon-user"></span> My Account</a></li>

			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</nav>
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
	<script>
		$(document).ready(function() {			
			$("button.btn-primary").click(function() {
				var product_listing_dom = $(this).parent().parent();
				var product_name_dom = $(this).parent().parent().children()[0];
				var product_name = $(product_name_dom).text();
				$.post("ApproveProduct",{name: product_name, status: 'approve'},function(response) {
					if (response != "") {
						if(response.updateStatus == true){
							$(".alert").removeClass("hide");
							$(".alert").addClass("alert-success");
							$(".alert").addClass("alert-dismissible");
							$(".alert").append("Product approved!");
							setTimeout(function() {
								$(".alert").alert('close');
								$(product_listing_dom).remove();
							}, 2000);
						} else{
							$(".alert").removeClass("hide");
							$(".alert").addClass("alert-warning");
							$(".alert").addClass("alert-dismissible");
							$(".alert").append("Something went wrong!");
							setTimeout(function() {
								$(".alert").alert('close');
							}, 2000);
						}
					} else{
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
