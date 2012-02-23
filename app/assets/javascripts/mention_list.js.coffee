$(document).ready(->
  if $("div.mention").size() > 0
    $("div.mention").each((index,element)->
      depth = $(element).data("depth")
      $(element).css("margin-left", depth * 20)
    )
)
