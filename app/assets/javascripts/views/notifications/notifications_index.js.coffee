class Hahacast.Views.NotificationsIndex extends Backbone.View

  template: JST['notifications/index']

  initialize: ->
    @collection.on('reset', @render, this)


  render: ->
      $(@el).html(@template(notifications: @collection))
      this
