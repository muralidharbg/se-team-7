<%@page import="org.YouReview.dto.SubCategory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.YouReview.dto.Products"%>
<%@page import="org.YouReview.dto.Reviews"%>
<%
	Products product = (Products) request.getAttribute("productDetails");
%>
<!DOCTYPE html>
<html>
<head>
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

</head>
<body style="background-color: #d3d3d3;">
	<jsp:include page="menu.jsp"></jsp:include>
	<%
		if (product != null) {
			SubCategory subCategory = product.getSubCategory();
			ArrayList<Reviews> reviewList = new ArrayList<>();
	%>
	<div class="container">
		<div class="row">
			<div class="col-xs-4 item-photo">
				<img style="max-width: 100%;"
					src="http://img1.cellibrity.net/wp-content/uploads/2017/12/09165700/Apple-iPhone-X-Silver-ATT-Device-CELLibrity.png" />
			</div>
			<div class="col-xs-5" style="border: 0px solid gray">
				<!-- Datos del vendedor y titulo del producto -->
				<h3><%=product.getBrand()%>
					<%=product.getProduct_Name()%>
					<%=product.getModel()%></h3>
				<h5 style="color: #337ab7">
					Product By <a href="#"><%=product.getBrand()%></a> · <small
						style="color: #337ab7">(5054 Reviews)</small>
				</h5>

				<!-- Detalles especificos del producto -->
				<%
					if (subCategory != null) {
				%>
				<div class="section" style="padding-bottom: 5px;">
					<table style="width: 100%">
						<tr>
							<th><div class="attr2"><%=subCategory.getQuestion1()%></div>
								<div id="stars4" class="starrr"
									data-rating='<%=product.getAnswer1Avg()%>'></div></th>
							<th>
								<div class="attr2"><%=subCategory.getQuestion2()%></div>
								<div id="stars4" class="starrr"
									data-rating='<%=product.getAnswer2Avg()%>'></div>
							</th>
							<th>
								<div class="attr2"><%=subCategory.getQuestion3()%></div>
								<div id="stars4" class="starrr"
									data-rating='<%=product.getAnswer3Avg()%>'></div>
							</th>
						</tr>
						<tr>
							<th>
								<div class="attr2"><%=subCategory.getQuestion4()%></div>
								<div id="stars4" class="starrr"
									data-rating='<%=product.getAnswer4Avg()%>'></div>
							</th>
							<th>
								<div class="attr2"><%=subCategory.getQuestion5()%></div>
								<div id="stars4" class="starrr"
									data-rating='<%=product.getAnswer5Avg()%>'></div>
							</th>
						</tr>
					</table>
				</div>
				<%
					}
				%>
			</div>
		</div>

		<div class="col-xs-9">
			<div style="width: 100%; border-top: 1px solid silver">
				<p style="padding: 15px;">
					<small> <%=product.getDescription()%>
					</small>
				</p>
				<!-- <small>
                            <ul>
                                <li>Super AMOLED capacitive touchscreen display with 16M colors</li>
                                <li>Available on GSM, AT T, T-Mobile and other carriers</li>
                                <li>Compatible with GSM 850 / 900 / 1800; HSDPA 850 / 1900 / 2100 LTE; 700 MHz Class 17 / 1700 / 2100 networks</li>
                                <li>MicroUSB and USB connectivity</li>
                                <li>Interfaces with Wi-Fi 802.11 a/b/g/n/ac, dual band and Bluetooth</li>
                                <li>Wi-Fi hotspot to keep other devices online when a connection is not available</li>
                                <li>SMS, MMS, email, Push Mail, IM and RSS messaging</li>
                                <li>Front-facing camera features autofocus, an LED flash, dual video call capability and a sharp 4128 x 3096 pixel picture</li>
                                <li>Features 16 GB memory and 2 GB RAM</li>
                                <li>Upgradeable Jelly Bean v4.2.2 to Jelly Bean v4.3 Android OS</li>
                                <li>17 hours of talk time, 350 hours standby time on one charge</li>
                                <li>Available in white or black</li>
                                <li>Model I337</li>
                                <li>Package includes phone, charger, battery and user manual</li>
                                <li>Phone is 5.38 inches high x 2.75 inches wide x 0.13 inches deep and weighs a mere 4.59 oz </li>
                            </ul>  
                        </small>  -->
			</div>
			<div class="row">
				<div class="col-sm-7">
					<hr />
					<div class="review-block">
						<!-- 
						<div class="row">
							<div class="col-sm-3">
								<img src="http://dummyimage.com/60x60/666/ffffff&text=No+Image"
									class="img-rounded">
								<div class="review-block-name">
									<a href="#">nktailor</a>
								</div>
								<div class="review-block-date">
									January 29, 2016<br />1 day ago
								</div>
							</div>
							<div class="col-sm-9">
								<div class="review-block-rate">
									<div id="stars4" class="starrr" data-rating='4'></div>
								</div>
								<div class="review-block-title">this was nice in buy</div>
								<div class="review-block-description">this was nice in
									buy. this was nice in buy. this was nice in buy. this was nice
									in buy this was nice in buy this was nice in buy this was nice
									in buy this was nice in buy</div>
							</div>
						</div>
						<hr />
						 -->
						<%
							for (int i = 0; i < reviewList.size(); i++) {
									Reviews review = reviewList.get(i);
									int avgRating = (review.getAnswer1() + review.getAnswer2() + review.getAnswer3()
											+ review.getAnswer4() + review.getAnswer5()) / 5;
						%>

						<div class="row">
							<div class="col-sm-3">
								<div class="review-block-name">
									<a href="#"><%=review.getUser_UserName()%></a>
								</div>
								<div class="review-block-date">
									January 29, 2016<br />1 day ago
								</div>
							</div>
							<div class="col-sm-9">
								<div class="review-block-rate">
									<div id="stars4" class="starrr" data-rating='<%=avgRating%>'></div>
								</div>
								<div class="review-block-description"><%=review.getComment()%></div>
							</div>
						</div>
						<hr />
						<%
							}
						%>
					</div>
				</div>
			</div>
			<br> <a
				href="WriteReviewServlet?Product_Name=<%=product.getProduct_Name()%>">
				<button id="myButton"
					class="btn btn-primary btn-lg btn-block login-button"
					style="width: 250px; margin-left: 0px;">Write Review</button>
			</a>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>
