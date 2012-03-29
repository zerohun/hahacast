mediaPlayer = null
playInterval = null
@registerAudioPlayEvents = ->
  if $("#audioPlayer").length > 0
    #    alert "play!"
    currentPlaying = 0
    $(".audioPlayButton").click((event)->
      alert "play button"
      entry = $(this).parent()
      index = Number(entry.attr("id"))
      playList(index)
    )

@playList = (index)->
  alert index
  if playInterval && typeof(playInterval) != "undefined"
    clearInterval(playInterval)
    playInterval = null

  if mediaPlayer && typeof(playInterval) != "undefined"
    #alert "its not null"
    mediaPlayer.stop()
    mediaPlayer.release()
    mediaPlayer = null


  #alert "after inint"
  src = $("div##{index}.playlist").data("file")
  $("div##{index}.playlist").addClass("playing")
  src = src.replace("https", "http")
  #alert src
  mediaPlayer = new Media(src, onSuccess, onError)
  mediaPlayer.play()
  #alert "play"
  playTime = 0
  playInterval = setInterval(->
    playTime = playTime + 1
    if playTime >= 5
      #mediaPlayer.stop()
#      ediaPlayer.release()
      if index < Number($(".playlist").last().attr("id"))
        #alert "next is #{index + 1}"
        $("div##{index}.playlist").removeClass("playing")
        playList(index + 1)
  , 1000)


  #src = "myrecording_2.3gp"
  #mediaRec = new Media(src, onSuccess, onError)
  #mediaRec.startRecord()
  #recTime = 0
  #recInterval = setInterval(->
    #recTime = recTime + 1
    #$("#count").html("#{recTime}")
    #if recTime >= 5
      #clearInterval recInterval
      #mediaRec.stopRecord()
      #options = new FileUploadOptions()
      #options.fileKey = "mention[file]"
      #options.fileName = "myrecording_2.3gp"
      #options.mimeType = "audio/3gp4"
      #params = new Object()
      #params.auth_token = "6KSBABWjgSmALqgHJmh"
      #$("#message").html("token1")
      #$("#message").html("utf8")
      #params["mention[usercast_id]"] = "1"
      #$("#message").html("ucid")
      #$("meta[name=csrf-token]").attr("content")
      #params.authenticity_token = $("meta[name=csrf-token]").attr("content")
      #$("#message").html(params.authenticity_token)
      #options.params = params
      #ft = new FileTransfer()
      #ft.upload("/mnt/sdcard/myrecording_2.3gp", "http://192.168.43.170:3000/usercasts/1/mentions", 
        #onUploadSuccess ,onUploadFail
        #, options) 
    #src = "http://s3.amazonaws.com/zerohun_forupload/uploads/mention/file/39/myrecording_2.3gp"
    #mediaPlayer =  new Media(src, onSuccess, onError)
    #$("#message").html("before_play")
    #mediaPlayer.play()
    #src = "http://s3.amazonaws.com/zerohun_forupload/uploads/mention/file/16/mono_8bit_11khz.wav"
    #mediaPlayer.release()
    #mediaPlayer =  new Media(src, onSuccess, onError)
    #mediaPlayer.play()
    #$("#message").html("playing")




#  , 1000)
@onSuccess = ->
  #  console.log "recordAudio():Audio Success"
  #alert "success"


  
@onError = (error) ->
  #  console.log "code: " + error.code + "\n" + "message: " + error.message + "\n"

@onUploadSuccess = ->
  $("#message").html("upload success")
@onUploadFail = (error)->
  alert "[upload fail]#{error.code}"
