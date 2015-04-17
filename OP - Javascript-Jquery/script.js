$(document).ready(function() {

  //$("body").append("<div class = 'new_container' width='960px'></div>");
  
  for (var a = 1; a <= 16; a++)
  {
  $("body").append("<div class = 'container'></div>");
  }
  $(".container").height(960/16 - 4);

  for (var b = 1; b <= 16; b++)
  {
  $(".container").append("<div class = 'cell'></div>"); 
  } 
  $(".cell").width(960/16 -4);
  $(".cell").height(960/16 -4);

$("#reset").click(function(){
    $(".container").remove();
    $(".cell").remove();
    var col = prompt("Please enter the number of columns: ");
    var rows = prompt("Please enter the number rows: ");
    

    for (var i = 1; i < rows; i++)
    {
      $d = $("<div class = 'container'></div>");
      $("body").append($d);
    }
      $(".container").width(960);
      $(".container").height(960/rows - 2);
    
    for (var j = 1; j <= col; j++)
    {
      $c = $("<div class = 'cell'></div>");
      $(".container").append($c);
    }
      $(".cell").width(960/col - 4);
      $(".cell").height(960/col - 4);

      $(".cell").mouseenter(function(){
        //$(this).addClass("black");
        var randomColor = "#"+(Math.random()*0xFFFFFF<<0).toString(16);
        $(this).css("background-color", randomColor);
    });
  });
      $(".cell").mouseenter(function(){
        //$(this).addClass("black");
        var randomColor = "#"+(Math.random()*0xFFFFFF<<0).toString(16);
        var randomOpacity = Math.random();
        $(this).css("background-color", randomColor);
        $(this).css("opacity", randomOpacity);
    });
      $("#clear").click(function(){
        $(".cell").removeClass("black");
  });
});