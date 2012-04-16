class Hahacast.Routers.Requests extends Backbone.Router
  routes:
    'requests': 'index'

  initialize: ->

  index: ->
    @collection = new  Hahacast.Collections.Requests()
    @collection.fetch() 
    view = new Hahacast.Views.RequestsIndex(collection: @collection)
    $('#main-content').html(view.render().el)



