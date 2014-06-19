$(document).on 'ready page:load', ->
  
  $("a.popover").click (event) ->
    event.preventDefault()
    popover_src = $(this).children("img").attr("data-src")
    popover_caption = $(this).children("img").attr("alt")
    popover_width = $(this).children("img").attr("data-width")
    popover_height = $(this).children("img").attr("data-height")
    $("div#popover img").attr "src", popover_src
    $("div#popover img").attr "alt", popover_caption
    $("div#popover img").attr "width", popover_width
    $("div#popover img").attr "height", popover_height
    $("div#popover").fadeIn "fast"

  $("div#popover button").click ->
    event.preventDefault()
    $("div#popover").fadeOut "fast"
