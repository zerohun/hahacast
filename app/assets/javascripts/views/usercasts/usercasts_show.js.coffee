class Hahacast.Views.UsercastsShow extends Backbone.View
  template: JST['usercasts/show']

  initialize: ->
    this.options.usercast.on('change', @render, this)

  render: ->
    $(@el).html(@template(usercast: this.options.usercast))
#    @initSoundPlayer()
    @indentByDepth()
    registerAudioPlayEvents()
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


  indentByDepth: ->
    $("div.playlist").each((index,element)->
      margin = Number($(element).data("depth")) * 20
      $(element).css("margin-left", "#{margin}px")
    )


