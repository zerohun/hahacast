window.Hahacast =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    new Hahacast.Routers.Mentions()
    Backbone.history.start()


$(document).ready ->
  Hahacast.init()
