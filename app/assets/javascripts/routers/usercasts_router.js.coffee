class Hahacast.Routers.Usercasts extends Backbone.Router
  routes:
    'usercasts': 'index'
    'usercasts/:id': 'show'

  initialize: ->

  index: ->
    @collection = new Hahacast.Collections.Usercasts()
    @collection.fetch()
    view = new Hahacast.Views.UsercastsIndex(collection: @collection)
    $('#main-content').html(view.render().el)

  show: (id)->
    @usercast = new Hahacast.Models.Usercast
    @usercast.url = "/usercasts/#{id}"
    @usercast.fetch()
    showView = new Hahacast.Views.UsercastsShow(usercast: @usercast)
    $('#main-content').html(showView.render().el)
