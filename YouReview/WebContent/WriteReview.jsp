<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<html>
<head>
<title>
Write Review
</title>
<script>
//Starrr plugin (https://github.com/dobtco/starrr)
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

$( document ).ready(function() {
      
  $('#stars1').on('starrr:change', function(e, value){
    $('#count1').html(value);
    document.getElementById('A1').value = value;
  });
  $('#stars2').on('starrr:change', function(e, value){
	    $('#count2').html(value);
	    document.getElementById('A2').value = value;
	  });
  $('#stars3').on('starrr:change', function(e, value){
	    $('#count3').html(value);
	    document.getElementById('A3').value = value;
	  });

  $('#stars4').on('starrr:change', function(e, value){
	    $('#count4').html(value);
	    document.getElementById('A4').value = value;
	  });

  $('#stars5').on('starrr:change', function(e, value){
	    $('#count5').html(value);
	    document.getElementById('A5').value = value;
	  });

  
  $('#stars-existing').on('starrr:change', function(e, value){
    $('#count-existing').html(value);
  });
});
document.getElementById("myButton").onclick = function () {
    location.href = "www.google.com";
};
</script>
</head>

    <body style="background-color:#d3d3d3;">
<nav class="navbar navbar-default" role="navigation" style="background-color: black; color: white">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="index.html" style="color: white">YouReview</a>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
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
    		<li><a href="#" style="color: white">About</a></li>
      	<li><a href="Register.jsp" style="color: white"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      	<li><a href="Login.jsp" style="color: white"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div><!-- /.navbar-collapse -->
</nav>
<div class="container">
	<div class="row">
		<h2><%=request.getAttribute("Product_Name")%> <small>Hover and click on a star</small></h2>
		<div class="col-xs-3 item-photo ">
                    <img style="max-width:50%;" src="http://img1.cellibrity.net/wp-content/uploads/2017/12/09165700/Apple-iPhone-X-Silver-ATT-Device-CELLibrity.png" />
                </div>
         <div class="col-3"> 
		
		</div>
	</div>
    <div class="row lead">
    		<h2>How is the <%=request.getAttribute("Q1")%>?</h2>
        <div id="stars1" class="starrr"></div>
        You gave a rating of <span id="count1">0</span> star(s)
	</div>
	<div class="row lead">
    		<h2>How is the <%=request.getAttribute("Q2")%>?</h2>
        <div id="stars2" class="starrr"></div>
        You gave a rating of <span id="count2">0</span> star(s)
	</div>
	<div class="row lead">
    		<h2>How is the <%=request.getAttribute("Q3")%>?</h2>
        <div id="stars3" class="starrr"></div>
        You gave a rating of <span id="count3">0</span> star(s)
	</div>
	<div class="row lead">
    		<h2>How is the <%=request.getAttribute("Q4")%>?</h2>
        <div id="stars4" class="starrr"></div>
        You gave a rating of <span id="count4">0</span> star(s)
	</div>
	<div class="row lead">
    		<h2>How is the <%=request.getAttribute("Q5")%>?</h2>
        <div id="stars5" class="starrr"></div>
        You gave a rating of <span id="count5">0</span> star(s)
	</div>
	
	<form action="WriteReviewServlet" method="POST">
		<input type="hidden" name="A1" id="A1" value="" />
		<input type="hidden" name="A2" id="A2" value="" />
		<input type="hidden" name="A3" id="A3" value="" />
		<input type="hidden" name="A4" id="A4" value="" />
		<input type="hidden" name="A5" id="A5" value="" />
		<input type="hidden" name="Product_Name" id="Product_Name" value="<%=request.getAttribute("Product_Name") %>" />
		<div class="form-group">
    		<label for="exampleFormControlTextarea2">Write Comment</label>
    		<textarea class="form-control rounded-0" id="Comment" name="Comment" rows="3"></textarea>
		</div>
		<input type="submit" class="btn btn-primary btn-lg btn-block login-button" style="width: 250px;margin-left:0px;"/>
	</form>
	 <!--<a href="ProductDetail.jsp">
		<button id="myButton" class="btn btn-primary btn-lg btn-block login-button" style="width: 250px;margin-left:0px;">Submit</button>
	</a>
    
    <div class="row lead">
        <p>Also you can give a default rating by adding attribute data-rating</p>
        <div id="stars-existing" class="starrr" data-rating='4'></div>
        You gave a rating of <span id="count-existing">4</span> star(s)
     </div>-->
</div>
</body>
</html>