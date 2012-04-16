window.mediaPlayer = null
window.playInterval = null
window.index = 0
window.playTime = -1
window.playState = "stop"
@registerAudioPlayEvents = ->
  if $("#audioPlayer").length > 0
    currentPlaying = 0
    $(".audioPlayButton").click((event)->
      entry = $(this).parent()
      window.index = Number(entry.attr("id"))
      playList(window.index)
    )

@playList = ()->
  if window.playInterval != null  && typeof(window.playInterval) != "undefined"
    clearInterval(window.playInterval)
    window.playInterval = null

  if window.mediaPlayer != null && typeof(window.mediaPlayer) != "undefined"
    #window.mediaPlayer.stop()
    window.mediaPlayer.release()
    window.mediaPlayer = null
    #alert "media cleared!"
    window.playState = "stop"

  $("div.playlist").each((i, element)->
    $(element).removeClass("playing")
  )
  src = $("div##{window.index}.playlist").data("file")
  $("div##{window.index}.playlist").addClass("playing")
  src = src.replace("https", "http")
  window.mediaPlayer = new Media(src, onPlaySuccess, onPlayError, (state)->
    #alert state
    if state == 4 && window.playState == "playing"
      #alert "insdie"
      #window.mediaPlayer.stop()
      #ediaPlayer.release()
      #alert "window.index #{window.index}"
      console.log "last_id : #{$(".playlist").last().attr("id")}"
      if window.index < $(".playlist").last().attr("id")
        $("div##{window.index}.playlist").removeClass("playing")
        console.log "#{window.playInterval} must be closed now"
        console.log "clear interval"
        #alert "playing #{window.index}"
        window.index = window.index + 1
        window.playState = "finished"
        playList()
    if state == 2
      window.playState = "playing"

  )
  window.mediaPlayer.play()
  #duration = window.mediaPlayer._duration
  #window.playInterval = setInterval(->
    #alert "position: #{position}"
    #alert "duration: #{window.mediaPlayer._duration}"

  #, 1000)

@onPlaySuccess = ->
  console.log "recordAudio():Audio Success"
  window.playTime = 0


#@findPlayingwindow =->
  #currentPlaying = 0
  #$(".playlist").each((i, element)->
    #if $(element).hasClass("playing")
      #currentPlaying = window.index
      #alert "window.index is #{window.index}"
  #)
  #currentPlaying 

@onPlayError = (error) ->
  #  console.log "code: " + error.code + "\n" + "message: " + error.message + "\n"

