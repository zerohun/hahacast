class Hahacast.Views.FriendsIndex extends Backbone.View

  template: JST['friends/index']
 
  initialize: ->
    @collection.on('reset', @render, this)


  render: ->
      $(@el).html(@template(friends: @collection))
      $(".nav-collapse").removeClass('in')      
      $(".nav-collapse").css("height", "0px")
      this

