/**
 * 
 */

var search = {
	init : function() {
		search.searchProcessing();
	},
	searchProcessing : function() {
		$("#keyword").on("keyup", function(){
			var keyword = $(this).val();
			if(keyword !== "" && keyword !== null) {
				
				$.ajax({
					type : 'GET',
					url : 'http://localhost:9090/product-search',
					data : {keyword:keyword},
					success : function(data) {
						console.log(data);
					},
					error: function (jqXHR, textStatus, errorThrown) { 
						console.log(textStatus,errorThrown);
					}
				})
			}
		});
	}
};

search.init();