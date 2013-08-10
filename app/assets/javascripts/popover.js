$(document).ready(function() {
  $("a.popover").click(function() {	
    var popover_src = $(this).children("img").attr('data-src');
    var popover_caption = $(this).children("img").attr('alt');
    var popover_width = $(this).children("img").attr('data-width');
    var popover_height = $(this).children("img").attr('data-height');
    $("div#popover img").attr('src', popover_src);
    $("div#popover img").attr('alt', popover_caption);
    $("div#popover img").attr('width', popover_width);
    $("div#popover img").attr('height', popover_height);
    $("div#popover").fadeIn('fast');
    return false;
  });
  $("div#popover button").click(function() {
    $("div#popover").fadeOut('fast');
  });
});