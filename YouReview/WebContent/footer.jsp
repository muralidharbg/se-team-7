<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
	$(function() {
		$.widget("custom.catcomplete", $.ui.autocomplete, {
			_create : function() {
				this._super();
				this.widget().menu("option", "items",
						"> :not(.ui-autocomplete-category)");
			},
			_renderMenu : function(ul, items) {
				var that = this, currentCategory = "";
				$.each(items, function(index, item) {
					var li;
					if (item.category != currentCategory) {
						ul.append("<li class='ui-autocomplete-category'>"
								+ item.category + "</li>");
						currentCategory = item.category;
					}
					li = that._renderItemData(ul, item);
					if (item.category) {
						li.attr("aria-label", item.category + " : "
								+ item.label);
					}
				});
			}
		});
		var data = [ {
			label : "anders",
			category : ""
		}, {
			label : "andreas",
			category : ""
		}, {
			label : "antal",
			category : ""
		}, {
			label : "annhhx10",
			category : "Products"
		}, {
			label : "annk K12",
			category : "Products"
		}, {
			label : "annttop C13",
			category : "Products"
		}, {
			label : "anders andersson",
			category : "People"
		}, {
			label : "andreas andersson",
			category : "People"
		}, {
			label : "andreas johnson",
			category : "People"
		} ];

		$("#search").catcomplete(
				{
					delay : 0,
					source : function(request, response) {
						var search_query = $("#search").val();
						$.get("search?q=" + search_query, function(
								server_response) {
							response(server_response);
						});
					},
					minLength : 3,
					select : function(event, ui) {
						window.location.href = 'ProductList?' + ui.item.category.replace(/ /g, "_") + '=' + ui.item.value;
					}
				});
	});
</script>
<script>
	$(document).ready(function() {
		$.get("MenuServlet", function(server_response) {
			$.each(server_response, function(key, value){
				$(".dropdown-menu").append("<li><a href='SubCategoryList?Category_Name="+key+"'>"+key+"</a></li>");
			});
		});
	});
</script>