class Hahacast.SoundPlayer

  #interface(public methods)
  constructor: (audio, list, listElements, options = [])->
    @audio = audio
    @list = list
    @currentPlaying = 0
    @listElements = listElements
    if options["listRepeat"]
      @audio.bind("ended", {context: this}, (event)->
        event.data.context.playNext()
      )


  setTrack: (num)->
    @currentPlaying = num

  playNext: ()->
    if @currentPlaying < @list.length
      @currentPlaying++
      @play()

  playPrev: ->
    if @currentPlaying > 0
      @currentPlaying--
    @play()

  playFirst: ->
    @currentPlaying = 0
    @play()

  play: ->
    @audio.find("source").attr("src", @list[@currentPlaying])
    @audio.trigger("play")
    @unmarkPlaying()
    @markPlaying(@currentPlaying)

  getCurrentPlaying: ->
    @currentPlaying

  markPlaying: (num)->
    if @listElements.length > 0 
      @listElements.each((index, element)->
        if $(element).attr("id") == num.toString()
          $(element).append("playing")

      )

  unmarkPlaying: ->
    if @listElements.length > 0 
      @listElements.each((index, element)->
        oldHtml = $(element).html()
        if oldHtml[(oldHtml.length - 7)..(oldHtml.length - 1)] == "playing"
          newHtml = oldHtml[0..(oldHtml.length - 8)]
          $(element).html(newHtml)
      )
