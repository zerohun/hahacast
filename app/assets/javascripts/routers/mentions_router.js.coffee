class Hahacast.Routers.Mentions extends Backbone.Router
  routes:
    'mentions': 'index'
    'mentions/:id' : 'show'
    'mentions/new': 'new'

  initialize: ->
    @collection = new Hahacast.Collections.Mentions()
    @collection.fetch()
    

  index: ->
    view = new Hahacast.Views.MentionsIndex(collection: @collection)
    $('#container').html(view.render().el)

    

  show: (id)->
    alert id

  new: ->
    $('#container').html('aaaaa')



