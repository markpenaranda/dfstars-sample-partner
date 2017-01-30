$(document).ready(function() {


	// Events 
	$("#transferBtn").on('click', transferCredits);



	// Functions

	var transferCredits = function() {
		var amount = $("#addAmount").val();
		$.post("/dfs/load", {amount: amount}, function(res){
			console.log(res);
		});	
	}

});