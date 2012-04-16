class Hahacast.Routers.Notifications extends Backbone.Router
  routes:
    'notifications': 'index'
  initialize: ->

  index: ->
    @collection = new  Hahacast.Collections.Notifications()
    @collection.fetch() 
    view = new Hahacast.Views.NotificationsIndex(collection: @collection)
    $('#main-content').html(view.render().el)





