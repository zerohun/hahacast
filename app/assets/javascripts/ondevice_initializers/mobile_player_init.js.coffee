#Media class mock
#class Media

  #constructor: (src, onPlaySuccess, onPlayError, onSuccess, onError)->
    #console.log("constructure")

  #release: ->
    #console.log("release")

  #play: ->
    #console.log("play")

  #stop: ->
    #console.log("stop")
  
window.mediaPlayer = null
window.playInterval = null
window.index = 0
window.playTime = -1
window.playState = "stop"
window.usercastId = -1

@findMentionIdByIndex = (index)->
  $("##{index}.playlist").data("mention_id")

@markCurrentPlaying = ($playing)->
  mentionUsercastId = $playing.data("usercast_id")
  window.usercastId = $("div#usercast_info").data("usercast_id")
  $("div#current-playing").html("
    <a class='btn' href='#usercasts/#{mentionUsercastId}'>
      <img class='playlist-profile-icon' src='#{$playing.data("picture")}' />
</a>
    #{$playing.data("created_at")}
    <a class='btn' href='#usercasts/#{window.usercastId}/edit'>    
    list
    </a>
  ")

  mentionId = findMentionIdByIndex(window.index)
  $(".answer-btn").attr("href", "/usercasts/#{mentionUsercastId}/mentions/new?parent_id=#{mentionId}")

@registerAudioPlayEvents = ->
  if $("#audioPlayer").length > 0
    currentPlaying = 0
    $(".audioPlayButton").click((event)->
      event.preventDefault()
      $parent = $(this).parent().parent()
      window.index = Number($parent.attr("id"))
      mentionId = $parent.data("mention_id")
      window.usercastId = $("div#usercast_info").data("usercast_id")
      window.location.href = "/#usercasts/#{window.usercastId}?mention_id=#{mentionId}"
      playList()

    )
    $(".play-btn").click((event)->
      event.preventDefault()
      playList(window.index)
      $(this).hide()
      $(".stop-btn").show()
      window.playState = "playing"
      $("#play-status").html("playing")
    )
    $(".stop-btn").click((event)->
      window.mediaPlayer.stop()
      $(this).hide()
      $(".play-btn").show()
      window.playState = "stop"

      $("#play-status").html("stop")
    )
    $(".stop-btn").hide()
    $(".next-btn").click((event)-> 
      event.preventDefault()
      if window.index < $(".playlist").last().attr("id")
        window.index = window.index + 1
        playList()
    )

    $(".prev-btn").click((event)->
      event.preventDefault()
      if window.index > 0
        window.index = window.index - 1
        playList()
    )
    if $("div#current-playing").size() > 0
      $playing = $("div##{window.index}.playlist")
      @markCurrentPlaying($playing)

@playList = ()->

  if window.playInterval != null  && typeof(window.playInterval) != "undefined"
    clearInterval(window.playInterval)
    window.playInterval = null

  if window.mediaPlayer != null && typeof(window.mediaPlayer) != "undefined"
    window.mediaPlayer.release()
    window.mediaPlayer = null
    window.playState = "stop"

  $("div.playlist").each((i, element)->
    $(element).removeClass("playing")
  )

  src = $("div##{window.index}.playlist").data("file")
  console.log window.index
  $("div##{window.index}.playlist").addClass("playing")
  $playing = $("div##{window.index}.playlist")
  @markCurrentPlaying($playing)




  src = src.replace("https", "http")

  window.playState = "playing"
  $("#play-status").html("loading")

  window.mediaPlayer = new Media(src, onPlaySuccess, onPlayError, (state)->
    if state == 4 && window.playState == "playing"
      console.log "last_id : #{$(".playlist").last().attr("id")}"
      if window.index < $(".playlist").last().attr("id")
        $("div##{window.index}.playlist").removeClass("playing")
        console.log "#{window.playInterval} must be closed now"
        console.log "clear interval"
        
        if window.index < $(".playlist").last().attr("id")
          window.index = window.index + 1
          window.playState = "playing"
          $("#play-status").html("loading")
          playList()
        else
          $("#play-status").html("stop")


    if state == 2
      window.playState = "playing"
      $("#play-status").html("playing")
  )
  window.mediaPlayer.play()

@onPlaySuccess = ->
  console.log "recordAudio():Audio Success"
  $("#play-status").html("playing")
  window.playTime = 0

@onPlayError = (error) ->
  #  console.log "code: " + error.code + "\n" + "message: " + error.message + "\n"
  #
playList()
