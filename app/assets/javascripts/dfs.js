$(document).ready(function() {
  alert('here');

  // Events 
  $("#addCreditModal").on('click', '#transferBtn', function() {
    var amount = $("#addAmount").val();
    $.post("/dfs/load", {amount: amount}, function(res){
      console.log(res);
    }); 
  });



  // Functions

  var transferCredits = function() {
    var amount = $("#addAmount").val();
    $.post("/dfs/load", {amount: amount}, function(res){
      console.log(res);
    }); 
  }

});