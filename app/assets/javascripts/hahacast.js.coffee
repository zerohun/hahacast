window.Hahacast =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    new Hahacast.Routers.Usercasts()
    new Hahacast.Routers.Friends()
    new Hahacast.Routers.Notifications()
    new Hahacast.Routers.Requests()
    Backbone.history.start()


$(document).ready ->
  Hahacast.init()
