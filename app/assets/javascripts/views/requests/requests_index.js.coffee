class Hahacast.Views.RequestsIndex extends Backbone.View

  template: JST['requests/index']
 
  initialize: ->
    @collection.on('reset', @render, this)


  render: ->
      $(@el).html(@template(requests: @collection))
      @registerClickEvents(this)


      $(".nav-collapse").removeClass('in')
      $(".nav-collapse").css("height", "0px")
      this

  registerClickEvents: (context)->
    $(".friendAcceptButton").click((event)->
      
      parent = $(this).parent()
      $.getJSON("/users/show", (data)->

        current_user_id = data["current_user_id"]
        parent.html("<img src='/loading.gif' />")
        event.preventDefault()
        dataToSend = {}

        dataToSend["friend_id"] = parent.data('friend_id')
        dataToSend["user_id"] = current_user_id
        $.post("/friendships", dataToSend, (data, textStatus)->
          parent.remove()
        )
      )
    )
