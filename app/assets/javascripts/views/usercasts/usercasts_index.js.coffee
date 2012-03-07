class Hahacast.Views.UsercastsIndex extends Backbone.View

  template: JST['usercasts/index']

  initialize: ->
    @collection.on('reset', @render, this)


  render: ->
      $(@el).html(@template(usercasts: @collection))
      this
