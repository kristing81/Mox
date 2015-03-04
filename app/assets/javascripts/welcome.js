$(document).ready(function(){
  $("img").mouseenter(function(){
    $(this).animate({height: "20px"}, 500);
  });
   $("img").mouseleave(function(){
    $(this).animate({height: "250px"}, 500);
  });
});