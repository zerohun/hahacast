class Hahacast.Views.UsercastsIndex extends Backbone.View

  template: JST['usercasts/index']

  initialize: ->
    @collection.on('reset', @render, this)


  render: ->
      $(@el).html(@template(usercasts: @collection))
      $(".nav-collapse").removeClass('in')
      $(".nav-collapse").css("height", "0px")
    
      this

