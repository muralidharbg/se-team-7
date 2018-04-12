<%@page import="org.YouReview.Service.CategoryService"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.YouReview.Service.subcategoryService"%>
<%@page import="org.YouReview.dto.subCategory"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.ArrayList" %>
<%@page import="org.YouReview.Service.LoginService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type= "text/javascript">
	function fetchdata(){
		
	}
</script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

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
<body>
<nav class="navbar navbar-default" role="navigation" style="background-color: black; color: white">
  
  		<div class="navbar-header">
    			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
      			<span class="sr-only">Toggle navigation</span>
      			<span class="icon-bar"></span>
      			<span class="icon-bar"></span>
      			<span class="icon-bar"></span>
    			</button>
    			<a class="navbar-brand" href="index.html" style="color: white">YouReview</a>
  		</div>

  
	  	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	    		<div class="col-sm-8 col-md-8">
	        		<form class="navbar-form" role="search">
	        			<div class="input-group col-sm-8 col-md-8">
	            			<input type="text" class="form-control" placeholder="Search" name="q">
	            			<div class="input-group-btn">
	                			<button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
	            			</div>
	        			</div>
	        		</form>
	    		</div>
	    		<ul class="nav navbar-nav navbar-right">
	    			<li><a href="#" style="color: white">Home</a></li>
	    			<li><a href="#" style="color: white">Categories</a></li>
	      		<li><a href="MyAccount.jsp" style="color: white"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
	    		</ul>
  		</div><!-- /.navbar-collapse -->
	</nav>

<%
CategoryService cs = new CategoryService();
ResultSet cat_list = cs.getAllCategories();
subcategoryService scs= new subcategoryService();
ResultSet scat_list= scs.getAllsubCategories();
%>
<form action="modifyscatServlet" method= "post">
<table border = "1" align = "center">
<tr><td>Select a category</td>
<td>
<select id = "selected_category" name = "selected_category">
<%
while(cat_list.next()){  
	String category = cat_list.getString("Category_Name");
	out.println(" sub Category is >> " + category);
	%>
	<option value="<%=category %>"><%=category %></option>
	<%
}
%>

</select>
</td>
</tr>
<tr><td>select a sub category</td>
<td>
<select id = "selected_scategory" name = "selected_scategory">
<%
while(scat_list.next()){  
	String scategory = scat_list.getString("Sub_Category_Name");
	out.println(" sub Category is >> " + scategory);
	%>
	<option value="<%=scategory %>"><%=scategory %></option>
	<%
}
%>

</select>
</td>
</tr>

<tr><td colspan= 2 align = "center"><input type= "submit" value= "fetch data"></td></tr>
<%
String category=(String)request.getAttribute("category");
String sub_category= (String)request.getAttribute("sub_category");
String q1= (String)request.getAttribute("q1");
String q2=(String)request.getAttribute("q2");
String q3 = (String)request.getAttribute("q3");
String q4=(String)request.getAttribute("q4");
String q5=(String)request.getAttribute("q5");

%>

<tr><td>Category</td><td><input type = "text" name = "category" readonly= "readonly" value="<%= category %>"></td></tr>
<tr><td>Sub Category</td><td><input type = "text" name = "sub_category"value="<%= sub_category %>"></td></tr>
<tr><td>Question 1</td><td><input type = "text" name = "q1" value="<%= q1 %>"></td></tr>
<tr><td>Question 2</td><td><input type = "text" name = "q2" value="<%= q2 %>"></td></tr>
<tr><td>Question 3</td><td><input type = "text" name = "q3" value="<%= q3 %>"></td></tr>
<tr><td>Question 4</td><td><input type = "text" name = "q4" value="<%= q4 %>"></td></tr>
<tr><td>Question 5</td><td><input type = "text" name = "q5" value="<%= q5 %>"></td></tr>

<tr><td colspan= 2 align = "center"><input type= "button" value= "commit"></td></tr>

</table>
</form>
</body>
</html>