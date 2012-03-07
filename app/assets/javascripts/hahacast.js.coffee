window.Hahacast =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    new Hahacast.Routers.Usercasts()
    Backbone.history.start()


$(document).ready ->
  Hahacast.init()
