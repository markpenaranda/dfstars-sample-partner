$(document).ready(function() {


  // Events 
  $("#addCreditModal").on('click', '#transferBtn', function() {
    var amount = $("#addAmount").val();
    $.post("/dfs/load", {amount: amount}, function(res){
      $("#addForm").fadeOut();
      $("#addSuccess").fadeIn();
    })

  });



  // Functions


});