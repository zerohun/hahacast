class Hahacast.Routers.Friends extends Backbone.Router
  routes:
    'friends': 'index'

  initialize: ->

  index: ->
    @collection = new  Hahacast.Collections.Friends()
    @collection.fetch() 
    view = new Hahacast.Views.FriendsIndex(collection: @collection)
    $('#main-content').html(view.render().el)


