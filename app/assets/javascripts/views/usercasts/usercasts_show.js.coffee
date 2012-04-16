class Hahacast.Views.UsercastsShow extends Backbone.View
  template: JST['usercasts/show']

  initialize: ->
    this.options.usercast.on('change', @render, this)

  render: ->
    $(@el).html(@template(usercast: this.options.usercast))
    @decorateByDepth()
    registerAudioPlayEvents()
    @registerClickEvents(this)
    this

  initSoundPlayer: ->
    audioPlayerElement = this.$("audio#player")
    fileList = []
    $("div.playlist").each((index, element)->
      fileUrl = $(element).data("file")
      fileList.push(fileUrl)
    )
    listElements =  $("div.playlist")
    if listElements.length > 0
      player = new Hahacast.SoundPlayer(audioPlayerElement, fileList, listElements, {listRepeat: true}) 
      player.playFirst() 


  decorateByDepth: ->
    $("div.playlist").each((index,element)->
      margin = Number($(element).data("depth")) * 20
      $(element).css("margin-left", "#{margin}px")
    )

  registerClickEvents: (context)->
    $("#friendRequestButton").click((event)->
      parent = $(this).parent()
      $(this).hide()

      parent.html("<img src='/loading.gif' />")
      usercast = context.options.usercast
      event.preventDefault()
      dataToSend = {}
      dataToSend["friend_id"] = usercast.get('user')["id"]
      dataToSend["user_id"] = usercast.get('current_user')["id"]
      $.post("/friendships", dataToSend, (data, textStatus)->
        parent.html("Friend request is sent")
      )
    )


