class Hahacast.Views.MentionsIndex extends Backbone.View

  template: JST['mentions/index']

  initialize: ->
    @collection.on('reset', @render, this)
    

  render: ->
    $(@el).html(@template(mentions: @collection))
    if @collection.first()
      sound_url = @collection.first().get('file').url
      @countData = []
      @countData.currentPlaying = 0
      this.$('#firstSound').attr('src', sound_url)
      this.$('#player').bind('ended', {countData: @countData, collection: @collection},@playNextSound)
    $(".nav-collapse").removeClass('in')
    $(".nav-collapse").css("height","0px")
    
    this

  playNextSound: (event)->
    countData = event.data.countData
    collection = event.data.collection 
    if countData.currentPlaying <  collection.length - 1
      countData.currentPlaying++
      sound_url = collection.at(countData.currentPlaying).get('file').url 
      $('#firstSound').attr('src', sound_url)
      $('#player').trigger('play')
    else
      alert "end of list"
