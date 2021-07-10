$(function () {
  var headerHight = $("header").height();

  $('a[href^="#"]').click(function(e) {
     var href = $(this).attr("href");
     var target = $(href == "#" || href == "" ? 'html' : href);
     var position = target.offset().top - headerHight;

     $.when(
       $("html, body").animate({
         scrollTop: position
       }, 400, "swing"),
       e.preventDefault(),
     ).done(function() {
       var diff = target.offset().top - headerHight;
       if (diff === position) {
       } else {
         $("html, body").animate({
           scrollTop: diff
         }, 10, "swing");
       }
     });
   });
   $('#page_top').click(function() {
    $('body').scrollTop(0);
  });
});